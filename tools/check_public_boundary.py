#!/usr/bin/env python3
"""Fail closed on tracked private-boundary files and high-confidence credentials.

This deterministic repository check complements, but does not replace, GitHub native
secret scanning, push protection, incident response, or an admitted external scanner.
"""

from __future__ import annotations

import re
import subprocess
import sys
from pathlib import Path, PurePosixPath
from typing import Iterable

FORBIDDEN_BASENAMES = {
    ".env",
    ".npmrc",
    ".pypirc",
    "id_ed25519",
    "id_rsa",
}
FORBIDDEN_SUFFIXES = {".key", ".p12", ".pem", ".pfx"}
FORBIDDEN_ROOTS = {".private", "private", "secrets"}

CONTENT_PATTERNS = (
    (
        "private-key material",
        re.compile(rb"-----BEGIN (?:RSA |EC |OPENSSH |DSA )?PRIVATE KEY-----"),
    ),
    ("GitHub token", re.compile(rb"\bgh[pousr]_[A-Za-z0-9]{36,}\b")),
    ("GitHub fine-grained token", re.compile(rb"\bgithub_pat_[A-Za-z0-9_]{40,}\b")),
    ("AWS access-key ID", re.compile(rb"\bAKIA[0-9A-Z]{16}\b")),
    ("OpenAI-style API key", re.compile(rb"\bsk-[A-Za-z0-9]{32,}\b")),
    (
        "credential-bearing URL",
        re.compile(rb"https?://[^\s/@:]+:[^\s/@]+@[^\s/]+", re.IGNORECASE),
    ),
)


def tracked_paths(root: Path) -> list[str]:
    result = subprocess.run(
        ["git", "ls-files", "-z"],
        cwd=root,
        check=True,
        stdout=subprocess.PIPE,
    )
    return [item.decode("utf-8") for item in result.stdout.split(b"\0") if item]


def scan_paths(root: Path, paths: Iterable[str]) -> list[str]:
    findings: list[str] = []
    for raw_path in paths:
        relative = PurePosixPath(raw_path.replace("\\", "/"))
        parts_lower = tuple(part.lower() for part in relative.parts)
        basename = relative.name.lower()
        suffix = relative.suffix.lower()

        if parts_lower and parts_lower[0] in FORBIDDEN_ROOTS:
            findings.append(f"{relative}: forbidden public-repository root")
        if basename in FORBIDDEN_BASENAMES or suffix in FORBIDDEN_SUFFIXES:
            findings.append(f"{relative}: forbidden credential-bearing filename")

        file_path = root.joinpath(*relative.parts)
        if not file_path.is_file():
            continue
        data = file_path.read_bytes()
        if b"\0" in data:
            continue
        for label, pattern in CONTENT_PATTERNS:
            if pattern.search(data):
                findings.append(f"{relative}: detected {label}")
    return findings


def main() -> int:
    root = Path(__file__).resolve().parents[1]
    findings = scan_paths(root, tracked_paths(root))
    if findings:
        print("SIGNALPROOF PUBLIC BOUNDARY: FAIL", file=sys.stderr)
        for finding in findings:
            print(f"- {finding}", file=sys.stderr)
        print(
            "Do not print or copy suspected secret values. Remove the material and "
            "follow SECURITY.md rotation/reporting guidance.",
            file=sys.stderr,
        )
        return 1

    print("SIGNALPROOF PUBLIC BOUNDARY: PASS")
    print("Tracked files contain no prohibited private paths or high-confidence credential patterns.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
