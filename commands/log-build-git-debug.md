# `log-build-git-debug` - Active Ordered Debug Continuity Command V0.1

**Status:** ACTIVE  
**Version:** 0.1.0  
**Owner:** Doc Reo

## Purpose

`log-build-git-debug` preserves debug/recovery state before the next repository-backed correction and then routes only the smallest supported debug action.

Required order:

```text
log-skill
-> design-git
-> build-git-debug
```

> **Preserve the current failure state first, design from what actually persisted, then correct only what current evidence supports.**

## Core contract

1. **Log before retry.** Preserve the failure, partial success, accepted evidence, uncertainty, and recovery state before another consequential correction.
2. Plain invocation uses plain `log-skill`; it does not imply closeout.
3. **Design from persisted state.** Do not assume the last console STOP describes the inner product/candidate state.
4. Force `build-git-debug` discipline when correction is still required.
5. Do not retry an unchanged failed path without a corrected cause or material changed condition.
6. Preserve failed runners, logs, reports, manifests, traces, and recovery evidence.
7. Keep product, harness, parser, staging, expectation, serialization, environment, and security/authority status distinct.
8. **Exit Debug when Debug is complete.** If current evidence says the next owner is Review, Verify, Security, Closeout, or another discipline, do not manufacture another repair.

## Phase 1 - `log-skill`

Preserve proportionately:

- work/build-stream identity and current Git basis;
- exact failed action and symptom;
- strongest supported failure layer/cause;
- failed-attempt count for the unresolved symptom;
- failed artifact identities/hashes where appropriate;
- exact persisted candidate/product state;
- protected state and rollback/non-mutation boundary;
- what did and did not execute;
- known-error/failure-intelligence match;
- changed conditions since the prior attempt;
- final-artifact validation truth class;
- next review/closeout obligation;
- public/private evidence classification.

Do not reserve a Build Ledger `C###` number.

## Phase 2 - `design-git`

For active debugging, produce a bounded contract containing:

```text
DEBUG NEXT ACTION CONTRACT
Symptom: <exact observable failure>
Supported layer/cause: <supported / unknown>
Persisted state: <what already completed>
Prior failed attempts: <count/identities>
Material changed condition: <what differs now>
Protected state: <must not change>
Allowed correction surface: <bounded>
Known-failure constraints: <evidence/rules/none>
Final-artifact validation: <required checks>
Original reproduction: <exact retest>
Regression proof: <protected behavior>
Authority dependencies: <if any>
STOP: <halt/re-design conditions>
Next review/closeout trigger: <when applicable>
```

If cause is not sufficiently localized, route to `signalproof-investigate`. If the defect is already fixed, route onward rather than inventing another fix.

## Phase 3 - `build-git-debug`

When correction remains necessary, execute through Active `build-git-debug`, including current Git recheck, Known Failure Preflight, persisted-state inspection, exact-final artifact validation, structured-literal checks, parser/compiler/schema checks where available, defect-specific tests, original-condition retest, protected-state verification, failed-lane preservation, and the three-attempt escalation rule.

## Status outputs

Use the strongest supported state, such as:

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

Do not manufacture `FIX VERIFIED` merely because a repair artifact was generated or parsed.

## Idempotency

Repeated invocation against the same current-state/failure identity must not duplicate the log or create a fake new attempt. A renamed runner or cosmetic wrapper change is not a material changed condition.

## Authority boundary

Invocation does not authorize protected-state overwrite, destructive host cleanup outside a separate contract, privilege elevation, credentials/secrets use, security weakening, production/release, Candidate activation, Hermes/model execution, direct protected-main mutation, or canonical Build Ledger append.

## STOP conditions

STOP when current debug state cannot be preserved without fabrication/leakage; Git or persisted state is materially ambiguous; proposed retry repeats an unchanged high-confidence failure; the failing layer is too uncertain for bounded correction; exact-final artifact validation is incomplete; an authority-critical literal fails format/length checks; a prior mutation may have completed but persisted-state inspection has not occurred; protected-state integrity is unknown; the third materially unsuccessful attempt is reached without deeper Investigation/authority; or Debug is already complete and another discipline owns the next action.

## Maintenance acceptance

Retain regression coverage for open-state preservation, persisted-state inspection, known-error route change, malformed artifact rejection, validated final handoff, evidence-tail recovery, unchanged-retry STOP, three-attempt escalation, protected-state preservation, debug-complete onward routing, idempotent logging, and public/private chronology boundaries.
