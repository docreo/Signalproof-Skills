# `/dsp` - Dr. Signalproof Command Shell V0.4.1

**Status:** ACTIVE  
**Version:** 0.4.1  
**Owner:** Doc Reo

## Purpose

`/dsp` is the human-facing **Dr. Signalproof command shell** for the public Signalproof Library in `docreo/Signalproof-Skills`.

It is a compact resolver: normalize operator syntax, resolve exactly one canonical command, then load that command's contract. `/dsp` is **not a new authority source**.

`commands/COMMAND-REGISTRY.md` is command authority. `library/EXECUTION-PIPELINE.yaml` defines compact stage order. `library/STATE-CAPSULE.md` defines minimum continuity context.

## Dr. Signalproof mode

Typing `/dsp` or `dsp` enters or reaffirms **Dr. Signalproof mode**.

Accepted prefixes:

```text
/dsp <command>
dsp <command>
/dsp-<command>
dsp-<command>
```

Host runtimes may intercept slash commands. Non-slash `dsp` forms are the mandatory **transport-safe fallback**. Spaces and hyphens may normalize only when they identify the same command and preserve arguments.

Required compatibility forms include:

```text
/dsp print
dsp print
/dsp-print
dsp-print
/dsp print docx
/dsp print docs
/dsp print pdf
/dsp print all
/dsp git-check
/dsp git check
dsp-git-check
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
/dsp build-spawn-debug
/dsp build spawn debug
dsp-build-spawn-debug
/dsp complete
dsp-complete
/dsp build-capsule
/dsp build capsule
/dsp-build-capsule
dsp build-capsule
dsp-build-capsule
/dsp capsule
/dsp cut-chase
/dsp cut chase
dsp-cut-chase
/dsp cut-cost
/dsp cut cost
dsp-cut-cost
/dsp download
/dsp-download
dsp download
dsp-download
/dsp help
/dsp-help
dsp help
dsp-help
```

## Canonical resolution

| DSP form | Canonical command |
|---|---|
| `help` | `help` |
| `research` | `research` |
| `complete`, `finish this` | `complete` |
| `download` | `download` |
| `print`, `print this`, `print <...>` | `print` with arguments preserved |
| `build capsule`, `build-capsule`, `capsule` | `build-capsule` |
| `plan`, `this plan`, `this-plan` | `signalproof-this-plan` |
| `git check`, `git-check`, `check git` | `git-check` |
| `design`, `design git`, `design-git` | `design-git` |
| `build`, `this build`, `this-build` | `signalproof-this-build` |
| `build git`, `build-git` | `build-git` |
| `build git this`, `build-git this` | `build-git this` |
| `build git spawn`, `build-git spawn` | `build-git spawn` |
| `debug`, `build git debug`, `build-git-debug` | `build-git-debug` |
| `full debug`, `full-debug` | `full-debug` |
| `build spawn debug`, `build-spawn-debug` | `build-spawn-debug` |
| `qc`, `human qc` | `qc` |
| `deploy` | `deploy` |
| `cut chase`, `cut-chase` | `cut-chase` |
| `cut cost`, `cut-cost` | `cut-cost` |
| `log build git`, `log-build-git` | `log-build-git` |
| `log build git debug`, `log-build-git-debug` | `log-build-git-debug` |
| `authorize`, `authorized` | `authorize` |
| `authorize <command>`, `authorized <command>` | `authorize` with resolved target |
| `authorized log build git`, `authorized-log-build-git` | `/authorized-log-build-git` |
| `known errors`, `known-errors` | `known-errors` |
| `teach` | `signalproof-teach` |
| `log`, `log skill`, `log-skill` | `log-skill` |
| `handoff`, `handoff log`, `handoff-log` | `handoff-log` |

Exact canonical names remain valid after the DSP prefix.

## Efficient execution path

Preferred guided software flow:

```text
/dsp research
-> /dsp this-plan
-> /dsp design
-> /dsp complete
-> /dsp qc
-> /dsp authorize deploy
-> /dsp deploy
```

`/dsp print` is a document-output route, not part of the software deployment chain. It resolves to `commands/print.md` and `skills/signalproof-print/SKILL.md`.

`/dsp build-capsule` is an optional transfer route for substantial builds/live updates. It does not replace Build, Complete, Handoff, or deployment authority.

Stages may be skipped only when current evidence proves them N/A or still satisfied. `complete` may route Build, Debug, Verify, Review, Security, Recovery, and Learn. Human QC and deployment authority remain separate boundaries.

## Complete handler

`/dsp complete` resolves to `complete`: bounded owner-authorizable completion through `build-spawn-debug`, with retry, protected-state, evidence, recovery, and excluded-authority controls. It returns for real Human QC or a genuine blocker and cannot manufacture user PASS.

## Minimal handlers

- `/dsp print` -> `print`: resolve author/voice separately from layout; build and verify one authoritative styled DOCX; import it to native Google Docs; PDF only when explicitly requested.
- `/dsp git-check` -> `git-check`, deterministic read-only Git basis/divergence preflight.
- `/dsp research` -> `research`, unresolved-material-fact evidence gathering.
- `/dsp design` -> `design-git`; no duplicate Design command.
- `/dsp qc` -> `qc`, exact-candidate Human-Observed Fact gate after automated PASS.
- `/dsp authorize deploy` -> `authorize` targeting `deploy`.
- `/dsp deploy` -> `deploy`, exact accepted artifact through Release, post-deploy Verify, then Closeout.
- `/dsp download` -> `download`, cross-chat artifact recovery/re-delivery with identity discipline.
- `/dsp build-capsule` -> `build-capsule`, multimodal build-transfer packaging.
- `/dsp build-spawn-debug` -> `build-spawn-debug`, bounded build/debug convergence.
- `/dsp full-debug` -> `full-debug`, repeated/cross-layer debug coordination.
- `/dsp cut-chase` -> `cut-chase`.
- `/dsp cut-cost` -> `cut-cost`, read-only measured efficiency audit.
- `/dsp help` -> `help`, current registry-backed help.

## Public Library navigation

The **public Signalproof Library** is protected `docreo/Signalproof-Skills/main`:

```text
/dsp skills   -> SKILL-REGISTRY.md
/dsp commands -> commands/COMMAND-REGISTRY.md
/dsp loops    -> loops/LOOP-REGISTRY.yaml
/dsp status   -> compact public Library state
```

The private Build Ledger supports continuity/history but does not replace the public Signalproof Library.

## Resolution algorithm

1. Detect a supported DSP prefix.
2. Preserve arguments; normalize only command-name separators.
3. Prefer exact canonical matches.
4. Resolve generic handlers such as `authorize` without broadening scope.
5. Resolve `print` only from current public registry/command/Skill state; historical Build Ledger print definitions are provenance, not runtime authority.
6. **If resolution is ambiguous, STOP** and present the smallest disambiguation.
7. Load the resolved command plus only minimum required Skills/specialists/Loops.
8. Preserve that command's authority, evidence, recovery, compliance, and STOP rules.

## Authority boundary

DSP mode **does not grant write**, destructive, credential, privilege, security-change, publication, release, Candidate-activation, or **canonical Build Ledger authority**.

The **resolved canonical command remains authoritative**. Capability and visibility are not permission.

## Governance rule

Keep this shell small. New operator capabilities should normally add a thin command/alias and route into existing Active Skills rather than duplicating specialist doctrine. Human-facing aliases may grow; canonical command identities remain stable and versioned.
