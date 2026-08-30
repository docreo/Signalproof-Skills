# Signalproof Operator Command Registry

`main` is canonical public command state. Every command listed below is Active only after governed merge.

## Active commands

| Command | Version | Purpose |
|---|---:|---|
| `/dsp` | 0.4.0 | Compact Dr. Signalproof resolver and public Library shell |
| `help` | 0.1.0 | Registry-backed command discovery |
| `research` | 0.1.0 | Minimum necessary evidence gathering through `signalproof-research` |
| `authorize` | 0.1.0 | Exact bounded authorization handler |
| `complete` | 0.1.0 | Bounded authorize-all completion through Build Spawn Debug and real user acceptance |
| `download` | 0.1.0 | Recover and re-deliver prior artifacts across supported chat/library/storage surfaces without fabricating identity |
| `stop-hermes` | 0.1.0 | Fully quiesce Hermes runtime/autostart surfaces while preserving Ollama, models, histories, profiles, configs, source, and evidence |
| `qc` | 0.1.0 | Exact-candidate Human QC gate after automated PASS |
| `deploy` | 0.1.0 | Authorized exact-artifact deployment, post-deploy verification, and closeout |
| `known-errors` | 0.1.0 | Continuous recurrence prevention for current workstream |
| `log-skill` | 0.2.0 | Milestone/learning/Skill continuity without fabricated chronology |
| `handoff-log` | 0.2.1 | Durable fresh-chat handoff plus log synchronization |
| `build-capsule` | 0.1.0 | Create/refine a human-readable and AI-readable build-transfer package, including optional Design Capsule and live-update command mode |
| `cut-chase` | 0.1.0 | Decision-ready salience compression |
| `cut-cost` | 0.1.0 | Read-only measured AI operating-efficiency audit |
| `git-check` | 0.1.0 | Deterministic read-only repository/ref/HEAD/worktree/upstream preflight |
| `design-git` | 0.2.0 | Smallest governed Git-backed design/next-action route |
| `build-git` | 0.2.5 | Compact governed repository-backed next-action execution with proof reuse and deterministic failure guards |
| `build-git this` | 0.1.0 | Apply Build Git to the current bounded work unit |
| `build-git spawn` | 0.1.0 | Builder, Design, Governor role separation |
| `build-git-debug` | 0.1.0 | Git-backed defect localization/correction |
| `full-debug` | 0.1.0 | High-governance repeated/cross-layer debug coordination |
| `build-spawn-debug` | 0.1.0 | Build/debug convergence to automated PASS and human UI gate |
| `log-build-git` | 0.2.1 | `log-skill -> design-git -> build-git` continuity route |
| `log-build-git-debug` | 0.1.0 | `log-skill -> design-git -> build-git-debug` continuity route |
| `/authorized-log-build-git` | 0.1.0 | Compatibility authorization route for log/design/build continuation |
| `signalproof-this-plan` | 0.1.0 | Grill/design/bound the current plan without implementation |
| `signalproof-this-build` | 0.1.0 | Consume an approved plan, build, and verify |
| `signalproof-teach` | 0.1.0 | Signalproof source-disciplined teaching and HAMM learning |

## Canonical file mapping

- `/dsp` -> `commands/dsp.md`
- `help` -> `commands/help.md`
- `research` -> `commands/research.md`
- `authorize` -> `commands/authorize.md`
- `complete` -> `commands/complete.md`
- `download` -> `commands/download.md`
- `stop-hermes` -> `commands/stop-hermes.md`
- `qc` -> `commands/qc.md`
- `deploy` -> `commands/deploy.md`
- `known-errors` -> `commands/known-errors.md`
- `log-skill` -> `commands/log-skill.md`
- `handoff-log` -> `commands/handoff-log.md`
- `build-capsule` -> `commands/build-capsule.md`
- `cut-chase` -> `commands/cut-chase.md`
- `cut-cost` -> `commands/cut-cost.md`
- `git-check` -> `commands/git-check.md`
- `design-git` -> `commands/design-git.md`
- `build-git` -> `commands/build-git.md`
- `build-git this` -> `commands/build-git-this.md`
- `build-git spawn` -> `commands/build-git-spawn.md`
- `build-git-debug` -> `commands/build-git-debug.md`
- `full-debug` -> `commands/full-debug.md`
- `build-spawn-debug` -> `commands/build-spawn-debug.md`
- `log-build-git` -> `commands/log-build-git.md`
- `log-build-git-debug` -> `commands/log-build-git-debug.md`
- `/authorized-log-build-git` -> `commands/authorized-log-build-git.md`
- `signalproof-this-plan` -> `commands/signalproof-this-plan.md`
- `signalproof-this-build` -> `commands/signalproof-this-build.md`
- `signalproof-teach` -> `commands/signalproof-teach.md`

## DSP execution pipeline

The compact stage order lives in `library/EXECUTION-PIPELINE.yaml`; minimum continuity context lives in `library/STATE-CAPSULE.md`.

Preferred guided route:

`/dsp research -> /dsp this-plan -> /dsp design -> /dsp complete -> /dsp qc -> /dsp authorize deploy -> /dsp deploy`

`/dsp design` is an alias for `design-git`; no duplicate Design command is required.

`/dsp complete` may internally perform Build/Debug/Verify/Review/Security/Recovery/Learn work inside its bounded envelope, but Human QC and deployment authority remain distinct evidence/authority boundaries.

Examples retained for compatibility:

- `/dsp help` -> `help`
- `/dsp complete` -> `complete`
- `/dsp download` -> `download`
- `/dsp stop-hermes` -> `stop-hermes`
- `/dsp build-capsule` -> `build-capsule`
- `/dsp capsule` -> `build-capsule`
- `/dsp full-debug` -> `full-debug`
- `/dsp build-spawn-debug` -> `build-spawn-debug`
- `/dsp cut-chase` -> `cut-chase`
- `/dsp cut-cost` -> `cut-cost`
- `/dsp handoff` -> `handoff-log`
- `/dsp log` -> `log-skill`

## Conversational aliases

- `help` -> `help`
- `research` -> `research`
- `complete` / `finish this` -> `complete` when invoking bounded completion
- `download` / `download this` / `download that` -> `download`
- `stop Hermes` / `shut Hermes down completely` / `stop Hermes and keep it stopped` -> `stop-hermes`
- `build capsule` / `capsule this build` -> `build-capsule`
- `git check` / `check git` -> `git-check`
- `design` -> `design-git`
- `human qc` -> `qc`
- `authorize deploy` -> `authorize` with target `deploy`
- `deploy` -> `deploy`
- `authorize` / `authorized` -> `authorize`
- `authorized log-build-git` -> `/authorized-log-build-git`
- `full debug` -> `full-debug`
- `build spawn debug` -> `build-spawn-debug`
- `cut to the chase` -> `cut-chase`
- `cut cost` -> `cut-cost`
- `Signalproof this plan` -> `signalproof-this-plan`
- `Signalproof this build` -> `signalproof-this-build`
- `Signalproof Teach` -> `signalproof-teach`

## Governance rules

1. Commands are shorthand/orchestration, not new authority sources.
2. Load the minimum current stage context: root once, compact routing metadata, one principal Skill, zero to two narrow specialists/Loops, State Capsule, task evidence.
3. Reuse still-valid evidence and failure memory; do not replay full logs or rerun unaffected gates.
4. Deterministic checks should precede expensive reasoning/spawn when they can establish or reject the needed claim.
5. Research only unresolved material facts; Design should not reload research unless the evidence changed or is insufficient.
6. Debug preserves failure fingerprints/attempt counts and blocks materially unchanged retries.
7. Human QC is Human-Observed Fact, not deployment authority.
8. Deployment requires exact-candidate evidence, applicable compliance/security/recovery gates, and explicit bounded authority.
9. Artifact recovery must preserve exact/reconstructed identity, public/private boundaries, and connected-storage authority; `download` cannot manufacture a missing original.
10. Law, licenses, Terms of Service, platform policy, privacy, security, and access controls remain binding; command convenience cannot waive them.
11. `complete` cannot manufacture human acceptance; `deploy` cannot manufacture deployment authority or post-deploy PASS.
12. Public Git promotion does not claim canonical private Build Ledger append.
13. Active command versions in command files and this registry must remain synchronized.

## Lifecycle

`DISCOVERED -> CANDIDATE -> TESTED -> APPROVED -> ACTIVE -> DEPRECATED / RETIRED`