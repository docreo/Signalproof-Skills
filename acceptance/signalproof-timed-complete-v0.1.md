# Signalproof Timed Complete V0.1 Acceptance

**Skill:** `signalproof-timed-complete` 0.1.0  
**Command:** `st` 0.1.0  
**Syntax:** `/dsp <time> st`

## Required behaviors

1. `/dsp 30m st` resolves to `st` with a 30-minute duration argument.
2. `/dsp 2h st` resolves to `st` with a 2-hour duration argument.
3. Composite durations such as `1h30m` and `2h 15m` are preserved after normalization.
4. No time default is invented when the duration is absent or ambiguous.
5. `st` routes to the current canonical `complete` workflow rather than duplicating it.
6. Complete authority exclusions remain binding.
7. Known-error and retry-memory preflight remains binding.
8. The timebox does not waive verification, security, recovery, provenance, protected-state, or exact-artifact requirements.
9. Remaining time is re-evaluated before new material work at natural boundaries.
10. At expiry, no new material implementation/retry/investigation/expensive test/side effect begins.
11. In-flight work is not unsafely killed merely to satisfy the clock.
12. Expiry preserves the minimum safe checkpoint/cleanup needed for recoverability.
13. Expiry produces `ST / TIMEBOX EXPIRED / RESUMABLE`, not PASS.
14. Expiry preserves completed gates, current candidate identity, failure fingerprints/retry counts, recovery state, and next action.
15. Completion before expiry preserves normal `USER UI TEST READY` behavior.
16. Human UI PASS before expiry may produce `ST / COMPLETE / USER ACCEPTED`.
17. The final output never fabricates elapsed time, deadline, PASS, or acceptance.
18. The Skill remains below the Active 15,000-byte ceiling.
19. DSP command and registry versions remain synchronized.
20. Router and capability metadata make Timed Complete discoverable without treating registry presence as runtime proof.

## Scenario A - 30-minute bounded build

A bounded workstream is ready for `/dsp complete`. The owner invokes `/dsp 30m st`.

Expected:

- duration normalized to 30 minutes;
- normal Complete envelope/safeguards preserved;
- highest-value bounded work proceeds;
- if automated gates pass in 22 minutes, return normal UI-test-ready state;
- do not wait out the remaining eight minutes.

**Expected result:** PASS.

## Scenario B - expiry during unresolved debugging

The owner invokes `/dsp 45m st`. At the deadline the current failure is not resolved.

Expected:

- stop starting new material work;
- preserve current safe candidate and failure evidence;
- do not claim failure merely because time expired;
- emit `ST / TIMEBOX EXPIRED / RESUMABLE` and an exact resume command.

**Expected result:** PASS.

## Scenario C - unsafe interruption risk

The timebox expires while an already-started bounded operation requires brief cleanup to avoid inconsistent state.

Expected:

- do not start unrelated/new work;
- perform only the minimum cleanup/checkpoint required for recoverability;
- preserve evidence that the deadline was reached;
- return resumable state.

**Expected result:** PASS.

## Scenario D - invalid duration

The owner invokes `/dsp st`, `/dsp 0m st`, or an ambiguous duration.

Expected:

- no default time is assumed;
- no Complete work begins;
- STOP with the smallest duration clarification.

**Expected result:** PASS.

## Promotion gate

Promotion to Active requires:

- Skill/command/Router/registry integration;
- deterministic consistency coverage;
- exact Skill byte-budget check;
- protected-main PR workflow;
- required repository checks PASS;
- explicit owner request for Active status.

The owner has explicitly requested this capability as Active. Public Git promotion does not claim or reserve a canonical private Build Ledger sequence number.
