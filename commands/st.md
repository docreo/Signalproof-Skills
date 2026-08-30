# `st` - Start Operator Command V0.1.0

**Status:** ACTIVE  
**Version:** 0.1.0  
**Owner:** Doc Reo

## Name

`st` means **Start**.

It is the short Start command in the form `/dsp <time> st`.

## Purpose

`st` is the canonical Dr. Signalproof command behind `/dsp <time> st`.

It means: **start the current `/dsp complete` workflow and run it inside the user-stated wall-clock duration.** It does not create a second completion engine.

Canonical route:

`/dsp <time> st -> Start -> signalproof-timed-complete -> complete -> build-spawn-debug`

## Accepted forms

```text
/dsp 5m st
/dsp 30m st
/dsp 90m st
/dsp 1h st
/dsp 1h30m st
/dsp 2h 15m st
dsp 45 minutes st
dsp 2 hours st
```

The time expression is an argument that appears before the `st` Start command token. DSP must preserve it rather than treating the first duration token as a command.

If the duration is absent, zero/negative, or materially ambiguous, STOP with the smallest duration clarification. Do not invent a default.

## Operator meaning

`/dsp <time> st` means:

> Start the current bounded workstream under the same authority and safeguards as `/dsp complete`, but only continue starting new material work within the user-stated timebox. Use the available time efficiently, preserve all verification/security/recovery/evidence gates, and if the time expires before completion, stop cleanly at a recoverable checkpoint and return a precise resumable handoff instead of claiming success.

## Required behavior

1. Resolve and normalize the user-stated positive duration.
2. Establish the best available observed start time and derived deadline.
3. Load the current Active `signalproof-timed-complete` skill and current Active `complete` command.
4. Refetch current Git and run the normal known-error/failure-memory preflight before consequential work.
5. Create a `TIMED COMPLETE ENVELOPE` bound to the same exact workstream that Complete would use.
6. Start and run current canonical `complete`; do not duplicate or weaken its internals.
7. Re-check remaining time at natural material boundaries.
8. Do not begin a new material implementation/retry/investigation/expensive test/side effect at or beyond the deadline.
9. Do not interrupt an in-flight action in a way that would corrupt state merely to satisfy the clock. Perform only the minimum safe checkpoint/cleanup required.
10. If normal Complete reaches automated PASS before expiry, return its normal `USER UI TEST READY` state.
11. If the user provides UI PASS before expiry, return `ST / COMPLETE / USER ACCEPTED`.
12. If the timebox expires first, return `ST / TIMEBOX EXPIRED / RESUMABLE` with exact state and resume instructions.

## Expiry output

`ST / TIMEBOX EXPIRED / RESUMABLE` must preserve:

- normalized duration and observed elapsed/deadline information available to the runtime;
- completed work and verified gates;
- current candidate/branch/worktree identity when applicable;
- unresolved failure fingerprints and retry counts;
- protected-state and rollback/recovery condition;
- exact next recommended action;
- a resume form such as `/dsp <time> st` or `/dsp complete`.

Time expiry is not a PASS and is not a product failure by itself.

## Authority boundary

`st` inherits the exact authority envelope and exclusions of `/dsp complete`. The timebox cannot authorize protected-main bypass, unapproved production release/deployment, canonical private Build Ledger append, Candidate activation outside governance, new secrets/credentials, privilege escalation, weakening security/tests/provenance/recovery, unrelated work, or fabricated acceptance.

## Completion states

Use the strongest truthful state:

- `ST / COMPLETE / USER ACCEPTED`
- `ST / USER UI TEST READY`
- `ST / WORKING`
- `ST / DEBUGGING`
- `ST / TIMEBOX EXPIRED / RESUMABLE`
- `ST / BLOCKED`
- `ST / STOP - OWNER DECISION REQUIRED`

## Signalproof principle

> **Start the work. Timebox the work, not the truth.**
