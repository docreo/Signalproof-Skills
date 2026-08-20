# `full-debug` - Active Full Debug Orchestration Command V0.1

**Status:** ACTIVE  
**Version:** 0.1.0  
**Owner:** Doc Reo

## Purpose

`full-debug` is the canonical operator command behind `/dsp full-debug`.

It runs the strongest bounded Signalproof debugging workflow by composing the current Active `signalproof-full-debug` coordinator with existing debug continuity, authorization, known-error, and spawn contracts.

> **One command may coordinate the full bounded debug operation, but it does not create blanket authority or duplicate the underlying debug execution.**

## Accepted intent

The owner may invoke forms such as:

```text
/dsp full-debug
/dsp full debug
/dsp-full-debug
dsp full-debug
dsp-full-debug
```

All accepted forms resolve to canonical `full-debug` before action.

## Canonical orchestration

The intended composition is:

```text
REFETCH CURRENT GIT
-> RESTORE KNOWN-ERROR / FAILURE MEMORY
-> ESTABLISH FULL DEBUG ENVELOPE
-> RECORD BOUNDED OWNER AUTHORIZATION
-> LOG-BUILD-GIT-DEBUG CONTINUITY
-> BUILD-GIT SPAWN EXECUTION MODEL
-> VERIFY / REVIEW / SECURITY / RECOVERY AS ROUTED
-> PRESERVE RESULT / LEARNING / CONTINUITY
```

`log-build-git-debug` already routes `log-skill -> design-git -> build-git-debug`. Therefore Full Debug must not invoke a second independent `build-git-debug` after that sequence. `build-git spawn` is the role-separation execution model for the bounded debug work, not a second build pass.

## Full Debug Envelope

Before consequential action, establish the exact bounded workstream and preserve:

- repository/ref/head;
- symptom and current failure class/fingerprint;
- prior attempt count, including attempts from earlier chats;
- persisted state and any partial success;
- protected state and forbidden changes;
- applicable known-error and PowerShell prevention rules;
- owner-authorizable steps required by this bounded debug operation;
- authority exclusions;
- acceptance evidence;
- recovery/non-mutation path;
- STOP conditions.

If the workstream cannot be bounded sufficiently, STOP rather than interpreting `full-debug` as general permission to repair anything available to the session.

## Authorization semantics

Invocation is explicit owner direction to perform all **owner-authorizable actions required by the current bounded Full Debug Envelope**.

This is the Full Debug meaning of `authorize all`.

It remains subject to objective prerequisites and does not authorize:

- canonical Build Ledger append;
- release or production deployment;
- direct protected-main mutation where branch/PR controls apply;
- privilege escalation or administrative security-control change;
- credentials, secrets, private keys, or expanded access not already authorized for the bounded operation;
- disabling security, verification, provenance, or recovery controls;
- unrelated repositories/workstreams;
- future operations after the current envelope is consumed;
- Candidate activation outside normal Signalproof promotion governance.

When an excluded authority class is required, use `AUTHORIZED-PENDING-PRECONDITION` or STOP and obtain the separately required authority.

The generic `authorize` contract remains authoritative for authorization scope, prerequisites, protected state, consumption, and STOP behavior.

## Known-error and PowerShell persistence

Full Debug must search current known-error/failure evidence before correction.

A new chat or conversation, renamed runner, wrapper change, prompt rewrite, or cosmetic command change does not create a fresh retry budget.

When PowerShell is relevant, load the current `library/POWERSHELL-FAILURE-REGISTRY.yaml`, restore prior same-failure attempt state, run applicable executable known-error validation, parser-preflight the exact final staged `.ps1`, and block materially unchanged known-bad retries according to current `build-git` controls.

## Spawn requirement

Full Debug uses the current `build-git spawn` protocol for nontrivial debug work.

Required lanes:

- **Builder** - bounded correction and defect-specific implementation/test evidence;
- **Design** - architecture/contract/state-fidelity challenge and redesign detection;
- **Governor** - authority, protected state, recurrence, security/provenance, evidence strength, and STOP challenge.

The main session remains the Signalproof Orchestrator.

If the environment supports true independent agents, bounded roles may execute independently. Otherwise use clearly labeled logical lanes and report that accurately. Never claim agents spawned when they did not.

## Debug execution rule

The correction phase follows `log-build-git-debug` and `build-git-debug` semantics:

1. preserve the current failure/recovery state;
2. inspect persisted state before retry;
3. localize the failure layer or route to Investigation;
4. identify a materially changed condition before retry;
5. make only the smallest supported correction;
6. validate the exact final artifact;
7. retest the original failure;
8. verify protected-state regressions;
9. preserve failed attempts and reusable learning;
10. exit Debug when another discipline owns the next action.

Default same-failure unsuccessful-attempt limits carry across chat boundaries.

## Evidence and completion

Return a `FULL DEBUG RESULT` containing at least:

- workstream and Git basis;
- failure class/fingerprint;
- carried-forward attempt count;
- known-error matches;
- bounded authorization status;
- spawn truth (`independent agents` or `logical lanes`);
- persisted-state inspection result;
- correction or no-change result;
- exact-final validation truth class;
- original-failure retest;
- protected-state/regression result;
- Governor decision;
- final status and next action.

A generated patch, parser PASS, or successful build alone is not `FULL DEBUG VERIFIED` when required runtime or regression evidence remains missing.

## STOP conditions

STOP when current Git/workstream is unknown; protected state is unresolved; repeat-prone failure continuity is missing; a high-confidence known failure would be repeated unchanged; a proposed retry is cosmetic; persisted-state inspection is incomplete; exact-final validation fails or is unavailable when required and available tooling should have run; the failing layer is not localized enough for bounded correction; lane disagreement exposes an unresolved owner decision or material risk; an excluded authority class is required; the retry limit is reached; or continuing would infer release, production, secrets, privilege, protected-main, Candidate activation, or canonical Build Ledger authority.

## Authority boundary

`full-debug` is convenience orchestration over existing governed commands and skills. It cannot weaken or override their STOP conditions and creates no independent authority source.
