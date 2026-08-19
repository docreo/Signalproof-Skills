# Signalproof Skill Atomicity and Context Budget

**Status:** RD1 / candidate policy

## Core rule

> **Grow the suite, not the file.**

Active and candidate `SKILL.md` files must remain below **15,000 UTF-8 bytes**. The ceiling protects context efficiency, routing precision, reviewability, and maintainability. It is not a target size.

## Budget bands

- **HEALTHY** — 0-9,999 bytes
- **WATCH** — 10,000-11,999 bytes
- **REVIEW** — 12,000-14,999 bytes
- **OVER LIMIT** — 15,000 bytes or more

## Required behavior

### HEALTHY
Normal skill governance.

### WATCH
Record size during meaningful updates. Remove duplicated doctrine before adding more.

### REVIEW
Before material expansion, perform decomposition review:

1. identify independently routeable responsibilities;
2. identify doctrine inherited from the root contract;
3. identify content already owned elsewhere;
4. determine whether a narrower Skill or Loop should own a section;
5. preserve behavior and tests before extraction.

### OVER LIMIT
Do not promote or materially expand the Skill until the primary `SKILL.md` is below 15,000 UTF-8 bytes.

An over-limit Active skill is not automatically deactivated. It enters **REFACTOR REQUIRED** state so existing accepted behavior remains available while decomposition candidates are governed and tested.

## Atomicity test

A Skill should represent one coherent routeable capability. Split review is justified when one or more of the following are material:

- multiple independently routeable jobs;
- large sections used only for special request classes;
- sections that can evolve independently;
- repeated root/common doctrine;
- repeated doctrine from another specialist;
- separate risk/permission boundaries;
- separate acceptance evidence;
- loading one section alone would materially reduce runtime context.

## Decomposition choices

Use the smallest correct mechanism:

1. **CONCISE** — remove redundancy without losing behavior.
2. **INHERIT** — rely on root/common contract instead of repeating it.
3. **REFERENCE** — move explanatory material to wiki/docs where it is not operating doctrine.
4. **LOOP** — extract reusable bounded iteration behavior into the Loop Library.
5. **SEPARATE SKILL** — create a new independently routeable specialist.
6. **POLICY / SCHEMA / TEST** — move deterministic rules or data contracts out of prose when appropriate.

Separate Skills are preferred over vague subskill prose when the capability can be routed, tested, versioned, and governed independently.

## Runtime context objective

A normal operation should aim to load:

- root Signalproof contract once;
- compact registry/routing metadata;
- one principal Skill;
- zero to two narrow specialists or Loops;
- task evidence.

Do not load an entire category merely because one narrow capability is needed.

## Build Ledger fields

For meaningful Skill updates, preserve when available:

- `skill_id`
- `version`
- `skill_bytes_before`
- `skill_bytes_after`
- `size_limit_bytes` = 15000
- `budget_status_before`
- `budget_status_after`
- `atomicity_review`
- `decomposition_decision`
- `extracted_capabilities`
- `duplicate_doctrine_removed`
- `routing_changes`
- `acceptance_tests`
- `rollback_or_supersession`

## Promotion gate

A new or revised Skill cannot be promoted if its `SKILL.md` is 15,000 bytes or larger.

A decomposition does not pass merely because each resulting file is smaller. It must also preserve clear ownership, routing, authority, tests, and accepted behavior.
