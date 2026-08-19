# `log-build-git-debug` — Ordered Debug Continuity Command V0.1 Candidate

**Status:** CANDIDATE / NOT ACTIVE  
**Version:** 0.1.0-candidate  
**Date:** 2026-08-19

## Purpose

`log-build-git-debug` is the ordered Signalproof command for preserving debug-state continuity before the next repository-backed correction or recovery action.

Its required order is:

```text
log-skill
   ↓
design-git
   ↓
build-git-debug
```

The command means:

> **Preserve the current failure/recovery state first, design the next debug action from that preserved evidence, then execute only the smallest supported correction through `build-git-debug`.**

This command exists to stop a specific class of failure: debugging from memory, losing failed-lane evidence, repeating a mutation because an outer wrapper failed, or handing the operator another repair artifact before the previous failure has been fully characterized.

## Core contract

1. **Log before retry.** The current failure, partial success, recovery state, accepted evidence, and uncertainty must be preserved before another consequential correction is designed.
2. **Do not manufacture closure.** Plain `log-build-git-debug` uses plain `log-skill`; it does not imply `log-skill close`.
3. **Design from persisted state.** `design-git` must inspect what actually persisted, not assume the last console STOP describes the inner product state.
4. **Force debug discipline.** Consequential correction uses `build-git-debug`, including Known Failure Preflight and final-artifact self-validation.
5. **No unchanged blind retry.** A failed path may be retried only when the prior cause was corrected or a material changed condition is recorded.
6. **Preserve failed attempts.** Failed runners, logs, reports, manifests, trace lanes, and recovery evidence remain immutable unless normal governance separately authorizes archival/supersession.
7. **Keep product and harness status separate.** Harness, staging, serializer, expectation, test, environment, source/product, security, and dependency failures must not be collapsed into one generic BUILD FAIL.
8. **Stop when debug is complete.** If logging/design proves the defect is already corrected and the next step is Review, Verify, Security, Closeout, or another non-debug action, do not force an unnecessary debug mutation. Return the routed next action explicitly.

## Phase 1 — `log-skill`

Preserve/synchronize the current debug work unit before another repair action.

Record as applicable:

- work/build-stream identity;
- governing Git/ref/head used by the current work;
- open/closed/blocked state;
- exact failing action and symptom;
- strongest supported failure layer/cause;
- failed-attempt count for the unresolved symptom;
- failed runner/artifact identity and hashes where public-safe;
- exact persisted candidate/product state;
- protected state and rollback/non-mutation boundary;
- what did and did not execute;
- known-error/failure-intelligence match or candidate learning;
- changed conditions since the last failed attempt;
- current artifact-validation truth class;
- next closeout obligation;
- public/private evidence classification.

Do not reserve a Build Ledger `C###` number. If canonical private ledger ingestion is unavailable or unauthorized, preserve only a staged/noncanonical state consistent with `log-skill`.

## Phase 2 — `design-git`

Design the next action from the newly preserved state.

For active debugging, the Next Action Contract must additionally include:

```text
DEBUG NEXT ACTION CONTRACT
Symptom: <exact observable failure>
Supported layer/cause: <supported / unknown>
Persisted state: <what already completed>
Prior failed attempts: <count and identities>
Material changed condition: <what is different now>
Protected state: <must not change>
Allowed correction surface: <bounded surface>
Known-error constraints: <IDs/rules/none>
Final-artifact validation: <required validators/tests>
Original reproduction: <exact retest>
Regression proof: <protected behavior>
STOP: <authority/state/repeat-loop conditions>
```

If the cause is not localized enough for a bounded correction, route to `signalproof-investigate` and stop before correction.

If the defect has already been verified fixed, route to the appropriate Review/Verify/Security/Closeout action rather than inventing another fix.

## Phase 3 — `build-git-debug`

When the Next Action Contract still requires correction/recovery, execute it through `build-git-debug`.

Mandatory behavior includes:

- recheck current Git before consequential work;
- run Known Failure Preflight;
- inspect persisted state before retrying a mutation;
- validate exact-final artifacts after all edits;
- machine-check structured literals such as SHA-256, versions, identifiers, ports, paths, and refs when applicable;
- run parser/compiler/schema checks when available;
- run a defect-specific micro-fixture or negative test when feasible;
- report validation truth honestly when the operator environment must perform the final runtime/parser gate;
- retest the original failing condition;
- verify protected state and regression behavior;
- preserve evidence and failed lanes;
- stop the repeated-fix loop after three materially unsuccessful attempts against the same unresolved symptom unless explicit human authority directs deeper work.

## Debug-continuity statuses

Return the strongest supported status, for example:

- `LOGGED -> DEBUG CONTRACT READY`
- `LOGGED -> INVESTIGATION REQUIRED`
- `LOGGED -> HARNESS CORRECTION VERIFIED`
- `LOGGED -> PRODUCT FIX VERIFIED`
- `LOGGED -> RECOVERY TAIL COMPLETE`
- `LOGGED -> DEBUG COMPLETE -> REVIEW REQUIRED`
- `LOGGED -> DEBUG COMPLETE -> SECURITY REVIEW REQUIRED`
- `LOGGED -> MILESTONE CLOSEOUT REQUIRED`
- `LOGGED -> BLOCKED`
- `LOGGED -> STOP / OWNER DECISION REQUIRED`

The command must never manufacture `FIX VERIFIED` simply because a repair artifact was generated.

## Current proven motivating case

Build 8A Phase C C1 exposed the need for this command:

- repeated harness failures occurred around a candidate that had already partially or fully progressed;
- persisted-state inspection prevented blind mutation reruns;
- an evidence-tail recovery avoided re-running the patch/security suite;
- a 61-character truncated expected SHA-256 repeatedly produced a false protected-state failure;
- final pre-handoff literal-shape validation caught and eliminated that defect class;
- the corrected tail recovery completed with 21/21 preserved security regressions and protected Core unchanged.

This case is acceptance evidence for the command architecture, not authority to make `log-build-git-debug` Active.

## Relationship to other commands

### `log-build-git`

General ordered continuity:

`log-skill -> design-git -> build-git`

Use for ordinary governed next-action execution.

### `build-git-debug`

Debug-specialized execution:

`build-git` governance + `signalproof-debug` + Known Error discipline + mandatory final-artifact self-validation.

### `log-build-git-debug`

Debug continuity composition:

`log-skill -> design-git -> build-git-debug`

Use when a failure/correction/recovery stream must be made durable before another debug action.

## Idempotency

Repeated invocation must not duplicate the same failure identity or current-state log merely because the command was called again.

A new debug iteration requires materially new evidence, a changed condition, or a newly bounded hypothesis/correction. A renamed runner without a material correction does not constitute a new attempt class.

## Authority boundary

Invocation does not itself authorize:

- protected-state overwrite;
- destructive host cleanup beyond an already authorized cleanup contract;
- privilege elevation;
- security-policy weakening;
- credentials/secrets use;
- release/deployment;
- Hermes/model/tool execution that remains separately gated;
- skill/policy activation;
- direct protected-main mutation;
- canonical Build Ledger append when separate ledger gates are not satisfied.

## STOP conditions

STOP when:

- current state cannot be logged without fabricating chronology or exposing private data;
- governing Git or persisted product/candidate state is materially ambiguous;
- the proposed retry repeats an unchanged high-confidence failed path;
- the failing layer remains unknown and the proposed fix is speculative;
- the exact-final repair artifact has not passed all available pre-handoff validators;
- an authority-critical literal fails its format/length check;
- a prior mutating action may already have completed and persisted-state inspection has not occurred;
- protected-state integrity is not established;
- the third materially unsuccessful correction attempt is reached without deeper investigation or explicit authority;
- debug is already complete and the next required action belongs to Review/Verify/Security/Closeout rather than another correction.

## Acceptance requirements

Before Active promotion, demonstrate at minimum:

1. logging preserves an open failed/recovery state without falsely closing it;
2. persisted-state inspection prevents one blind mutation rerun;
3. known-error evidence changes at least one retry/design decision;
4. a malformed final repair artifact is rejected before operator handoff;
5. a valid final artifact reaches the operator with an honest validation-truth statement;
6. an evidence-tail recovery completes without repeating already-passed implementation/tests;
7. a repeated unchanged failure is stopped rather than renamed/retried;
8. the three-attempt escalation rule is exercised;
9. protected state remains exact through a successful correction;
10. when debug is complete, the command exits to Review/Verify/Security/Closeout instead of forcing another fix;
11. repeated invocation is idempotent for already-recorded failure/current-state identities;
12. public/private boundaries and Build Ledger chronology remain intact.

## Identity

- **Command:** `log-build-git-debug`
- **Version:** `0.1.0-candidate`
- **Maturity:** Candidate / Not Active
- **Order:** `log-skill -> design-git -> build-git-debug`
- **Parent commands:** `log-build-git`, `build-git-debug`
- **Primary Active specialists:** `signalproof-debug`, `signalproof-known-errors`, `signalproof-investigate`, `signalproof-verify`, `signalproof-review`, `signalproof-closeout`
- **Created by:** Doc Reo / Signalproof
