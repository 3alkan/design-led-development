#!/usr/bin/env python3
"""Build and check DLD development and product ZIP distributions (stdlib only)."""
from __future__ import annotations

import argparse
import re
import subprocess
import sys
from pathlib import Path, PurePosixPath
from zipfile import ZIP_DEFLATED, ZipFile

ROOT = Path(__file__).resolve().parents[1]
SUPPORT = "docs/supporting/repository-layout.md"
STARTER = ["starter/README.md", "starter/foundation/DESIGN.md", "starter/foundation/RULES.md"]
META = ["VERSION", "CHANGELOG.md", "LICENSE"]
DEV = [
    "README.md", *META, ".gitignore",
    "foundation/CORE.md", "foundation/DESIGN.md", "foundation/RULES.md",
    *STARTER, SUPPORT,
    ".github/product-readme.md", ".github/package.py",
    ".github/workflows/package-check.yml",
]
LINK = re.compile(r"(?<!!)\[[^\]]*\]\(([^)]+)\)")
MARKER = "@DLD_BASELINE@"


def read(path: str) -> bytes:
    return (ROOT / path).read_bytes()


def create_files(kind: str, version: str, release: bool) -> dict[str, bytes]:
    if kind == "development":
        files = {p: read(p) for p in DEV}
    else:
        files = {p: read(p) for p in [*META, *STARTER]}
        files["README.md"] = read(".github/product-readme.md")
        files["supporting/repository-layout.md"] = read(SUPPORT)

    files["starter/foundation/CORE.md"] = read("foundation/CORE.md")
    label = version if release else version + " (unreleased source snapshot)"
    body = files["starter/README.md"]
    if body.count(MARKER.encode()) != 1:
        raise ValueError("Starter version marker missing or duplicated")
    files["starter/README.md"] = body.replace(MARKER.encode(), label.encode())
    if kind == "product" and not release:
        files["README.md"] += b"\n> **Unreleased snapshot:** Not an approved or published DLD release.\n"
    return files


def relative_target(base: str, href: str) -> str:
    parts = list(PurePosixPath(base).parent.parts)
    for element in href.split("/"):
        if element in ("", "."):
            continue
        if element == "..":
            if not parts:
                raise ValueError(f"Path escapes archive: {base} -> {href}")
            parts.pop()
        else:
            parts.append(element)
    return "/".join(parts)


def check_links(files: dict[str, bytes]) -> None:
    for path, content in files.items():
        if not path.endswith(".md"):
            continue
        text = content.decode("utf-8")
        if MARKER in text:
            raise ValueError(f"Unresolved marker: {path}")
        for match in LINK.finditer(text):
            href = match.group(1).strip().split(" ", 1)[0].split("#", 1)[0]
            if not href or href.startswith(("https://", "http://", "mailto:")):
                continue
            target = relative_target(path, href)
            if target not in files and target + "/README.md" not in files:
                raise ValueError(f"Broken link: {path} -> {href}")


def validate(kind: str, files: dict[str, bytes], core: bytes) -> None:
    if files["starter/foundation/CORE.md"] != core:
        raise ValueError("Starter Core differs from canonical Core")
    expected = set(DEV if kind == "development" else [*META, *STARTER, "README.md", "supporting/repository-layout.md"])
    expected.add("starter/foundation/CORE.md")
    if set(files) != expected:
        raise ValueError(f"Unexpected {kind} file set: {sorted(set(files) ^ expected)}")
    check_links(files)
    if kind == "product":
        # The optional support file is usable unchanged at docs/dld/ in an adopter project.
        installed = {
            "README.md": files["starter/README.md"],
            "foundation/CORE.md": core,
            "foundation/DESIGN.md": files["starter/foundation/DESIGN.md"],
            "foundation/RULES.md": files["starter/foundation/RULES.md"],
            "docs/dld/repository-layout.md": files["supporting/repository-layout.md"],
        }
        check_links(installed)


def release_prerequisites(version: str) -> None:
    def git(*args: str) -> str:
        return subprocess.run(["git", *args], cwd=ROOT, text=True, check=True,
                              capture_output=True).stdout.strip()
    if git("status", "--porcelain"):
        raise ValueError("Release requires a clean source tree")
    if git("describe", "--tags", "--exact-match", "HEAD") != f"v{version}":
        raise ValueError("Release requires matching version tag")
    # Human approval and publication authorization are separate.


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true", help="Build and validate both distributions")
    parser.add_argument("--release", action="store_true", help="Verify matching release tag and clean tree")
    args = parser.parse_args()
    try:
        version = read("VERSION").decode().strip()
        if not re.fullmatch(r"\d+\.\d+\.\d+", version):
            raise ValueError("Invalid VERSION")
        if args.release:
            release_prerequisites(version)
        core = read("foundation/CORE.md")
        packages = {k: create_files(k, version, args.release) for k in ("development", "product")}
        for kind, files in packages.items():
            validate(kind, files, core)
        output = ROOT / "dist"
        output.mkdir(exist_ok=True)
        suffix = "" if args.release else "-unreleased"
        for kind, files in packages.items():
            base = f"dld-{kind}-v{version}{suffix}"
            archive = output / f"{base}.zip"
            with ZipFile(archive, "w", compression=ZIP_DEFLATED) as out:
                for name in sorted(files):
                    out.writestr(f"{base}/{name}", files[name])
            with ZipFile(archive) as built:
                if built.testzip() is not None or set(built.namelist()) != {
                    f"{base}/{name}" for name in files
                }:
                    raise ValueError("Invalid ZIP archive: " + archive.name)
            print(f"{kind}: {len(files)} verified files")
        print("DLD distribution checks passed")
        return 0
    except (OSError, ValueError, subprocess.CalledProcessError) as exc:
        print(f"DLD package error: {exc}", file=sys.stderr)
        return 1


if __name__ == "__main__":
    raise SystemExit(main())
