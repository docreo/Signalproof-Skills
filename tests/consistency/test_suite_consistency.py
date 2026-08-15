import importlib.util
import sys
import tempfile
import unittest
from pathlib import Path

CHECKER_PATH = Path(__file__).resolve().parents[2] / "tools" / "check_suite_consistency.py"
spec = importlib.util.spec_from_file_location("sp_suite_consistency", CHECKER_PATH)
checker = importlib.util.module_from_spec(spec)
assert spec.loader is not None
sys.modules[spec.name] = checker
spec.loader.exec_module(checker)


def skill_text(name, version="0.1.0", maturity="Active public baseline"):
    return f"""---\nname: {name}\ndescription: fixture\n---\n\n# {name}\n\n## Identity\n\n- **Suite:** Signalproof Skills\n- **Skill:** `{name}`\n- **Version:** `{version}`\n- **Maturity:** {maturity}\n"""


def registry_text(rows, planned=""):
    body = [
        "# Signalproof Skill Registry",
        "",
        "| Skill | Version | Maturity | Role | Status |",
        "|---|---:|---|---|---|",
    ]
    body += [f"| `{n}` | {v} | {m} | Fixture role | {s} |" for n, v, m, s in rows]
    body += ["", "## Planned Specialist Lanes", "", planned or "No planned lanes."]
    return "\n".join(body) + "\n"


def readme_text(rows):
    body = [
        "# Signalproof Skills",
        "",
        "## Active skills",
        "",
        "| Skill | Version | Purpose |",
        "|---|---:|---|",
    ]
    body += [f"| [`{n}`](skills/{n}/SKILL.md) | {v} | Fixture |" for n, v in rows]
    body += ["", "## Other", "", "fixture"]
    return "\n".join(body) + "\n"


def router_text(targets, version="0.1.0", maturity="Active public baseline"):
    bullets = "\n".join(f"- `{name}` — fixture;" for name in targets)
    return f"""---\nname: signalproof-router\ndescription: fixture\n---\n\n# Signalproof Router\n\n## Current Routing Set\n\n{bullets}\n\n## Identity\n\n- **Suite:** Signalproof Skills\n- **Skill:** `signalproof-router`\n- **Version:** `{version}`\n- **Maturity:** {maturity}\n"""


class SuiteConsistencyTests(unittest.TestCase):
    def make_repo(self, rows=None, readme_rows=None, router_targets=None, planned=""):
        temp = tempfile.TemporaryDirectory()
        self.addCleanup(temp.cleanup)
        root = Path(temp.name)
        rows = rows or [
            ("signalproof", "0.1.1", "Active public baseline", "Active"),
            ("signalproof-router", "0.1.0", "Active public baseline", "Active"),
            ("signalproof-plan", "0.1.0", "Active public baseline", "Active"),
        ]
        readme_rows = readme_rows or [(n, v) for n, v, _, s in rows if s == "Active"]
        active = [n for n, _, _, s in rows if s == "Active"]
        router_targets = router_targets or [n for n in active if n != "signalproof-router"]

        (root / "skills").mkdir()
        (root / "SKILL-REGISTRY.md").write_text(registry_text(rows, planned), encoding="utf-8")
        (root / "README.md").write_text(readme_text(readme_rows), encoding="utf-8")

        for n, v, m, _ in rows:
            d = root / "skills" / n
            d.mkdir()
            if n == "signalproof-router":
                (d / "SKILL.md").write_text(router_text(router_targets, v, m), encoding="utf-8")
            else:
                (d / "SKILL.md").write_text(skill_text(n, v, m), encoding="utf-8")
        return root

    def assertFailsWith(self, root, phrase):
        errors = checker.check_repository(root)
        self.assertTrue(errors, "fixture unexpectedly passed")
        self.assertTrue(any(phrase in error for error in errors), errors)

    def test_good_fixture_passes(self):
        self.assertEqual([], checker.check_repository(self.make_repo()))

    def test_missing_readme_active_skill_fails(self):
        root = self.make_repo(readme_rows=[("signalproof", "0.1.1"), ("signalproof-router", "0.1.0")])
        self.assertFailsWith(root, "missing from README Active table: signalproof-plan")

    def test_readme_version_mismatch_fails(self):
        root = self.make_repo(readme_rows=[("signalproof", "9.9.9"), ("signalproof-router", "0.1.0"), ("signalproof-plan", "0.1.0")])
        self.assertFailsWith(root, "README/registry version mismatch for signalproof")

    def test_router_omits_active_skill_fails(self):
        root = self.make_repo(router_targets=["signalproof"])
        self.assertFailsWith(root, "Router omits Active routable skill: signalproof-plan")

    def test_missing_active_skill_file_fails(self):
        root = self.make_repo()
        (root / "skills" / "signalproof-plan" / "SKILL.md").unlink()
        self.assertFailsWith(root, "Active registry skill missing SKILL.md: signalproof-plan")

    def test_router_reference_to_candidate_fails(self):
        rows = [
            ("signalproof", "0.1.1", "Active public baseline", "Active"),
            ("signalproof-router", "0.1.0", "Active public baseline", "Active"),
            ("signalproof-plan", "0.1.0", "Active public baseline", "Active"),
            ("signalproof-future", "0.1.0-rc1", "Initial release candidate", "Candidate"),
        ]
        root = self.make_repo(rows=rows, router_targets=["signalproof", "signalproof-plan", "signalproof-future"])
        self.assertFailsWith(root, "Router references non-Active or unknown skill: signalproof-future")

    def test_candidate_in_readme_active_table_fails(self):
        rows = [
            ("signalproof", "0.1.1", "Active public baseline", "Active"),
            ("signalproof-router", "0.1.0", "Active public baseline", "Active"),
            ("signalproof-future", "0.1.0-rc1", "Initial release candidate", "Candidate"),
        ]
        root = self.make_repo(rows=rows, readme_rows=[("signalproof", "0.1.1"), ("signalproof-router", "0.1.0"), ("signalproof-future", "0.1.0-rc1")])
        self.assertFailsWith(root, "README Active skill is not Active in registry: signalproof-future")

    def test_active_registry_with_candidate_maturity_fails(self):
        rows = [
            ("signalproof", "0.1.1", "Initial release candidate", "Active"),
            ("signalproof-router", "0.1.0", "Active public baseline", "Active"),
        ]
        root = self.make_repo(rows=rows)
        self.assertFailsWith(root, "Active registry skill does not declare Active maturity in SKILL.md: signalproof")


if __name__ == "__main__":
    unittest.main()
