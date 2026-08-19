from pathlib import Path
import unittest

ROOT = Path(__file__).resolve().parents[2]


class OperatorCommandsAcceptance(unittest.TestCase):
    def read(self, rel):
        return (ROOT / rel).read_text(encoding="utf-8")

    def test_command_registry_declares_new_active_commands(self):
        text = self.read("commands/COMMAND-REGISTRY.md")
        for command in [
            "signalproof-this-plan",
            "signalproof-this-build",
            "signalproof-teach",
            "build-git this",
        ]:
            self.assertIn(command, text)

    def test_signalproof_teach_is_canonical_identity(self):
        text = self.read("commands/COMMAND-REGISTRY.md")
        self.assertIn("`signalproof-teach` | 0.1.0", text)
        self.assertIn("`Signalproof Teach` -> `signalproof-teach`", text)

    def test_commands_preserve_authority_boundaries(self):
        checks = {
            "commands/signalproof-this-plan.md": ["does not authorize implementation", "owner decisions"],
            "commands/signalproof-this-build.md": ["does not grant file-write authority", "Source content as evidence"],
            "commands/signalproof-teach.md": ["does not award HAMM maturity", "source content/evidence"],
            "commands/build-git-this.md": ["Refetch", "protected state", "STOP"],
        }
        for rel, required in checks.items():
            text = self.read(rel).lower()
            for phrase in required:
                self.assertIn(phrase.lower(), text, f"{phrase} missing from {rel}")

    def test_command_files_are_small(self):
        for rel in [
            "commands/signalproof-this-plan.md",
            "commands/signalproof-this-build.md",
            "commands/signalproof-teach.md",
            "commands/build-git-this.md",
        ]:
            self.assertLess(len((ROOT / rel).read_bytes()), 15000, rel)


if __name__ == "__main__":
    unittest.main()
