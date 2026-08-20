from pathlib import Path
import importlib.util
import sys
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[2]
TOOL_PATH = ROOT / "tools" / "known_error_preflight.py"

spec = importlib.util.spec_from_file_location("known_error_preflight", TOOL_PATH)
preflight = importlib.util.module_from_spec(spec)
sys.modules[spec.name] = preflight
assert spec.loader is not None
spec.loader.exec_module(preflight)


class KnownErrorPreflightToolTests(unittest.TestCase):
    def write(self, text):
        handle = tempfile.NamedTemporaryFile("w", suffix=".ps1", delete=False, encoding="utf-8")
        handle.write(text)
        handle.close()
        return Path(handle.name)

    def test_blocks_observed_console_wrapper_recurrence(self):
        path = self.write("& {\nWrite-Host 'x'\n}\n")
        findings = preflight.analyze(path, "operator-powershell")
        self.assertTrue(any(f["rule_id"] == "KE-PS-CONSOLE-CALL-WRAPPER-001" and f["severity"] == "BLOCK" for f in findings))

    def test_script_mode_does_not_block_wrapper_generically(self):
        path = self.write("& {\nWrite-Host 'x'\n}\n")
        findings = preflight.analyze(path, "powershell-script")
        self.assertFalse(any(f["rule_id"] == "KE-PS-CONSOLE-CALL-WRAPPER-001" for f in findings))

    def test_blocks_reserved_host_assignment(self):
        path = self.write("$Host = 'bad'\n")
        findings = preflight.analyze(path, "powershell-script")
        self.assertTrue(any(f["rule_id"] == "KE-PS-RESERVED-VARIABLE-001" and f["severity"] == "BLOCK" for f in findings))

    def test_warns_direct_count_shape(self):
        path = self.write("Set-StrictMode -Version Latest\nif ($Errors.Count -ne 0) { throw 'x' }\n")
        findings = preflight.analyze(path, "powershell-script")
        self.assertTrue(any(f["rule_id"] == "KE-PS-STRICTMODE-DIRECT-COUNT-001" for f in findings))

    def test_normalized_count_not_flagged(self):
        path = self.write("if (@($Errors).Count -ne 0) { throw 'x' }\n")
        findings = preflight.analyze(path, "powershell-script")
        self.assertFalse(any(f["rule_id"] == "KE-PS-STRICTMODE-DIRECT-COUNT-001" for f in findings))

    def test_warns_standalone_else_for_operator_mode(self):
        path = self.write("else {\nWrite-Host 'missing'\n}\n")
        findings = preflight.analyze(path, "operator-powershell")
        self.assertTrue(any(f["rule_id"] == "KE-PS-SPLIT-ELSE-001" for f in findings))


if __name__ == "__main__":
    unittest.main()
