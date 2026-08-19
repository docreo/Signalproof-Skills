# SP-LOOP-RETRY

**Status:** RD1 Candidate  
**Principal:** `signalproof-known-errors` / Candidate Failure Intelligence

## Purpose

Permit consequential retry only when the next attempt is informed by materially new evidence, changed conditions, or a proven mitigation.

## Cycle

`FAILURE -> SEARCH PRIOR INTELLIGENCE -> COMPARE CONDITIONS -> DEFINE NEW EVIDENCE/CHANGE -> RETRY ONCE -> VERIFY -> UPDATE INTELLIGENCE / STOP`

## Contract

- Record the prior failure and current preconditions.
- Search Known Errors / applicable failure evidence before retry.
- State what is materially different about the next attempt.
- Default maximum: **3 materially unsuccessful attempts against the same unresolved failure class**, unless a narrower principal loop sets a lower bound or explicit human authority plus new evidence justifies continuation.
- A cosmetic command variation does not reset the count.
- Preserve rollback/non-mutation boundary and per-attempt evidence.
- Reuse a tested mitigation when its applicability conditions match.

## STOP

STOP when preconditions are materially unchanged and the action matches a high-confidence known failure, the iteration limit is reached, retry threatens protected state, or no new discriminating evidence exists.

## Evidence

Failure fingerprint/match, attempt count, changed condition, mitigation/hypothesis, result, rollback state, recurrence/mitigation update, next decision.
