from pathlib import Path
import unittest

ROOT = Path(__file__).resolve().parents[2]


class DspCommandShellAcceptance(unittest.TestCase):
    def read(self, rel):
        return (ROOT / rel).read_text(encoding="utf-8")

    def test_dsp_command_is_active_and_registered(self):
        dsp = self.read("commands/dsp.md")
        registry = self.read("commands/COMMAND-REGISTRY.md")
        self.assertIn("**Status:** ACTIVE", dsp)
        self.assertIn("`/dsp`", registry)
        self.assertIn("commands/dsp.md", registry)
        self.assertLess(len((ROOT / "commands/dsp.md").read_bytes()), 15000)

    def test_dsp_declares_dr_signalproof_mode(self):
        dsp = self.read("commands/dsp.md").lower()
        self.assertIn("dr. signalproof command shell", dsp)
        self.assertIn("dr. signalproof mode", dsp)
        self.assertIn("not a new authority source", dsp)

    def test_space_hyphen_and_slash_variants_are_supported(self):
        dsp = self.read("commands/dsp.md").lower()
        for required in [
            "/dsp build git",
            "/dsp build-git",
            "dsp-build-git",
            "/dsp this plan",
            "/dsp-this-plan",
            "/dsp this build",
            "/dsp-this-build",
            "/dsp cut-chase",
            "/dsp cut chase",
            "dsp-cut-chase",
        ]:
            self.assertIn(required, dsp)

    def test_aliases_resolve_to_existing_canonical_commands(self):
        dsp = self.read("commands/dsp.md")
        registry = self.read("commands/COMMAND-REGISTRY.md")
        for canonical in [
            "signalproof-this-plan",
            "signalproof-this-build",
            "build-git",
            "build-git this",
            "build-git spawn",
            "build-git-debug",
            "log-build-git",
            "log-build-git-debug",
            "/authorized-log-build-git",
            "signalproof-teach",
            "cut-chase",
            "log-skill",
            "handoff-log",
            "design-git",
        ]:
            self.assertIn(canonical, dsp)
            self.assertIn(f"`{canonical}`", registry)

    def test_public_library_navigation_is_explicit(self):
        dsp = self.read("commands/dsp.md").lower()
        for required in [
            "public signalproof library",
            "docreo/signalproof-skills",
            "/dsp skills",
            "skill-registry.md",
            "/dsp commands",
            "commands/command-registry.md",
            "/dsp loops",
            "loops/loop-registry.yaml",
            "private build ledger",
            "does not replace the public signalproof library",
        ]:
            self.assertIn(required, dsp)

    def test_transport_safe_fallback_and_ambiguity_stop_exist(self):
        dsp = self.read("commands/dsp.md").lower()
        self.assertIn("transport-safe fallback", dsp)
        self.assertIn("if resolution is ambiguous, stop", dsp)
        self.assertIn("host runtimes may intercept slash commands", dsp)

    def test_dsp_does_not_replace_command_authority(self):
        dsp = self.read("commands/dsp.md").lower()
        for required in [
            "resolved canonical command remains authoritative",
            "does not grant write",
            "canonical build ledger authority",
        ]:
            self.assertIn(required, dsp)

    def test_new_material_avoids_u2014(self):
        for rel in ["commands/dsp.md", "commands/COMMAND-REGISTRY.md"]:
            self.assertNotIn("\u2014", self.read(rel), rel)


if __name__ == "__main__":
    unittest.main()
