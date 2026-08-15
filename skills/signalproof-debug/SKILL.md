---
name: signalproof-debug
description: Diagnose and correct reproducible defects through evidence-led root-cause work, bounded fixes, regression protection, and explicit STOP conditions. Use when a system is demonstrably malfunctioning and the goal is to move from symptom to supported cause to the smallest verified correction without rewriting working subsystems or repeating failed guesses.
---

# Signalproof Debug

## Purpose

`signalproof-debug` is the defect-correction specialist in the Signalproof Skill Suite. It inherits the active root `signalproof` contract and works with `signalproof-investigate`, `signalproof-plan`, and `signalproof-build`.

Its central rule is:

> **No fix without localization; no success claim without reproduction and regression proof.**

Debugging is not random editing. A defect must be characterized, localized, corrected within a bounded surface, and re-tested against both the failing behavior and protected working behavior.

## Inheritance

This skill inherits the root Signalproof requirements for human authority, protected state, evidence classification, smallest effective change, verification, recovery, STOP conditions, public/private boundaries, proof, and continuity.

When the failing layer is unclear, use `signalproof-investigate` first. When the correction materially changes scope or architecture, return to `signalproof-plan`. When the correction is sufficiently bounded, execute it according to `signalproof-build` discipline.

## Debug Contract

1. **State the symptom precisely.** Record expected behavior, observed behavior, reproduction conditions, and evidence class.
2. **Reproduce before fixing when feasible.** A defect that cannot be reproduced must remain honestly classified.
3. **Protect known-working state.** Identify engines, data, interfaces, configuration, dependencies, security controls, and accepted behavior that must not regress.
4. **Localize the failed layer and boundary.** Do not modify a working subsystem merely because it is adjacent to the symptom.
5. **Use explicit hypotheses.** Hypotheses remain inference until a discriminating test supports them.
6. **Prefer one discriminating change at a time.** Avoid multi-surface shotgun fixes.
7. **Fix the smallest supported cause.** Do not redesign unrelated code during defect correction.
8. **Retest the original reproduction exactly.** The defect is not fixed until the failing condition passes.
9. **Run regression checks for protected state.** A new pass that breaks prior behavior is not success.
10. **Preserve recovery.** Keep a baseline, branch, backup, candidate copy, or other practical way back.
11. **Stop failed-fix loops.** After repeated failed corrections, return to investigation instead of varying the same guess indefinitely.
12. **Separate correction from improvement.** Optional refactors, cleanup, redesign, dependency changes, and enhancements remain proposals unless independently authorized.

## Debug Workflow

### 1. Reproduction Contract

Capture:

- exact failing action/input;
- expected result;
- observed result;
- reproducibility rate;
- environment/version;
- human-observed versus runtime-verified evidence.

If reproduction is unsafe or impossible, state the limitation and do not invent runtime proof.

### 2. Protected State

Declare what must not change during correction. For narrow bugs, establish a forbidden-change boundary and capture useful integrity anchors such as hashes, baseline tests, or version identity.

### 3. Localization

Determine which layer actually fails:

- execution;
- persistence;
- data/schema;
- interpretation;
- presentation/UI;
- environment/runtime;
- dependency/integration;
- permission/security;
- expectation/contract.

If this cannot be established, hand off to `signalproof-investigate`.

### 4. Hypothesis and Discriminating Test

For each plausible cause, record:

- evidence for;
- evidence against;
- cheapest discriminating test;
- result;
- confidence.

Retire disproven hypotheses.

### 5. Bounded Correction Plan

Before editing, state:

- target cause;
- expected change surface;
- protected/forbidden surfaces;
- acceptance test for the defect;
- regression tests for protected behavior;
- rollback path;
- STOP conditions.

If the required correction expands materially beyond this boundary, stop and re-plan.

### 6. Implement One Supported Correction

Use the smallest change that addresses the supported cause. Avoid unrelated cleanup, architecture changes, dependency churn, or security-policy changes.

### 7. Verify the Defect

Re-run the original failing condition. Record the before/after result.

Compilation or static analysis alone is insufficient for a runtime defect when runtime verification is available.

### 8. Regression Verification

Run the protected-state tests and compare integrity anchors where useful.

A defect correction passes only if:

- the original failure is corrected; and
- required protected behavior still passes.

### 9. Failed-Fix Loop Rule

After a failed correction:

- preserve the evidence;
- revert or isolate the failed change when appropriate;
- revise the hypothesis based on new evidence.

After **three materially unsuccessful correction attempts against the same unresolved symptom**, default to STOP and return to deeper investigation unless explicit human authority says otherwise. Do not manufacture superficial variations to reset the count.

### 10. Closure

Report:

- **Symptom**
- **Reproduction**
- **Supported cause**
- **Changed**
- **Protected**
- **Defect verification**
- **Regression verification**
- **Integrity/recovery evidence**
- **Failed attempts**, if any
- **Status**
- **Open findings/proposals**

## Debug Status

Return one of:

- **FIX VERIFIED** — original reproduction passes and required regression checks pass.
- **CAUSE SUPPORTED / FIX UNVERIFIED** — cause is supported but the environment cannot run a required acceptance gate.
- **LAYER LOCALIZED** — failed layer is known but exact cause remains unresolved.
- **NO FAILURE REPRODUCED** — current environment/evidence does not reproduce the defect.
- **REVERTED** — attempted correction failed and the protected baseline was restored.
- **BLOCKED** — required evidence/environment/authority is unavailable.
- **STOP** — continued correction would violate scope, authority, protected state, recovery, or failed-loop rules.

## Anti-Patterns

Fail this skill when a debugger:

- edits before reproducing/localizing when reproduction is feasible;
- rewrites a working engine because a UI symptom looks severe;
- changes several unrelated files/dependencies to “see what works”;
- treats a hypothesis as a fact;
- declares success because code compiles;
- fixes the symptom but skips protected-state regression tests;
- repeats failed guesses without materially new evidence;
- destroys logs/history/rollback evidence;
- folds optional redesign into a bounded defect correction.

## Completion Criteria

A Signalproof debug cycle is complete when the symptom and reproduction are clear, the cause or failed layer is honestly supported by evidence, the correction stayed within the authorized boundary, the original defect was re-tested, protected behavior was regression-tested, recovery remained intact, and the final status reflects the strongest verification actually performed.

## Identity

- **Suite:** Signalproof Skills
- **Skill:** `signalproof-debug`
- **Version:** `0.1.0-rc1`
- **Maturity:** Initial public release candidate
- **Parent:** `signalproof` 0.1.0+
- **Works with:** `signalproof-investigate`, `signalproof-plan`, `signalproof-build`
- **Domain:** Evidence-led debugging, bounded correction, regression protection, failed-loop control
- **Created by:** Doc Reo / Signalproof
