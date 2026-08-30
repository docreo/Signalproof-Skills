import importlib.util
import tempfile
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
SPEC = importlib.util.spec_from_file_location(
    "check_public_boundary", ROOT / "tools" / "check_public_boundary.py"
)
MODULE = importlib.util.module_from_spec(SPEC)
assert SPEC.loader is not None
SPEC.loader.exec_module(MODULE)


class PublicBoundaryTests(unittest.TestCase):
    def scan(self, files):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            paths = []
            for relative, content in files.items():
                target = root / relative
                target.parent.mkdir(parents=True, exist_ok=True)
                target.write_bytes(content)
                paths.append(relative)
            return MODULE.scan_paths(root, paths)

    def test_normal_public_material_passes(self):
        findings = self.scan(
            {
                "README.md": b"Public documentation without credentials.",
                ".env.example": b"TOKEN=<set-outside-repository>",
            }
        )
        self.assertEqual([], findings)

    def test_private_root_and_sensitive_filename_fail(self):
        findings = self.scan(
            {
                "private/evidence.md": b"not public",
                ".env": b"PLACEHOLDER=true",
            }
        )
        self.assertTrue(any("forbidden public-repository root" in item for item in findings))
        self.assertTrue(any("forbidden credential-bearing filename" in item for item in findings))

    def test_high_confidence_credentials_fail_without_echoing_value(self):
        token = ("ghp_" + "A" * 36).encode("ascii")
        findings = self.scan({"notes.txt": b"token=" + token})
        self.assertEqual(["notes.txt: detected GitHub token"], findings)
        self.assertNotIn(token.decode("ascii"), findings[0])

    def test_private_key_and_credential_url_fail(self):
        key_header = ("-----BEGIN " + "PRIVATE KEY-----").encode("ascii")
        credential_url = ("https://" + "owner:token@github.com/repo").encode("ascii")
        findings = self.scan({"unsafe.txt": key_header + b"\n" + credential_url})
        self.assertTrue(any("private-key material" in item for item in findings))
        self.assertTrue(any("credential-bearing URL" in item for item in findings))

    def test_binary_files_are_not_content_scanned(self):
        findings = self.scan({"image.bin": b"\x00" + ("ghp_" + "A" * 36).encode("ascii")})
        self.assertEqual([], findings)


if __name__ == "__main__":
    unittest.main()
