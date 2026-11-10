#!/usr/bin/env python3
"""Tests for TXT-001 validator. Uses only Python standard library."""

import importlib.util
import tempfile
import unittest
from pathlib import Path

module_path = Path(__file__).resolve().parent / "check-text-format.py"
spec = importlib.util.spec_from_file_location("text_format", module_path)
checker = importlib.util.module_from_spec(spec)
spec.loader.exec_module(checker)


class CheckTextFormatTests(unittest.TestCase):
    def check_bytes(self, payload: bytes, suffix: str = ".md") -> list[str]:
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory) / ("example" + suffix)
            path.write_bytes(payload)
            return checker.check_file(path)

    def test_clean_utf8_lf(self):
        self.assertEqual(self.check_bytes("Héllo\n".encode("utf-8")), [])

    def test_utf8_bom(self):
        self.assertIn("UTF-8 BOM", self.check_bytes(b"\xef\xbb\xbfhello\n"))

    def test_crlf(self):
        self.assertTrue(any("CR" in item for item in self.check_bytes(b"hello\r\n")))

    def test_cr_only(self):
        self.assertTrue(any("CR" in item for item in self.check_bytes(b"hello\r")))

    def test_invalid_utf8(self):
        self.assertIn("not valid UTF-8", self.check_bytes(b"hello\xff\n"))

    def test_binary_with_nul(self):
        self.assertEqual(self.check_bytes(b"\x00\xff\r\n", ".dat"), [])

    def test_known_binary_suffix(self):
        self.assertEqual(self.check_bytes(b"\xff\r\n", ".png"), [])


if __name__ == "__main__":
    unittest.main()
