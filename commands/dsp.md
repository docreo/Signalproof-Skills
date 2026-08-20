# `/dsp` - Dr. Signalproof Command Shell V0.3.2

**Status:** ACTIVE  
**Version:** 0.3.2  
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

Private Build Ledger evidence may support continuity, historical reconstruction, acceptance evidence, or private governance. It does **not** replace the public Signalproof Library as `/dsp` Skill/Command/Loop authority.

## Root behavior

Typing any supported root form enters or reaffirms Dr. Signalproof mode for the current session:

```text
/dsp
dsp
```

The root should expose compact public Library navigation and the current command surface without requiring the user to memorize full canonical command names.

## Accepted prefix forms

The resolver may accept:

```text
/dsp <command>
dsp <command>
/dsp-<command>
dsp-<command>
```

Host runtimes may intercept slash commands before Signalproof receives them. Therefore the non-slash `dsp` forms are mandatory transport-safe fallbacks.

## Separator normalization

After detecting the DSP prefix, normalize equivalent human separators before alias resolution:

- spaces;
- hyphens;
- repeated spaces around separators.

Examples that resolve to the same canonical command:

```text
/dsp build git
/dsp build-git
dsp build git
dsp build-git
/dsp-build-git
dsp-build-git
```

Likewise:

```text
/dsp this plan
/dsp-this-plan
dsp this-plan
dsp-this-plan
```

and:

```text
/dsp this build
/dsp-this-build
dsp this-build
dsp-this-build
```

Full Debug variants also normalize to one command:

```text
/dsp full-debug
/dsp full debug
/dsp-full-debug
dsp full-debug
dsp-full-debug
```

Cut Chase variants normalize to one command:

```text
/dsp cut-chase
/dsp cut chase
/dsp-cut-chase
dsp cut-chase
dsp-cut-chase
```

Normalization must not erase meaningful arguments after a command has been resolved.

## Canonical resolution

Every accepted DSP form must resolve to exactly one canonical Signalproof operator command before action.

Initial alias map:

| DSP form | Canonical command |
|---|---|
| `plan`, `this plan`, `this-plan` | `signalproof-this-plan` |
| `build`, `this build`, `this-build` | `signalproof-this-build` |
| `build git`, `build-git` | `build-git` |
| `build git this`, `build-git this` | `build-git this` |
| `build git spawn`, `build-git spawn` | `build-git spawn` |
| `debug`, `build git debug`, `build-git-debug` | `build-git-debug` |
| `full debug`, `full-debug` | `full-debug` |
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

## Cut Chase handler

`/dsp cut-chase` resolves to canonical `cut-chase`, which routes to the Active public `signalproof-cut-chase` Skill.

Cut Chase reduces decision load, not merely word count. It must preserve evidence, uncertainty, failures, protected state, and authority that materially affect the user's next decision. Default output is Bottom line -> What matters -> Action note, with Watch / blocker only when materially needed.

A normal invocation is one-shot for the current material. It must not silently convert the entire conversation into a permanent terse persona.

## Full Debug handler

`/dsp full-debug` resolves to canonical `full-debug`.

Full Debug is a bounded orchestration command, not shorthand for unrestricted `authorize all`. Its current command and `signalproof-full-debug` contracts define the allowed debug envelope, authorization exclusions, failure-memory continuity, `log-build-git-debug` composition, `build-git spawn` role separation, verification, and STOP behavior.

The resolver must not expand `full-debug` into multiple ad hoc commands itself. It resolves to the one canonical `full-debug` identity, and that command owns the composition so Debug is not accidentally executed twice.

## Authorization handler forms

DSP supports a generic authorization handler so the Library does not need a separate authorization command for every target operation.

Examples:

```text
/dsp authorize
/dsp authorized
/dsp authorize build-git
/dsp authorized build-git
/dsp-authorize-build-git
dsp authorized this-build
```

The resolver must first identify `authorize`/`authorized` as the handler, preserve the remaining target text and arguments, resolve that target to exactly one canonical Signalproof command, then apply the current `authorize` contract.

Bare conversational forms such as `authorized build-git` may also route to the same handler when the Signalproof command context is clear.

The existing `/authorized-log-build-git` command remains a specialized compatibility route. It does not become blanket authority merely because the generic handler exists.

## Library navigation

The root shell supports read-only discovery forms such as:

```text
/dsp commands
/dsp skills
/dsp loops
/dsp status
```

These navigate the **public Signalproof Library** on current protected `docreo/Signalproof-Skills/main`:

- `/dsp skills` -> current public `SKILL-REGISTRY.md` / Active `skills/`;
- `/dsp commands` -> current public `commands/COMMAND-REGISTRY.md` / `commands/`;
- `/dsp loops` -> current public `loops/LOOP-REGISTRY.yaml` / `loops/`;
- `/dsp status` -> compact current public Library status, with private continuity state only when separately relevant and clearly labeled.

Navigation is read-only unless a separately defined canonical command grants an applicable actuation path. A branch/PR may be shown as Candidate evidence but cannot be reported as public Active state before governed merge.

## Resolution algorithm

1. Detect a supported DSP prefix.
2. Strip only the DSP prefix and its immediate separator.
3. Preserve the remaining user arguments.
4. Normalize command-name spaces/hyphens sufficiently to match the alias registry.
5. Detect generic handlers such as `authorize` before normal target-command resolution.
6. For a handler form, preserve and separately resolve the target command and arguments.
7. Prefer exact canonical command matches over convenience aliases.
8. Resolve to exactly one canonical command identity.
9. If resolution is ambiguous, STOP and present the smallest disambiguation.
10. Route through the canonical command's current protected `main` contract.
11. Preserve all command-specific governance, authority, verification, recovery, and STOP conditions.

## Authority boundary

DSP mode does not grant write, destructive, credential, privilege, security-change, publication, release, Candidate-activation, or canonical Build Ledger authority.

Authorization syntax does not manufacture authority. The `authorize` handler can only preserve and route explicit bounded owner authority or a uniquely established pending owner gate. The resolved canonical command remains authoritative. It remains authoritative for execution semantics and preserves its own prerequisites and STOP conditions.

Public Library visibility also does not create execution authority. Public Skills describe governed operating capability; Governor/command-specific authority still controls consequential actuation.

## Collision rule

`/dsp` is the preferred Signalproof shell syntax, but Signalproof must not assume it owns a host application's global slash-command namespace. When a host intercepts `/dsp`, use the equivalent non-slash `dsp` form.

## Governance rule

Human-facing aliases and handlers may grow, but canonical command identities must remain stable and versioned. Do not fork behavior merely because multiple spellings are accepted. Generic handlers must not bypass target-command governance or become blanket authority sources.
