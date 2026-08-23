from pathlib import Path
import re
import unittest

ROOT = Path(__file__).resolve().parents[2]


class DSPDownloadAcceptance(unittest.TestCase):
    def read(self, rel):
        return (ROOT / rel).read_text(encoding="utf-8")

    def test_download_is_active_registered_and_routed(self):
        command = self.read("commands/download.md")
        registry = self.read("commands/COMMAND-REGISTRY.md")
        dsp = self.read("commands/dsp.md")
        self.assertIn("**Status:** ACTIVE", command)
        match = re.search(r"^\*\*Version:\*\*\s+([^\s]+)", command, re.MULTILINE)
        self.assertIsNotNone(match)
        self.assertIn(f"| `download` | {match.group(1)} |", registry)
        self.assertIn("`download` -> `commands/download.md`", registry)
        self.assertIn("| `download` | `download` |", dsp)
        self.assertIn("/dsp download", dsp)
        self.assertLess(len((ROOT / "commands/download.md").read_bytes()), 15000)

    def test_download_preserves_artifact_identity(self):
        text = self.read("commands/download.md").lower()
        for required in [
            "exact recovery",
            "verified equivalent",
            "reconstructed",
            "never call a reconstruction byte-identical without proof",
            "sha-256",
            "do not repeatedly reconstruct",
        ]:
            self.assertIn(required, text)

    def test_download_supports_cross_chat_and_durable_storage_without_fake_success(self):
        text = self.read("commands/download.md").lower()
        for required in [
            "different chat",
            "conversation/file-library",
            "authorized connected storage",
            "google drive",
            "do not claim the copy succeeded unless",
            "requested durable destination is unavailable",
        ]:
            self.assertIn(required, text)

    def test_download_preserves_private_and_authority_boundaries(self):
        text = self.read("commands/download.md").lower()
        for required in [
            "public/private boundary",
            "does not create deployment",
            "candidate-activation",
            "canonical build ledger authority",
            "do not use public web search as a substitute",
        ]:
            self.assertIn(required, text)

    def test_download_material_avoids_u2014(self):
        for rel in [
            "commands/download.md",
            "commands/dsp.md",
            "commands/COMMAND-REGISTRY.md",
        ]:
            self.assertNotIn("\u2014", self.read(rel), rel)


if __name__ == "__main__":
    unittest.main()
