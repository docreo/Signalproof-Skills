---
name: signalproof-full-debug
description: Coordinate the highest-governance Signalproof debugging mode for complex, repeated, cross-layer, or high-consequence defects. Use when the owner requests full-debug and the work benefits from persistent known-error memory, bounded authorization, log/design/debug continuity, Builder/Design/Governor lane separation, exact-final artifact validation, regression proof, and explicit STOP conditions.
---

# Signalproof Full Debug

## Purpose

`signalproof-full-debug` is the coordinator for the strongest bounded Signalproof debug workflow.

It does not replace `signalproof-debug`. It composes the existing Active debugging, known-error, investigation, verification, review, security, recovery, and orchestration contracts so complex debug work does not fragment across separate prompts or fresh chats.

Central rule:

> **Preserve the failure state, authorize only the bounded debug envelope, search prior failure memory, separate roles, correct the smallest supported cause, verify the exact final artifact, and never reset a failed loop because the chat changed.**

## When to use

Use Full Debug when one or more are true:

- the same defect or harness failure has recurred across attempts or chats;
- the failure layer is partly uncertain or spans product, harness, environment, evidence, security, or integration boundaries;
- a correction could affect protected working state;
- multiple disciplines need independent challenge;
- the owner explicitly invokes `/dsp full-debug` or an equivalent accepted form;
- ordinary Debug has reached a point where stronger orchestration would reduce duplicate work or unsupported retries.

Do not use Full Debug merely to make a trivial correction look more rigorous. For a narrow localized defect, ordinary `signalproof-debug` remains appropriate.

## Inheritance

This skill inherits the root Signalproof contract and works with:

- `signalproof-debug` for defect localization and correction;
- `signalproof-known-errors` for recurrence prevention;
- `signalproof-investigate` when cause is not sufficiently localized;
- `signalproof-plan` for bounded correction contracts;
- `signalproof-build` for supported implementation;
- `signalproof-verify` for material acceptance claims;
- `signalproof-review` for scope/change integrity;
- `signalproof-security` and specialists when a trust boundary is implicated;
- `signalproof-recovery` when rollback/restore/cleanup is materially relevant.

Command orchestration may use the current Active `authorize`, `log-build-git-debug`, `build-git-debug`, and `build-git spawn` contracts. Those commands remain authoritative for their own semantics.

## Full Debug Envelope

Before consequential correction, establish one bounded Full Debug Envelope:

```text
FULL DEBUG ENVELOPE
Workstream: <exact current bounded work>
Git basis: <repo/ref/head>
Symptom: <exact observable failure>
Failure identity: <stable class/fingerprint when known>
Prior attempts: <count and material identities>
Persisted state: <what already happened>
Protected state: <must not change>
Allowed debug surfaces: <bounded>
Known-error matches: <ids/evidence/none>
Owner-authorizable steps: <bounded set>
Excluded authority: <explicit>
Acceptance evidence: <required proof>
Recovery: <rollback/non-mutation path>
STOP: <conditions>
```

The envelope is consumed by the current bounded Full Debug operation. It is not a reusable credential or blanket authorization.

## Meaning of "authorize all" inside Full Debug

When the owner invokes Full Debug with the intent to authorize all of its normal work, interpret `all` only as:

> **all owner-authorizable actions required by the current bounded Full Debug Envelope, subject to every objective prerequisite, protected-state rule, repository rule, security boundary, and STOP condition.**

It does not silently include:

- canonical Build Ledger append;
- release or production deployment;
- direct mutation of protected `main` where repository rules require branch/PR flow;
- credentials, secrets, or private-key use not already authorized for the bounded operation;
- privilege escalation or administrative security-control changes;
- disabling security or verification controls;
- unrelated repositories, products, workstreams, or future operations;
- Candidate skill activation outside the governed promotion path.

If such an excluded class becomes necessary, preserve `AUTHORIZED-PENDING-PRECONDITION` or STOP and obtain the separately required authority.

## Mandatory workflow

### 1. Reconcile current truth

Refetch current Git and identify the exact workstream, current head, protected baseline, prior accepted evidence, open debug state, and current authority.

Do not rely on a prior chat snapshot when current Git or durable evidence is available.

### 2. Restore failure memory

Before another correction:

- search Active Known Errors and applicable current failure evidence;
- restore the unresolved failure class/fingerprint;
- restore prior failed-attempt count;
- restore failed runner/artifact identities when relevant;
- restore mitigations already attempted;
- restore explicit do-not-repeat paths.

A new chat, new filename, new wrapper, new wording, or cosmetic command variation does not reset failure identity or retry budget.

When PowerShell is relevant, load the current Git-backed PowerShell failure registry and apply the current PowerShell guard before generating or retrying a runner.

### 3. Preserve before mutation

Log the current debug/recovery state before another consequential correction. Preserve partial success, failed attempts, evidence already sufficient, uncertainty, protected state, and recovery options.

Do not rerun an expensive or mutating step merely to recreate evidence that already exists and remains valid.

### 4. Produce the Debug Next Action Contract

Design the smallest supported next action from persisted state.

If the cause is not sufficiently localized, route to Investigation. If Debug is already complete, route to Review, Verify, Security, Closeout, or Handoff instead of inventing another fix.

### 5. Run the spawn protocol

Full Debug requires the `build-git spawn` role-separation protocol.

If true independent agents are available, use bounded independent lanes. If not, use explicitly labeled logical lanes in the main session and state that accurately.

Required lanes:

**Builder lane**
- owns bounded implementation/correction and defect-specific test evidence;
- follows `signalproof-debug` and applicable build/recovery controls;
- cannot self-authorize.

**Design lane**
- challenges architecture, contract, interface/state fidelity, and unintended design drift;
- identifies when the proposed fix is actually a redesign requiring re-plan;
- does not approve runtime authority.

**Governor lane**
- challenges scope, authority, protected state, known-error recurrence, security/provenance, evidence strength, and STOP conditions;
- may block but cannot manufacture owner permission.

The Orchestrator resolves lane disagreement by evidence and bounded owner authority, not majority vote.

### 6. Correct only the supported cause

Use `signalproof-debug` discipline:

- reproduce/localize when feasible;
- separate product, parser, harness, staging, path, environment, expectation, serialization, evidence, dependency, and authority failures;
- inspect persisted state before rerunning mutation;
- make one smallest supported correction;
- preserve failed runners and recovery evidence.

### 7. Validate the exact final artifact

Before consequential handoff or execution, validate the exact final artifact as far as tooling permits.

Apply all relevant parser/compiler/schema, structured-literal, cross-reference, path/staging, known-error, shell/runtime, micro-fixture, negative-test, protected-state, and identity/hash checks after final edits.

If the artifact changes after validation, prior final-artifact validation is invalid and must be repeated on the new exact bytes/state.

### 8. Execute/retest once per condition set

Execute the exact validated correction only within the envelope.

Retest the original failing condition exactly, then run required protected-state/regression checks.

A successful parser or build is not runtime defect proof when runtime verification is required and available.

### 9. Reconcile evidence classes

Separate:

- source/product state;
- harness/wrapper state;
- runtime state;
- security/authority state;
- verification evidence;
- documentation/reporting state;
- release/production state;
- Build Ledger state.

A downstream reporter or harness defect does not automatically invalidate already-sufficient product evidence. Conversely, a green harness cannot override a real product regression.

### 10. Learn or stop

After an unsuccessful correction:

- preserve the attempt;
- state what new evidence was gained;
- state the material changed condition required for another attempt;
- update/reconcile known-error memory when a reusable failure is proven.

Default maximum remains three materially unsuccessful attempts against the same unresolved failure class, including attempts preserved from prior chats. Cosmetic changes do not reset the count.

## Full Debug result

Return a concise result with:

```text
FULL DEBUG RESULT
Workstream: <id>
Git basis: <ref/head>
Failure class: <supported/unknown>
Prior attempts carried forward: <n>
Known-error matches: <ids/none>
Authorization: <bounded status>
Spawn: <independent agents | logical lanes>
Persisted state inspected: <yes/no>
Correction: <what changed or none>
Exact-final validation: <truth class>
Original failure retest: <result>
Regression/protected state: <result>
Governor decision: <pass/block/escalate>
Status: <final status>
Next action: <if any>
```

## Status values

Use the strongest supported status:

- **FULL DEBUG VERIFIED**
- **CAUSE SUPPORTED / CORRECTION UNVERIFIED**
- **LAYER LOCALIZED / INVESTIGATION REQUIRED**
- **HARNESS CORRECTION VERIFIED**
- **PRODUCT FIX VERIFIED**
- **DEBUG COMPLETE / REVIEW REQUIRED**
- **DEBUG COMPLETE / SECURITY REVIEW REQUIRED**
- **RECOVERY REQUIRED**
- **AUTHORIZED-PENDING-PRECONDITION**
- **BLOCKED**
- **STOP / OWNER DECISION REQUIRED**

## STOP conditions

STOP when:

- current Git or workstream identity cannot be established;
- protected state is unknown for consequential mutation;
- required failure continuity is unavailable for a repeat-prone path;
- a high-confidence known failure would be repeated unchanged;
- the proposed retry is cosmetic rather than materially changed;
- persisted-state inspection is required but incomplete;
- exact-final validation required by available tooling has not passed;
- lane disagreement exposes an unresolved material risk or owner decision;
- correction scope expands into material redesign without re-plan;
- an excluded authority class is required but not separately authorized;
- the third materially unsuccessful attempt against the same unresolved failure class is reached;
- continuing would imply release, production, privilege, secrets, protected-main, Candidate activation, or canonical Build Ledger authority not actually granted.

## Anti-duplication rule

Full Debug is an orchestration skill, not another implementation of Debug.

Do not copy or fork the detailed semantics of `signalproof-debug`, `signalproof-known-errors`, `signalproof-security`, `signalproof-recovery`, or command contracts into separate competing logic. Resolve current Active definitions from Git and compose them.

## Identity

- **Suite:** Signalproof Skills
- **Skill:** `signalproof-full-debug`
- **Version:** `0.1.0`
- **Maturity:** Active public baseline after governed merge
- **Parent:** `signalproof` 0.1.0+
- **Role:** Full-debug coordinator
- **Created by:** Doc Reo / Signalproof
