# signalproof-router V0.1.9 — Evaluate Integration Acceptance

## Scenarios

1. “Research current evidence on Framework X.” -> Research.
2. “Given our research, should we adopt, adapt, integrate, pilot, defer, reject, or build internally?” -> Evaluate.
3. “Candidate B looks best; install it now.” -> Evaluate result does not grant install authority; route to Plan/Build only with explicit authority.
4. “Does Candidate B actually work on this exact workstation?” -> Readiness (and Verify for a specific proven claim).
5. “Candidate A has a strong score but unresolved license/security hard gates.” -> Evaluate must not bypass the hard gates.

## Required behavior

1. External evidence acquisition/synthesis selects Research.
2. Option disposition after evidence selects Evaluate.
3. Evaluate remains distinct from Plan/Build and does not grant adoption/execution authority.
4. Target-specific prerequisite/compatibility proof remains Readiness.
5. Specific material claims remain Verify territory.
6. Security/licensing hard gates cannot be bypassed by routing or scores.
7. Evaluate may hand back to Research when decision-critical evidence is missing.
8. Planned skills remain unroutable.
9. Meaningful evaluation decisions can route to Closeout.
10. Smallest sufficient route remains preferred.

## Pass condition

PASS only if all ten behaviors are preserved with no authority expansion or cross-skill substitution.
