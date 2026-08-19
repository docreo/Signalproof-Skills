# Signalproof Operator Command Registry

`main` is the canonical public command state. Every command listed below is Active after governed merge of this registry.

## Active commands

| Command | Version | Purpose |
|---|---:|---|
| `log-skill` | 0.2.0 | Preserve/synchronize milestone, learning, Skill architecture, and closeout state without fabricating chronology |
| `handoff-log` | 0.2.0 | Create a current durable handoff plus log-skill synchronization and fresh-chat bootstrap |
| `design-git` | 0.2.0 | Design and route the smallest governed next Git-backed action |
| `build-git` | 0.2.2 | Execute the smallest governed Git-backed next action with current-Git, known-failure, protected-state, verification, and recovery controls |
| `build-git this` | 0.1.0 | Apply build-git to the current clearly bounded subject/work unit |
| `build-git spawn` | 0.1.0 | Coordinate Builder, Design, and Governor lanes under the main Signalproof Orchestrator |
| `build-git-debug` | 0.1.0 | Apply build-git plus explicit defect localization, persisted-state inspection, retry discipline, and exact-final repair validation |
| `log-build-git` | 0.2.0 | Run log-skill -> design-git -> build-git, including governed handoff receipt/bootstrap |
| `log-build-git-debug` | 0.1.0 | Run log-skill -> design-git -> build-git-debug for debug-state continuity |
| `/authorized-log-build-git` | 0.1.0 | Authorize the current bounded owner gate, preserve the Authorization Envelope, then continue through log/design/build |
| `signalproof-this-plan` | 0.1.0 | Grill, design, and bound the current work into a THIS PLAN CONTRACT without implementation |
| `signalproof-this-build` | 0.1.0 | Revalidate an approved plan, grill material implementation decisions with docs, build the bounded surface, and verify it |
| `signalproof-teach` | 0.1.0 | Teach using Signalproof principles, source discipline, durable learning, and HAMM boundaries |

## Canonical file mapping

- `log-skill` -> `commands/log-skill.md`
- `handoff-log` -> `commands/handoff-log.md`
- `design-git` -> `commands/design-git.md`
- `build-git` -> `commands/build-git.md`
- `build-git this` -> `commands/build-git-this.md`
- `build-git spawn` -> `commands/build-git-spawn.md`
- `build-git-debug` -> `commands/build-git-debug.md`
- `log-build-git` -> `commands/log-build-git.md`
- `log-build-git-debug` -> `commands/log-build-git-debug.md`
- `/authorized-log-build-git` -> `commands/authorized-log-build-git.md`
- `signalproof-this-plan` -> `commands/signalproof-this-plan.md`
- `signalproof-this-build` -> `commands/signalproof-this-build.md`
- `signalproof-teach` -> `commands/signalproof-teach.md`

## Conversational aliases

- `grill this plan` -> `signalproof-this-plan`
- `Signalproof this plan` -> `signalproof-this-plan`
- `grill-with-docs this architecture` -> `signalproof-this-build`
- `Signalproof this build` -> `signalproof-this-build`
- `Signalproof Teach` -> `signalproof-teach`
- `teach me this using signalproof-teach` -> `signalproof-teach`
- `authorized log-build-git` -> `/authorized-log-build-git`

## Command governance rules

1. A command is operator shorthand/orchestration, not a new authority source.
2. Commands route to Active Skills and evidence/governance mechanisms and do not replace those contracts.
3. Git current state must be refetched before consequential repository work.
4. Known Failure Preflight is required where the command contract says it is materially applicable.
5. Planning, grilling, teaching, logging, or command invocation cannot silently create write, destructive, credential, privilege, security-change, release, publication, Candidate-activation, or canonical Build Ledger authority.
6. A projected Build Ledger sequence is never a reservation.
7. `signalproof-this-plan` does not implement; `signalproof-this-build` requires a sufficiently bounded/authorized plan.
8. `signalproof-teach` may teach toward HAMM readiness but does not award maturity/certification/permission.
9. `build-git-debug` and `log-build-git-debug` preserve failed attempts and require changed conditions or deeper Investigation rather than blind retries.
10. Signalproof-controlled generated build output must avoid U+2014 except when preserving immutable/protected source evidence.
11. Public Git command promotion does not claim a canonical private Build Ledger append.

## Lifecycle

Future command changes remain versioned and governed through:

`DISCOVERED -> CANDIDATE -> TESTED -> APPROVED -> ACTIVE -> DEPRECATED / RETIRED`

This registry records the current owner-approved Active state after merge; historical Candidate PRs remain provenance and do not override newer canonical `main` definitions.
