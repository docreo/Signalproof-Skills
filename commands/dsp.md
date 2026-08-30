# `/dsp` - Dr. Signalproof Command Shell V0.3.10

**Status:** ACTIVE  
**Version:** 0.3.10  
**Owner:** Doc Reo

## Purpose

`/dsp` is the human-facing **Dr. Signalproof command shell** for the public Signalproof Library in `docreo/Signalproof-Skills`.

It is a compact resolver: normalize operator syntax, resolve exactly one canonical command, then load that command's contract. `/dsp` is **not a new authority source** and should not duplicate specialist doctrine.

The public `commands/COMMAND-REGISTRY.md` is command authority. `library/EXECUTION-PIPELINE.yaml` defines compact stage order. `library/STATE-CAPSULE.md` defines minimum sufficient continuity context.

## Dr. Signalproof mode

Typing `/dsp` or `dsp` enters or reaffirms **Dr. Signalproof mode** for the current session.

Accepted prefixes:

```text
/dsp <command>
dsp <command>
/dsp-<command>
dsp-<command>
```

Host runtimes may intercept slash commands. Non-slash `dsp` forms are the mandatory **transport-safe fallback**.

Spaces and hyphens may normalize only when they identify the same command and do not erase arguments.

Required compatibility forms include:

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
/dsp build-spawn-debug
/dsp build spawn debug
dsp-build-spawn-debug
/dsp complete
dsp-complete
/dsp 30m st
/dsp 2h st
/dsp 1h30m st
dsp 45 minutes st
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
| `<time> st` | `st` with preserved duration argument `<time>` |
| `download` | `download` |
| `build capsule`, `build-capsule`, `capsule` | `build-capsule` |
| `plan`, `this plan`, `this-plan` | `signalproof-this-plan` |
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
| `authorize <command>`, `authorized <command>` | `authorize` with resolved target command |
| `authorized log build git`, `authorized-log-build-git` | `/authorized-log-build-git` compatibility route |
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

`/dsp <time> st` is the time-bounded Complete route. It applies a user-stated positive duration to the current `complete` workflow and preserves a resumable state if the timebox expires first.

`/dsp build-capsule` is an optional transfer/continuity route for packaging a substantial build, live-update state, authoritative payloads, and optional Design Capsule for another AI system. It does not replace Build, Complete, Handoff, or deployment authority.

Stages may be skipped only when current evidence proves them N/A or still satisfied. `complete` may internally route Build, Debug, Verify, Review, Security, Recovery, and Learn without making the human babysit routine gates. Human QC remains real human evidence. Deployment remains a separate explicit authority boundary.

## Complete handler

`/dsp complete` resolves to `complete`. It authorizes all owner-authorizable actions only inside the current bounded completion envelope, then uses `build-spawn-debug`. It preserves retry limits, protected state, evidence, recovery, and excluded authority. It returns for real Human QC or a genuine blocker; it cannot manufacture user PASS.

## Timed ST handler

`/dsp <time> st` resolves to `st` only when the final token is `st` and the preceding text can be preserved as one positive duration expression. This is an intentional argument-before-command form.

The resolver must preserve the complete duration expression, including composite/plain-language forms such as `1h30m`, `2h 15m`, or `45 minutes`. If duration parsing is absent or ambiguous, STOP rather than falling through to another command or inventing a default.

`st` then loads `signalproof-timed-complete` and the current `complete` contract. Time expiry limits new work; it does not weaken Complete safeguards or convert expiry into PASS.

## Minimal handlers

- `/dsp research` -> `research`, evidence gathering only where unresolved facts materially matter.
- `/dsp design` -> `design-git`, existing design/governance route; no duplicate Design command.
- `/dsp <time> st` -> `st`, user-defined wall-clock timebox over current `complete` with resumable expiry.
- `/dsp qc` -> `qc`, exact-candidate Human-Observed Fact gate after automated PASS.
- `/dsp authorize deploy` -> generic `authorize` handler targeting `deploy`.
- `/dsp deploy` -> `deploy`, exact accepted artifact through Release, post-deploy Verify, then Closeout.
- `/dsp download` -> `download`, cross-chat artifact recovery/re-delivery with exact/reconstructed identity discipline and optional explicit durable connected-storage copy.
- `/dsp build-capsule` -> `build-capsule`, multimodal build-transfer packaging with payload authority, optional Design Capsule, and live-update mode.
- `/dsp build-spawn-debug` -> `build-spawn-debug`, bounded build/debug convergence to the human gate.
- `/dsp full-debug` -> `full-debug`, high-governance repeated/cross-layer debugging.
- `/dsp cut-chase` -> `cut-chase`.
- `/dsp cut-cost` -> `cut-cost`, read-only measured efficiency audit.
- `/dsp help` -> `help`, current registry-backed help.

## Public Library navigation

The **public Signalproof Library** is current protected `docreo/Signalproof-Skills/main`:

```text
/dsp skills   -> SKILL-REGISTRY.md
/dsp commands -> commands/COMMAND-REGISTRY.md
/dsp loops    -> loops/LOOP-REGISTRY.yaml
/dsp status   -> compact public Library state
```

The private Build Ledger may support continuity/history but does not replace the public Signalproof Library as Skill/Command/Loop authority.

## Resolution algorithm

1. Detect a supported DSP prefix.
2. Preserve arguments and normalize only command-name separators.
3. Before ordinary first-token resolution, detect the special timed suffix form: if the final token is `st`, preserve all preceding post-prefix text as the duration argument and resolve `st` only if that duration is valid/unambiguous.
4. Prefer exact canonical matches for all other commands.
5. Resolve generic handlers such as `authorize` without broadening their target.
6. **If resolution is ambiguous, STOP** and present the smallest disambiguation.
7. Load the resolved command plus only the minimum required Skill/specialists/Loops.
8. Preserve the target command's authority, evidence, recovery, compliance, and STOP rules.

## Authority boundary

DSP mode **does not grant write**, destructive, credential, privilege, security-change, publication, release, Candidate-activation, or **canonical Build Ledger authority**.

The **resolved canonical command remains authoritative**. Capability and visibility are not permission.

## Governance rule

Keep this shell small. New operator capabilities should normally add a thin command or alias and route into existing Active Skills rather than adding detailed doctrine here. Human-facing aliases may grow; canonical command identities remain stable and versioned.
