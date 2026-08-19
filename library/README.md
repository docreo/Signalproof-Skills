# Signalproof Library

**Status:** RD1 / architecture candidate  
**Owner:** Doc Reo  
**Authority:** This directory defines the proposed library architecture. Existing Active skills remain governed by their current accepted contracts until decomposition candidates are tested and promoted.

## Purpose

The **Signalproof Library** is the governed capability library for Signalproof. It is broader than a collection of long prompt files. It organizes small, routeable operating contracts, reusable loops, policies, patterns, schemas, registries, tests, and evidence so a human or agent can load only the minimum context needed for the current job.

Core rule:

> **Grow the library, not the file.**

A capability should become more precise as Signalproof grows, not larger merely because more lessons have accumulated.

## Two primary libraries

### 1. Skill Library

The existing `skills/` tree remains the executable specialist library.

A Skill is a bounded operating contract for one coherent capability. Skills inherit universal Signalproof governance from the root contract and should not duplicate that doctrine unnecessarily.

Examples:

- `signalproof-build`
- `signalproof-debug`
- `signalproof-research`
- `signalproof-security`
- future narrow specialists such as secrets, permissions, supply-chain review, UI polish, or loop execution.

### 2. Loop Library

The new `loops/` tree stores reusable bounded iteration protocols.

A Loop is not a general Skill and does not grant authority. It defines a repeatable cycle such as measure -> act -> verify -> stop. The Router may select a loop, but the Signalproof Governor must determine whether the loop may run with the proposed permissions, risk, cost, and protected state.

Examples:

- debug loop
- research loop
- build/test loop
- optimization loop
- recovery loop
- ingestion loop
- agent-action loop
- learning loop

## Supporting library layers

The Signalproof Library may also contain:

- `library/` — architecture, budgets, decomposition maps, manifests, and governance.
- `skills/` — routeable specialist capability contracts.
- `loops/` — reusable bounded iteration protocols.
- `commands/` — operator shorthand that coordinates skills but is not itself a specialist skill.
- `tests/` — acceptance and consistency evidence.
- `tools/` — deterministic validators and library maintenance tooling.
- `provenance/` — promotion, supersession, and architectural decision evidence.
- `research/` — external intake and comparison evidence; research is not operating authority.
- `wiki/` — human-readable explanatory material; wiki prose is not automatically executable doctrine.

Future layers may include `patterns/`, `policies/`, `schemas/`, and machine-readable registries when their contracts are sufficiently stable.

## Context-budget principle

The number of files in the library is not the primary token cost. The loaded context is.

The desired runtime pattern is:

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

The undesired pattern is loading every related skill because a category name happens to match.

## Skill size budget

`SKILL.md` is measured as exact UTF-8 bytes.

| Size | Status | Required action |
|---:|---|---|
| 0-9,999 | HEALTHY | normal governance |
| 10,000-11,999 | WATCH | monitor growth and duplication |
| 12,000-14,999 | REVIEW | decomposition/conciseness review required before material expansion |
| 15,000+ | OVER LIMIT | block promotion or material expansion until refactored below 15,000 bytes |

15 KB is a ceiling, not a target.

## Atomicity principle

Size alone does not decide architecture. A Skill should be decomposed when it contains independently routeable responsibilities even if it is still below the ceiling.

Ask:

1. Does the Skill perform more than one independently routeable job?
2. Are large sections relevant only to certain request classes?
3. Can a section evolve independently without changing the parent capability contract?
4. Is doctrine duplicated from the root contract or another Skill?
5. Would runtime context improve if the model could load only this portion?

Several YES answers justify decomposition review.

## Routing principle

The Router should become smaller as the library grows.

The Router should not contain full descriptions of every Skill. It should consult compact registry metadata and select the minimum applicable capability set.

```text
INTENT
  -> RISK / AUTHORITY
  -> CAPABILITY INDEX
  -> PRINCIPAL SKILL
  -> OPTIONAL SPECIALIST / LOOP
  -> GOVERNOR
  -> EXECUTION
```

## Authority boundaries

- A Skill defines how to perform a bounded capability.
- A Loop defines how to iterate a bounded process.
- The Router selects applicable capability.
- The Governor decides whether proposed action is authorized.
- The Build Ledger records what actually happened.
- Learn decides what reusable capability may be extracted.
- The lifecycle governs whether a candidate becomes Active.

```text
DISCOVERED -> CANDIDATE -> TESTED -> APPROVED -> ACTIVE -> DEPRECATED / RETIRED
```

No file becomes Active merely because it was added to the library.

## Build Ledger integration

Meaningful Skill events should record, where applicable:

- Skill identity and version;
- UTF-8 bytes before and after;
- budget status before and after;
- decomposition review result;
- extracted/new Skill candidates;
- duplicate doctrine removed;
- routing changes;
- tests run;
- protected behavior;
- supersession/rollback path.

If the private canonical Build Ledger head cannot be verified, stage the library milestone rather than fabricating canonical chronology.

## RD1 objective

RD1 starts by:

1. establishing the 15,000-byte ceiling and atomicity rules;
2. creating deterministic budget tooling;
3. inventorying all current Skills;
4. designing decomposition for over-limit and near-limit Skills;
5. creating the first Loop Library registry;
6. moving toward registry-driven lazy loading;
7. preserving current Active behavior until replacement candidates pass acceptance.
