from pathlib import Path
import unittest

ROOT = Path(__file__).resolve().parents[2]


class PowerShellFailureGuardAcceptance(unittest.TestCase):
    def read(self, rel):
        return (ROOT / rel).read_text(encoding="utf-8")

    def test_registry_contains_recurrence_prevention(self):
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

    def test_loop_is_registered_and_cross_chat(self):
        registry = self.read("loops/LOOP-REGISTRY.yaml")
        loop = self.read("loops/SP-LOOP-POWERSHELL-GUARD.md").lower()
        self.assertIn("SP-LOOP-POWERSHELL-GUARD", registry)
        self.assertIn("default_max_iterations: 3", registry)
        self.assertIn("a new chat is not a new failure history", loop)
        self.assertIn("parser-validate the exact final staged `.ps1`", loop)
        self.assertIn("does not reset failure identity or attempt count", loop)

    def test_build_git_requires_persistent_guard(self):
        text = self.read("commands/build-git.md").lower()
        for phrase in [
            "git-backed powershell persistence guard",
            "library/powershell-failure-registry.yaml",
            "fresh chat does not grant a fresh retry budget",
            "parser-preflight the exact final staged `.ps1`",
            "execute at most once for the exact artifact/condition set",
            "sp-loop-powershell-guard",
        ]:
            self.assertIn(phrase, text)

    def test_build_git_is_compact_orchestration_not_registry_duplication(self):
        path = ROOT / "commands/build-git.md"
        text = path.read_text(encoding="utf-8").lower()
        self.assertLess(len(path.read_bytes()), 9000)
        self.assertIn("do not restate the whole registry", text)
        self.assertIn("load only applicable entries", text)
        self.assertIn("reuse still-valid evidence", text)
        self.assertIn("deterministic checks before agent spawn", text)

    def test_existing_executable_preflight_is_preserved(self):
        text = self.read("commands/build-git.md")
        self.assertIn("tools/known_error_preflight.py", text)
        self.assertIn("Evidence sufficiency termination", text)
        self.assertIn("observed operator environment", text)

    def test_fresh_chat_restores_attempt_state(self):
        logbuild = self.read("commands/log-build-git.md").lower()
        handoff = self.read("commands/handoff-log.md").lower()
        self.assertIn("reload failure guards", logbuild)
        self.assertIn("restore failure id/attempt count", logbuild)
        self.assertIn("does not reset attempt count or failure identity", logbuild)
        self.assertIn("powershell guard state", handoff)
        self.assertIn("attempt count for that failure class", handoff)
        self.assertIn("explicit do-not-repeat path", handoff)
        self.assertIn("does not reset the same-failure attempt count", handoff)

    def test_registry_versions_match(self):
        text = self.read("commands/COMMAND-REGISTRY.md")
        self.assertIn("| `build-git` | 0.2.5 |", text)
        self.assertIn("| `log-build-git` | 0.2.1 |", text)
        self.assertIn("| `handoff-log` | 0.2.1 |", text)

    def test_new_artifacts_fit_budget_and_avoid_u2014(self):
        for rel in [
            "library/POWERSHELL-FAILURE-REGISTRY.yaml",
            "loops/SP-LOOP-POWERSHELL-GUARD.md",
        ]:
            path = ROOT / rel
            self.assertLess(len(path.read_bytes()), 15000, rel)
            self.assertNotIn("\u2014", path.read_text(encoding="utf-8"), rel)


if __name__ == "__main__":
    unittest.main()
