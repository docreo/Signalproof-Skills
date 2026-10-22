import hashlib
import json
import re
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
PACK = ROOT / "packs" / "ghl-skills-v1"
def canonical_bytes(path):
    """Hash Git's canonical LF text bytes consistently across platforms."""
    return path.read_bytes().replace(b"\r\n", b"\n")


EXPECTED = {
    "ghl-account-audit", "ghl-agency-locations", "ghl-users-permissions",
    "ghl-contacts-companies", "ghl-custom-fields-values",
    "ghl-opportunities-pipelines", "ghl-calendars-appointments",
    "ghl-workflows-automation", "ghl-conversations-messaging",
    "ghl-forms-surveys", "ghl-funnels-websites", "ghl-products-payments",
    "ghl-documents-contracts", "ghl-content-social", "ghl-reputation",
    "ghl-memberships-courses", "ghl-integrations-webhooks",
    "ghl-snapshots-migrations", "ghl-reporting-attribution",
    "ghl-safe-testing-recovery",
}


class GHLSkillsPackAcceptance(unittest.TestCase):
    def test_manifest_has_exact_specialist_set(self):
        manifest = json.loads((PACK / "MANIFEST.json").read_text(encoding="utf-8"))
        self.assertEqual(20, manifest["specialist_count"])
        self.assertEqual(EXPECTED, {item["name"] for item in manifest["skills"]})

    def test_manifest_skill_hashes_match(self):
        manifest = json.loads((PACK / "MANIFEST.json").read_text(encoding="utf-8"))
        for item in manifest["skills"]:
            path = PACK / "skills" / item["name"] / "SKILL.md"
            payload = canonical_bytes(path)
            self.assertEqual(item["bytes"], len(payload))
            self.assertEqual(item["sha256"], hashlib.sha256(payload).hexdigest())

    def test_pack_checksum_manifest_matches(self):
        lines = (PACK / "SHA256SUMS.txt").read_text(encoding="utf-8").splitlines()
        self.assertEqual(23, len(lines))
        for line in lines:
            digest, relative = line.split("  ", 1)
            self.assertEqual(digest, hashlib.sha256(canonical_bytes(PACK / relative)).hexdigest())

    def test_public_placeholders_and_boundaries(self):
        combined = "\n".join(path.read_text(encoding="utf-8") for path in PACK.rglob("*.md"))
        self.assertIn("<LOCATION_ID>", combined)
        self.assertIn("example.invalid", combined)
        for forbidden in ("AppData", "F:\\", "C:\\", "@gmail.com", "@signalproof.com"):
            self.assertNotIn(forbidden, combined)
        self.assertIsNone(re.search(r"(?i)(api[_ -]?key|token|secret)\s*[:=]\s*[A-Za-z0-9_-]{16,}", combined))

    def test_active_coordinator_routes_every_specialist(self):
        coordinator = (ROOT / "skills" / "signalproof-ghl" / "SKILL.md").read_text(encoding="utf-8")
        for name in EXPECTED:
            self.assertIn(f"`{name}`", coordinator)


if __name__ == "__main__":
    unittest.main()
