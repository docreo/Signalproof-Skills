from pathlib import Path
import unittest

ROOT = Path(__file__).resolve().parents[2]


class BrandPackGuardAcceptance(unittest.TestCase):
    def read(self, rel):
        return (ROOT / rel).read_text(encoding="utf-8")

    def test_design_git_has_first_project_specific_brand_preflight(self):
        text = self.read("commands/design-git.md").lower()
        for required in [
            "brand pack preflight",
            "first project-specific check",
            "verified-present",
            "reuse a still-valid",
            "packaging gate",
            "immediately before creating a package",
            "exact packaging candidate",
        ]:
            self.assertIn(required, text)

    def test_design_git_blocks_missing_brand_pack_or_unchecked_package(self):
        text = self.read("commands/design-git.md").lower()
        self.assertIn("required canonical brand pack is missing", text)
        self.assertIn("without the required exact-candidate brand recheck", text)

    def test_build_git_consumes_design_git_brand_state(self):
        text = self.read("commands/build-git.md").lower()
        for required in [
            "brand-pack enforcement",
            "consume the current `design-git` brand pack guard state",
            "route through `design-git` brand pack preflight",
            "immediately before any package",
            "exact packaging candidate",
        ]:
            self.assertIn(required, text)

    def test_registry_versions_match_brand_guard_release(self):
        registry = self.read("commands/COMMAND-REGISTRY.md")
        self.assertIn("| `design-git` | 0.2.1 |", registry)
        self.assertIn("| `build-git` | 0.2.6 |", registry)

    def test_generated_material_avoids_u2014(self):
        for rel in [
            "commands/design-git.md",
            "commands/build-git.md",
            "commands/COMMAND-REGISTRY.md",
        ]:
            self.assertNotIn("\u2014", self.read(rel), rel)


if __name__ == "__main__":
    unittest.main()
