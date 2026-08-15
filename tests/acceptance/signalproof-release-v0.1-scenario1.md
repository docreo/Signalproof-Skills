# signalproof-release V0.1 — Acceptance Scenario 1

## Scenario

A Windows application candidate has already passed compile, automated tests, Verify, Review, and a scoped Security review. The originally accepted ZIP had a recorded SHA-256. After acceptance, the ZIP was rebuilt/repacked, producing different bytes. The proposed release notes call it “production-ready.” Signing is still pending. No rollback artifact has yet been designated for the release.

## Expected Release behavior

The skill must:

1. freeze and compare exact release artifact identity;
2. bind acceptance evidence to the exact candidate bytes;
3. reject silent transfer of evidence from the earlier ZIP to the rebuilt ZIP;
4. return `REVERIFY CANDIDATE` for the changed artifact;
5. require rollback designation/preservation before promotion;
6. keep unsigned state explicit rather than reporting signed;
7. reject unsupported “production-ready” release-note language;
8. preserve version/package/manifest coherence;
9. separate technical readiness from owner/distribution authority;
10. keep failed/rejected candidates distinguishable from the release artifact;
11. prevent public/private or secret-bearing artifact publication;
12. route meaningful completed release decisions through Closeout.

## Acceptance result

**PASS — 12/12 required behaviors; 0 fail conditions.**

Release decision for the scenario: **REVERIFY CANDIDATE / RELEASE CHANGES REQUIRED**.

## Non-claims

This is a behavioral fixture. It does not establish production readiness, signing, installer readiness, security certification, universal compatibility, or authorization to publish an actual product.
