#!/usr/bin/env python3
"""Signalproof Skills suite consistency checker.

Checks public suite contract coherence across:
- SKILL-REGISTRY.md
- README.md Active skills table
- skills/<name>/SKILL.md identity metadata
- signalproof-router Current Routing Set

Uses only the Python standard library.
"""

from __future__ import annotations

import argparse
import re
import sys
from dataclasses import dataclass
from pathlib import Path
from typing import Dict, Iterable, List, Set, Tuple


REGISTRY_ROW_RE = re.compile(
    r"^\|\s*`(?P<name>[^`]+)`\s*\|\s*(?P<version>[^|]+?)\s*\|\s*"
    r"(?P<maturity>[^|]+?)\s*\|\s*(?P<role>[^|]+?)\s*\|\s*(?P<status>[^|]+?)\s*\|\s*$"
)

README_ROW_RE = re.compile(
    r"^\|\s*\[`(?P<name>[^`]+)`\]\(skills/(?P<folder>[^/]+)/SKILL\.md\)\s*"
    r"\|\s*(?P<version>[^|]+?)\s*\|\s*(?P<purpose>[^|]+?)\s*\|\s*$"
)

FRONTMATTER_NAME_RE = re.compile(r"^name:\s*(?P<name>[A-Za-z0-9._-]+)\s*$", re.MULTILINE)
IDENTITY_VERSION_RE = re.compile(r"^- \*\*Version:\*\*\s*`(?P<version>[^`]+)`\s*$", re.MULTILINE)
IDENTITY_MATURITY_RE = re.compile(r"^- \*\*Maturity:\*\*\s*(?P<maturity>.+?)\s*$", re.MULTILINE)
ROUTER_BULLET_RE = re.compile(r"^\s*-\s*`(?P<name>signalproof(?:-[A-Za-z0-9._-]+)?)`\s+—", re.MULTILINE)
PLANNED_SKILL_RE = re.compile(r"`(?P<name>signalproof(?:-[A-Za-z0-9._-]+)?)`")


@dataclass(frozen=True)
class RegistryEntry:
    name: str
    version: str
    maturity: str
    role: str
    status: str


@dataclass(frozen=True)
class ReadmeEntry:
    name: str
    folder: str
    version: str
    purpose: str


@dataclass(frozen=True)
class SkillIdentity:
    frontmatter_name: str | None
    version: str | None
    maturity: str | None


def read_text(path: Path) -> str:
    return path.read_text(encoding="utf-8")


def section(text: str, heading: str) -> str:
    """Return markdown content under an exact H2 heading, excluding the next H2."""
    marker = f"## {heading}"
    start = text.find(marker)
    if start < 0:
        return ""
    body_start = text.find("\n", start)
    if body_start < 0:
        return ""
    next_h2 = text.find("\n## ", body_start + 1)
    if next_h2 < 0:
        next_h2 = len(text)
    return text[body_start + 1 : next_h2]


def parse_registry(path: Path) -> Tuple[Dict[str, RegistryEntry], List[str]]:
    entries: Dict[str, RegistryEntry] = {}
    duplicates: List[str] = []
    for line in read_text(path).splitlines():
        match = REGISTRY_ROW_RE.match(line)
        if not match:
            continue
        entry = RegistryEntry(
            name=match.group("name").strip(),
            version=match.group("version").strip(),
            maturity=match.group("maturity").strip(),
            role=match.group("role").strip(),
            status=match.group("status").strip(),
        )
        if entry.name in entries:
            duplicates.append(entry.name)
        entries[entry.name] = entry
    return entries, duplicates


def parse_readme_active(path: Path) -> Tuple[Dict[str, ReadmeEntry], List[str]]:
    text = section(read_text(path), "Active skills")
    entries: Dict[str, ReadmeEntry] = {}
    duplicates: List[str] = []
    for line in text.splitlines():
        match = README_ROW_RE.match(line)
        if not match:
            continue
        entry = ReadmeEntry(
            name=match.group("name").strip(),
            folder=match.group("folder").strip(),
            version=match.group("version").strip(),
            purpose=match.group("purpose").strip(),
        )
        if entry.name in entries:
            duplicates.append(entry.name)
        entries[entry.name] = entry
    return entries, duplicates


def parse_skill_identity(path: Path) -> SkillIdentity:
    text = read_text(path)
    name_match = FRONTMATTER_NAME_RE.search(text)
    version_match = IDENTITY_VERSION_RE.search(text)
    maturity_match = IDENTITY_MATURITY_RE.search(text)
    return SkillIdentity(
        frontmatter_name=name_match.group("name").strip() if name_match else None,
        version=version_match.group("version").strip() if version_match else None,
        maturity=maturity_match.group("maturity").strip() if maturity_match else None,
    )


def parse_router_targets(path: Path) -> Set[str]:
    text = section(read_text(path), "Current Routing Set")
    return {m.group("name") for m in ROUTER_BULLET_RE.finditer(text)}


def parse_planned_names(registry_path: Path) -> Set[str]:
    text = section(read_text(registry_path), "Planned Specialist Lanes")
    return {m.group("name") for m in PLANNED_SKILL_RE.finditer(text)}


def check_repository(root: Path) -> List[str]:
    errors: List[str] = []
    registry_path = root / "SKILL-REGISTRY.md"
    readme_path = root / "README.md"
    skills_dir = root / "skills"

    for required in (registry_path, readme_path, skills_dir):
        if not required.exists():
            errors.append(f"Missing required path: {required.relative_to(root)}")
    if errors:
        return errors

    registry, registry_duplicates = parse_registry(registry_path)
    readme, readme_duplicates = parse_readme_active(readme_path)

    if not registry:
        errors.append("SKILL-REGISTRY.md contains no parseable skill rows.")
        return errors
    if not readme:
        errors.append("README.md contains no parseable Active skills rows.")

    for name in sorted(set(registry_duplicates)):
        errors.append(f"Duplicate registry row: {name}")
    for name in sorted(set(readme_duplicates)):
        errors.append(f"Duplicate README Active row: {name}")

    active = {name: entry for name, entry in registry.items() if entry.status.casefold() == "active"}
    inactive = {name: entry for name, entry in registry.items() if entry.status.casefold() != "active"}

    active_names = set(active)
    readme_names = set(readme)

    for name in sorted(active_names - readme_names):
        errors.append(f"Active registry skill missing from README Active table: {name}")
    for name in sorted(readme_names - active_names):
        status = registry[name].status if name in registry else "not in registry"
        errors.append(f"README Active skill is not Active in registry: {name} ({status})")

    for name, readme_entry in sorted(readme.items()):
        if readme_entry.folder != name:
            errors.append(f"README skill link folder mismatch for {name}: folder={readme_entry.folder}")
        if name in active and readme_entry.version != active[name].version:
            errors.append(
                f"README/registry version mismatch for {name}: "
                f"README={readme_entry.version}, registry={active[name].version}"
            )

    if skills_dir.exists():
        for child in sorted(skills_dir.iterdir()):
            skill_md = child / "SKILL.md"
            if not child.is_dir() or not skill_md.exists():
                continue

            identity = parse_skill_identity(skill_md)
            declared_name = identity.frontmatter_name or child.name

            if identity.frontmatter_name and identity.frontmatter_name != child.name:
                errors.append(
                    f"Skill folder/frontmatter mismatch: folder={child.name}, name={identity.frontmatter_name}"
                )

            reg_entry = registry.get(declared_name)
            if reg_entry:
                if identity.version is None:
                    errors.append(f"SKILL.md missing Identity Version: {declared_name}")
                elif identity.version != reg_entry.version:
                    errors.append(
                        f"SKILL.md/registry version mismatch for {declared_name}: "
                        f"SKILL.md={identity.version}, registry={reg_entry.version}"
                    )

                if identity.maturity is None:
                    errors.append(f"SKILL.md missing Identity Maturity: {declared_name}")
                elif reg_entry.status.casefold() == "active" and "active" not in identity.maturity.casefold():
                    errors.append(
                        f"Active registry skill does not declare Active maturity in SKILL.md: "
                        f"{declared_name} ({identity.maturity})"
                    )
                elif reg_entry.status.casefold() != "active" and "active" in identity.maturity.casefold():
                    errors.append(
                        f"Non-Active registry skill declares Active maturity in SKILL.md: "
                        f"{declared_name} (registry={reg_entry.status}, maturity={identity.maturity})"
                    )
            elif identity.maturity and "active" in identity.maturity.casefold():
                errors.append(f"SKILL.md declares Active maturity but skill is absent from registry: {declared_name}")

    for name in sorted(active_names):
        expected = skills_dir / name / "SKILL.md"
        if not expected.exists():
            errors.append(f"Active registry skill missing SKILL.md: {name}")

    router_name = "signalproof-router"
    router_path = skills_dir / router_name / "SKILL.md"
    if router_name not in active:
        errors.append("signalproof-router is not Active in registry.")
    elif not router_path.exists():
        errors.append("Active signalproof-router is missing skills/signalproof-router/SKILL.md.")
    else:
        router_targets = parse_router_targets(router_path)
        expected_targets = active_names - {router_name}

        for name in sorted(expected_targets - router_targets):
            errors.append(f"Router omits Active routable skill: {name}")
        for name in sorted(router_targets - expected_targets):
            status = registry[name].status if name in registry else "not in registry"
            errors.append(f"Router references non-Active or unknown skill: {name} ({status})")

        router_identity = parse_skill_identity(router_path)
        reg_version = active[router_name].version
        if router_identity.version != reg_version:
            errors.append(
                f"Router SKILL.md/registry version mismatch: "
                f"SKILL.md={router_identity.version}, registry={reg_version}"
            )
        if router_name in readme and readme[router_name].version != reg_version:
            errors.append(
                f"Router README/registry version mismatch: "
                f"README={readme[router_name].version}, registry={reg_version}"
            )

    planned_names = parse_planned_names(registry_path)
    router_targets = parse_router_targets(router_path) if router_path.exists() else set()
    for name in sorted(planned_names):
        if name in readme_names:
            errors.append(f"Planned skill appears in README Active table: {name}")
        if name in router_targets:
            errors.append(f"Planned skill appears in Router Current Routing Set: {name}")

    for name, entry in sorted(inactive.items()):
        if name in readme_names:
            errors.append(f"Non-Active registry skill appears in README Active table: {name} ({entry.status})")
        if name in router_targets:
            errors.append(f"Non-Active registry skill appears in Router Current Routing Set: {name} ({entry.status})")

    return errors


def main(argv: Iterable[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description="Check Signalproof Skills suite consistency.")
    parser.add_argument(
        "--root",
        type=Path,
        default=Path(__file__).resolve().parents[1],
        help="Repository root (default: parent of tools/).",
    )
    args = parser.parse_args(list(argv) if argv is not None else None)
    root = args.root.resolve()

    errors = check_repository(root)
    if errors:
        print(f"SIGNALPROOF SUITE CONSISTENCY: FAIL ({len(errors)} issue(s))")
        for index, error in enumerate(errors, 1):
            print(f"{index:02d}. {error}")
        return 1

    registry, _ = parse_registry(root / "SKILL-REGISTRY.md")
    active_count = sum(1 for entry in registry.values() if entry.status.casefold() == "active")
    router_targets = parse_router_targets(root / "skills" / "signalproof-router" / "SKILL.md")
    print("SIGNALPROOF SUITE CONSISTENCY: PASS")
    print(f"Active skills: {active_count}")
    print(f"Router targets: {len(router_targets)}")
    print("Registry, README, SKILL.md identity, and Router routing-set checks are coherent.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
