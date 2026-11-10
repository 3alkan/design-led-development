#!/usr/bin/env python3
"""Verify TXT-001 for tracked, maintained text files (Python standard library only)."""

from __future__ import annotations

import subprocess
import sys
from pathlib import Path

# Historical files are preserved as-is; maintained source lives outside old/.
EXCLUDED_PREFIXES = ("old/",)
# Git may track binary assets that have no NUL bytes. Explicitly exclude known binary formats.
BINARY_EXTENSIONS = {
    ".7z", ".avi", ".bin", ".bmp", ".class", ".dll", ".doc", ".docx",
    ".eot", ".exe", ".gif", ".gz", ".ico", ".jar", ".jpeg", ".jpg",
    ".mp3", ".mp4", ".otf", ".pdf", ".png", ".ppt", ".pptx", ".so",
    ".tar", ".ttf", ".wasm", ".webp", ".woff", ".woff2", ".xls",
    ".xlsx", ".zip",
}


def check_file(path: Path) -> list[str]:
    data = path.read_bytes()
    if path.suffix.lower() in BINARY_EXTENSIONS or b"\x00" in data:
        return []
    problems = []
    if data.startswith(b"\xef\xbb\xbf"):
        problems.append("UTF-8 BOM")
    try:
        data.decode("utf-8")
    except UnicodeDecodeError:
        problems.append("not valid UTF-8")
    if b"\r" in data:
        problems.append("CR line ending (use LF only)")
    return problems


def main() -> int:
    root = Path(__file__).resolve().parent.parent
    result = subprocess.run(
        ["git", "-C", str(root), "ls-files", "-z", "--cached", "--full-name"],
        check=True,
        stdout=subprocess.PIPE,
    )
    failures: list[tuple[str, list[str]]] = []
    checked = 0
    excluded = 0
    for name in result.stdout.split(b"\x00"):
        if not name:
            continue
        relative = name.decode("utf-8", errors="surrogateescape").replace("\\", "/")
        if relative.startswith(EXCLUDED_PREFIXES):
            excluded += 1
            continue
        path = root / relative
        if not path.is_file():
            continue  # A removed file may still be present in the index before commit.
        checked += 1
        issues = check_file(path)
        if issues:
            failures.append((relative, issues))

    for name, issues in failures:
        print(f"FAIL {name}: {', '.join(issues)}")
    print(f"TXT-001: checked {checked} maintained tracked files; "
          f"excluded {excluded} historical files; {len(failures)} failed.")
    return 1 if failures else 0


if __name__ == "__main__":
    sys.exit(main())
