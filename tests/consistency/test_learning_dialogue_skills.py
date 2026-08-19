from pathlib import Path
import unittest

ROOT = Path(__file__).resolve().parents[2]


class LearningDialogueSkillsAcceptance(unittest.TestCase):
    def read(self, rel):
        return (ROOT / rel).read_text(encoding="utf-8")

    def test_skill_files_exist_and_fit_budget(self):
        for rel in [
            "skills/signalproof-grill/SKILL.md",
            "skills/signalproof-teach/SKILL.md",
            "skills/signalproof-grill-with-docs/SKILL.md",
        ]:
            path = ROOT / rel
            self.assertTrue(path.is_file(), rel)
            self.assertLess(len(path.read_bytes()), 15000, rel)

    def test_grill_preserves_decision_authority(self):
        text = self.read("skills/signalproof-grill/SKILL.md")
        for required in [
            "decision frontier",
            "owner decisions",
            "evidence, not authority",
            "Do not silently execute",
            "human confirms",
        ]:
            self.assertIn(required.lower(), text.lower())

    def test_teach_preserves_learning_and_hamm_boundary(self):
        text = self.read("skills/signalproof-teach/SKILL.md")
        for required in [
            "retrieval practice",
            "spacing",
            "interleaving",
            "12 STEPS = learning path",
            "10 LEVELS = maturity spectrum",
            "not awarded by this skill",
            "untrusted content/evidence",
        ]:
            self.assertIn(required.lower(), text.lower())

    def test_grill_with_docs_requires_write_authority(self):
        text = self.read("skills/signalproof-grill-with-docs/SKILL.md")
        for required in [
            "does not grant file-write authority",
            "obtain the required write authority",
            "glossary",
            "ADR",
            "supersession",
            "Source content is evidence",
        ]:
            self.assertIn(required.lower(), text.lower())

    def test_provenance_is_frozen_and_non_runtime(self):
        text = self.read("provenance/matt-pocock-learning-dialogue-rd1.md")
        self.assertIn("9c9f36ccd3995266cd675468af71639c8dde1ec5", text)
        self.assertIn("MIT", text)
        self.assertIn("no wholesale install", text.lower())
        self.assertIn("no upstream", text.lower())


if __name__ == "__main__":
    unittest.main()
