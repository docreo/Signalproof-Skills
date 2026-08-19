# `/dsp` - Dr. Signalproof Command Shell V0.1

**Status:** ACTIVE  
**Version:** 0.1.0  
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
| `authorized log build git`, `authorized-log-build-git` | `/authorized-log-build-git` |
| `teach` | `signalproof-teach` |
| `log`, `log skill`, `log-skill` | `log-skill` |
| `handoff`, `handoff log`, `handoff-log` | `handoff-log` |
| `design git`, `design-git` | `design-git` |

Exact canonical command names remain valid after the DSP prefix.

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
5. Prefer exact canonical command matches over convenience aliases.
6. Resolve to exactly one canonical command identity.
7. If resolution is ambiguous, STOP and present the smallest disambiguation.
8. Route through the canonical command's current `main` contract.
9. Preserve all command-specific governance, authority, verification, recovery, and STOP conditions.

## Authority boundary

DSP mode does not grant write, destructive, credential, privilege, security-change, publication, release, Candidate-activation, or canonical Build Ledger authority.

The resolved canonical command remains authoritative for execution semantics.

## Collision rule

`/dsp` is the preferred Signalproof shell syntax, but Signalproof must not assume it owns a host application's global slash-command namespace. When a host intercepts `/dsp`, use the equivalent non-slash `dsp` form.

## Governance rule

Human-facing aliases may grow, but canonical command identities must remain stable and versioned. Do not fork behavior merely because multiple spellings are accepted.
