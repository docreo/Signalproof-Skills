# PowerShell 5.1 Native-Command / Interactive-Harness Compatibility

**Lifecycle:** Candidate  
**Discovered:** 2026-08-16  
**Source milestone:** Signalproof V0.2 Case 3 — Hermes Disposable Runtime Acceptance

## Candidate targets

Primary:

- `signalproof-build`
- `signalproof-debug`

Supporting relevance:

- `signalproof-recovery`

## Problem observed

Two recurring Windows PowerShell 5.1 harness behaviors caused avoidable operator friction during governed Hermes staging:

1. Git's normal stderr progress (`Cloning into ...`) became a terminating `NativeCommandError` under `$ErrorActionPreference = "Stop"` before the harness could classify Git's actual exit code.
2. Interactive copy/paste of an `if { ... }` block followed later by `else { ... }` caused `else` to execute as a standalone command after the successful branch had already completed.

Neither event was a Hermes product failure.

## Candidate doctrine

For Signalproof Windows scripts and operator command blocks:

1. Treat Windows PowerShell 5.1 as the default compatibility floor unless a newer shell is explicitly verified.
2. Separate native stderr from native-command failure.
3. Determine native-command success from `$LASTEXITCODE` and command-specific semantics.
4. Use quiet/no-progress switches when appropriate without suppressing meaningful failure evidence.
5. Avoid split interactive `if/else` instructions; prefer guard clauses, `throw`/`return` failure checks, or complete `.ps1` scripts for multi-branch logic.
6. Distinguish product failure, harness failure, wrapper failure, and operator-shell artifact.
7. Before retrying any mutating operation, inspect whether partial state already exists.
8. Preserve failed harness evidence.
9. Bound cleanup to exact owned disposable state and verify the target path before deletion.
10. Run a PowerShell 5.1 compatibility review before distributing Signalproof Windows acceptance/build/recovery scripts.

## Relationship to current Active skills

`signalproof-debug` already requires separating product/source failure from harness or wrapper failure. `signalproof-build` already requires containment of partial actuation before returning failure. This Candidate is a narrower Windows implementation lesson that may strengthen those existing rules; it does not replace them.

## Test requirements before promotion

Test the Candidate across at least these classes:

- Git native commands that emit stderr progress;
- `gh` native commands;
- Python/native interpreter calls;
- npm/Node commands;
- installer or compiler commands;
- bounded cleanup and rollback paths;
- interactive operator command blocks;
- complete PowerShell script execution.

Promotion requires evidence that the rules reduce false harness failures without hiding real native-command failures.

## Current status

**CANDIDATE ONLY — not Active.**

Do not alter the current Active `signalproof-build`, `signalproof-debug`, or `signalproof-recovery` baselines solely from this discovery.