# `/dsp` - Dr. Signalproof Command Shell V0.3.3

**Status:** ACTIVE  
**Version:** 0.3.3  
**Owner:** Doc Reo

## Purpose

`/dsp` is the human-facing **Dr. Signalproof command shell** for the public Signalproof Library in `docreo/Signalproof-Skills`.

Its job is to provide one compact namespace that resolves forgiving human command forms into one canonical Signalproof operator command before routing or execution, and to expose compact navigation across the public Skill, Command, and Loop libraries.

`/dsp` is a command resolver and mode entry point, not a new authority source.

## Public Library authority

The canonical `/dsp` Library is the public `docreo/Signalproof-Skills` repository after governed promotion to protected `main`.

Public Library surfaces include:

- `SKILL-REGISTRY.md` and `skills/` for Active public Skills;
- `commands/COMMAND-REGISTRY.md` and `commands/` for Active operator commands;
- `loops/LOOP-REGISTRY.yaml` and `loops/` for bounded Loop Library protocols;
- `library/CAPABILITY-REGISTRY.yaml` for compact routing metadata;
- public tests, tools, provenance, research, and wiki material according to their own authority boundaries.

Private Build Ledger evidence may support continuity, historical reconstruction, acceptance evidence, or private governance. It does not replace the public Signalproof Library as `/dsp` Skill/Command/Loop authority.

## Root behavior

Typing `/dsp` or `dsp` enters or reaffirms Dr. Signalproof mode for the current session. The root exposes compact public Library navigation and the current command surface.

## Accepted prefix forms

```text
/dsp <command>
dsp <command>
/dsp-<command>
dsp-<command>
```

Host runtimes may intercept slash commands. The non-slash `dsp` forms are mandatory transport-safe fallbacks.

## Separator normalization

Spaces and hyphens may normalize when they identify the same command. Normalization must not erase meaningful arguments.

Examples:

```text
/dsp build git
/dsp build-git
dsp-build-git

/dsp this plan
/dsp-this-plan
/dsp this build
/dsp-this-build

/dsp full-debug
/dsp full debug
/dsp-full-debug
dsp full-debug
dsp-full-debug

/dsp cut-chase
/dsp cut chase
dsp-cut-chase

/dsp build-spawn-debug
/dsp build spawn debug
dsp-build-spawn-debug
```

## Canonical resolution

Every accepted DSP form resolves to exactly one canonical Signalproof operator command before action.

| DSP form | Canonical command |
|---|---|
| `plan`, `this plan`, `this-plan` | `signalproof-this-plan` |
| `build`, `this build`, `this-build` | `signalproof-this-build` |
| `build git`, `build-git` | `build-git` |
| `build git this`, `build-git this` | `build-git this` |
| `build git spawn`, `build-git spawn` | `build-git spawn` |
| `debug`, `build git debug`, `build-git-debug` | `build-git-debug` |
| `full debug`, `full-debug` | `full-debug` |
| `build spawn debug`, `build-spawn-debug` | `build-spawn-debug` |
| `cut chase`, `cut-chase` | `cut-chase` |
| `log build git`, `log-build-git` | `log-build-git` |
| `log build git debug`, `log-build-git-debug` | `log-build-git-debug` |
| `authorize`, `authorized` | `authorize` |
| `authorize <command>`, `authorized <command>` | `authorize` with resolved target command |
| `authorized log build git`, `authorized-log-build-git` | `/authorized-log-build-git` compatibility route |
| `known errors`, `known-errors` | `known-errors` |
| `teach` | `signalproof-teach` |
| `log`, `log skill`, `log-skill` | `log-skill` |
| `handoff`, `handoff log`, `handoff-log` | `handoff-log` |
| `design git`, `design-git` | `design-git` |

Exact canonical command names remain valid after the DSP prefix.

## Build Spawn Debug handler

`/dsp build-spawn-debug` resolves to canonical `build-spawn-debug`, which routes to the Active public `signalproof-build-spawn-debug` coordinator.

This is one bounded build-to-user-acceptance command. It may continue through Build, Spawn challenge, Debug/Full Debug, automated Verify/Review/Security/Recovery, and Learn as required by the current envelope. It does not expand into an ad hoc sequence at the DSP resolver layer.

The coordinator continues while evidence supports a materially new correction. It stops at automated PASS for the human UI gate, a real owner/authority boundary, or a real blocker. Human UI FAIL resumes the same workstream with new evidence; human UI PASS moves to owner authorization readiness.

## Cut Chase handler

`/dsp cut-chase` resolves to canonical `cut-chase`, which routes to the Active public `signalproof-cut-chase` Skill. Cut Chase reduces decision load while preserving material evidence, uncertainty, failures, protected state, and authority. A normal invocation is one-shot.

## Full Debug handler

`/dsp full-debug` resolves to canonical `full-debug`. Full Debug is bounded orchestration, not unrestricted `authorize all`, and preserves its current debug envelope, exclusions, failure-memory, spawn, verification, and STOP behavior.

## Authorization handler forms

`authorize` and `authorized` resolve through the generic authorization handler before target-command execution. Authorization syntax does not manufacture authority. The existing `/authorized-log-build-git` route remains a specialized compatibility path.

## Library navigation

Read-only discovery forms include:

```text
/dsp commands
/dsp skills
/dsp loops
/dsp status
```

These navigate current protected `docreo/Signalproof-Skills/main`:

- `/dsp skills` -> `SKILL-REGISTRY.md` / Active `skills/`;
- `/dsp commands` -> `commands/COMMAND-REGISTRY.md` / `commands/`;
- `/dsp loops` -> `loops/LOOP-REGISTRY.yaml` / `loops/`;
- `/dsp status` -> compact public Library status, with private continuity state only when separately relevant and labeled.

A branch/PR is Candidate evidence, not public Active state before governed merge.

## Resolution algorithm

1. Detect a supported DSP prefix.
2. Strip only the DSP prefix and immediate separator.
3. Preserve user arguments.
4. Normalize command-name spaces/hyphens enough to match aliases.
5. Detect generic handlers such as `authorize` before target resolution.
6. Prefer exact canonical command matches over convenience aliases.
7. Resolve to exactly one canonical command identity.
8. If resolution is ambiguous, STOP and present the smallest disambiguation.
9. Route through the canonical command's current protected `main` contract.
10. Preserve command-specific governance, authority, verification, recovery, and STOP conditions.

## Authority boundary

DSP mode does not grant write, destructive, credential, privilege, security-change, publication, release, Candidate-activation, or canonical Build Ledger authority.

The resolved canonical command remains authoritative. Public Library visibility also does not create execution authority.

## Collision rule

`/dsp` is preferred Signalproof shell syntax, but Signalproof must not assume it owns a host application's global slash-command namespace. Use equivalent non-slash `dsp` forms when intercepted.

## Governance rule

Human-facing aliases and handlers may grow, but canonical command identities remain stable and versioned. Aliases must not fork semantics or bypass target-command governance.
