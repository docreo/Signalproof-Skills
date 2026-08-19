# Signalproof Operator Command Registry

This registry identifies Signalproof operator-command identities and maturity. `main` is canonical public state. A command file may exist without being Active.

## Active commands

| Command | Version | Purpose | Routes to |
|---|---:|---|---|
| `log-skill` | 0.2.0 | Preserve/synchronize milestone, learning, and Skill architecture state without fabricating chronology | Closeout, Learn, Verify, Document, Handoff, Router |
| `handoff-log` | 0.1.0 | Preserve conversation continuity plus `log-skill` synchronization | Handoff + `log-skill` |
| `signalproof-this-plan` | 0.1.0 | Stress-test the current plan or decision before execution | `signalproof-grill` |
| `signalproof-this-build` | 0.1.0 | Stress-test the current build/architecture and capture durable decision/glossary/ADR candidates | `signalproof-grill-with-docs` |
| `signalproof-teach` | 0.1.0 | Teach a topic using Signalproof principles, source discipline, durable learning, and HAMM distinctions | `signalproof-teach` skill |
| `build-git this` | 0.1.0 | Turn the currently bounded discussion/decision into the next governed Git-backed action | Router + applicable Active Skills + Git evidence |

## Candidate commands

| Command | Version | Status |
|---|---:|---|
| `design-git` | 0.2.0-candidate | Candidate / not Active |
| `build-git` | 0.2.0-candidate | Candidate / not Active |
| `build-git spawn` | 0.1.0-candidate | Candidate / not Active |
| `log-build-git` | 0.1.0-candidate | Candidate / not Active |
| `/authorized-log-build-git` | 0.1.0-candidate | Candidate / not Active |

## Command rules

1. A command is operator shorthand, not a new authority source.
2. Commands route to Active Skills and evidence/governance mechanisms; they do not replace those contracts.
3. Conversational aliases may be accepted, but the canonical identity in this registry is the durable command name.
4. A command that implies repository mutation must refetch current Git state before consequential writes.
5. A command that implies document persistence, system action, publication, security change, credentials, privilege, or canonical Build Ledger mutation must preserve the underlying authority gate.
6. `build-git this` binds `this` to the currently established subject/decision only; if the referent is ambiguous or materially changed, resolve scope before writing.
7. `signalproof-this-plan` and `signalproof-this-build` harden decisions; neither silently authorizes implementation.
8. `signalproof-teach` may teach toward HAMM readiness but does not award maturity, certification, permission, or operational authority.
9. New or materially changed commands should be recorded through `log-skill` governance and this registry should remain synchronized.
10. Public Git command records do not establish a canonical private Build Ledger event number.

## Conversational aliases

- `grill this plan` -> `signalproof-this-plan`
- `Signalproof this plan` -> `signalproof-this-plan`
- `grill-with-docs this architecture` -> `signalproof-this-build`
- `Signalproof this build` -> `signalproof-this-build`
- `teach me this using signalproof-teach` -> `signalproof-teach`
- `Signalproof Teach` -> `signalproof-teach`
- `build-git this` -> canonical form is already conversational

## Lifecycle

`DISCOVERED -> CANDIDATE -> TESTED -> APPROVED -> ACTIVE -> DEPRECATED / RETIRED`

Command promotion does not imply Skill promotion, release authority, or canonical Build Ledger authority.
