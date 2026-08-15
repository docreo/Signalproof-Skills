# Router Recovery Integration Promotion

## Promotion

Promotes tested Recovery routing into the Active `signalproof-router` baseline.

## Result

- `signalproof-router` -> **0.1.4 Active public baseline**
- `signalproof-recovery` remains **0.1.0 Active public baseline**
- public README and registry synchronized

## Acceptance

Five routing scenarios were evaluated.

**PASS — 10/10 required behaviors; 0 fail conditions.**

Accepted behavior includes:

- rollback/restoration routes to Recovery rather than generic Build/Debug;
- read-only rollback inspection does not authorize restore;
- unclear failure boundary may route `Investigate -> Recovery`;
- recovered-state claims may route `Recovery -> Verify`;
- persistent-data protection remains part of Recovery;
- destructive/elevation authority remains separate from capability routing;
- Recovery remains distinct from Verify and Review;
- planned skills remain unroutable;
- meaningful recovery milestones route through Closeout;
- smallest sufficient route remains preferred.

## Source

Recovery candidate PR: #26

Recovery promotion PR: #27

Router integration PR: #28

## Authority boundary

Routing does not authorize destructive replacement, privilege elevation, persistent-data overwrite, release, security clearance, or canonical Build Ledger mutation.
