# Signalproof Operator Command Registry

`main` is the canonical public command state. Every command listed below is Active after governed merge of this registry.

## Active commands

| Command | Version | Purpose |
|---|---:|---|
| `/dsp` | 0.3.2 | Enter Dr. Signalproof mode, navigate the public Signalproof Library, and resolve compact DSP syntax to canonical Signalproof commands and handlers |
| `authorize` | 0.1.0 | Generic bounded authorization handler for a pending owner gate or resolved target command |
| `known-errors` | 0.1.0 | Enable continuous known-error recurrence checking for the current bounded workstream |
| `log-skill` | 0.2.0 | Preserve/synchronize milestone, learning, Skill architecture, and closeout state without fabricating chronology |
| `handoff-log` | 0.2.1 | Create a current durable handoff plus log-skill synchronization, fresh-chat bootstrap, and PowerShell failure continuity |
| `cut-chase` | 0.1.0 | Distill material into a decision-ready Bottom line, What matters, and Action note while preserving evidence and authority |
| `design-git` | 0.2.0 | Design and route the smallest governed next Git-backed action |
| `build-git` | 0.2.4 | Execute the smallest governed Git-backed next action with current-Git, known-failure, executable recurrence prevention, persistent PowerShell failure memory, evidence-sufficiency termination, protected-state, verification, and recovery controls |
| `build-git this` | 0.1.0 | Apply build-git to the current clearly bounded subject/work unit |
| `build-git spawn` | 0.1.0 | Coordinate Builder, Design, and Governor lanes under the main Signalproof Orchestrator |
| `build-git-debug` | 0.1.0 | Apply build-git plus explicit defect localization, persisted-state inspection, retry discipline, and exact-final repair validation |
| `full-debug` | 0.1.0 | Run bounded owner-authorized Full Debug orchestration with failure memory, log-build-git-debug continuity, spawn role separation, and verification |
| `log-build-git` | 0.2.1 | Run log-skill -> design-git -> build-git, including governed handoff receipt/bootstrap and failure-guard reload |
| `log-build-git-debug` | 0.1.0 | Run log-skill -> design-git -> build-git-debug for debug-state continuity |
| `/authorized-log-build-git` | 0.1.0 | Specialized compatibility route for authorizing the current bounded owner gate before log/design/build continuation |
| `signalproof-this-plan` | 0.1.0 | Grill, design, and bound the current work into a THIS PLAN CONTRACT without implementation |
| `signalproof-this-build` | 0.1.0 | Revalidate an approved plan, grill material implementation decisions with docs, build the bounded surface, and verify it |
| `signalproof-teach` | 0.1.0 | Teach using Signalproof principles, source discipline, durable learning, and HAMM boundaries |

## Canonical file mapping

- `/dsp` -> `commands/dsp.md`
- `authorize` -> `commands/authorize.md`
- `known-errors` -> `commands/known-errors.md`
- `log-skill` -> `commands/log-skill.md`
- `handoff-log` -> `commands/handoff-log.md`
- `cut-chase` -> `commands/cut-chase.md`
- `design-git` -> `commands/design-git.md`
- `build-git` -> `commands/build-git.md`
- `build-git this` -> `commands/build-git-this.md`
- `build-git spawn` -> `commands/build-git-spawn.md`
- `build-git-debug` -> `commands/build-git-debug.md`
- `full-debug` -> `commands/full-debug.md`
- `log-build-git` -> `commands/log-build-git.md`
- `log-build-git-debug` -> `commands/log-build-git-debug.md`
- `/authorized-log-build-git` -> `commands/authorized-log-build-git.md`
- `signalproof-this-plan` -> `commands/signalproof-this-plan.md`
- `signalproof-this-build` -> `commands/signalproof-this-build.md`
- `signalproof-teach` -> `commands/signalproof-teach.md`

## DSP command shell

`/dsp` means **Dr. Signalproof mode**. The non-slash form `dsp` is the transport-safe fallback when a host reserves or intercepts slash commands.

The `/dsp` Library is the public `docreo/Signalproof-Skills` Library after governed promotion to protected `main`. `/dsp skills`, `/dsp commands`, and `/dsp loops` navigate the current public registries and corresponding public library surfaces. Private Build Ledger evidence may support continuity but does not replace public Skill/Command/Loop authority.

The DSP resolver accepts space/hyphen variants and resolves every accepted form to exactly one canonical command before routing. Examples:

- `/dsp build git`, `/dsp build-git`, `dsp-build-git` -> `build-git`
- `/dsp this plan`, `/dsp-this-plan`, `dsp this-plan` -> `signalproof-this-plan`
- `/dsp this build`, `/dsp-this-build`, `dsp this-build` -> `signalproof-this-build`
- `/dsp full-debug`, `/dsp full debug`, `/dsp-full-debug`, `dsp-full-debug` -> `full-debug`
- `/dsp cut-chase`, `/dsp cut chase`, `dsp-cut-chase` -> `cut-chase`
- `/dsp log-build-git` -> `log-build-git`
- `/dsp known-errors`, `/dsp-known-errors`, `dsp known errors` -> `known-errors`
- `/dsp authorize`, `/dsp authorized` -> `authorize`
- `/dsp authorize build-git`, `authorized build-git`, `/dsp-authorized-this-build` -> `authorize` with a resolved target command
- `/dsp teach` -> `signalproof-teach`
- `/dsp debug` -> `build-git-debug`
- `/dsp handoff` -> `handoff-log`
- `/dsp log` -> `log-skill`

See `commands/dsp.md` for the complete normalization, public Library, and authority contract.

## Conversational aliases

- `authorize` -> `authorize`
- `authorized` -> `authorize`
- `authorized build-git` -> `authorize build-git`
- `authorized log-build-git` -> `/authorized-log-build-git` compatibility route
- `full debug` -> `full-debug`
- `cut to the chase` -> `cut-chase` when the user is clearly invoking the Signalproof command behavior
- `grill this plan` -> `signalproof-this-plan`
- `Signalproof this plan` -> `signalproof-this-plan`
- `grill-with-docs this architecture` -> `signalproof-this-build`
- `Signalproof this build` -> `signalproof-this-build`
- `Signalproof Teach` -> `signalproof-teach`
- `teach me this using signalproof-teach` -> `signalproof-teach`

## Command governance rules

1. A command is operator shorthand/orchestration, not a new authority source.
2. Commands route to Active Skills and evidence/governance mechanisms and do not replace those contracts.
3. Git current state must be refetched before consequential repository work.
4. Known Failure Preflight is required where the command contract says it is materially applicable.
5. PowerShell-relevant build and continuation work must load the current Git-backed PowerShell failure registry, preserve same-failure attempt counts across chat boundaries, run applicable executable known-error preflight, parser-preflight the exact final staged `.ps1`, and block unchanged known-bad retries.
6. Planning, grilling, teaching, logging, DSP resolution, Cut Chase compression, authorization handling, known-error guarding, Full Debug orchestration, or command invocation cannot silently create write, destructive, credential, privilege, security-change, release, publication, Candidate-activation, or canonical Build Ledger authority beyond the exact bounded command contract.
7. A projected Build Ledger sequence is never a reservation.
8. `signalproof-this-plan` does not implement; `signalproof-this-build` requires a sufficiently bounded/authorized plan.
9. `signalproof-teach` may teach toward HAMM readiness but does not award maturity/certification/permission.
10. `cut-chase` may simplify an established conclusion but must not strengthen evidence, hide failed gates, or convert recommendation into authorization.
11. `build-git-debug` and `log-build-git-debug` preserve failed attempts and require changed conditions or deeper Investigation rather than blind retries.
12. `full-debug` composes one bounded debug operation; it must not double-run `build-git-debug`, and its meaning of `authorize all` is limited to owner-authorizable actions inside the current Full Debug Envelope.
13. Signalproof-controlled generated build output must avoid U+2014 except when preserving immutable/protected source evidence.
14. Public Git command promotion does not claim a canonical private Build Ledger append.
15. DSP aliases and handlers must resolve to stable canonical command identities before execution; aliases must not fork command semantics.
16. `known-errors` must block materially unchanged known-bad retry paths and must not auto-promote newly observed failures into the Active catalog.
17. `authorize` must preserve exact bounded scope, prerequisites, protected state, and consumption. It must not become blanket or recursive authority.
18. Active command versions in command files and this registry must remain synchronized; promotion is incomplete while those identities disagree.

## Lifecycle

Future command changes remain versioned and governed through:

`DISCOVERED -> CANDIDATE -> TESTED -> APPROVED -> ACTIVE -> DEPRECATED / RETIRED`

This registry records the current owner-approved Active state after merge; historical Candidate PRs remain provenance and do not override newer canonical `main` definitions.
