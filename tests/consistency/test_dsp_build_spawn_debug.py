from pathlib import Path
import unittest

ROOT = Path(__file__).resolve().parents[2]


class DSPBuildSpawnDebugAcceptance(unittest.TestCase):
    def read(self, rel):
        return (ROOT / rel).read_text(encoding="utf-8")

    def test_skill_and_command_exist_and_fit_budget(self):
        skill = ROOT / "skills/signalproof-build-spawn-debug/SKILL.md"
        command = ROOT / "commands/build-spawn-debug.md"
        self.assertTrue(skill.is_file())
        self.assertTrue(command.is_file())
        self.assertLess(len(skill.read_bytes()), 15000)
        self.assertLess(len(command.read_bytes()), 15000)

    def test_dsp_routes_one_canonical_command(self):
        dsp = self.read("commands/dsp.md").lower()
        registry = self.read("commands/COMMAND-REGISTRY.md")
        for form in [
            "/dsp build-spawn-debug",
            "/dsp build spawn debug",
            "dsp-build-spawn-debug",
        ]:
            self.assertIn(form, dsp)
        self.assertIn("`build-spawn-debug`", registry)
        self.assertIn("commands/build-spawn-debug.md", registry)

    def test_loop_converges_to_human_ui_gate(self):
        skill = self.read("skills/signalproof-build-spawn-debug/SKILL.md").lower()
        for required in [
            "automated pass / user ui test ready",
            "user ui fail / debug resumed",
            "user ui pass / owner authorization ready",
            "same-failure retry discipline remains binding",
            "materially changed condition",
            "signalproof-learn",
            "does not silently rewrite this skill",
        ]:
            self.assertIn(required, skill)

    def test_human_acceptance_is_not_fabricated(self):
        command = self.read("commands/build-spawn-debug.md").lower()
        for required in [
            "never claim human ui pass before the human reports it",
            "human ui pass into release/production/canonical-ledger authority",
            "user ui test",
            "same-failure retry limits remain binding",
        ]:
            self.assertIn(required, command)

    def test_public_registries_include_skill(self):
        registry = self.read("SKILL-REGISTRY.md")
        readme = self.read("README.md")
        capabilities = self.read("library/CAPABILITY-REGISTRY.yaml")
        router = self.read("skills/signalproof-router/SKILL.md")
        for text in [registry, readme, capabilities, router]:
            self.assertIn("signalproof-build-spawn-debug", text)

    def test_generated_material_avoids_u2014(self):
        for rel in [
            "skills/signalproof-build-spawn-debug/SKILL.md",
            "commands/build-spawn-debug.md",
            "commands/dsp.md",
        ]:
            self.assertNotIn("\u2014", self.read(rel), rel)


if __name__ == "__main__":
    unittest.main()
