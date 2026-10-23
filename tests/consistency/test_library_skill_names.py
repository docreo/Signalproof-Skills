"""All registered skill names must receive the same routing integrity checks."""

import importlib.util
import tempfile
import unittest
from pathlib import Path


CHECKER_PATH = Path(__file__).resolve().parents[2] / "tools" / "check_library_consistency.py"
spec = importlib.util.spec_from_file_location("sp_library_skill_names", CHECKER_PATH)
checker = importlib.util.module_from_spec(spec)
assert spec.loader is not None
spec.loader.exec_module(checker)


class LibrarySkillNameTests(unittest.TestCase):
    def make_repo(self, registry_status="Active", capability="videocraft"):
        temp = tempfile.TemporaryDirectory()
        self.addCleanup(temp.cleanup)
        root = Path(temp.name)
        (root / "library").mkdir()
        (root / "loops").mkdir()
        (root / "SKILL-REGISTRY.md").write_text(
            "| Skill | Version | Maturity | Role | Status |\n"
            f"| `videocraft` | 1.0.0 | Test maturity | Edit video | {registry_status} |\n",
            encoding="utf-8",
        )
        (root / "library/CAPABILITY-REGISTRY.yaml").write_text(
            f"capabilities:\n  - {{id: {capability}, state: ACTIVE}}\n"
            "candidates:\n  - {id: future-video, state: CANDIDATE}\n",
            encoding="utf-8",
        )
        (root / "loops/LOOP-REGISTRY.yaml").write_text(
            "- {id: SP-LOOP-TEST, file: test.md}\n", encoding="utf-8"
        )
        (root / "loops/test.md").write_text(
            "# SP-LOOP-TEST\n## STOP\n## Evidence\n", encoding="utf-8"
        )
        return root

    def test_unprefixed_active_entry_passes(self):
        self.assertEqual([], checker.check_repository(self.make_repo()))

    def test_missing_and_unknown_entries_both_fail(self):
        errors = checker.check_repository(self.make_repo(capability="unknown-skill"))
        self.assertIn("Active skill missing from capability registry: videocraft", errors)
        self.assertIn("capability registry marks non-Active skill as Active capability: unknown-skill", errors)

    def test_candidate_cannot_be_active_capability(self):
        errors = checker.check_repository(self.make_repo(registry_status="Candidate"))
        self.assertIn("capability registry marks non-Active skill as Active capability: videocraft", errors)

    def test_mixed_names_and_candidate_boundary(self):
        text = "capabilities:\n- {id: signalproof, state: ACTIVE}\n- id: videocraft\n  state: ACTIVE\ncandidates:\n- id: future-video\n"
        self.assertEqual({"signalproof", "videocraft"}, checker.capability_ids(text))


if __name__ == "__main__":
    unittest.main()
