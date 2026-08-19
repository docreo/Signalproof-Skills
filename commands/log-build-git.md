# `log-build-git` — Active Operator Command V0.1

**Status:** ACTIVE  
**Version:** 0.1.0  
**Activated:** 2026-08-19  
**Owner approval:** Doc Reo

## Purpose

`log-build-git` is an Active Signalproof operator command shorthand for a bounded three-part workflow:

1. preserve/synchronize the current governed milestone state;
2. perform only the build or verification work that is already explicitly authorized;
3. synchronize public-safe reusable command, skill, provenance, or governance changes to Git without leaking private build evidence.

It combines existing Active Signalproof disciplines. It does not create new Build Ledger authority, does not imply milestone closeout, and does not turn a build authorization into production implementation authority.

Core rule:

> **Log what is true, build only what is authorized, and publish only what is safe.**

## Required behavior

### 1. Log

Route through the `log-skill` synchronization semantics for the current milestone/work unit.

- identify current evidence and authorization state;
- preserve failed and partial checkpoints;
- preserve stable identities and deduplicate repeated logging;
- keep private/internal evidence separate from public Git;
- stage a noncanonical/private record when canonical Build Ledger append is unavailable, unnecessary, or unauthorized;
- never reserve or manufacture a canonical C-number;
- logging alone does not close the milestone.

### 2. Build

Execute only the smallest build, reproduction, test, or verification step that is already authorized.

Before execution:

- bind the applicable parent evidence and source/build authority;
- preserve protected state and rollback boundaries;
- isolate the candidate/workspace when practical;
- verify exact hashes or equivalent stable identities for consequential inputs;
- state what is explicitly not authorized.

During execution:

- do not silently expand scope;
- preserve stdout/stderr/native exit-code evidence when relevant;
- stop on material divergence;
- never treat a harness failure as a product failure without evidence;
- never mutate protected production state unless separately authorized.

After execution:

- record the real result, including mismatch/failure;
- verify protected state remains unchanged when required;
- do not infer implementation, release, activation, or closeout authority from a successful build.

### 3. Git

Synchronize only public-safe reusable changes.

Appropriate Git content includes:

- operator-command contracts;
- public-safe skills and governance lessons;
- generic tests and acceptance scenarios;
- public-safe provenance/promotion records;
- documentation that does not expose private recovery or infrastructure details.

Do not publish:

- private Build Ledger chronology or staged internal records;
- local filesystem paths;
- private recovery locations;
- protected artifact hashes when they reveal internal release/recovery state and publication was not explicitly authorized;
- credentials, customer/private data, machine-specific secrets, or internal security evidence.

Prefer a dedicated branch and draft pull request for new or materially changed command/skill doctrine unless the user explicitly authorizes direct activation on the default branch.

## Authorization semantics

A user instruction such as:

`authorized log-build-git`

means:

- the previously identified bounded build step is authorized;
- logging/synchronization of the current milestone state is authorized under `log-skill` rules;
- public-safe Git synchronization is authorized;
- canonical Build Ledger mutation is **not** implied unless the canonical head and append authority are separately verified;
- milestone closeout is **not** implied;
- implementation, deployment, release, protected-state replacement, or production activation are **not** implied.

If there is no clearly identified pending build scope, do not invent one. Resolve the current authorized scope from existing evidence first.

## Relationship to other commands

- `log-skill` preserves/synchronizes milestone and reusable-learning state.
- `handoff-log` transfers conversation continuity plus governance state.
- `log-build-git` preserves state, executes an already-authorized bounded build/checkpoint, and synchronizes public-safe Git changes.
- `log-skill close` remains the explicit closeout path when a milestone is actually complete.

Typical pattern:

`investigation -> authority established -> authorized log-build-git -> staged/private record -> bounded build -> evidence -> public-safe Git sync -> continue gate`

## Idempotency

Repeated `log-build-git` must not duplicate stable log/Git records or repeat a completed build blindly.

- inspect existing evidence first;
- adopt already-complete valid evidence when appropriate;
- preserve partial workspaces and diagnose before rerunning;
- update/supersede staged state when new evidence materially changes the milestone;
- preserve historical failures rather than deleting them.

## STOP conditions

STOP when:

- the intended build scope is ambiguous and cannot be resolved from current evidence;
- source/build authority required for the next action is unresolved;
- a canonical C-number would have to be guessed or reserved;
- the operation would silently close an open milestone;
- a public Git change would leak private/internal evidence;
- the requested build would mutate protected state without separate authorization;
- a prior output collision may represent complete or partial evidence and has not been classified;
- Git synchronization would auto-promote a candidate capability without the required lifecycle approval.

## Update rule

Active does not mean immutable. Changes to `log-build-git` must be versioned, reviewed, tested proportionately, owner-approved, and supersede rather than erase earlier command behavior.
