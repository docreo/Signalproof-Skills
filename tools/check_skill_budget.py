#!/usr/bin/env python3
"""Signalproof Skill Budget Checker.

Measures exact UTF-8 byte size of every SKILL.md under skills/ and classifies
it against the Signalproof Skill Atomicity and Context Budget bands.

Exit codes:
  0 = no SKILL.md is 15,000 bytes or larger
  2 = one or more SKILL.md files are over limit
"""

from __future__ import annotations

from pathlib import Path
import json
import sys

HEALTHY_MAX = 9_999
WATCH_MAX = 11_999
REVIEW_MAX = 14_999
LIMIT = 15_000


def classify(size: int) -> str:
    if size <= HEALTHY_MAX:
        return "HEALTHY"
    if size <= WATCH_MAX:
        return "WATCH"
    if size <= REVIEW_MAX:
        return "REVIEW"
    return "OVER_LIMIT"


def main() -> int:
    repo = Path(__file__).resolve().parents[1]
    skills_root = repo / "skills"
    rows = []

    for skill_file in sorted(skills_root.rglob("SKILL.md")):
        raw = skill_file.read_bytes()
        # Require valid UTF-8 so byte budget and runtime text identity remain deterministic.
        raw.decode("utf-8")
        size = len(raw)
        rows.append(
            {
                "path": skill_file.relative_to(repo).as_posix(),
                "bytes": size,
                "status": classify(size),
                "limit_bytes": LIMIT,
            }
        )

    over = [row for row in rows if row["status"] == "OVER_LIMIT"]

    print("Signalproof Skill Budget")
    print(f"Ceiling: {LIMIT} UTF-8 bytes\n")
    for row in rows:
        print(f"{row['status']:<10} {row['bytes']:>6}  {row['path']}")

    print("\nJSON")
    print(json.dumps({"limit_bytes": LIMIT, "skills": rows}, indent=2))

    if over:
        print(f"\nFAIL: {len(over)} skill(s) are at or above {LIMIT} bytes.", file=sys.stderr)
        return 2

    print("\nPASS: all skills are below the ceiling.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
