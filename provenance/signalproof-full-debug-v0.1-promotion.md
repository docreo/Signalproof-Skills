# Signalproof Full Debug V0.1 Promotion Record

**Owner direction:** implement `/dsp full-debug` immediately without changing or closing unrelated active/open Git work.

## Canonical basis

Development branch was created from current `Signalproof-Skills/main` after the persistent PowerShell failure-memory milestone merged at:

`afc59f6710f44670393b17a5b8e354e3ebcdd111`

No pre-existing canonical `full-debug` command or `signalproof-full-debug` skill was found on that basis.

## Purpose

The owner requested one high-governance debug mode combining the practical intent of:

- `/dsp debug`;
- bounded owner authorization for the current full-debug operation;
- log/build/debug continuity;
- `build-git spawn` role separation;
- current known-error and PowerShell recurrence prevention.

The implementation is deliberately compositional. It adds a coordinator skill and one canonical command rather than modifying the detailed semantics of existing Active `signalproof-debug`, `build-git-debug`, `log-build-git-debug`, `authorize`, or `build-git spawn` contracts.

## Authorization interpretation

Within Full Debug, the phrase `authorize all` means only:

> all owner-authorizable actions required by the current bounded Full Debug Envelope, subject to objective prerequisites, protected-state rules, repository rules, security boundaries, and STOP conditions.

It explicitly excludes canonical Build Ledger append, release/production, unauthorized secrets/credentials, privilege or administrative security-control changes, unrelated repositories/workstreams, protected-main bypass, and Candidate activation outside normal governance.

## Anti-duplication design

`log-build-git-debug` already routes:

`log-skill -> design-git -> build-git-debug`

Therefore `full-debug` does not execute another independent `build-git-debug` afterward. `build-git spawn` supplies the Builder/Design/Governor role-separation execution model for the bounded debug operation rather than creating a second repair pass.

## Failure-memory continuity

Full Debug inherits the current Git-backed known-error and PowerShell prevention system. A fresh chat, renamed runner, wrapper change, prompt rewrite, or cosmetic command variation does not reset an unresolved failure identity or attempt count.

## New public surfaces

- `skills/signalproof-full-debug/SKILL.md`
- `commands/full-debug.md`
- DSP alias/routing update in `commands/dsp.md`
- command registration in `commands/COMMAND-REGISTRY.md`
- Skill registration in `SKILL-REGISTRY.md`
- routing registration in `library/CAPABILITY-REGISTRY.yaml`
- consistency tests in `tests/consistency/test_dsp_full_debug.py`

## Skill architecture

`signalproof-full-debug` is a coordinator, not a mega-skill. It composes existing Active specialists and keeps detailed debug, known-error, security, recovery, verification, authorization, and spawn semantics in their canonical definitions.

Promotion requires the exact `SKILL.md` to remain below the 15,000 UTF-8 byte ceiling and all applicable repository consistency checks to pass.

## Open-PR boundary

Historical and Candidate PRs that were already open before this milestone were inspected for collision but were not closed, rewritten, rebased, or merged as part of Full Debug implementation. Their lifecycle/provenance remains independent until a separate reconciliation/cleanup decision.

## Ledger boundary

This public Git promotion record does not claim or authorize a canonical private Build Ledger append or reserve any private Ledger sequence identifier.
