from pathlib import Path
import unittest

ROOT = Path(__file__).resolve().parents[2]


class DSPAuthorizeHandlerAcceptance(unittest.TestCase):
    def read(self, rel):
        return (ROOT / rel).read_text(encoding="utf-8")

    def test_authorize_command_is_active_and_small(self):
        path = ROOT / "commands/authorize.md"
        text = path.read_text(encoding="utf-8")
        self.assertIn("**Status:** ACTIVE", text)
        self.assertLess(len(path.read_bytes()), 15000)

    def test_dsp_routes_authorize_handler(self):
        text = self.read("commands/dsp.md").lower()
        self.assertIn("`authorize`, `authorized` | `authorize`", text)
        self.assertIn("`authorize <command>`, `authorized <command>` | `authorize` with resolved target command", text)

    def test_registry_declares_authorize(self):
        text = self.read("commands/COMMAND-REGISTRY.md")
        self.assertIn("| `authorize` | 0.1.0 |", text)
        self.assertIn("`authorize` -> `commands/authorize.md`", text)

    def test_scope_and_prerequisite_boundaries(self):
        text = self.read("commands/authorize.md").lower()
        for phrase in [
            "authorization is exact, scoped, consumable",
            "stop rather than inventing authority",
            "authorized-pending-precondition",
            "recursively authorize `authorize` itself",
            "does not manufacture it",
            "not a reusable credential",
        ]:
            self.assertIn(phrase, text)

    def test_specialized_compatibility_route_is_preserved(self):
        text = self.read("commands/authorize.md").lower()
        self.assertIn("/authorized-log-build-git", text)
        self.assertIn("specialized compatibility command", text)

    def test_known_errors_guard_remains_binding(self):
        text = self.read("commands/authorize.md").lower()
        self.assertIn("authorization does not permit a materially unchanged known-bad retry", text)


if __name__ == "__main__":
    unittest.main()
