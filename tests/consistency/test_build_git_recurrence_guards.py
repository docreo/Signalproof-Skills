from pathlib import Path
import unittest

ROOT = Path(__file__).resolve().parents[2]


class BuildGitRecurrenceGuardTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.text = (ROOT / "commands" / "build-git.md").read_text(encoding="utf-8")
        cls.lower = cls.text.lower()

    def test_observed_operator_environment_outranks_generic_wrapper_recipe(self):
        self.assertIn("choose interactive submission style from the **observed operator environment**", self.text)
        self.assertIn("has rejected a leading `& { ... }` wrapper", self.text)
        self.assertNotIn("preferably one `& { ... }` block", self.text)

    def test_executable_known_error_preflight_is_required_when_applicable(self):
        self.assertIn("### executable known-error enforcement", self.lower)
        self.assertIn("tools/known_error_preflight.py", self.text)
        self.assertIn("validator `block` must stop handoff", self.lower)

    def test_evidence_sufficiency_termination_prevents_false_regression(self):
        self.assertIn("## evidence sufficiency termination", self.lower)
        self.assertIn("do not automatically regress an already-proven product/security claim", self.lower)
        self.assertIn("consume already-valid evidence instead of rerunning unchanged tests", self.lower)

    def test_shape_and_structural_rules_are_preserved(self):
        for phrase in (
            "@($value).count",
            "reason_codes",
            "self-referential static guards",
            "inspect structured fields structurally",
        ):
            self.assertIn(phrase, self.lower)


if __name__ == "__main__":
    unittest.main()
