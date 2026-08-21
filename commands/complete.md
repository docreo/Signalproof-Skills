# `complete` - Active Operator Command V0.1.0

**Status:** ACTIVE  
**Version:** 0.1.0  
**Owner:** Doc Reo

## Purpose

`complete` is the canonical Dr. Signalproof command behind `/dsp complete`.

It is the fast owner directive for: authorize every owner-authorizable action inside the current bounded workstream, run the existing `build-spawn-debug` convergence workflow, keep correcting while evidence supports a materially changed next attempt, and continue through the human UI feedback loop until the user reports the result works and is properly usable or a genuine STOP condition is reached.

Canonical route:

`/dsp complete -> complete -> bounded authorize-all envelope -> build-spawn-debug`

Accepted forms include:

```text
/dsp complete
dsp complete
/dsp-complete
dsp-complete
complete
```

## Operator meaning

When the current workstream is already sufficiently bounded, `/dsp complete` means:

> Authorize all owner-authorizable Build Spawn Debug actions required to finish this current bounded workstream. Do not return routine intermediate implementation/debug approval gates to the user. Keep working while evidence supports a valid next correction. Present the exact candidate for human UI testing only when automated acceptance passes. If the user reports FAIL, resume the same workstream with that observation as evidence. Finish only when the user reports the result works and is properly usable, or when a real excluded authority/blocker/STOP condition requires the user.

This is shorthand for bounded completion authority, not unlimited authority.

## Required behavior

1. Refetch current Git and current public command contracts before consequential action.
2. Resolve the current workstream, exact objective, protected state, acceptance target, and recovery path.
3. If the workstream is not sufficiently bounded, STOP with the smallest missing scope decision. Do not invent a target simply because the word `complete` was used.
4. Create one `COMPLETE AUTHORIZATION ENVELOPE` bound to the current workstream.
5. Treat the invocation as explicit owner authorization for all normal owner-authorizable build, spawn, investigate, debug, test, verify, review, security-check, recovery, and learning actions required by the current `build-spawn-debug` envelope.
6. Preserve all objective prerequisites, known-error guards, retry limits, protected-state rules, exact-final-artifact checks, and recovery requirements.
7. Do not stop for routine intermediate owner approvals that are already inside the Complete Authorization Envelope.
8. Run the current canonical `build-spawn-debug` command rather than reimplementing its internals.
9. Continue across materially distinct failure classes while evidence supports another bounded correction.
10. Same-failure retry limits remain binding. A new attempt against the same failure requires materially new evidence, a newly localized cause, a materially changed implementation/environment condition, a proven mitigation, or an owner decision that resolves the blocked branch.
11. When all machine-verifiable gates pass, present `USER UI TEST READY` with the exact candidate, launch action, minimum test steps, expected behavior, and the specific user-visible acceptance claim.
12. Human UI FAIL is not a terminal stop. Preserve the exact observation and candidate identity, then resume the same Build Spawn Debug workstream automatically under the still-valid Complete Authorization Envelope when the failure remains inside scope.
13. Human UI PASS means the stated user-visible acceptance gate is satisfied. Record `COMPLETE / USER ACCEPTED` for the bounded workstream and stop unless a separately excluded release/deployment/canonical-ledger gate remains explicitly requested.
14. Do not claim user acceptance before the user actually reports that the result works and is properly usable. Complete cannot manufacture user PASS.

## Complete Authorization Envelope

Before actuation preserve:

```text
COMPLETE AUTHORIZATION ENVELOPE
Workstream: <exact current bounded workstream>
Objective: <user-visible outcome>
Git basis: <repo/ref/head>
Protected state: <must remain true>
Acceptance target: <machine gates + human UI gate>
Allowed authority: all owner-authorizable actions required by current build-spawn-debug envelope
Known failures / retry memory: <ids/fingerprints/attempt counts>
Recovery: <rollback/non-mutation path>
Excluded authority: <explicit classes below>
Consumption: user ACCEPTED, material workstream change, envelope invalidation, or STOP
Status: AUTHORIZED | AUTHORIZED-PENDING-PRECONDITION | STOP / AMBIGUOUS
```

The envelope survives ordinary corrections and human UI FAIL feedback inside the same workstream. It is not reusable for another product, repository, objective, release, or future workstream.

## Human interaction contract

The intended operator experience is minimal interruption.

Do not return:

- routine compile/build/test permission questions;
- routine bounded debug authorization questions;
- repeated approval requests after each materially supported correction;
- another `authorize all` request for work already inside the same valid Complete Authorization Envelope.

Return to the human only for:

1. `USER UI TEST READY` after automated PASS;
2. a genuinely unresolved product/UX choice that cannot be inferred safely;
3. an excluded authority class;
4. a true STOP/blocker that cannot be resolved inside the envelope.

After `USER UI TEST READY`:

- user reports FAIL -> resume work automatically inside the same bounded workstream;
- user reports PASS / works / usable -> `COMPLETE / USER ACCEPTED`.

## Relationship to authorization

`complete` incorporates the intent of a bounded `/dsp authorize all build-spawn-debug` for the current workstream.

The phrase `all` means all owner-authorizable actions necessary inside this exact completion envelope. It does not mean all possible actions, all repositories, all future operations, or all authority classes.

Do not recursively call `authorize` and then ask the owner to authorize the same work again. The `complete` invocation itself is the explicit owner authority source for the bounded completion envelope.

## Relationship to Build Spawn Debug

`complete` is a thin coordinator over the Active `build-spawn-debug` command.

All Build Spawn Debug safeguards remain binding, including:

- current-Git reconciliation;
- known-error and failure-memory preflight;
- Builder/Design/Governor separation when applicable;
- exact machine-verifiable acceptance gates;
- materially changed-condition retry discipline;
- preserved attempt counts across chats/files;
- governed learning rather than uncontrolled self-modification;
- exact human UI evidence before user PASS.

## Authority exclusions

`/dsp complete` does not authorize:

- production deployment or public release unless that release is separately and explicitly part of an already authorized current envelope;
- bypass of protected-main/PR controls;
- canonical private Build Ledger append;
- Candidate Skill activation outside governance;
- use or acquisition of credentials/secrets not already authorized;
- privilege escalation or administrative security-control changes;
- weakening/disabling security, verification, provenance, rollback, tests, or evidence requirements;
- unrelated repositories, products, objectives, or future workstreams;
- actions blocked by legal/licensing requirements;
- fabrication of machine PASS, human UI PASS, release state, or authority.

## STOP conditions

STOP only when continuing would require an excluded authority class; the current workstream/objective/protected state cannot be established; same-failure retry limits are exhausted without a materially changed condition; a material redesign decision genuinely requires the owner; recovery is no longer credible; required machine verification cannot be performed honestly; legal/licensing/security prerequisites block continuation; the workstream changes materially enough to invalidate the envelope; or continuing would manufacture evidence, acceptance, authority, or completion.

A routine failed build, test, or UI observation is not by itself a STOP condition when a bounded evidence-supported correction remains available.

## Completion states

Use the strongest supported state:

- `COMPLETE / WORKING`
- `COMPLETE / DEBUGGING`
- `COMPLETE / AUTHORIZED-PENDING-PRECONDITION`
- `COMPLETE / USER UI TEST READY`
- `COMPLETE / USER UI FAIL - RESUMED`
- `COMPLETE / USER ACCEPTED`
- `COMPLETE / BLOCKED`
- `COMPLETE / STOP - OWNER DECISION REQUIRED`

## Signalproof principle

> **Finish the bounded job. Do not make the human babysit the build. Do not fake the last mile.**
