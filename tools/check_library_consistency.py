#!/usr/bin/env python3
"""Signalproof Library consistency checks with no third-party dependencies."""

from pathlib import Path
import re
import sys

ROOT = Path(__file__).resolve().parents[1]


def active_registry_ids(text: str) -> set[str]:
    ids = set()
    for line in text.splitlines():
        m = re.match(r"\| `(?P<id>signalproof[^`]*)` \| [^|]+ \| [^|]+ \| [^|]+ \| Active \|", line)
        if m:
            ids.add(m.group("id"))
    return ids


def capability_ids(text: str) -> set[str]:
    before_candidates = text.split("\ncandidates:\n", 1)[0]
    ids = set(re.findall(r"\bid:\s*(signalproof[-\w]*)", before_candidates))
    return ids


def loop_entries(text: str) -> list[tuple[str, str]]:
    return re.findall(r"id:\s*(SP-LOOP-[A-Z-]+),\s*file:\s*([\w.-]+)", text)


def check_repository(root: Path = ROOT) -> list[str]:
    errors: list[str] = []

    registry_path = root / "SKILL-REGISTRY.md"
    capability_path = root / "library" / "CAPABILITY-REGISTRY.yaml"
    loop_registry_path = root / "loops" / "LOOP-REGISTRY.yaml"

    for path in (registry_path, capability_path, loop_registry_path):
        if not path.is_file():
            errors.append(f"missing required library file: {path.relative_to(root)}")
    if errors:
        return errors

    active = active_registry_ids(registry_path.read_text(encoding="utf-8"))
    capabilities = capability_ids(capability_path.read_text(encoding="utf-8"))

    for missing in sorted(active - capabilities):
        errors.append(f"Active skill missing from capability registry: {missing}")
    for extra in sorted(capabilities - active):
        errors.append(f"capability registry marks non-Active skill as Active capability: {extra}")

    loop_text = loop_registry_path.read_text(encoding="utf-8")
    entries = loop_entries(loop_text)
    if not entries:
        errors.append("Loop Registry contains no parseable loop entries")
    seen: set[str] = set()
    for loop_id, filename in entries:
        if loop_id in seen:
            errors.append(f"duplicate loop ID: {loop_id}")
        seen.add(loop_id)
        path = root / "loops" / filename
        if not path.is_file():
            errors.append(f"loop registry file missing: {filename}")
            continue
        text = path.read_text(encoding="utf-8")
        if loop_id not in text:
            errors.append(f"loop file does not declare its ID: {filename}")
        if "## STOP" not in text:
            errors.append(f"loop file missing STOP section: {filename}")
        if "## Evidence" not in text:
            errors.append(f"loop file missing Evidence section: {filename}")

    return errors


def main() -> int:
    errors = check_repository()
    if errors:
        print(f"SIGNALPROOF LIBRARY CONSISTENCY: FAIL ({len(errors)} issue(s))")
        for i, error in enumerate(errors, 1):
            print(f"{i:02d}. {error}")
        return 1
    print("SIGNALPROOF LIBRARY CONSISTENCY: PASS")
    return 0


if __name__ == "__main__":
    sys.exit(main())
