#!/usr/bin/env python3
"""Build and validate the DLD development and product distributions (stdlib only)."""
from __future__ import annotations

import argparse
import re
import subprocess
import sys
from pathlib import Path, PurePosixPath
from zipfile import ZipFile, ZIP_DEFLATED

ROOT = Path(__file__).resolve().parents[1]
COMMON_DOCS = [
    "docs/README.md",
    "docs/guides/lifecycle/01-start-the-project.md",
    "docs/guides/lifecycle/02-define-the-foundation-design.md",
    "docs/guides/lifecycle/03-develop-detailed-designs.md",
    "docs/guides/lifecycle/04-realize-the-design.md",
    "docs/guides/lifecycle/05-verify-and-deliver.md",
    "docs/guides/lifecycle/06-evolve-the-project.md",
    "docs/reference/repository-layout.md",
]
STARTER_TEMPLATES = [
    "starter/README.md",
    "starter/foundation/DESIGN.md",
    "starter/foundation/RULES.md",
]
COMMON = ["foundation/CORE.md", "VERSION", "CHANGELOG.md", "LICENSE", *COMMON_DOCS]
PRODUCT_SOURCES = [*COMMON, "docs/guides/adoption.md", *STARTER_TEMPLATES]
DEVELOPMENT_SOURCES = [
    "README.md", "VERSION", "CHANGELOG.md", "LICENSE", ".gitignore",
    "foundation/CORE.md", "foundation/DESIGN.md", "foundation/RULES.md",
    *COMMON_DOCS, "docs/guides/adoption.md", "docs/guides/development.md",
    "docs/internal/product-readme.md", "docs/internal/packaging.md", *STARTER_TEMPLATES,
    "examples/README.md", ".github/package.py",
    ".github/workflows/package-check.yml",
]
LINK = re.compile(r"(?<!!)\[[^\]]*\]\(([^)]+)\)")
MARKER = "@DLD_BASELINE@"


def git(*args: str) -> str:
    return subprocess.run(
        ["git", *args], cwd=ROOT, check=True, text=True,
        stdout=subprocess.PIPE, stderr=subprocess.PIPE
    ).stdout.strip()


def check_release(version: str) -> None:
    if git("status", "--porcelain"):
        raise ValueError("Release requires a clean source tree.")
    if git("describe", "--tags", "--exact-match", "HEAD") != "v" + version:
        raise ValueError("Release requires the matching v" + version + " tag.")
    # Release authorization and substantive approval are still human gates.


def source(path: str) -> bytes:
    filepath = ROOT / path
    if not filepath.is_file():
        raise FileNotFoundError(path)
    return filepath.read_bytes()


def package_files(kind: str, version: str, release: bool) -> dict[str, bytes]:
    selected = DEVELOPMENT_SOURCES if kind == "development" else PRODUCT_SOURCES
    files = {p: source(p) for p in selected}
    label = version if release else version + " (unreleased source snapshot)"
    files["starter/README.md"] = files["starter/README.md"].replace(
        MARKER.encode(), label.encode()
    )
    # Both distributions include a complete, copyable starter; its Core is
    # generated from the one canonical source, never maintained separately.
    files["starter/foundation/CORE.md"] = files["foundation/CORE.md"]
    if kind == "product":
        # The maintained product entry lives in docs/internal/ but is
        # distributed at the archive root. Rewrite only known relative paths.
        intro = source("docs/internal/product-readme.md").decode("utf-8")
        intro = (intro.replace("../../foundation/", "foundation/")
                      .replace("../../starter/", "starter/")
                      .replace("../README.md", "docs/README.md")
                      .replace("../guides/", "docs/guides/")
                      .replace("../reference/", "docs/reference/"))
        files["README.md"] = intro.encode("utf-8")
        if not release:
            files["README.md"] += (
                "\n> **Unreleased source snapshot:** Not an approved or published DLD release.\n"
            ).encode()
    return files


def norm_link(base: str, relative: str) -> str:
    segments = []
    for segment in (PurePosixPath(base).parent / relative).parts:
        if segment in ("", "."):
            continue
        if segment == "..":
            if not segments:
                raise ValueError("Link escapes archive: " + base + " -> " + relative)
            segments.pop()
        else:
            segments.append(segment)
    return "/".join(segments)


def check_package(kind: str, files: dict[str, bytes]) -> None:
    mandatory = set(COMMON)
    mandatory.add("starter/foundation/CORE.md")
    if files["foundation/CORE.md"] != files["starter/foundation/CORE.md"]:
        raise ValueError("Generated starter Core differs from canonical Core.")
    if kind == "product":
        mandatory |= set(STARTER_TEMPLATES) | {
            "README.md", "docs/guides/adoption.md", "starter/foundation/CORE.md"
        }
        forbidden = {
            "foundation/DESIGN.md", "foundation/RULES.md",
            "docs/guides/development.md", "docs/internal/packaging.md",
            "docs/internal/product-readme.md", ".github/package.py",
        }
        if forbidden.intersection(files):
            raise ValueError("Product contains development-only files.")
        if files["foundation/CORE.md"] != files["starter/foundation/CORE.md"]:
            raise ValueError("Adopted Core differs from canonical Core.")
    else:
        mandatory |= {"foundation/DESIGN.md", "foundation/RULES.md",
                      "docs/guides/development.md", ".github/package.py"}
    if missing := mandatory.difference(files):
        raise ValueError("Missing " + kind + " files: " + repr(sorted(missing)))
    if any(p == "AGENTS.md" or p.endswith("/AGENTS.md") for p in files):
        raise ValueError("No AGENTS.md may be distributed.")
    if any(p.endswith("/WORKFLOW.md") for p in files):
        raise ValueError("WORKFLOW.md is superseded by DLD Core.")
    for path, data in files.items():
        if not path.endswith(".md"):
            continue
        txt = data.decode("utf-8")
        if MARKER in txt:
            raise ValueError("Unresolved version marker: " + path)
        for match in LINK.finditer(txt):
            dest = match.group(1).strip().split("#", 1)[0].split(" ", 1)[0]
            if not dest or dest.startswith(("https://", "http://", "mailto:")):
                continue
            full = norm_link(path, dest)
            if full not in files and full + "/README.md" not in files:
                raise ValueError(f"Unresolved Markdown link {path} -> {dest}")


def build(version: str, release: bool) -> None:
    packages = {
        kind: package_files(kind, version, release)
        for kind in ("development", "product")
    }
    for kind, files in packages.items():
        check_package(kind, files)
    for shared in COMMON:
        if packages["development"][shared] != packages["product"][shared]:
            raise ValueError("Shared source differs: " + shared)

    output = ROOT / "dist"
    output.mkdir(exist_ok=True)
    suffix = "" if release else "-unreleased"
    for kind, files in packages.items():
        base = f"dld-{kind}-v{version}{suffix}"
        archive = output / f"{base}.zip"
        with ZipFile(archive, "w", compression=ZIP_DEFLATED) as z:
            for name in sorted(files):
                z.writestr(base + "/" + name, files[name])
        with ZipFile(archive) as z:
            expected = {base + "/" + name for name in files}
            if set(z.namelist()) != expected or z.testzip() is not None:
                raise ValueError("Broken archive: " + archive.name)
        print(f"{kind}: {len(files)} validated files in {archive.relative_to(ROOT)}")


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true",
                        help="assemble both distributions and run package validation")
    parser.add_argument("--release", action="store_true",
                        help="require clean source at matching release tag")
    args = parser.parse_args()
    try:
        version = (ROOT / "VERSION").read_text(encoding="utf-8").strip()
        if not re.fullmatch(r"\d+\.\d+\.\d+", version):
            raise ValueError("VERSION is not major.minor.patch.")
        if args.release:
            check_release(version)
        build(version, args.release)
        print("Distribution content, links, and shared Core checks passed.")
        return 0
    except (OSError, ValueError, subprocess.CalledProcessError) as exc:
        print("DLD package error:", exc, file=sys.stderr)
        return 1


if __name__ == "__main__":
    raise SystemExit(main())
