from pathlib import Path
import unittest

ROOT = Path(__file__).resolve().parents[2]


class DSPKnownErrorsAcceptance(unittest.TestCase):
    def read(self, rel):
        return (ROOT / rel).read_text(encoding="utf-8")

    def test_command_is_active_and_small(self):
        path = ROOT / "commands/known-errors.md"
        text = path.read_text(encoding="utf-8")
        self.assertIn("**Status:** ACTIVE", text)
        self.assertLess(len(path.read_bytes()), 15000)

    def test_dsp_routes_known_errors(self):
        text = self.read("commands/dsp.md").lower()
        self.assertIn("`known errors`, `known-errors` | `known-errors`", text)

    def test_registry_declares_known_errors(self):
        text = self.read("commands/COMMAND-REGISTRY.md")
        self.assertIn("| `known-errors` | 0.1.0 |", text)
        self.assertIn("`known-errors` -> `commands/known-errors.md`", text)

    def test_redundant_retry_is_blocked(self):
        text = self.read("commands/known-errors.md").lower()
        for phrase in [
            "standing requirement",
            "before each consequential build, debug, retry",
            "block the redundant path",
            "material condition changed",
            "do not spend another build/debug loop",
            "not automatically a known error",
            "signalproof-known-errors",
        ]:
            self.assertIn(phrase, text)

    def test_command_preserves_authority_boundary(self):
        text = self.read("commands/known-errors.md").lower()
        self.assertIn("does not grant build", text)
        self.assertIn("canonical build ledger authority", text)


if __name__ == "__main__":
    unittest.main()
