# SP-LOOP-DEBUG

**Status:** RD1 Candidate  
**Principal:** `signalproof-debug`

## Purpose

Bound a defect-correction cycle so each attempt adds evidence instead of repeating guesses.

## Cycle

`REPRODUCE -> LOCALIZE -> HYPOTHESIS -> DISCRIMINATING TEST -> CORRECT -> VERIFY -> REGRESSION -> PASS / REVISE / STOP`

## Contract

- Protect the accepted baseline and forbidden-change surfaces.
- Each iteration must record the hypothesis, one material change, before/after evidence, and rollback state.
- Default maximum: **3 materially unsuccessful correction attempts against the same unresolved symptom**.
- A superficial variation does not reset the count.
- Success requires the original reproduction to pass and required protected behavior to remain passing.
- Wrapper/harness failure must be distinguished from product/source failure before retry.

## STOP

STOP at the iteration bound, on protected-state/authority conflict, when the failed layer remains unlocalized, or when continuing would repeat the same unsupported cause.

## Evidence

Per iteration: attempt number, hypothesis, discriminating evidence, changed surface, verification, regression, rollback/result, next decision.
