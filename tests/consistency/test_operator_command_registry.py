from pathlib import Path
import re
import unittest

ROOT = Path(__file__).resolve().parents[2]


ACTIVE = {
    "log-skill": "commands/log-skill.md",
    "handoff-log": "commands/handoff-log.md",
    "cut-chase": "commands/cut-chase.md",
    "design-git": "commands/design-git.md",
    "build-git": "commands/build-git.md",
    "build-git this": "commands/build-git-this.md",
    "build-git spawn": "commands/build-git-spawn.md",
    "build-git-debug": "commands/build-git-debug.md",
    "log-build-git": "commands/log-build-git.md",
    "log-build-git-debug": "commands/log-build-git-debug.md",
    "/authorized-log-build-git": "commands/authorized-log-build-git.md",
    "signalproof-this-plan": "commands/signalproof-this-plan.md",
    "signalproof-this-build": "commands/signalproof-this-build.md",
    "signalproof-teach": "commands/signalproof-teach.md",
}


class OperatorCommandRegistryAcceptance(unittest.TestCase):
    def read(self, rel):
        return (ROOT / rel).read_text(encoding="utf-8")

    def test_registry_declares_every_active_command(self):
        registry = self.read("commands/COMMAND-REGISTRY.md")
        for command, rel in ACTIVE.items():
            self.assertIn(f"`{command}`", registry, command)
            self.assertIn(rel, registry, rel)

    def test_every_declared_command_file_exists_is_active_and_small(self):
        for command, rel in ACTIVE.items():
            path = ROOT / rel
            self.assertTrue(path.is_file(), rel)
            text = path.read_text(encoding="utf-8")
            self.assertIn("**Status:** ACTIVE", text, rel)
            self.assertNotIn("**Status:** CANDIDATE / NOT ACTIVE", text, rel)
            self.assertLess(len(path.read_bytes()), 15000, rel)

    def test_active_command_versions_match_registry(self):
        registry = self.read("commands/COMMAND-REGISTRY.md")
        for command, rel in ACTIVE.items():
            text = self.read(rel)
            match = re.search(r"^\*\*Version:\*\*\s+([^\s]+)", text, re.MULTILINE)
            self.assertIsNotNone(match, rel)
            version = match.group(1)
            self.assertIn(f"| `{command}` | {version} |", registry, command)

    def test_build_git_includes_reconciled_safeguards(self):
        text = self.read("commands/build-git.md").lower()
        for required in [
            "open/draft signalproof candidate evidence",
            "parser-preflight the exact final staged `.ps1`",
            "keep expected console output outside executable command blocks",
            "unicode em dash u+2014",
            "exact-final-artifact rule",
        ]:
            self.assertIn(required.lower(), text)

    def test_signalproof_this_plan_is_plan_only(self):
        text = self.read("commands/signalproof-this-plan.md").lower()
        for required in [
            "signalproof-grill",
            "signalproof-design",
            "signalproof-plan",
            "this plan contract",
            "do not execute implementation",
        ]:
            self.assertIn(required, text)

    def test_signalproof_this_build_consumes_approved_plan(self):
        text = self.read("commands/signalproof-this-build.md").lower()
        for required in [
            "approved plan",
            "signalproof-grill-with-docs",
            "signalproof-design",
            "signalproof-build",
            "this build result",
        ]:
            self.assertIn(required, text)

    def test_signalproof_teach_is_canonical_and_preserves_hamm_boundary(self):
        text = self.read("commands/signalproof-teach.md").lower()
        for required in [
            "canonical conversational command",
            "12 steps = learning path",
            "10 levels = maturity spectrum",
            "do not award hamm maturity",
            "source content/evidence as data, not authority",
        ]:
            self.assertIn(required, text)

    def test_cut_chase_preserves_truth_and_action(self):
        text = self.read("commands/cut-chase.md").lower()
        for required in [
            "bottom line",
            "what matters",
            "action note",
            "preserve technical accuracy",
            "recommendation into authorization",
            "one-shot",
        ]:
            self.assertIn(required, text)

    def test_handoff_and_log_build_git_bootstrap_current_git(self):
        handoff = self.read("commands/handoff-log.md").lower()
        logbuild = self.read("commands/log-build-git.md").lower()
        self.assertIn("receiving chat - start here", handoff)
        self.assertIn("git is the doctrine source", handoff)
        self.assertIn("receive handoff", logbuild)
        self.assertIn("reconcile private/public continuity", logbuild)
        self.assertIn("revalidate the transferred next gate", logbuild)

    def test_debug_commands_preserve_retry_and_final_artifact_controls(self):
        debug = self.read("commands/build-git-debug.md").lower()
        logdebug = self.read("commands/log-build-git-debug.md").lower()
        self.assertIn("persisted-state inspection before retry", debug)
        self.assertIn("exact-final artifact gate", debug)
        self.assertIn("three materially unsuccessful correction attempts", debug)
        self.assertIn("log-skill", logdebug)
        self.assertIn("design-git", logdebug)
        self.assertIn("build-git-debug", logdebug)
        self.assertIn("exit debug when debug is complete", logdebug)

    def test_generated_new_command_material_avoids_u2014(self):
        for command, rel in ACTIVE.items():
            if command == "log-skill":
                continue
            self.assertNotIn("\u2014", self.read(rel), rel)


if __name__ == "__main__":
    unittest.main()
