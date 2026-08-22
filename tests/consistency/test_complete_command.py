from pathlib import Path
import re
import unittest

ROOT = Path(__file__).resolve().parents[2]


class CompleteCommandAcceptance(unittest.TestCase):
    def read(self, rel):
        return (ROOT / rel).read_text(encoding="utf-8")

    def test_complete_is_active_registered_and_small(self):
        command_path = ROOT / "commands/complete.md"
        command = command_path.read_text(encoding="utf-8")
        registry = self.read("commands/COMMAND-REGISTRY.md")
        self.assertIn("**Status:** ACTIVE", command)
        self.assertLess(len(command_path.read_bytes()), 15000)
        self.assertIn("| `complete` | 0.1.1 |", registry)
        self.assertIn("`complete` -> `commands/complete.md`", registry)

    def test_complete_is_bounded_authorize_all_plus_build_spawn_debug(self):
        text = self.read("commands/complete.md").lower()
        for required in [
            "authorize all owner-authorizable",
            "complete authorization envelope",
            "build-spawn-debug",
            "same-failure retry limits remain binding",
            "do not stop for routine intermediate owner approvals",
            "user ui test ready",
            "human ui fail is not a terminal stop",
            "resume the same build spawn debug workstream automatically",
            "complete / user accepted",
            "cannot manufacture user pass",
        ]:
            self.assertIn(required, text)

    def test_complete_requires_host_quarantine_discovery(self):
        text = self.read("commands/complete.md").lower()
        for required in [
            "host staging and quarantine discovery",
            "bounded read-only host discovery scan",
            "do not assume `%userprofile%\\downloads`",
            "generated or transferred artifacts used for execution must be referenced from that governed location",
            "public skill may define the discovery rule but must not publish a user's private machine path",
            "never silently switch to a convenience path",
        ]:
            self.assertIn(required, text)

    def test_complete_preserves_excluded_authority(self):
        text = self.read("commands/complete.md").lower()
        for required in [
            "protected-main",
            "canonical private build ledger append",
            "candidate skill activation",
            "privilege escalation",
            "security-control",
            "legal/licensing",
        ]:
            self.assertIn(required, text)

    def test_dsp_routes_complete(self):
        dsp = self.read("commands/dsp.md").lower()
        registry = self.read("commands/COMMAND-REGISTRY.md").lower()
        self.assertIn("/dsp complete", dsp)
        self.assertIn("| `complete`, `finish this` | `complete` |", dsp)
        self.assertIn("## complete handler", dsp)
        self.assertIn("/dsp complete", registry)

    def test_dsp_version_matches_registry(self):
        dsp = self.read("commands/dsp.md")
        registry = self.read("commands/COMMAND-REGISTRY.md")
        match = re.search(r"^\*\*Version:\*\*\s+([^\s]+)", dsp, re.MULTILINE)
        self.assertIsNotNone(match)
        self.assertIn(f"| `/dsp` | {match.group(1)} |", registry)

    def test_generated_material_avoids_u2014(self):
        for rel in [
            "commands/complete.md",
            "commands/dsp.md",
            "commands/COMMAND-REGISTRY.md",
        ]:
            self.assertNotIn("\u2014", self.read(rel), rel)


if __name__ == "__main__":
    unittest.main()
