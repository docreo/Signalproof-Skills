from pathlib import Path
import re
import unittest

ROOT = Path(__file__).resolve().parents[2]
ABSOLUTE_WINDOWS_PATH = re.compile(r"(?<![A-Za-z0-9_])(?:[A-Za-z]:\\)")


def candidate_files():
    for base in ("tools/workbench", "provenance", "handoffs", "designs"):
        root = ROOT / base
        if not root.exists():
            continue
        for path in root.rglob("*"):
            if not path.is_file():
                continue
            name = path.name.lower()
            if "workbench" not in name and "sp-workbench" not in name:
                continue
            if path.suffix.lower() not in {".ps1", ".md", ".txt", ".json", ".yaml", ".yml"}:
                continue
            yield path


class WorkbenchR6PublicPathHygiene(unittest.TestCase):
    def test_public_workbench_artifacts_do_not_publish_literal_drive_root_paths(self):
        findings = []
        for path in candidate_files():
            text = path.read_text(encoding="utf-8", errors="replace")
            for line_number, line in enumerate(text.splitlines(), 1):
                if ABSOLUTE_WINDOWS_PATH.search(line):
                    findings.append(f"{path.relative_to(ROOT)}:{line_number}: {line.strip()}")

        self.assertEqual(
            findings,
            [],
            "Public Workbench artifacts contain literal workstation drive-root paths:\n"
            + "\n".join(findings),
        )


if __name__ == "__main__":
    unittest.main()
