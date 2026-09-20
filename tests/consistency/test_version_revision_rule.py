from pathlib import Path
import unittest

ROOT = Path(__file__).resolve().parents[2]


class VersionRevisionRuleAcceptance(unittest.TestCase):
    def read(self, rel):
        return (ROOT / rel).read_text(encoding="utf-8").lower()

    def test_design_git_binds_v_rd_progression(self):
        text = self.read("commands/design-git.md")
        for required in [
            "version/revision planning",
            "rd1 through rd9",
            "never design rd10",
            "v(n+1)/rd1",
            "consumed",
            "version/revision target",
        ]:
            self.assertIn(required, text)

    def test_build_git_blocks_invalid_rollover_and_reuse(self):
        text = self.read("commands/build-git.md")
        for required in [
            "version/revision identity guard",
            "rd1 through rd9",
            "never emit rd10",
            "v(n+1)/rd1",
            "consumed",
            "reuse the failed one",
        ]:
            self.assertIn(required, text)

    def test_registry_versions_match_v_rd_guard_release(self):
        registry = (ROOT / "commands/COMMAND-REGISTRY.md").read_text(encoding="utf-8")
        self.assertIn("| `design-git` | 0.2.2 |", registry)
        self.assertIn("| `build-git` | 0.2.7 |", registry)

    def test_no_u2014_in_changed_material(self):
        for rel in [
            "commands/design-git.md",
            "commands/build-git.md",
            "commands/COMMAND-REGISTRY.md",
        ]:
            self.assertNotIn("\u2014", (ROOT / rel).read_text(encoding="utf-8"), rel)


if __name__ == "__main__":
    unittest.main()
