# Signalproof Router Recovery Integration — Acceptance V0.1

## Scenario set

Five routing scenarios were evaluated after `signalproof-recovery` became Active:

1. User asks to restore the last known-working version after a failed candidate.
2. User asks only to inspect which backup is safe, with no authority to restore.
3. User wants rollback, but the failure/current-state boundary is unclear.
4. Recovery completes and the user asks whether the recovered state is actually working.
5. A meaningful recovery decision is complete and the project is moving to the next phase.

## Required behavior

The router must:

- route rollback/restoration objectives to `signalproof-recovery`, not generic Build/Debug;
- preserve read-only inspection scope when restore authority was not granted;
- use `signalproof-investigate -> signalproof-recovery` when failure-state ambiguity matters to safe restore;
- allow `signalproof-recovery -> signalproof-verify` when the recovered-state claim needs proof;
- keep persistent-data protection inside Recovery's responsibility;
- keep destructive/elevation authority separate from routing;
- keep Recovery distinct from Verify and Review;
- keep planned skills unroutable;
- route meaningful completed recovery milestones through `signalproof-closeout`;
- preserve smallest-sufficient routing.

## Result

**PASS — 10/10 required behaviors; 0 fail conditions.**

No destructive restore was performed by this behavioral fixture.
