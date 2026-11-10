#!/usr/bin/env python3
"""Build the manifest-defined DLD distribution. Python 3.11+; standard library only."""

from __future__ import annotations

import hashlib
import os
import re
import shutil
import sys
import tempfile
import tomllib
import zipfile
from pathlib import Path, PurePosixPath
from urllib.parse import unquote, urlsplit

ROOT = Path(__file__).resolve().parent.parent
MANIFEST = ROOT / "product.toml"
BUILD = ROOT / "build"
VERSION_RE = re.compile(r"(?:0|[1-9]\d*)\.(?:0|[1-9]\d*)\.(?:0|[1-9]\d*)(?:-(?:[0-9A-Za-z-]+)(?:\.[0-9A-Za-z-]+)*)?\Z")
MARKDOWN_LINK = re.compile(r"!?(?:\[[^\]]*\])\(([^)]+)\)")


def relative_path(value: str) -> Path:
    """Require a simple, safe repository/product-relative path."""
    if not value or "\\" in value or "\x00" in value:
        raise ValueError(f"Unsafe path: {value!r}")
    path = PurePosixPath(value)
    if path.is_absolute() or any(x in ("", ".", "..") for x in value.split("/")) or ":" in value:
        raise ValueError(f"Unsafe path: {value!r}")
    return Path(*path.parts)


def entries_from_manifest(root: Path) -> list[tuple[Path, Path]]:
    data = tomllib.loads((root / "product.toml").read_text(encoding="utf-8"))
    if data.get("product", {}).get("version_file") != "VERSION":
        raise ValueError("Manifest must use the root VERSION")
    entries = data.get("files")
    if not isinstance(entries, list) or not entries:
        raise ValueError("Manifest must declare product files")
    seen = set()
    pairs = []
    for item in entries:
        if set(item) != {"source", "destination"}:
            raise ValueError("Each files entry requires only source and destination")
        src = relative_path(item["source"])
        dst = relative_path(item["destination"])
        if dst.as_posix() in seen:
            raise ValueError(f"Duplicate product destination: {dst}")
        seen.add(dst.as_posix())
        source = root / src
        if not source.is_file() or source.is_symlink():
            raise ValueError(f"Missing or linked source file: {src}")
        if any(parent.is_symlink() for parent in source.parents if parent != root.parent):
            raise ValueError(f"Linked source parent: {src}")
        pairs.append((src, dst))
    if "VERSION" not in seen or "README.md" not in seen:
        raise ValueError("Product must contain VERSION and README.md")
    return pairs


def validate_links(product: Path) -> None:
    for md in product.rglob("*.md"):
        text = md.read_text(encoding="utf-8")
        for raw in MARKDOWN_LINK.findall(text):
            target = raw.strip().split(" ", 1)[0].strip("<>")
            if not target or target.startswith("#"):
                continue
            parsed = urlsplit(target)
            if parsed.scheme or target.startswith("//"):
                continue
            if parsed.path.startswith("/"):
                raise ValueError(f"Absolute link in {md.relative_to(product)}: {raw}")
            local = (md.parent / unquote(parsed.path)).resolve()
            if not local.is_relative_to(product.resolve()) or not local.exists():
                raise ValueError(f"Broken or escaping link in {md.relative_to(product)}: {raw}")


def inspect_product(product: Path, destinations: list[Path], version: str) -> None:
    actual = sorted(p.relative_to(product).as_posix() for p in product.rglob("*") if p.is_file())
    expected = sorted(p.as_posix() for p in destinations)
    if actual != expected:
        raise ValueError("Assembled product differs from manifest")
    if (product / "VERSION").read_text(encoding="utf-8").strip() != version:
        raise ValueError("Assembled VERSION does not match source")
    for path in product.rglob("*"):
        if path.is_symlink():
            raise ValueError(f"Linked product path: {path}")
    validate_links(product)


def assemble(root: Path = ROOT) -> tuple[Path, Path]:
    root = root.resolve()
    build = root / "build"
    if build.is_symlink() or (build.exists() and not build.is_dir()):
        raise ValueError("Unsafe build directory")
    pairs = entries_from_manifest(root)
    version = (root / "VERSION").read_text(encoding="utf-8").strip()
    if not VERSION_RE.fullmatch(version):
        raise ValueError(f"Invalid SemVer VERSION: {version}")
    prefix = f"dld-v{version}"
    zip_name = f"{prefix}.zip"
    checksum_name = f"{zip_name}.sha256"

    build.mkdir(exist_ok=True)
    stage = Path(tempfile.mkdtemp(prefix=".dld-stage-", dir=build))
    try:
        product = stage / "product"
        product.mkdir()
        for src, dst in pairs:
            out = product / dst
            out.parent.mkdir(parents=True, exist_ok=True)
            shutil.copyfile(root / src, out)
        inspect_product(product, [dst for _, dst in pairs], version)

        archive = stage / zip_name
        with zipfile.ZipFile(archive, "w", compression=zipfile.ZIP_STORED) as zf:
            for _, dst in sorted(pairs, key=lambda item: item[1].as_posix()):
                info = zipfile.ZipInfo(f"{prefix}/{dst.as_posix()}", date_time=(1980, 1, 1, 0, 0, 0))
                info.compress_type = zipfile.ZIP_STORED
                info.create_system = 3
                info.external_attr = 0o100644 << 16
                zf.writestr(info, (product / dst).read_bytes())

        with zipfile.ZipFile(archive) as zf:
            expected = sorted(f"{prefix}/{dst.as_posix()}" for _, dst in pairs)
            if sorted(zf.namelist()) != expected:
                raise ValueError("ZIP members do not match manifest")
            for _, dst in pairs:
                if zf.read(f"{prefix}/{dst.as_posix()}") != (product / dst).read_bytes():
                    raise ValueError(f"ZIP content mismatch: {dst}")
        digest = hashlib.sha256(archive.read_bytes()).hexdigest()
        (stage / checksum_name).write_text(f"{digest}  {zip_name}\n", encoding="utf-8", newline="\n")

        outputs = ["product", zip_name, checksum_name]
        backup = stage / ".previous"
        backup.mkdir()
        moved_old = []
        moved_new = []
        for name in outputs:
            path = build / name
            if path.is_symlink():
                raise ValueError(f"Unsafe existing output: {path}")
            if path.exists() and path.is_dir() != (name == "product"):
                raise ValueError(f"Unexpected existing output type: {path}")
        try:
            for name in outputs:
                if (build / name).exists():
                    os.replace(build / name, backup / name)
                    moved_old.append(name)
            for name in outputs:
                os.replace(stage / name, build / name)
                moved_new.append(name)
        except Exception:
            for name in reversed(moved_new):
                path = build / name
                if path.is_dir():
                    shutil.rmtree(path)
                elif path.exists():
                    path.unlink()
            for name in moved_old:
                os.replace(backup / name, build / name)
            raise
        return build / zip_name, build / checksum_name
    finally:
        shutil.rmtree(stage, ignore_errors=True)


def main() -> int:
    try:
        archive, checksum = assemble()
    except (OSError, ValueError, KeyError, UnicodeError, tomllib.TOMLDecodeError, zipfile.BadZipFile) as exc:
        print(f"Packaging failed: {exc}", file=sys.stderr)
        return 1
    print(f"Product ZIP: {archive}")
    print(f"SHA-256: {checksum}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
