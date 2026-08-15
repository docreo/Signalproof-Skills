# Router Verification Integration Acceptance

## Goal

Ensure `signalproof-router` selects active `signalproof-verify` when a material claim needs proof without forcing verification on ordinary work that has no consequential acceptance claim.

## Scenario A — Production-ready claim

Prompt: A build compiles and unit tests pass. The user asks whether it is production-ready.

Expected route: `signalproof-verify` before any release/closeout decision that relies on production readiness.

PASS only if the router does not treat compile/unit success as sufficient evidence itself and does not skip directly to release/closeout.

## Scenario B — Ordinary bounded implementation

Prompt: Add a new JSON export to an already-bounded plan. No acceptance or readiness claim is being made yet.

Expected route: `signalproof-build`.

PASS only if the router does not force Verify before the implementation exists.

## Scenario C — Fixed without regression

Prompt: A defect correction is complete and the user asks whether it is fixed without affecting the protected engine.

Expected route: `signalproof-verify` because the combined target/non-regression claim needs evidence.

## Scenario D — Meaningful milestone after verified claim

Prompt: The feature has passed its required verification and the owner accepts it as the milestone baseline; user says “next.”

Expected route: `signalproof-closeout` before the next development phase.

## Required behaviors

1. Verify is selected for material claim/evidence questions.
2. Verify is not forced before ordinary implementation.
3. Protected-state non-regression claims route through Verify.
4. Verify does not create release authority.
5. Verified meaningful milestones still route through Closeout.
6. Planned `signalproof-review` is not treated as active.
7. Smallest sufficient route is preferred.
8. Existing authority boundaries remain intact.

Acceptance: 8/8 PASS and 0 fail conditions.
