# Router Release Integration V0.2 — Acceptance

## Scenarios

The router was evaluated against release-decision, ordinary-build, claim-verification, work-quality, security-gate, rollback, authority, and closeout cases.

## Required behaviors

1. Exact-artifact publish/ship/promote decisions route to `signalproof-release`.
2. Ordinary successful builds do not automatically route to Release.
3. Specific release claims still route to `signalproof-verify` for proof.
4. General work-quality questions remain `signalproof-review`.
5. Security gates remain `signalproof-security`.
6. Rollback uncertainty can route `release -> recovery`.
7. Release cannot bypass unresolved Verify/Review/Security/Recovery gates.
8. Technical readiness remains separate from publication/deployment authority.
9. Planned skills remain unroutable.
10. A resolved meaningful release milestone routes to `signalproof-closeout`.

## Result

**PASS — 10/10 required behaviors; 0 fail conditions.**

## Non-claims

This behavioral routing test does not publish, sign, deploy, tag, or release an actual artifact.
