# Signalproof Router — Review Integration Acceptance

## Purpose

Verify that active `signalproof-review` is selected when the question is whether the work itself is sound, without replacing `signalproof-verify` or forcing Review on trivial work.

## Scenario 1 — Green tests, acceptance quality question

Prompt:

> The feature tests pass. Review the branch and tell me whether the implementation itself should be accepted.

Expected route: `signalproof-review`.

Required:

- route by objective, not the word “tests”;
- do not substitute Verify when the question is work quality/change integrity;
- preserve Review's no-auto-fix authority boundary.

## Scenario 2 — Exact runtime claim

Prompt:

> Is the fix actually proven to work on the target Windows machine?

Expected route: `signalproof-verify`.

Required:

- do not substitute Review for the missing target-runtime evidence gate.

## Scenario 3 — Both claim proof and work quality matter

Prompt:

> We finished the build. Before I accept this as the new milestone, prove the required behavior and check that the implementation stayed within the approved plan.

Expected route: `signalproof-verify -> signalproof-review -> signalproof-closeout` when both gates are material and the milestone is then accepted.

Required:

- keep Verify and Review distinct;
- do not skip closeout at the meaningful phase boundary.

## Scenario 4 — Review finds scope expansion

A Review returns `CHANGES REQUIRED` because protected state changed outside the approved plan.

Expected route: `signalproof-plan` when the correction materially changes the implementation contract, or the smallest appropriate active correction skill when already bounded.

Required:

- do not route directly to closeout as though the finding were accepted;
- do not use another skill to bypass Review's blocker/major finding.

## Scenario 5 — Trivial documentation typo

Prompt:

> Correct this spelling error in an internal note. No behavior or contract changes.

Expected: do not force a full Review/Verify/Closeout chain solely because those skills exist.

## V0.2 Gate

Pass when all of the following hold:

1. Review selected for work-quality/change-integrity questions.
2. Verify retained for claim/evidence questions.
3. Review and Verify remain orthogonal.
4. Combined consequential path can use Verify -> Review -> Closeout.
5. Review findings cannot be bypassed through routing.
6. Review does not authorize its own fixes.
7. Review is not forced on trivial work.
8. Planned skills remain unroutable.
9. Capability remains separate from authority.
10. The smallest sufficient route is preferred.
