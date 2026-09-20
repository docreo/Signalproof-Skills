from pathlib import Path
import unittest

ROOT = Path(__file__).resolve().parents[2]


class FrameworkPreflightHookAcceptance(unittest.TestCase):
    def read(self, rel):
        return (ROOT / rel).read_text(encoding="utf-8").lower()

    def test_design_git_owns_full_preflight(self):
        text = self.read("commands/design-git.md")
        for phrase in [
            "signalproof framework preflight hook",
            "read current git authority first",
            "current brand, rules, commands",
            "do not violate the signalproof framework",
            "do not violate the law",
            "do not violate applicable terms of service",
            "do not violate applicable licenses",
            "framework preflight: pass | blocked | owner override",
        ]:
            self.assertIn(phrase, text)

    def test_build_git_cannot_skip_hook_by_inheritance(self):
        text = self.read("commands/build-git.md")
        for phrase in [
            "signalproof framework preflight hook",
            "must not be skipped merely because",
            "prior-chat summary, memory, or stale cached result is not a substitute",
            "framework preflight: pass",
        ]:
            self.assertIn(phrase, text)

    def test_complete_cannot_skip_hook_by_inheritance(self):
        text = self.read("commands/complete.md")
        for phrase in [
            "signalproof framework preflight hook",
            "must not treat inheritance as permission to skip",
            "complete authorization envelope cannot waive",
            "framework preflight: pass | blocked | owner override",
        ]:
            self.assertIn(phrase, text)

    def test_registry_versions_and_global_governance(self):
        text = self.read("commands/command-registry.md")
        self.assertIn("| `complete` | 0.1.1 |", text)
        self.assertIn("| `design-git` | 0.2.2 |", text)
        self.assertIn("| `build-git` | 0.2.7 |", text)
        self.assertIn("current git-backed signalproof framework preflight hook", text)

    def test_generated_material_avoids_u2014(self):
        for rel in [
            "commands/design-git.md",
            "commands/build-git.md",
            "commands/complete.md",
            "commands/COMMAND-REGISTRY.md",
        ]:
            self.assertNotIn("\u2014", self.read(rel), rel)


if __name__ == "__main__":
    unittest.main()
