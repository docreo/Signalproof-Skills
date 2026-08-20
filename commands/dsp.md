# `/dsp` - Dr. Signalproof Command Shell V0.3

**Status:** ACTIVE  
**Version:** 0.3.0  
**Owner:** Doc Reo

## Purpose

`/dsp` is the human-facing **Dr. Signalproof command shell** for the Signalproof Library.

Its job is to provide one compact namespace that resolves forgiving human command forms into one canonical Signalproof operator command before routing or execution.

`/dsp` is a command resolver and mode entry point, not a new authority source.

## Root behavior

Typing any supported root form enters or reaffirms Dr. Signalproof mode for the current session:

```text
/dsp
dsp
```

The root should expose compact Library navigation and the current command surface without requiring the user to memorize full canonical command names.

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
/dsp this-plan
dsp-this-plan
/dsp-this-plan
```

and:

```text
/dsp this build
/dsp this-build
dsp-this-build
/dsp-this-build
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

The root shell should support read-only discovery forms such as:

```text
/dsp commands
/dsp skills
/dsp loops
/dsp status
```

These are Library navigation/resolution operations unless and until a separately defined canonical command gives them actuation semantics.

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
10. Route through the canonical command's current `main` contract.
11. Preserve all command-specific governance, authority, verification, recovery, and STOP conditions.

## Authority boundary

DSP mode does not grant write, destructive, credential, privilege, security-change, publication, release, Candidate-activation, or canonical Build Ledger authority.

Authorization syntax does not manufacture authority. The `authorize` handler can only preserve and route explicit bounded owner authority or a uniquely established pending owner gate. The resolved canonical command remains authoritative. It remains authoritative for execution semantics and preserves its own prerequisites and STOP conditions.

## Collision rule

`/dsp` is the preferred Signalproof shell syntax, but Signalproof must not assume it owns a host application's global slash-command namespace. When a host intercepts `/dsp`, use the equivalent non-slash `dsp` form.

## Governance rule

Human-facing aliases and handlers may grow, but canonical command identities must remain stable and versioned. Do not fork behavior merely because multiple spellings are accepted. Generic handlers must not bypass target-command governance or become blanket authority sources.
