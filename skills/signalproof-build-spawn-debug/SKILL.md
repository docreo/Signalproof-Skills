---
name: signalproof-build-spawn-debug
description: Coordinate a bounded build, multi-role challenge, debug, verification, learning, and user-UI acceptance loop until automated gates pass or a real STOP condition is reached. Use when the owner wants Signalproof to keep building and fixing a UI or product problem, reuse prior failure intelligence, pass machine-verifiable gates first, then hand the exact result to the human for UI testing and final authorization.
---

# Signalproof Build Spawn Debug

## Purpose

`signalproof-build-spawn-debug` is the bounded build-to-human-acceptance coordinator.

> **Keep working while evidence supports a next correction. Stop only at PASS, a real authority boundary, or a real blocker.**

It is designed for work where the human should not have to inspect every intermediate build. Signalproof performs the available governed build, role-separated challenge, debug, regression, and verification work first. The human receives the candidate only after the automated acceptance envelope passes.

This Skill does not replace Build, Debug, Full Debug, Verify, Known Errors, Learn, or the `build-git spawn` command. It composes them.

## Core outcome

The preferred progression is:

```text
CURRENT TRUTH
-> KNOWN-ERROR / FAILURE MEMORY
-> BOUNDED BUILD ENVELOPE
-> BUILD + SPAWN CHALLENGE
-> AUTOMATED VERIFY
-> FAIL? LOCALIZE + DEBUG + RETEST
-> REPEAT WHILE MATERIAL PROGRESS EXISTS
-> AUTOMATED PASS
-> LEARN
-> USER UI TEST READY
-> USER PASS? OWNER AUTHORIZATION READY
-> USER FAIL? RETURN TO DEBUG WITH NEW EVIDENCE
```

The command is complete only when it reaches an honest terminal state. `keep working until it passes` never means repeat an unchanged failed path indefinitely.

## Composition

Resolve current Active definitions from Git and compose, as applicable:

- `signalproof-known-errors` - recurrence prevention and known mitigations;
- `signalproof-build` - bounded implementation;
- `build-git spawn` - Builder, Design, Governor role separation;
- `signalproof-full-debug` / `signalproof-debug` - localization and correction;
- `signalproof-investigate` - unresolved failure layer;
- `signalproof-verify` - acceptance claims;
- `signalproof-review` - scope and change integrity;
- `signalproof-security` - trust-boundary review when implicated;
- `signalproof-recovery` - rollback/restore/cleanup when implicated;
- `signalproof-learn` - evidence-backed reusable learning after resolved work.

Do not duplicate those detailed contracts here.

## Build Spawn Debug Envelope

Before consequential mutation establish:

```text
BUILD SPAWN DEBUG ENVELOPE
Objective: <exact user-visible problem or requested outcome>
Repository / Git basis: <repo/ref/head>
Protected state: <must remain true>
Allowed surfaces: <bounded files/components/resources>
Current symptom / acceptance gap: <observable>
Known-error matches: <ids/none>
Prior failure memory: <fingerprints/attempt counts/none>
Automated gates: <build/test/verify/regression/security as applicable>
User UI gate: <exact final human-observable behavior>
Recovery: <rollback/non-mutation path>
Authority exclusions: <explicit>
STOP: <conditions>
```

Invocation authorizes all owner-authorizable development and debug actions required inside this exact envelope through automated PASS. It does not authorize excluded authority classes below.

## Execution contract

### 1. Reconcile current truth

Refetch current Git and durable evidence. Establish the actual accepted/protected baseline, current implementation state, unresolved failures, prior attempts, and available authority.

Do not restart from chat narrative when durable current state exists.

### 2. Load failure intelligence before work

Run Known Error preflight and restore current workstream failure memory before each repeat-prone action.

Maintain a compact Working Failure Map:

```text
Failure fingerprint
Layer
Attempt count
Ruled-out causes
Known-error match
Last material change
Evidence gained
Next changed condition
Status
```

A new chat, filename, wrapper, prompt, or cosmetic edit does not reset a failure identity.

### 3. Build the smallest supported change

Use the current Build contract and protected-state rules. Do not broaden scope merely because the command can continue working.

### 4. Run spawn challenge

For nontrivial work use the existing `build-git spawn` model:

- Builder lane - implementation/correction and test evidence;
- Design lane - UX, architecture, state, contract, and redesign challenge;
- Governor lane - authority, protected state, known-failure recurrence, security/provenance, evidence strength, and STOP challenge.

The main session remains Orchestrator. If independent agents are unavailable, use explicitly labeled logical lanes and state that truthfully.

### 5. Run automated acceptance gates

Run every machine-verifiable gate required for the claim, including where applicable:

- parser/compiler/schema checks;
- build/package checks;
- unit/integration/regression tests;
- exact-final artifact validation;
- readiness/health checks;
- protected-state checks;
- security/provenance checks;
- runtime or UI automation when actually available and valid.

Static PASS never substitutes for runtime/user evidence that only the human can provide.

### 6. On failure, localize before correcting

Classify the failure layer before editing:

`PRODUCT | UI | BUILD | PARSER | TEST | HARNESS | ENVIRONMENT | DEPENDENCY | DATA | SECURITY | AUTHORITY | EVIDENCE | UNKNOWN`

Use Full Debug semantics for complex/repeated failures. Inspect persisted state first. Require a materially changed condition before another attempt against the same failure fingerprint.

Make the smallest evidence-supported correction, validate the exact final artifact, rerun the failed condition, then rerun required regression/protected-state gates.

### 7. Continue across material failure classes

The overall operation may continue through multiple newly localized failure classes until the automated acceptance envelope passes.

Same-failure retry discipline remains binding. The default Full Debug limit of three materially unsuccessful corrections against the same unresolved failure class carries forward across chats. Reaching that limit routes to Investigation, redesign/replan, owner decision, or STOP. It does not authorize attempt four with cosmetic changes.

### 8. Learn while getting more efficient

Efficiency comes from evidence reuse, not uncontrolled self-modification.

During the active workstream:

- preserve failed approaches so they are not repeated;
- reuse a proven local correction when the same fingerprint recurs under matching conditions;
- skip already-satisfied gates when their evidence remains valid and the relevant bytes/state did not change;
- rerun invalidated gates when affected state changes;
- record what evidence distinguished one failure layer from another.

After a novel failure is resolved, route material lessons through `signalproof-learn`.

Learning may produce a regression test, documentation update, known-error/policy/Skill candidate, or no action. It does not silently rewrite this Skill or auto-promote new doctrine. Future invocations become more efficient only when verified learning is preserved in the applicable governed memory/test/catalog and is valid for the new conditions.

## Automated PASS gate

Declare `AUTOMATED PASS / USER UI TEST READY` only when:

- all required machine-verifiable acceptance gates pass;
- original machine-observable failures are cleared;
- required regression/protected-state checks pass;
- no unresolved security/authority blocker remains for user testing;
- the exact candidate the human will test is identified;
- the remaining acceptance claim genuinely requires human UI observation.

Do not call the product fully accepted yet.

## User UI Test handoff

At automated PASS, present a compact `USER UI TEST` containing:

```text
Candidate: <exact version/build/artifact>
Launch: <exact user action>
Test: <minimum human steps>
Expected: <observable result>
Do not test: <out-of-scope behavior if relevant>
If PASS: reply PASS / authorize the next bounded gate
If FAIL: report what happened; preserve screenshot/text/error when useful
Pending after PASS: <exact authorization or closeout/release gate>
```

The human should test the user-visible behavior, not repeat internal automated gates.

## Human feedback loop

### Human reports FAIL

Treat the observation as new evidence. Preserve the exact candidate identity and user-observed symptom, classify the new failure, update the Working Failure Map, and re-enter Investigation/Debug without discarding prior automated evidence that remains valid.

### Human reports PASS

Record `USER UI PASS / OWNER AUTHORIZATION READY`.

Human PASS proves only the stated UI acceptance gate. It does not silently authorize release, production, protected-main bypass, privilege/security changes, or canonical Build Ledger mutation.

Proceed further only under the explicit next owner authorization and applicable command/Skill contract.

## Status values

Use the strongest supported state:

- `BUILDING / AUTOMATED GATES OPEN`
- `DEBUGGING / MATERIAL PROGRESS`
- `INVESTIGATION REQUIRED`
- `RECOVERY REQUIRED`
- `AUTOMATED PASS / USER UI TEST READY`
- `USER UI FAIL / DEBUG RESUMED`
- `USER UI PASS / OWNER AUTHORIZATION READY`
- `AUTHORIZED-PENDING-PRECONDITION`
- `BLOCKED`
- `STOP / OWNER DECISION REQUIRED`

## Authority exclusions

Invocation does not authorize:

- production/release/deployment;
- direct protected-main mutation where PR controls apply;
- canonical Build Ledger append;
- Candidate Skill activation outside governance;
- privilege escalation or administrative security-control changes;
- credentials/secrets/access not already authorized for the envelope;
- disabling security, verification, provenance, recovery, or tests;
- unrelated repositories/workstreams;
- future work after the current envelope is consumed.

## STOP conditions

STOP or escalate when current Git/protected state is unknown; the workstream cannot be bounded; a high-confidence known-bad path would be repeated unchanged; same-failure retry limit is reached; the failure remains too unlocalized for safe correction; lane disagreement exposes a material owner decision; correction requires material redesign without re-plan; required automated verification is unavailable and the claim cannot honestly advance; an excluded authority class is required; recovery is no longer credible; or continuing would manufacture evidence, authority, user acceptance, release status, or canonical chronology.

## Anti-loop rule

The goal is persistence with learning, not motion for its own sake.

A new attempt must have at least one of:

- materially new evidence;
- a newly localized layer/cause;
- a materially changed implementation or environment condition;
- a newly applicable known mitigation;
- an owner decision that resolves a blocked branch.

Otherwise STOP the repeated path.

## Identity

- **Suite:** Signalproof Skills
- **Skill:** `signalproof-build-spawn-debug`
- **Version:** `0.1.0`
- **Maturity:** Active public baseline after governed promotion
- **Parent:** `signalproof` 0.1.1+
- **Role:** build-to-user-acceptance coordinator
- **Domain:** bounded build, spawn challenge, debug convergence, adaptive failure reuse, automated acceptance, user UI handoff
- **Created by:** Doc Reo / Signalproof
