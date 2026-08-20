from pathlib import Path
import re
import unittest

ROOT = Path(__file__).resolve().parents[2]


class DspFullDebugAcceptance(unittest.TestCase):
    def read(self, rel):
        return (ROOT / rel).read_text(encoding="utf-8")

    def normalized(self, rel):
        return self.read(rel).lower().replace("**", "")

    def test_full_debug_skill_and_command_are_registered_and_under_budget(self):
        skill = ROOT / "skills/signalproof-full-debug/SKILL.md"
        command = ROOT / "commands/full-debug.md"
        self.assertTrue(skill.is_file())
        self.assertTrue(command.is_file())
        self.assertLess(len(skill.read_bytes()), 15000)
        self.assertLess(len(command.read_bytes()), 15000)

        skill_registry = self.read("SKILL-REGISTRY.md")
        capability_registry = self.read("library/CAPABILITY-REGISTRY.yaml")
        command_registry = self.read("commands/COMMAND-REGISTRY.md")
        self.assertIn("`signalproof-full-debug`", skill_registry)
        self.assertIn("id: signalproof-full-debug", capability_registry)
        self.assertIn("`full-debug`", command_registry)
        self.assertIn("commands/full-debug.md", command_registry)

    def test_dsp_variants_resolve_to_one_canonical_full_debug_command(self):
        dsp = self.read("commands/dsp.md").lower()
        registry = self.read("commands/COMMAND-REGISTRY.md").lower()
        for form in [
            "/dsp full-debug",
            "/dsp full debug",
            "/dsp-full-debug",
            "dsp full-debug",
            "dsp-full-debug",
        ]:
            self.assertIn(form, dsp)
        self.assertIn("| `full debug`, `full-debug` | `full-debug` |", dsp)
        self.assertIn("/dsp full-debug", registry)

    def test_full_debug_composes_existing_debug_once_instead_of_double_running(self):
        command = self.read("commands/full-debug.md").lower()
        for required in [
            "log-build-git-debug",
            "build-git spawn",
            "must not invoke a second independent `build-git-debug`",
            "role-separation execution model",
            "signalproof-full-debug",
        ]:
            self.assertIn(required, command)

    def test_authorize_all_is_bounded_and_excludes_protected_authority_classes(self):
        skill = self.normalized("skills/signalproof-full-debug/SKILL.md")
        command = self.normalized("commands/full-debug.md")
        for required in [
            "all owner-authorizable actions required by the current bounded full debug envelope",
            "canonical build ledger append",
            "release or production deployment",
            "privilege escalation",
            "credentials",
            "unrelated repositories",
            "candidate activation",
        ]:
            self.assertIn(required, skill)
            self.assertIn(required, command)
        self.assertIn("not a reusable credential or blanket authorization", skill)

    def test_failure_memory_and_powershell_guard_survive_chat_boundaries(self):
        skill = self.read("skills/signalproof-full-debug/SKILL.md").lower()
        command = self.read("commands/full-debug.md").lower()
        for required in [
            "new chat",
            "retry budget",
            "powershell-failure-registry.yaml",
            "parser-preflight the exact final staged `.ps1`",
            "materially unchanged known-bad retries",
        ]:
            self.assertIn(required, command)
        self.assertIn("prior failed-attempt count", skill)
        self.assertIn("does not reset failure identity or retry budget", skill)

    def test_spawn_truth_and_governor_boundary_are_explicit(self):
        skill = self.read("skills/signalproof-full-debug/SKILL.md").lower()
        command = self.read("commands/full-debug.md").lower()
        for required in ["builder", "design", "governor", "logical lanes"]:
            self.assertIn(required, skill)
            self.assertIn(required, command)
        self.assertIn("never claim agents spawned when they did not", command)
        self.assertIn("cannot manufacture owner permission", skill)

    def test_command_and_registry_versions_match(self):
        command = self.read("commands/full-debug.md")
        registry = self.read("commands/COMMAND-REGISTRY.md")
        match = re.search(r"^\*\*Version:\*\*\s+([^\s]+)", command, re.MULTILINE)
        self.assertIsNotNone(match)
        self.assertIn(f"| `full-debug` | {match.group(1)} |", registry)

        dsp = self.read("commands/dsp.md")
        dsp_match = re.search(r"^\*\*Version:\*\*\s+([^\s]+)", dsp, re.MULTILINE)
        self.assertIsNotNone(dsp_match)
        self.assertIn(f"| `/dsp` | {dsp_match.group(1)} |", registry)

    def test_new_full_debug_material_avoids_u2014(self):
        for rel in [
            "skills/signalproof-full-debug/SKILL.md",
            "commands/full-debug.md",
            "commands/dsp.md",
            "commands/COMMAND-REGISTRY.md",
        ]:
            self.assertNotIn("\u2014", self.read(rel), rel)


if __name__ == "__main__":
    unittest.main()
