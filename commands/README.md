# Signalproof Operator Commands

Signalproof operator commands are short human-facing instructions that invoke or compose existing governed Signalproof capabilities.

A command is not automatically a specialist skill, permission grant, Build Ledger event, release approval, or production mutation authority.

Core rule:

> Commands simplify operation. Skills retain specialist authority. Governance retains approval authority.

## Command types

### Operator command

A concise instruction that coordinates one or more existing Signalproof skills or governance behaviors.

Examples:

- `log-skill`
- `handoff-log`
- `log-build-git`

### Workmode command

A command that enters a bounded operating mode, verifies current governing Git state, routes through the current Active Signalproof skills, and keeps only the necessary working context loaded.

Examples:

- `build-git`
- `design-git`

A workmode command is a bootstrap and routing layer. It does not replace `signalproof-router` or the specialist skills it loads.

## Command lifecycle

Commands follow the same governed maturity principle used elsewhere in Signalproof:

`DISCOVERED -> CANDIDATE -> TESTED -> APPROVED -> ACTIVE -> DEPRECATED / RETIRED`

A command may be documented before it is Active. Documentation must always preserve its actual lifecycle state.

## Current command registry

| Command | Canonical form | Type | Status | Definition |
|---|---|---|---|---|
| `log-skill` | `log-skill` | Operator command | ACTIVE | Preserve and synchronize milestone or reusable-learning state without manufacturing chronology or closure. |
| `handoff-log` | `handoff-log` | Composite operator command | ACTIVE | Perform governed handoff plus `log-skill` synchronization while preserving open milestone and closeout state. |
| `build-git` | `/build-git` | Git-backed build workmode | CANDIDATE / NOT ACTIVE | Verify current Signalproof-Skills Git authority, route through `signalproof-router`, lazy-load only required Active build skills, protect working state, execute only authorized work, and leave proof. |
| `design-git` | `/design-git` | Git-backed design workmode | CANDIDATE / NOT ACTIVE | Verify current Signalproof-Skills Git authority, route through `signalproof-router`, load current design governance and only required supporting skills, preserve product truth and protected baselines. |
| `log-build-git` | `log-build-git` | Composite operator command | OWNER-APPROVED / PENDING MERGE | Synchronize current milestone state, execute only the already-authorized bounded build or verification step, and synchronize only public-safe reusable Git changes. |

## Active commands

### `log-skill`

Purpose:

Preserve and synchronize the current milestone or learning state.

It may stage or synchronize records, extract reusable lessons, and route to closeout when explicitly requested and actually justified.

It does not reserve a canonical Build Ledger number and does not activate a candidate merely because it was logged.

Supported forms include:

- `log-skill`
- `log-skill close`
- `log-skill close-when-complete`
- `log-skill close C###` as a strict conditional assertion only

Canonical contract:

[`log-skill.md`](log-skill.md)

### `handoff-log`

Purpose:

Transfer both working continuity and governance state to a fresh chat.

It combines normal Signalproof handoff with `log-skill` synchronization. It preserves pending closeout obligations, protected state, evidence boundaries, failures, exact next action, and receiving-chat boot instructions.

A handoff does not imply milestone closeout.

Canonical contract:

[`handoff-log.md`](handoff-log.md)

## Candidate workmode commands

### `/build-git`

Conversational alias:

`build-git`

Purpose:

Enter a Git-governed Signalproof application-building workmode.

Operating sequence:

```text
/build-git
  -> verify current docreo/Signalproof-Skills main
  -> load current signalproof-router
  -> establish objective, evidence state, protected baseline, and authority
  -> lazy-load only required Active skills
  -> execute only the authorized bounded build/debug/verification path
  -> preserve rollback and proof
  -> closeout, learn, document, or handoff only when triggered
```

Short form:

> GitHub Signalproof Skills first. Router second. Build third. Leave proof.

`build-git` does not mean "edit GitHub." Git is the governing source used to establish the current skill and routing authority for build work.

Invoking it does not by itself authorize destructive changes, privilege elevation, credentials, direct protected-main writes, production deployment, release, skill activation, canonical Build Ledger mutation, or mutation of protected working baselines.

Candidate source currently lives in PR #101 and remains not Active until governance promotion is completed.

### `/design-git`

Conversational alias:

`design-git`

Purpose:

Enter a Git-governed Signalproof product-design workmode.

It verifies the governing Git state, loads `signalproof-router` and the current Active `signalproof-design` contract, then lazy-loads supporting skills only when the evidence requires them.

It does not create build authority, fabricated system state, or permission to overwrite protected product baselines.

Candidate source currently lives in PR #101 and remains not Active until governance promotion is completed.

## Owner-approved pending command

### `log-build-git`

Purpose:

Coordinate three bounded behaviors without collapsing their authority boundaries:

1. synchronize the current milestone under `log-skill` semantics;
2. execute only the already-authorized bounded build, reproduction, test, or verification step;
3. synchronize only public-safe reusable Git changes.

It does not imply canonical Build Ledger mutation, milestone closeout, implementation authority, protected-state replacement, deployment, release, or production activation.

The command is owner-approved but is not canonical repository doctrine until its dedicated PR is merged to `main`.

## Commands versus skills

Commands answer:

> What operating shorthand did the human invoke?

Skills answer:

> What governed specialist discipline is responsible for this part of the work?

Examples:

- `build-git` may route to `signalproof-plan`, `signalproof-design`, `signalproof-build`, `signalproof-debug`, `signalproof-verify`, and other Active specialists as needed.
- `handoff-log` composes `signalproof-handoff` with `log-skill` synchronization behavior.
- `log-build-git` may coordinate logging, a bounded build/checkpoint, and public-safe Git synchronization, while the underlying specialist skills retain their own authority rules.

A command must not weaken or bypass the specialist skill it invokes.

## Commands versus authorization

A command invocation establishes intended operating behavior. It does not automatically grant every permission that the words inside the command might suggest.

Authorization remains bounded by:

- explicit current human instruction;
- established milestone scope;
- protected-state rules;
- current evidence;
- specialist skill authority boundaries;
- Build Ledger governance;
- release and security gates.

If a command would expand beyond those boundaries, stop rather than infer permission.

## Slash forms and conversational aliases

Where defined, slash forms and conversational aliases represent the same command contract.

Examples:

- `/build-git` and `build-git`
- `/design-git` and `design-git`
- `/handoff-log` and `handoff-log` where a command surface supports the slash form

A slash form is a user-interface convenience, not a separate capability or authority class.

## Output rule for `build-git`

While `build-git` workmode is active, Signalproof-controlled generated output should not contain Unicode em dash U+2014. Use commas, colons, semicolons, parentheses, or ASCII hyphen-minus where punctuation is under Signalproof control.

This does not authorize rewriting protected byte-for-byte source evidence, external quoted evidence, or checksum-covered artifacts.

## Governance rule

New commands should be added to this registry only with their true lifecycle status.

Do not:

- call a Candidate Active;
- infer activation from owner interest alone;
- reserve Build Ledger chronology;
- turn command documentation into implementation authority;
- duplicate an existing specialist skill merely to create a shortcut;
- silently broaden a command after it has been accepted.

Changes to command semantics should be versioned, reviewed, tested proportionately, owner-approved where required, and preserve prior history through supersession rather than silent rewrite.
