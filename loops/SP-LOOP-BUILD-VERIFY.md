# SP-LOOP-BUILD-VERIFY

**Status:** RD1 Candidate  
**Principal:** `signalproof-build`

## Purpose

Implement a bounded change incrementally and verify each affected boundary before stacking more uncertainty.

## Cycle

`BASELINE -> IMPLEMENT SMALLEST CHANGE -> STATIC/COMPILE CHECK -> TARGET VERIFY -> REGRESSION -> ACCEPT / REVISE / STOP`

## Contract

- Require bounded scope, protected state, acceptance condition, and rollback/non-mutation path.
- Prefer one independently testable implementation increment per iteration.
- Default maximum: **3 unsuccessful iterations** before returning to Plan/Investigate unless materially new evidence or human authority justifies continuation.
- Do not weaken protection gates because they block the implementation.
- Success requires the intended claim and protected-state regressions to pass.

## STOP

STOP when scope expands materially, accepted state is endangered, evidence cannot distinguish success, or retries cease producing new information.

## Evidence

Per iteration: baseline identity, changed files/surface, checks run, results, regressions, rollback status, next decision.
