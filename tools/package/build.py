#!/usr/bin/env python3
"""Assemble and validate DLD's development and product archives; stdlib only."""
from __future__ import annotations

import argparse
import os
import re
import subprocess
import sys
from pathlib import Path
from zipfile import ZIP_DEFLATED, ZipFile

ROOT = Path(__file__).resolve().parents[2]
GUIDE_COMMON = [
    "guide/README.md",
    "guide/methodology.md",
    "guide/reference-repository-layout.md",
    "guide/01-start-the-project.md",
    "guide/02-define-the-root-design.md",
    "guide/03-develop-detailed-designs.md",
    "guide/04-realize-the-design.md",
    "guide/05-verify-and-deliver.md",
    "guide/06-evolve-the-project.md",
]
STARTER = [
    "starter/README.md",
    "starter/foundation/DESIGN.md",
    "starter/foundation/WORKFLOW.md",
    "starter/foundation/RULES.md",
]
PRODUCT = ["VERSION", "LICENSE", "CHANGELOG.md", *GUIDE_COMMON, "guide/adoption.md", *STARTER]
DEVELOPMENT = [
    "README.md", "VERSION", "LICENSE", "CHANGELOG.md",
    "foundation/DESIGN.md", "foundation/WORKFLOW.md", "foundation/RULES.md",
    *GUIDE_COMMON, "guide/adoption.md", "guide/development.md", *STARTER,
    "examples/README.md", "product/README.md",
    "tools/package/README.md", "tools/package/build.py", ".gitignore",
]
LINKS = re.compile(r"(?<!!)\[[^\]]*\]\(([^)]+)\)")
BASELINE_MARKER = "@DLD_BASELINE@"


def git(*args: str) -> str:
    result = subprocess.run(["git", *args], cwd=ROOT, check=True, text=True,
                            stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    return result.stdout.strip()


def verify_release(version: str) -> None:
    if git("status", "--porcelain"):
        raise ValueError("Release requires a clean repository.")
    if git("describe", "--tags", "--exact-match", "HEAD") != "v" + version:
        raise ValueError("Release requires HEAD to be tagged v" + version + ".")
    # A tag and clean checkout are necessary checks, not human approval:
    # release authorization and substantive verification remain separate.


def inputs(kind: str, version: str, release: bool) -> dict[str, bytes]:
    selected = PRODUCT if kind == "product" else DEVELOPMENT
    files: dict[str, bytes] = {}
    for src in selected:
        target = "README.md" if kind == "product" and src == "product/README.md" else src
        if target in files and src != target:
            raise ValueError("Duplicate archive target: " + target)
        path = ROOT / src
        if not path.is_file():
            raise FileNotFoundError(src)
        data = path.read_bytes()
        if src.endswith(".md"):
            text = data.decode("utf-8")
            if kind == "product" and src == "product/README.md":
                text = text.replace("../guide/", "guide/").replace("../starter/", "starter/")
            if src == "starter/README.md":
                label = version if release else version + " (unreleased source snapshot)"
                text = text.replace(BASELINE_MARKER, label)
            data = text.encode("utf-8")
        files[target] = data
    if kind == "product":
        files["README.md"] = product_readme(version, release)
    return files


def product_readme(version: str, release: bool) -> bytes:
    text = (ROOT / "product" / "README.md").read_text(encoding="utf-8")
    text = text.replace("../guide/", "guide/").replace("../starter/", "starter/")
    if not release:
        text += "\n> **Unreleased source snapshot:** This is not an approved or published DLD release.\n"
    return text.encode("utf-8")


def check_contents(kind: str, files: dict[str, bytes]) -> None:
    required = {"README.md", "LICENSE", "VERSION", "guide/methodology.md",
                "guide/README.md", "guide/reference-repository-layout.md"}
    if kind == "product":
        required |= set(STARTER) | {"guide/adoption.md"}
        forbidden = {"foundation/DESIGN.md", "foundation/WORKFLOW.md",
                     "foundation/RULES.md", "guide/development.md", "tools/package/README.md"}
        if forbidden & files.keys():
            raise ValueError("Product contains development-only content: " + str(forbidden & files.keys()))
    else:
        required |= {"foundation/DESIGN.md", "foundation/WORKFLOW.md",
                     "foundation/RULES.md", "guide/development.md"}
    missing = required - files.keys()
    if missing:
        raise ValueError("Missing required files: " + ", ".join(sorted(missing)))
    if any(p.endswith("/AGENTS.md") or p == "AGENTS.md" for p in files):
        raise ValueError("Unexpected AGENTS.md.")
    for path, content in files.items():
        if not path.endswith(".md"):
            continue
        body = content.decode("utf-8")
        if BASELINE_MARKER in body:
            raise ValueError("Unresolved baseline marker in " + path)
        for match in LINKS.finditer(body):
            ref = match.group(1).strip().split("#", 1)[0]
            if not ref or ref.startswith(("https://", "http://", "mailto:")):
                continue
            ref = ref.split(" ", 1)[0]
            segments = (Path(path).parent / ref).parts
            normalized: list[str] = []
            for part in segments:
                if part in ("", "."):
                    continue
                if part == "..":
                    if not normalized:
                        raise ValueError(f"Link escapes archive: {path} -> {ref}")
                    normalized.pop()
                else:
                    normalized.append(part)
            destination = "/".join(normalized)
            if destination not in files and (destination + "/README.md") not in files:
                raise ValueError(f"Broken internal link: {path} -> {ref}")
    # Verify the shared learning source is identical across both distributions.
    if not files["guide/methodology.md"]:
        raise ValueError("Empty DLD fundamentals.")


def build(version: str, release: bool, check: bool) -> None:
    prepared = {kind: inputs(kind, version, release) for kind in ("development", "product")}
    for kind, files in prepared.items():
        check_contents(kind, files)
    for name in GUIDE_COMMON:
        if prepared["product"][name] != prepared["development"][name]:
            raise ValueError("Common guide differs between distributions: " + name)
    output = ROOT / "dist"
    output.mkdir(parents=True, exist_ok=True)
    suffix = "" if release else "-unreleased"
    for kind, files in prepared.items():
        base = f"dld-{kind}-v{version}{suffix}"
        archive = output / (base + ".zip")
        with ZipFile(archive, "w", compression=ZIP_DEFLATED) as z:
            for path in sorted(files):
                z.writestr(f"{base}/{path}", files[path])
        with ZipFile(archive) as z:
            expected = {f"{base}/{path}" for path in files}
            if set(z.namelist()) != expected or z.testzip() is not None:
                raise ValueError("Archive integrity check failed: " + str(archive))
        print(f"{kind}: {len(files)} files, checked -> {archive.relative_to(ROOT)}")
    if check:
        print("Package boundary, link, common-content, and archive checks passed.")


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--release", action="store_true",
                        help="require a clean checkout at matching version tag")
    parser.add_argument("--check", action="store_true",
                        help="build both archives and validate their integrity and links")
    args = parser.parse_args()
    try:
        version = (ROOT / "VERSION").read_text(encoding="utf-8").strip()
        if not re.fullmatch(r"\d+\.\d+\.\d+", version):
            raise ValueError("VERSION must contain a semantic major.minor.patch version.")
        if args.release:
            verify_release(version)
        build(version, args.release, args.check)
    except (OSError, ValueError, subprocess.CalledProcessError) as exc:
        print(f"DLD packaging failed: {exc}", file=sys.stderr)
        return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
