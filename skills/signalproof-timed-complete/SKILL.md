---
name: signalproof-timed-complete
description: Run bounded Complete work inside a user-defined wall-clock timebox without weakening verification, recovery, security, or evidence requirements.
---

# Signalproof Timed Complete

## Purpose

`signalproof-timed-complete` is a thin timebox coordinator over the Active `/dsp complete` workflow.

> **Use the time. Preserve the truth. Stop cleanly.**

It exists for work the owner wants advanced as far as safely possible within a stated duration. It does not replace `complete`, `build-spawn-debug`, or their safeguards.

## Inheritance

Inherits the Active root `signalproof` contract and the current Active `complete` command contract.

Canonical route:

```text
/dsp <time> st
-> st
-> timed complete envelope
-> complete
-> build-spawn-debug
```

The timebox limits continuation. It does not create new authority and cannot waive known-error, protected-state, retry, security, legal/licensing, recovery, exact-artifact, or evidence requirements.

## Accepted Time Forms

The user must state a positive duration. Supported normalized forms include:

```text
5m
30m
90m
1h
2h
1h30m
2h 15m
```

Equivalent plain-language forms such as `30 minutes`, `2 hours`, or `1 hour 30 minutes` may normalize to the same duration.

Examples:

```text
/dsp 30m st
/dsp 2h st
/dsp 1h30m st
dsp 45 minutes st
```

If no duration is supplied, the duration is zero/negative, or the duration is materially ambiguous, STOP with the smallest required clarification. Do not invent a default.

## Timed Complete Envelope

Before actuation establish:

```text
TIMED COMPLETE ENVELOPE
Workstream: <exact current bounded workstream>
Objective: <user-visible outcome>
Duration: <normalized positive duration>
Start: <observed start timestamp when available>
Deadline: <derived end timestamp when available>
Git basis: <repo/ref/head>
Protected state: <must remain true>
Acceptance target: <machine gates + human UI gate>
Allowed authority: same owner-authorizable scope as current /dsp complete
Known failures / retry memory: <ids/fingerprints/attempt counts>
Recovery: <rollback/non-mutation path>
Expiry behavior: stop starting new work, leave safe consistent state, preserve resumable handoff
Status: AUTHORIZED | AUTHORIZED-PENDING-PRECONDITION | STOP / AMBIGUOUS
```

## Execution Contract

1. Refetch current Git and current public `st`, `complete`, Router, and known-error contracts before consequential action.
2. Resolve the exact current workstream as `/dsp complete` would.
3. Normalize the user-stated duration and establish start/deadline from the best available clock source.
4. Run the current canonical `complete` workflow. Do not reimplement its internals.
5. Prefer high-value work that advances the stated acceptance target. Do not intentionally start work unlikely to reach a safe checkpoint before expiry when a smaller bounded action is available.
6. Re-check remaining time at natural boundaries: before a new material implementation attempt, before a new failure-class investigation, before an expensive test/build, and before a new side-effecting action.
7. Same-failure retry limits and materially-changed-condition rules remain binding.
8. If all required machine gates pass before expiry, return the normal `USER UI TEST READY` or stronger supported Complete state.
9. If human UI PASS occurs before expiry, return the normal `COMPLETE / USER ACCEPTED` state.
10. Time expiry is not success and is not failure by itself. It is a bounded STOP condition requiring continuity preservation.

## Expiry Rule

At or beyond the deadline:

- do not begin a new material implementation, retry, investigation branch, long-running test, or side-effecting operation;
- do not kill or corrupt an operation solely to satisfy the clock if doing so would leave unsafe or inconsistent state;
- complete only the minimum bounded cleanup/checkpoint needed to leave recoverable state;
- preserve exact current candidate identity, completed gates, failed attempts, unresolved failures, protected state, recovery state, and next best action;
- produce a resumable handoff/state capsule;
- report the strongest truthful timed state.

The deadline is a stop-starting-new-work boundary, not permission to abandon recovery obligations.

## Timed Completion States

Use the strongest supported state:

```text
ST / COMPLETE / USER ACCEPTED
ST / USER UI TEST READY
ST / WORKING
ST / DEBUGGING
ST / TIMEBOX EXPIRED / RESUMABLE
ST / BLOCKED
ST / STOP - OWNER DECISION REQUIRED
```

`ST / TIMEBOX EXPIRED / RESUMABLE` must include:

- what was completed;
- what remains;
- exact current candidate/worktree/branch identity when applicable;
- last verified evidence;
- unresolved failure fingerprint(s);
- rollback/recovery state;
- exact recommended resume command, normally another `/dsp <time> st` or `/dsp complete`.

## Efficiency Rule

A timebox is for prioritization, not corner-cutting.

Within the available time:

1. reuse still-valid evidence;
2. run cheap deterministic checks before expensive reasoning or builds;
3. avoid unchanged known-bad retries;
4. prefer the smallest material action that can advance acceptance;
5. preserve a usable checkpoint before expiry.

Do not spend the final portion of the timebox starting broad work that predictably cannot reach a safe checkpoint unless that action is itself the necessary evidence-gathering step.

## Authority Exclusions

Timed Complete inherits all `/dsp complete` exclusions. It does not authorize:

- protected-main bypass;
- production release/deployment outside an already-authorized envelope;
- canonical private Build Ledger append;
- Candidate activation outside governance;
- new credentials/secrets or privilege escalation;
- weakening security, tests, provenance, verification, or recovery;
- unrelated workstreams;
- fabrication of PASS, acceptance, elapsed time, or completion.

## STOP Conditions

STOP before execution when the duration is missing/invalid/ambiguous, the workstream is not bounded, reliable time tracking is unavailable where exact enforcement materially matters, or normal Complete would STOP.

During execution, STOP on the first of:

1. normal Complete STOP condition;
2. timebox expiry after safe checkpoint/cleanup;
3. user cancellation;
4. workstream material change invalidating the envelope.

## Acceptance Criteria

This skill is correctly applied when:

- the owner-stated duration is preserved exactly after normalization;
- the current Complete workflow remains authoritative;
- no safety/evidence gate is weakened because of time pressure;
- work stops starting new material actions at expiry;
- recoverable state and a precise resume point are preserved;
- the final status distinguishes accepted completion from timebox expiry.

## Identity

- **Suite:** Signalproof Skills
- **Skill:** `signalproof-timed-complete`
- **Version:** `0.1.0`
- **Maturity:** Active public baseline after governed promotion
- **Parent:** `signalproof` 0.1.1+
- **Domain:** user-defined wall-clock bounded completion coordination
- **Created by:** Doc Reo / Signalproof
