from pathlib import Path
import unittest

ROOT = Path(__file__).resolve().parents[2]


class PowerShellFailureGuardAcceptance(unittest.TestCase):
    def read(self, rel):
        return (ROOT / rel).read_text(encoding="utf-8")

    def test_registry_exists_and_contains_core_rules(self):
        text = self.read("library/POWERSHELL-FAILURE-REGISTRY.yaml").lower()
        for phrase in [
            "ps-parser-final-001",
            "ps-interactive-block-001",
            "ps-count-shape-001",
            "ps-json-51-001",
            "ps-native-stderr-001",
            "unchanged_known_bad_retry: stop",
        ]:
            self.assertIn(phrase, text)

    def test_loop_is_registered_and_bounded(self):
        registry = self.read("loops/LOOP-REGISTRY.yaml")
        loop = self.read("loops/SP-LOOP-POWERSHELL-GUARD.md").lower()
        self.assertIn("SP-LOOP-POWERSHELL-GUARD", registry)
        self.assertIn("default_max_iterations: 3", registry)
        self.assertIn("a new chat is not a new failure history", loop)
        self.assertIn("parser-validate the exact final staged `.ps1`", loop)
        self.assertIn("does not reset the failure identity or attempt count", loop)

    def test_build_git_makes_guard_mandatory(self):
        text = self.read("commands/build-git.md").lower()
        for phrase in [
            "mandatory powershell guard",
            "library/powershell-failure-registry.yaml",
            "parser-preflight the exact final staged `.ps1`",
            "do not assume `.count` exists",
            "carry same-failure attempt counts across new chats",
            "if a required state is unknown or failed, do not execute",
        ]:
            self.assertIn(phrase, text)

    def test_log_build_git_restores_guard_in_fresh_chat(self):
        text = self.read("commands/log-build-git.md").lower()
        for phrase in [
            "reload failure guards",
            "load current `library/powershell-failure-registry.yaml`",
            "a fresh conversation must not get three new attempts",
            "restore failure id/attempt count",
            "does not reset attempt count or failure identity",
        ]:
            self.assertIn(phrase, text)

    def test_handoff_preserves_failure_memory(self):
        text = self.read("commands/handoff-log.md").lower()
        for phrase in [
            "powershell guard state",
            "attempt count for that failure class",
            "explicit do-not-repeat path",
            "does not reset the same-failure attempt count",
        ]:
            self.assertIn(phrase, text)

    def test_updated_command_versions_are_registered(self):
        text = self.read("commands/COMMAND-REGISTRY.md")
        self.assertIn("| `build-git` | 0.2.3 |", text)
        self.assertIn("| `log-build-git` | 0.2.1 |", text)
        self.assertIn("| `handoff-log` | 0.2.1 |", text)

    def test_new_files_fit_context_budget_and_avoid_u2014(self):
        for rel in [
            "library/POWERSHELL-FAILURE-REGISTRY.yaml",
            "loops/SP-LOOP-POWERSHELL-GUARD.md",
        ]:
            path = ROOT / rel
            self.assertLess(len(path.read_bytes()), 15000, rel)
            self.assertNotIn("\u2014", path.read_text(encoding="utf-8"), rel)


if __name__ == "__main__":
    unittest.main()
