#!/usr/bin/env python3
"""Signalproof executable known-error preflight.

Static recurrence prevention for machine-checkable failure patterns.
This tool does not replace platform-native parser/runtime/security acceptance.
"""

from __future__ import annotations

import argparse
import json
import re
import sys
from pathlib import Path


RULES = (
    {
        "id": "KE-PS-CONSOLE-CALL-WRAPPER-001",
        "severity": "BLOCK",
        "modes": {"operator-powershell"},
        "pattern": re.compile(r"^\s*&\s*\{"),
        "message": "Do not hand the operator a leading '& {' wrapper when the observed console path has rejected that submission form.",
    },
    {
        "id": "KE-PS-RESERVED-VARIABLE-001",
        "severity": "BLOCK",
        "modes": {"operator-powershell", "powershell-script"},
        "pattern": re.compile(r"^\s*\$Host\s*=", re.IGNORECASE),
        "message": "Do not assign to PowerShell automatic/read-only variable $Host.",
    },
    {
        "id": "KE-PS-STRICTMODE-DIRECT-COUNT-001",
        "severity": "WARN",
        "modes": {"operator-powershell", "powershell-script"},
        "pattern": re.compile(r"(?<!@\()\$[A-Za-z_][A-Za-z0-9_]*(?:\.[A-Za-z_][A-Za-z0-9_]*)*\.Count\b"),
        "message": "Direct .Count on a value that may be null/scalar is recurrence-prone under StrictMode; normalize intentional collections with @(...).Count.",
    },
    {
        "id": "KE-PS-SPLIT-ELSE-001",
        "severity": "WARN",
        "modes": {"operator-powershell"},
        "pattern": re.compile(r"^\s*else\s*\{", re.IGNORECASE),
        "message": "Standalone else is unsafe for line-by-line interactive submission; keep if/else in one submitted statement or avoid else.",
    },
    {
        "id": "KE-PS-NATIVE-STDERR-AUTHORITY-001",
        "severity": "WARN",
        "modes": {"operator-powershell", "powershell-script"},
        "pattern": re.compile(r"(stderr|standarderror).*(throw|fail|stop)|(?:throw|fail|stop).*(stderr|standarderror)", re.IGNORECASE),
        "message": "stderr presence alone must not be failure authority for native processes; use exit/result contract plus required artifacts.",
    },
)


def analyze(path: Path, mode: str) -> list[dict]:
    text = path.read_text(encoding="utf-8")
    findings: list[dict] = []

    for rule in RULES:
        if mode not in rule["modes"]:
            continue
        for line_no, line in enumerate(text.splitlines(), 1):
            if rule["pattern"].search(line):
                findings.append(
                    {
                        "rule_id": rule["id"],
                        "severity": rule["severity"],
                        "path": str(path),
                        "line": line_no,
                        "message": rule["message"],
                    }
                )

    return findings


def parse_args(argv: list[str]) -> argparse.Namespace:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--mode",
        required=True,
        choices=("operator-powershell", "powershell-script"),
        help="Artifact context; operator-powershell is for paste-ready console commands.",
    )
    parser.add_argument("--json", action="store_true", dest="as_json")
    parser.add_argument("paths", nargs="+", type=Path)
    return parser.parse_args(argv)


def main(argv: list[str] | None = None) -> int:
    args = parse_args(sys.argv[1:] if argv is None else argv)
    findings: list[dict] = []

    for path in args.paths:
        if not path.is_file():
            findings.append(
                {
                    "rule_id": "PREFLIGHT-INPUT-001",
                    "severity": "BLOCK",
                    "path": str(path),
                    "line": 0,
                    "message": "Preflight input is not a readable file.",
                }
            )
            continue
        findings.extend(analyze(path, args.mode))

    blocked = any(item["severity"] == "BLOCK" for item in findings)

    if args.as_json:
        print(
            json.dumps(
                {
                    "status": "BLOCK" if blocked else "PASS_WITH_WARNINGS" if findings else "PASS",
                    "mode": args.mode,
                    "findings": findings,
                },
                indent=2,
            )
        )
    else:
        if not findings:
            print("PASS: no machine-checkable known-error recurrence detected")
        else:
            for item in findings:
                print(
                    f"{item['severity']}: {item['rule_id']}: "
                    f"{item['path']}:{item['line']}: {item['message']}"
                )
            print("STATUS: " + ("BLOCK" if blocked else "PASS_WITH_WARNINGS"))

    return 2 if blocked else 0


if __name__ == "__main__":
    raise SystemExit(main())
