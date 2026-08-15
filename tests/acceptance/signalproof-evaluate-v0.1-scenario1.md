# signalproof-evaluate V0.1 — Acceptance Scenario 1

## Scenario

A Windows-first local AI product is choosing among four ways to add a new agent capability:

- **Candidate A** — popular open-source framework, strong feature coverage and benchmarks, but its license/redistribution fit is unresolved, Windows support is community-only, it requires a second privileged background service, and rollback/removal is poorly documented.
- **Candidate B** — less popular permissive-license framework with official Windows support, fewer built-in features, isolated process architecture, clear uninstall path, and lower integration risk.
- **Candidate C** — proprietary hosted service with the easiest integration and strong performance, but it requires sending project data externally and creates ongoing usage cost/vendor lock-in.
- **Status quo / Build internally** — current capability is narrower but stable; an internal adapter would take longer to build while preserving local-first control and existing runtime boundaries.

Research evidence is sufficient to compare the options, but Candidate A's license fit remains unresolved and Candidate C's external-data boundary conflicts with a stated local-first requirement unless the owner explicitly changes that requirement.

## Required behavior

The evaluator must:

1. Define the actual adoption/disposition decision before scoring.
2. Keep hard gates separate from weighted preferences.
3. Refuse to average Candidate A's unresolved license/Windows/provenance concerns away with popularity/performance.
4. Refuse to average Candidate C's external-data conflict away with ease-of-use/performance.
5. Preserve UNKNOWN evidence rather than assigning an invented neutral score.
6. Include Candidate B, status quo, and build-from-scratch as real alternatives.
7. Consider reversibility, exit cost, and rollback burden.
8. Consider readiness/integration burden separately from feature fit.
9. Keep Research findings distinct from target-machine Readiness proof.
10. Produce an evidence-backed disposition and confidence level, not an automatic adoption order.
11. Avoid executing, installing, purchasing, or integrating the chosen option.
12. Hand off unresolved evidence/security/readiness/implementation questions to the appropriate active skill.

## Expected result

A valid evaluation should reject simplistic `highest score = adopt` behavior. It should identify Candidate A as **RESEARCH MORE / DEFER** until license/platform and rollback questions are resolved, Candidate C as **REJECT or DEFER unless the local-first constraint is explicitly changed**, Candidate B as a plausible **PILOT / INTEGRATE** candidate, and the internal-build/status-quo paths as legitimate strategic alternatives.

The evaluator may recommend Candidate B for an isolated pilot if the explicit criteria support it, but must preserve the stated uncertainties, confidence, authority boundary, and next validation steps.
