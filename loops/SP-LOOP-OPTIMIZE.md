# SP-LOOP-OPTIMIZE

**Status:** RD1 Candidate  
**Principal:** Evaluate + applicable execution skill

## Purpose

Improve a measurable target through bounded reversible experiments instead of open-ended tweaking.

## Cycle

`BASELINE MEASURE -> ONE CHANGE -> MEASURE -> COMPARE -> ACCEPT / REVERT -> NEXT HYPOTHESIS / STOP`

## Contract

- Define target metric, acceptable tradeoffs, protected metrics/state, and baseline before change.
- Change one material variable per iteration where practical.
- Default maximum: **5 iterations** unless the plan specifies a different justified budget.
- Define time/cost/token/compute budget when material.
- Revert regressions or changes that fail the acceptance threshold.
- Do not optimize a proxy while materially degrading the real objective.

## STOP

STOP on budget exhaustion, protected-state regression, diminishing/no measurable improvement across repeated iterations, metric ambiguity, or authority/risk expansion.

## Evidence

Iteration number, hypothesis, changed variable, before/after metric, protected metrics, cost/time, accept/revert decision, next hypothesis.
