#!/usr/bin/env python3
"""Unit and fixture tests for manifest-driven packaging (standard library only)."""
import importlib.util
import tempfile
import unittest
from pathlib import Path
from zipfile import ZipFile

module_path = Path(__file__).resolve().parent / "package.py"
spec = importlib.util.spec_from_file_location("dld_package", module_path)
packager = importlib.util.module_from_spec(spec)
spec.loader.exec_module(packager)


class PackageTests(unittest.TestCase):
    def fixture(self, directory: Path) -> None:
        (directory / "product-files").mkdir()
        (directory / "product-files" / "README.md").write_text("# Product\n[Method](dld/DLD.md)\n", encoding="utf-8")
        (directory / "dld").mkdir()
        (directory / "dld" / "DLD.md").write_text("# Method\n", encoding="utf-8")
        (directory / "VERSION").write_text("0.1.5-dev.1\n", encoding="utf-8")
        (directory / "product.toml").write_text(
            "[product]\nname = 'DLD'\nversion_file = 'VERSION'\n"
            "[[files]]\nsource = 'product-files/README.md'\ndestination = 'README.md'\n"
            "[[files]]\nsource = 'dld/DLD.md'\ndestination = 'dld/DLD.md'\n"
            "[[files]]\nsource = 'VERSION'\ndestination = 'VERSION'\n",
            encoding="utf-8",
        )

    def test_valid_package_and_reproducibility(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            self.fixture(root)
            archive, checksum = packager.assemble(root)
            first = archive.read_bytes()
            self.assertTrue(checksum.exists())
            with ZipFile(archive) as zf:
                self.assertEqual(zf.namelist(), [
                    "dld-v0.1.5-dev.1/README.md",
                    "dld-v0.1.5-dev.1/VERSION",
                    "dld-v0.1.5-dev.1/dld/DLD.md",
                ])
            packager.assemble(root)
            self.assertEqual(first, archive.read_bytes())

    def test_broken_link_preserves_previous_output(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            self.fixture(root)
            archive, _ = packager.assemble(root)
            original = archive.read_bytes()
            (root / "product-files" / "README.md").write_text("[Missing](does-not-exist.md)\n", encoding="utf-8")
            with self.assertRaises(ValueError):
                packager.assemble(root)
            self.assertEqual(original, archive.read_bytes())

    def test_path_traversal_rejected(self):
        for value in ("../outside", "/etc/passwd", "a/../b", "a\\b"):
            with self.subTest(value=value):
                with self.assertRaises(ValueError):
                    packager.relative_path(value)

    def test_invalid_version_rejected(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            self.fixture(root)
            (root / "VERSION").write_text("0.1.5.1\n", encoding="utf-8")
            with self.assertRaises(ValueError):
                packager.assemble(root)


if __name__ == "__main__":
    unittest.main()
