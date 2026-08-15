# Changelog

All notable public changes to the Signalproof Skill Suite should be recorded here.

## [signalproof-build 0.1.0] - Active

### Promoted

- `signalproof-build` promoted from `0.1.0-rc1` to the active public baseline after its bounded JSON-export Scenario 1 runtime acceptance passed and PR #7 was merged into protected `main`.

### Verified

- 10/10 required build behaviors passed with 0 fail conditions.
- JSON export was added through a separate bounded component.
- Existing CSV output remained byte-for-byte equivalent to baseline.
- Protected CSV-engine SHA-256 remained unchanged before and after the candidate build.
- No external dependency or unrelated refactor was introduced.

## [signalproof-plan 0.1.0] - Active

### Promoted

- `signalproof-plan` promoted from `0.1.0-rc1` to the active public baseline after its GPU-acceleration planning Scenario 1 behavioral acceptance passed and PR #5 was merged into protected `main`.

### Verified

- 10/10 required planning behaviors passed with 0 fail conditions.
- CPU fallback and the current model remained protected state.
- GPU/runtime assumptions remained unproven until inspection.
- System-wide installation and elevation remained explicit authority checkpoints.
- Acceptance criteria, rollback, and STOP conditions were defined before execution.

## [signalproof-investigate 0.1.0] - Active

### Promoted

- `signalproof-investigate` promoted from `0.1.0-rc1` to the active public baseline after Scenario 1 behavioral acceptance passed and PR #3 was merged into protected `main`.

### Verified

- Apparent scanner failure was localized to the presentation layer.
- Scanner execution, persistence, and report generation remained healthy.
- Protected scanner-engine SHA-256 remained unchanged before and after the bounded correction.
- Promotion continued through the protected branch and pull-request workflow.

## [0.1.0] - Active

### Promoted

- `signalproof` root governing skill promoted from `0.1.0-rc1` to the active public baseline after the agreed behavioral acceptance gate passed and the foundation PR was merged into protected `main`.
- Apache License 2.0 confirmed for the public suite.
- Canonical registry status updated to Active.

### Verified

- Scenario 1 bounded-bug-fix acceptance passed.
- Protected audio-engine SHA-256 remained unchanged before and after the bounded correction.
- Candidate promotion occurred through the protected branch and pull-request workflow.

## [0.1.0-rc1] - Candidate

### Added

- Initial `signalproof` root governing skill.
- Suite inheritance rule for future `signalproof-*` specialist skills.
- Evidence-class discipline.
- Protected-state, authority, bounded-change, verification, recovery, and closure requirements.
- Governed skill-update lifecycle: Discovered -> Candidate -> Tested -> Approved -> Active -> Deprecated/Retired.
- Public/private boundary for publishable skills.
- Initial governance document.
- Initial skill registry.
- Initial acceptance-test specification.
- Apache License 2.0 licensing package, trademark guidance, contribution policy, and first recorded behavioral acceptance result.
