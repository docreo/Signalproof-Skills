# Changelog

All notable public changes to the Signalproof Skill Suite should be recorded here.

## [Core Runtime hardening lessons] - Candidate

### Updated

- `signalproof-build` `0.1.1` adds a general partial-actuation containment rule: if a consequential operation creates a live resource and a later verification gate fails, cleanup must remain scoped to the created/owned resource; unverifiable cleanup preserves explicit recovery ownership rather than silently orphaning state.
- `signalproof-debug` `0.1.1` separates product/source failure from test-harness or evidence-wrapper failure. Mutating work must not be blindly rerun until persisted state is inspected, and static safety checks should be scoped to the semantic boundary they are intended to protect.
- `signalproof-recovery` `0.1.1` preserves uncertain ownership after failed cleanup and requires identity re-verification before destructive recovery when identifiers such as PIDs may be reused.

### Evidence source

- Extracted from Signalproof Core Runtime `0.1.2-RD1` provider lifecycle hardening after concrete Windows process control and failed-start containment work.
- The failed-start correction was written before a later wrapper-only static check failed; a bounded follow-up validator proved the source change without rewriting it.
- New containment tests passed 6/6; prior concrete process-control tests passed 7/7; managed-provider tests passed 8/8; provider regressions passed 19/19; lock-governance regressions passed 14/14.
- Existing direct `process.kill(pid, 0)` calls were confirmed to be signal-0 liveness probes rather than termination authority.
- Live external Ollama remained unchanged and no live provider start/stop was performed during the correction/validation gate.

### Governance

- No new specialist skill was created. The lessons fit existing Build, Debug, Recovery, Security, Closeout, and Learn boundaries; only the three skills needing new operational doctrine were changed.
- `signalproof-security` already governs least privilege, identity/integrity boundaries, and bounded remediation.
- `signalproof-closeout` already requires failed evidence preservation and staged/noncanonical Build Ledger handling when the live canonical head cannot be verified.
- Candidate changes remain noncanonical until reviewed, checks pass, and the pull request is merged to protected `main`.

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