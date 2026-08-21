# Signalproof Operator Command Registry

`main` is the canonical public command state. Every command listed below is Active after governed merge of this registry.

## Active commands

| Command | Version | Purpose |
|---|---:|---|
| `/dsp` | 0.3.6 | Enter Dr. Signalproof mode, navigate the public Signalproof Library, and resolve compact DSP syntax to canonical Signalproof commands and handlers |
| `help` | 0.1.0 | Show the current public DSP command surface or focused help for one command |
| `authorize` | 0.1.0 | Generic bounded authorization handler for a pending owner gate or resolved target command |
| `complete` | 0.1.0 | Authorize all owner-authorizable actions inside the current bounded workstream and drive Build Spawn Debug through automated PASS, human UI feedback, and real user acceptance |
| `known-errors` | 0.1.0 | Enable continuous known-error recurrence checking for the current bounded workstream |
| `log-skill` | 0.2.0 | Preserve/synchronize milestone, learning, Skill architecture, and closeout state without fabricating chronology |
| `handoff-log` | 0.2.1 | Create a current durable handoff plus log-skill synchronization, fresh-chat bootstrap, and PowerShell failure continuity |
| `cut-chase` | 0.1.0 | Distill material into a decision-ready Bottom line, What matters, and Action note while preserving evidence and authority |
| `cut-cost` | 0.1.0 | Run a read-only measured audit of AI operating waste across context, tools, models, cache, agents, schedules, output, and repeated Signalproof work |
| `design-git` | 0.2.0 | Design and route the smallest governed next Git-backed action |
| `build-git` | 0.2.4 | Execute the smallest governed Git-backed next action with current-Git, known-failure, executable recurrence prevention, persistent PowerShell failure memory, evidence-sufficiency termination, protected-state, verification, and recovery controls |
| `build-git this` | 0.1.0 | Apply build-git to the current clearly bounded subject/work unit |
| `build-git spawn` | 0.1.0 | Coordinate Builder, Design, and Governor lanes under the main Signalproof Orchestrator |
| `build-git-debug` | 0.1.0 | Apply build-git plus explicit defect localization, persisted-state inspection, retry discipline, and exact-final repair validation |
| `full-debug` | 0.1.0 | Run bounded owner-authorized Full Debug orchestration with failure memory, log-build-git-debug continuity, spawn role separation, and verification |
| `build-spawn-debug` | 0.1.0 | Keep a bounded UI/product build moving through spawn challenge, debug convergence, automated gates, learning, and final human UI acceptance |
| `log-build-git` | 0.2.1 | Run log-skill -> design-git -> build-git, including governed handoff receipt/bootstrap and failure-guard reload |
| `log-build-git-debug` | 0.1.0 | Run log-skill -> design-git -> build-git-debug for debug-state continuity |
| `/authorized-log-build-git` | 0.1.0 | Specialized compatibility route for authorizing the current bounded owner gate before log/design/build continuation |
| `signalproof-this-plan` | 0.1.0 | Grill, design, and bound the current work into a THIS PLAN CONTRACT without implementation |
| `signalproof-this-build` | 0.1.0 | Revalidate an approved plan, grill material implementation decisions with docs, build the bounded surface, and verify it |
| `signalproof-teach` | 0.1.0 | Teach using Signalproof principles, source discipline, durable learning, and HAMM boundaries |

## Canonical file mapping

- `/dsp` -> `commands/dsp.md`
- `help` -> `commands/help.md`
- `authorize` -> `commands/authorize.md`
- `complete` -> `commands/complete.md`
- `known-errors` -> `commands/known-errors.md`
- `log-skill` -> `commands/log-skill.md`
- `handoff-log` -> `commands/handoff-log.md`
- `cut-chase` -> `commands/cut-chase.md`
- `cut-cost` -> `commands/cut-cost.md`
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

## DSP command shell

`/dsp` means **Dr. Signalproof mode**. The non-slash form `dsp` is the transport-safe fallback when a host reserves or intercepts slash commands.

The `/dsp` Library is public `docreo/Signalproof-Skills` on protected `main`. Private Build Ledger evidence supports continuity but does not replace public Skill/Command/Loop authority.

Examples:

- `/dsp help` -> `help`
- `/dsp complete` -> `complete`
- `/dsp help complete` -> focused help for `complete`
- `/dsp build-git` -> `build-git`
- `/dsp full-debug` -> `full-debug`
- `/dsp build-spawn-debug`, `/dsp build spawn debug`, `dsp-build-spawn-debug` -> `build-spawn-debug`
- `/dsp cut-chase` -> `cut-chase`
- `/dsp cut-cost` -> `cut-cost`
- `/dsp handoff` -> `handoff-log`
- `/dsp log` -> `log-skill`

## Conversational aliases

- `help` -> `help`
- `complete` / `finish this` -> `complete` when clearly invoking the bounded completion workflow
- `authorize` / `authorized` -> `authorize`
- `authorized log-build-git` -> `/authorized-log-build-git` compatibility route
- `full debug` -> `full-debug`
- `build spawn debug` -> `build-spawn-debug`
- `cut to the chase` -> `cut-chase` when clearly invoking Signalproof command behavior
- `cut cost` -> `cut-cost` when clearly invoking the read-only Signalproof cost audit
- `Signalproof this plan` -> `signalproof-this-plan`
- `Signalproof this build` -> `signalproof-this-build`
- `Signalproof Teach` -> `signalproof-teach`

## Command governance rules

1. A command is operator shorthand/orchestration, not a new authority source.
2. Commands route to Active Skills and evidence/governance mechanisms and do not replace those contracts.
3. Git current state must be refetched before consequential repository work.
4. Known Failure Preflight is required where the command contract says it is materially applicable.
5. PowerShell-relevant build work preserves current failure-registry and parser-preflight controls.
6. Planning, teaching, logging, DSP resolution, Help, Complete, Cut Chase, Cut Cost, authorization handling, Full Debug, Build Spawn Debug, or any command cannot silently create authority outside its bounded contract.
7. A projected Build Ledger sequence is never a reservation.
8. `signalproof-this-plan` does not implement; `signalproof-this-build` requires a sufficiently bounded/authorized plan.
9. `signalproof-teach` does not award maturity/certification/permission.
10. `complete` authorizes all owner-authorizable actions only inside the current bounded completion envelope, preserves Build Spawn Debug safeguards, resumes on human UI FAIL, and cannot manufacture human acceptance.
11. `cut-chase` must not strengthen evidence, hide failed gates, or convert recommendation into authorization.
12. `cut-cost` is read-only in V0.1.0, must measure rather than estimate, and must not apply its recommended optimization automatically.
13. Debug commands preserve failed attempts and require changed conditions before retry.
14. `full-debug` must not double-run debug and its `authorize all` semantics remain bounded to the current envelope.
15. `build-spawn-debug` may continue through materially new failure classes, but same-failure retry limits remain binding; it must stop at automated PASS for real human UI testing and cannot manufacture user PASS.
16. `help` is read-only discovery and must source current command state from public protected `main` rather than private or Candidate state.
17. Signalproof-controlled generated build output must avoid U+2014 except when preserving immutable/protected source evidence.
18. Public Git command promotion does not claim canonical private Build Ledger append.
19. DSP aliases and handlers resolve to stable canonical command identities before execution.
20. `known-errors` blocks materially unchanged known-bad retry paths and does not auto-promote new failures.
21. `authorize` preserves exact bounded scope, prerequisites, protected state, and consumption.
22. Active command versions in command files and this registry must remain synchronized.

## Lifecycle

`DISCOVERED -> CANDIDATE -> TESTED -> APPROVED -> ACTIVE -> DEPRECATED / RETIRED`

This registry records current owner-approved Active state after merge; historical Candidate PRs remain provenance and do not override newer canonical `main` definitions.
