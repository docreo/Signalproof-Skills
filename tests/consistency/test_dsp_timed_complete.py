from pathlib import Path
import re
import unittest

ROOT = Path(__file__).resolve().parents[2]


class TimedCompleteAcceptance(unittest.TestCase):
    def read(self, rel):
        return (ROOT / rel).read_text(encoding="utf-8")

    def test_skill_and_command_are_active_registered_and_small(self):
        skill_path = ROOT / "skills/signalproof-timed-complete/SKILL.md"
        command_path = ROOT / "commands/st.md"
        skill = skill_path.read_text(encoding="utf-8")
        command = command_path.read_text(encoding="utf-8")
        skill_registry = self.read("SKILL-REGISTRY.md")
        command_registry = self.read("commands/COMMAND-REGISTRY.md")
        self.assertLess(len(skill_path.read_bytes()), 15000)
        self.assertLess(len(command_path.read_bytes()), 15000)
        self.assertIn("signalproof-timed-complete", skill)
        self.assertIn("**Status:** ACTIVE", command)
        self.assertIn("| `signalproof-timed-complete` | 0.1.0 |", skill_registry)
        self.assertIn("| `st` | 0.1.0 |", command_registry)
        self.assertIn("`st` -> `commands/st.md`", command_registry)

    def test_argument_before_command_syntax_is_explicit(self):
        dsp = self.read("commands/dsp.md").lower()
        command = self.read("commands/st.md").lower()
        for required in [
            "/dsp 30m st",
            "/dsp 2h st",
            "<time> st",
            "duration",
        ]:
            self.assertIn(required, dsp + "\n" + command)
        self.assertIn("final token", dsp)
        self.assertIn("preserve", dsp)

    def test_timed_complete_wraps_complete_without_weakening_it(self):
        text = (self.read("skills/signalproof-timed-complete/SKILL.md") + "\n" + self.read("commands/st.md")).lower()
        for required in [
            "complete",
            "build-spawn-debug",
            "known-error",
            "same-failure retry limits",
            "protected-main",
            "canonical private build ledger append",
            "privilege escalation",
            "recovery",
            "verification",
        ]:
            self.assertIn(required, text)

    def test_expiry_is_resumable_not_pass(self):
        text = (self.read("skills/signalproof-timed-complete/SKILL.md") + "\n" + self.read("commands/st.md")).lower()
        for required in [
            "st / timebox expired / resumable",
            "do not begin a new material",
            "minimum safe checkpoint",
            "resume",
            "time expiry is not a pass",
        ]:
            self.assertIn(required, text)

    def test_no_default_time_is_invented(self):
        text = (self.read("skills/signalproof-timed-complete/SKILL.md") + "\n" + self.read("commands/st.md")).lower()
        self.assertIn("do not invent a default", text)
        self.assertIn("zero/negative", text)
        self.assertIn("ambiguous", text)

    def test_dsp_version_matches_registry(self):
        dsp = self.read("commands/dsp.md")
        registry = self.read("commands/COMMAND-REGISTRY.md")
        match = re.search(r"^\*\*Version:\*\*\s+([^\s]+)", dsp, re.MULTILINE)
        self.assertIsNotNone(match)
        self.assertIn(f"| `/dsp` | {match.group(1)} |", registry)

    def test_router_and_capability_registry_include_skill(self):
        router = self.read("skills/signalproof-router/SKILL.md")
        capabilities = self.read("library/CAPABILITY-REGISTRY.yaml")
        self.assertIn("signalproof-timed-complete", router)
        self.assertIn("signalproof-timed-complete", capabilities)
        self.assertIn("state: ACTIVE", capabilities)

    def test_new_material_avoids_u2014(self):
        for rel in [
            "skills/signalproof-timed-complete/SKILL.md",
            "commands/st.md",
            "commands/dsp.md",
            "commands/COMMAND-REGISTRY.md",
            "SKILL-REGISTRY.md",
        ]:
            self.assertNotIn("\u2014", self.read(rel), rel)


if __name__ == "__main__":
    unittest.main()
