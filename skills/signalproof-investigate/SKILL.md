---
name: signalproof-investigate
description: Investigate failures, regressions, suspicious behavior, unexpected results, and unclear system state before proposing fixes. Use when something appears broken, changed, unsafe, inconsistent, degraded, or difficult to explain and the goal is to establish the failed layer, likely cause, evidence, and safest next action without prematurely rewriting working systems.
---

# Signalproof Investigate

## Purpose

`signalproof-investigate` is the first specialist skill in the Signalproof Skill Suite. It inherits the active root `signalproof` contract and specializes it for root-cause investigation.

Its central rule is:

> **Do not fix what has not yet been identified.**

An apparent failure may be an execution failure, persistence failure, interpretation failure, presentation failure, environment failure, dependency failure, configuration failure, permission failure, or expectation mismatch. Investigation establishes which layer actually failed before modification begins.

## Inheritance

This skill inherits the root Signalproof requirements for:

- human authority;
- protected state;
- evidence classification;
- smallest effective change;
- verification;
- recovery and STOP conditions;
- public/private boundaries;
- proof and continuity.

If this skill and the root contract appear to conflict, the more protective interpretation applies unless an explicit owner-approved suite version says otherwise.

## Investigation Contract

1. **Define the symptom precisely.** Record what was expected, what was observed, when it occurred, and what evidence currently supports the report.
2. **Do not convert appearance into cause.** “It looked like nothing happened” does not prove execution failure.
3. **Identify protected state before testing.** Working engines, data, configuration, credentials, history, recovery assets, and accepted behavior must not be casually disturbed during diagnosis.
4. **Prefer read-only evidence first.** Inspect logs, files, state, configuration, versions, hashes, status endpoints, reports, and prior evidence before making changes.
5. **Separate layers.** Determine whether the symptom belongs to execution, persistence, data, interpretation, presentation/UI, environment/runtime, dependency, permission/security, or expectation/requirements.
6. **Form explicit hypotheses.** A hypothesis is an inference until evidence confirms it.
7. **Test the cheapest discriminating hypothesis first.** Prefer tests that distinguish competing causes with minimal system change.
8. **Avoid shotgun fixes.** Do not change multiple unrelated surfaces merely to see whether the problem disappears.
9. **Stop repeated failure loops.** After repeated unsuccessful corrections, return to investigation and materially change the hypothesis or evidence source rather than repeating variants of the same fix.
10. **Fix only after localization.** Once the failed layer and cause are sufficiently supported, hand off to bounded correction or proceed only when authority includes implementation.

## Investigation Workflow

### 1. Symptom Statement

Capture:

- expected behavior;
- observed behavior;
- first known occurrence or triggering action if known;
- reproducibility;
- severity and affected scope;
- human-observed facts versus independently verified facts.

### 2. Current-State Snapshot

Collect the least-invasive evidence available, such as:

- repository/branch/version state;
- configuration;
- process/service status;
- logs and error output;
- API/status responses;
- persisted records/reports;
- hashes or file timestamps;
- dependency/runtime versions;
- relevant UI state;
- recent bounded changes.

Do not expose secrets in public evidence.

### 3. Protected-State Declaration

State what must not change during diagnosis. If investigation requires a consequential test that could disturb protected state, stop for authority or isolate the test.

### 4. Layer Classification

Classify the likely failure domain without claiming a cause prematurely:

- **Execution** — requested operation did not run or complete.
- **Persistence** — operation ran but result was not stored or retained.
- **Data** — inputs, outputs, schema, or content are wrong/missing/corrupt.
- **Interpretation** — system state is correct but interpreted incorrectly.
- **Presentation** — result exists but UI/reporting fails to show it accurately.
- **Environment/Runtime** — process, OS, service, driver, runtime, hardware, or resource condition prevents intended behavior.
- **Dependency/Integration** — external package, API, model, library, service, or contract failed.
- **Permission/Security** — authorization, credential, policy, sandbox, ACL, or trust boundary prevents operation.
- **Expectation/Requirement** — implementation and observation differ because the expected behavior was never established or differs from the actual contract.

Multiple layers may be involved, but do not broaden scope without evidence.

### 5. Hypothesis Table

For meaningful investigations, maintain a compact set of hypotheses with:

- hypothesis;
- evidence for;
- evidence against;
- discriminating test;
- result;
- confidence.

Retire disproven hypotheses instead of silently reusing them.

### 6. Reproduction

Reproduce the smallest meaningful failure when safe and possible. A valid reproduction should identify the exact condition that differentiates pass from fail.

If reproduction is impossible, state that limitation and use the strongest available artifact/human evidence without upgrading it to runtime verification.

### 7. Localization

A failure is sufficiently localized when evidence identifies the failing layer or boundary strongly enough that the next change can be bounded.

Examples:

- scanner completed and wrote records, but result banner stayed blank -> presentation layer;
- application UI is healthy but local API port is closed -> runtime/service layer;
- operation succeeds with direct token but fails under app identity -> permission/auth boundary;
- file exists but parser rejects only one schema version -> data/schema boundary.

### 8. Decision

Return one of:

- **CAUSE SUPPORTED** — evidence is sufficient for bounded correction.
- **LAYER LOCALIZED** — failed layer is known, exact cause still requires deeper investigation.
- **NO FAILURE REPRODUCED** — current evidence does not reproduce the reported defect.
- **EXPECTATION MISMATCH** — behavior differs from expectation but not from established contract.
- **BLOCKED** — required evidence/authority/environment is unavailable.
- **STOP** — risk or repeated failed approaches exceed the approved investigation boundary.

### 9. Closure

Report:

- **Symptom**
- **Evidence**
- **Protected**
- **Failed layer**
- **Supported cause or remaining hypotheses**
- **Tests performed**
- **What was not changed**
- **Decision**
- **Next bounded action**, only if justified

## Anti-Patterns

Fail this skill when an agent:

- rewrites a subsystem because the UI looked wrong;
- executes unknown install or repair scripts before inspection;
- changes several dependencies at once without localization;
- treats a human observation as runtime proof;
- calls a compile success a reproduced runtime fix;
- repeats the same failed fix without new evidence;
- destroys logs/history or rollback evidence during diagnosis;
- exposes credentials or private state in public diagnostic output;
- invents a root cause when evidence only supports a layer.

## Completion Criteria

An investigation is complete when the symptom is characterized, protected state was preserved, evidence classes remain honest, the failed layer is localized or the investigation is explicitly blocked, hypotheses are traceable, and the next action is bounded by evidence rather than guesswork.

## Identity

- **Suite:** Signalproof Skills
- **Skill:** `signalproof-investigate`
- **Version:** `0.1.0-rc1`
- **Maturity:** Initial public release candidate
- **Parent:** `signalproof` 0.1.0+
- **Domain:** Root-cause investigation, failure localization, evidence discipline, protected diagnosis
- **Created by:** Doc Reo / Signalproof
