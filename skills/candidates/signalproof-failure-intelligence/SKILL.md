---
name: signalproof-failure-intelligence
description: Prevent repeated Signalproof failures by matching current conditions against prior failure fingerprints, proven mitigations, unsafe retry patterns, and changed-condition evidence before consequential retry.
---

# Signalproof Failure Intelligence

## Status

**CANDIDATE / NOT ACTIVE — RD1 REFACTOR**

## Purpose

`signalproof-failure-intelligence` is the recurrence-prevention specialist.

> **Search before retry. If Signalproof already paid to learn the lesson, do not pay for the same failure again without materially new evidence.**

It complements Known Errors, Debug, Investigate, Learn, Recovery, Security, Review, and Closeout. Detailed failure records belong in a registry/evidence store rather than growing this Skill indefinitely.

## Contract

1. Search before consequential retry when current work previously failed, the tool/runtime has known Signalproof failures, or the operation is expensive, destructive, privilege-sensitive, or evidence-sensitive.
2. Match conditions and supported causes, not keywords alone.
3. Separate symptom from cause.
4. Prefer a previously accepted mitigation when applicability conditions still match.
5. Preserve failed attempts and counter-evidence.
6. Bind every mitigation to its known scope and UNKNOWN boundary.
7. Do not overgeneralize one case into suite-wide doctrine.
8. Preserve legal, licensing, security, privacy, authority, and protected-state constraints.
9. Record supersession rather than deleting obsolete failure history.
10. A high-confidence unchanged known failure should produce REUSE / REVISE / STOP rather than blind re-execution.
11. Exact retry cycles should use `SP-LOOP-RETRY` so iteration count, changed evidence, cost, rollback, and STOP are explicit.
12. Failure intelligence informs method selection; it does not grant execution or canonical ledger authority.

## Failure Fingerprint

A reusable record should preserve as applicable:

- stable failure ID;
- class/domain;
- first/last seen and recurrence/evidence count;
- affected products/tools/runtime/platform/version;
- triggering action and observable symptom;
- supported root cause;
- evidence references/class;
- protected-state/partial-actuation impact;
- proven mitigation and acceptance evidence;
- applicability conditions and UNKNOWN conditions;
- unsafe/ineffective retry pattern;
- required preflight/check;
- security/privacy/license/legal constraints;
- affected skills/commands;
- status and supersession relationship.

Stable failure identity must not depend on Build Ledger C-numbers.

## Match Decisions

- **NO KNOWN MATCH** — proceed under normal controls.
- **POSSIBLE MATCH** — inspect source evidence.
- **KNOWN FAILURE / MITIGATION AVAILABLE** — reuse tested pattern unless changed evidence justifies another path.
- **KNOWN FAILURE / CONDITIONS CHANGED** — retest deliberately and record the changed condition.
- **KNOWN FAILURE / NO APPROVED MITIGATION** — Investigate/Plan before retry.
- **PROHIBITED / STOP** — repetition would violate protected state, authority, security, license/legal boundary, or evidence integrity.

## Workflow

### 1. Build the Query

Use tool/runtime, environment, action, symptom, parser/schema behavior, path/encoding/line-ending behavior, permission/security surface, packaging/provenance, and protected-state conditions.

### 2. Compare Evidence

For each plausible fingerprint identify matching and differing preconditions. A familiar error string with a materially different environment is not automatically the same failure.

### 3. Select Path

Reuse a proven mitigation, revise for changed conditions, investigate when cause is unresolved, or STOP when the same unsafe path is about to repeat.

### 4. Execute Bounded Retry

When retry is justified, use `SP-LOOP-RETRY` with explicit new evidence, one material change, acceptance condition, rollback, max attempts, and STOP condition.

### 5. Update Intelligence

At meaningful closeout/Learn, update recurrence count, mitigation confidence, applicability/counter-evidence, supersession, and affected routing/tests. Do not create duplicate IDs for the same supported cause.

## Initial Proven Classes

Existing Signalproof evidence already contains recurring patterns involving generated PowerShell parsing, native stderr/exit-code misclassification, heterogeneous report objects, Git byte/line-ending identity, protected-state conflicts, wrapper-vs-product failure, and Build Ledger sequence projection misuse. These belong in the failure registry/evidence layer, not as ever-growing prose in this Skill.

## Relationship to Known Errors

Known Errors is the active repeatable-error preflight. Failure Intelligence is the broader Candidate architecture for structured recurrence memory, matching, mitigation confidence, supersession, and cross-project learning. Promotion must avoid duplicate authority and should consolidate rather than compete with Known Errors.

## STOP Conditions

STOP when a known high-confidence failure is about to be repeated under materially unchanged conditions, current evidence is being forced to match an old diagnosis, a technically effective mitigation violates authority/security/license/legal boundaries, or failed evidence is being erased to make a later retry look clean.

## Completion Criteria

Complete when the current action has a documented match/no-match decision, applicable prior evidence is reconciled, retry/mitigation path is bounded, and any new recurrence intelligence is ready for Learn/Closeout governance.

## Identity

- **Suite:** Signalproof Skills
- **Skill:** `signalproof-failure-intelligence`
- **Version:** `0.2.0-candidate`
- **Maturity:** Candidate
- **Parent:** `signalproof` 0.1.1+
- **Domain:** Failure recurrence matching and prevention
- **Created by:** Doc Reo / Signalproof
