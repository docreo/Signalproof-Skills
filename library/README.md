# Signalproof Library

**Status:** RD1 implementation candidate  
**Owner:** Doc Reo  
**Authority:** On a branch/PR this remains Candidate public state. Promotion to `main` requires repository acceptance and owner-authorized merge. Private Build Ledger chronology remains separately governed.

## Purpose

The **Signalproof Library** is the governed capability library for Signalproof. It organizes small routeable operating contracts, reusable bounded loops, compact registries, deterministic validators, tests, provenance, and supporting knowledge so a human or agent can load only the minimum context needed for a job.

> **Grow the library, not the file.**

A capability should become more precise as Signalproof grows, not larger merely because more lessons accumulate.

## Primary libraries

### Skill Library

`skills/` contains routeable specialist capability contracts. A Skill owns one coherent operating responsibility and inherits universal Signalproof governance from the root contract rather than repeating it.

RD1 decomposes oversized categories into compact coordinator/specialist families:

- Security -> Secrets, Permissions, Supply Chain, Network, Execution Security.
- Recovery -> Rollback, Restore, Cleanup, Recovery Continuity.
- Design -> UI Polish, Accessibility.
- Router -> compact registry-driven routing kernel.
- Candidate Knowledge -> Ingest, Provenance, Transform, Package.
- Candidate Failure Intelligence -> compact recurrence coordinator plus Retry Loop/registry model.

### Loop Library

`loops/` contains reusable bounded iteration protocols. A Loop never grants authority. See [`../loops/LOOP-REGISTRY.yaml`](../loops/LOOP-REGISTRY.yaml).

RD1 defines Candidate protocols for Debug, Build/Verify, Research, Ingest, Recovery, Agent Action, Learn, Optimize, and Retry.

## Supporting layers

- `library/` — architecture, budgets, inventory, compact capability metadata.
- `skills/` — Active routeable capability contracts.
- `skills/candidates/` — capability not yet Active.
- `loops/` — bounded iteration protocols.
- `commands/` — operator shorthand coordinating skills.
- `tests/` — acceptance/consistency evidence.
- `tools/` — deterministic validation/maintenance tooling.
- `provenance/` — promotion, supersession, architecture evidence.
- `research/` — external evidence; research is not operating authority.
- `wiki/` — human explanation; wiki prose is not automatically executable doctrine.

Future stable needs may justify `patterns/`, `policies/`, `schemas/`, or additional machine-readable registries.

## Context-budget principle

The number of files is not the primary token cost. Loaded context is.

```text
ROOT SIGNALPROOF CONTRACT
        +
COMPACT CAPABILITY INDEX
        +
1 PRINCIPAL SKILL
        +
0-2 NARROW SPECIALISTS / LOOPS
        +
TASK EVIDENCE
```

Avoid loading an entire family when one specialist is sufficient.

## Skill size budget

Every `SKILL.md` is measured as exact UTF-8 bytes.

| Size | Status | Required action |
|---:|---|---|
| 0-9,999 | HEALTHY | normal governance |
| 10,000-11,999 | WATCH | monitor growth/duplication |
| 12,000-14,999 | REVIEW | decomposition/conciseness review before material expansion |
| 15,000+ | OVER LIMIT | block promotion/material expansion until refactored below ceiling |

15 KB is a ceiling, not a target. CI enforces the hard limit through `tools/check_skill_budget.py`.

## Atomicity principle

Size alone does not decide architecture. Review decomposition whenever responsibilities are independently routeable, sections apply only to distinct request classes, one section can evolve independently, doctrine duplicates another owner, or lazy loading would materially reduce context.

Do not meet the budget by deleting required authority, evidence, STOP, security, recovery, or lifecycle semantics.

## Routing principle

The Router should become smaller as the library grows. Detailed specialist doctrine remains inside each specialist; Router consults compact metadata in `CAPABILITY-REGISTRY.yaml`.

```text
INTENT
  -> EVIDENCE STATE / RISK / AUTHORITY
  -> CAPABILITY INDEX
  -> PRINCIPAL SKILL
  -> OPTIONAL SPECIALIST / LOOP
  -> GOVERNOR when actuation/side effects require it
  -> EXECUTION
```

## Authority boundaries

- Skill: how to perform one bounded capability.
- Loop: how to iterate a bounded process.
- Router: which capability applies.
- Governor: whether proposed action is authorized.
- Build Ledger: what actually happened.
- Learn: what reusable capability may be extracted.
- Lifecycle: whether a Candidate becomes Active.

`DISCOVERED -> CANDIDATE -> TESTED -> APPROVED -> ACTIVE -> DEPRECATED / RETIRED`

A file, loop, branch, or PR never becomes authority merely by existing.

## Build Ledger integration

Meaningful Skill events should record when applicable: Skill/version, UTF-8 bytes before/after, budget status, atomicity/decomposition decision, extracted/new Skills, duplicate doctrine removed, routing changes, tests, protected behavior, and supersession/rollback.

`log-skill` and Closeout now require a Skill Architecture Check when Skills materially change. If the private canonical Build Ledger identity/head/chain/projection cannot be verified, preserve staged/noncanonical evidence instead of fabricating chronology.

## RD1 acceptance gates

RD1 is ready for promotion only when:

1. every Active/Candidate `SKILL.md` is below 15,000 bytes;
2. suite registry/README/Skill identities and versions are consistent;
3. compact capability registry covers every Active Skill exactly;
4. every registered loop has a file, STOP section, and evidence contract;
5. CI runs fixture tests, suite consistency, Skill budget, and Library consistency successfully;
6. oversized Active families preserve their core responsibilities through coordinator/specialist decomposition;
7. Candidate Knowledge and Failure Intelligence remain non-Active;
8. no canonical private Build Ledger append is claimed without live chain verification.

See [`SKILL-INVENTORY-RD1.md`](SKILL-INVENTORY-RD1.md) for measured state.
