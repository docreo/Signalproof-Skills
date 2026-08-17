# Candidate Delta — signalproof-build: PowerShell 5.1 Harness Compatibility

**Lifecycle:** Candidate  
**Target skill:** `signalproof-build`  
**Supporting skill:** `signalproof-debug`  
**Discovered:** 2026-08-16  
**Source milestone:** Signalproof V0.2 Case 3 — Hermes Disposable Runtime Acceptance

## Purpose

This is **not a standalone Signalproof skill**. It is a candidate doctrine update to the existing `signalproof-build` skill.

The primary reason it belongs in `signalproof-build` is that these controls must be applied **before a Windows build, acceptance, installer, recovery, or validation harness is handed to the operator**. The goal is to prevent avoidable wrapper failures during governed execution.

`signalproof-debug` remains a secondary consumer because it already governs how to distinguish product/source failure from harness or wrapper failure after a failure occurs.

## Problem observed

During governed Hermes staging, two Windows PowerShell 5.1 harness behaviors caused avoidable operator friction:

1. Git's normal stderr progress (`Cloning into ...`) became a terminating `NativeCommandError` under `$ErrorActionPreference = "Stop"` before the harness could classify Git's actual exit code.
2. Interactive copy/paste of an `if { ... }` block followed later by `else { ... }` caused `else` to execute as a standalone command after the successful branch had already completed.

Neither event was a Hermes product failure.

## Proposed signalproof-build doctrine

Before distributing a Signalproof Windows build/acceptance/recovery script or operator command block:

1. Treat Windows PowerShell 5.1 as the compatibility floor unless another shell version is explicitly verified.
2. Separate native stderr from native-command failure.
3. Determine native-command success from `$LASTEXITCODE` plus command-specific semantics.
4. Use quiet/no-progress switches when appropriate without suppressing meaningful failure evidence.
5. Avoid split interactive `if/else` instructions; prefer guard clauses, `throw`/`return` failure checks, or complete `.ps1` scripts for multi-branch logic.
6. Preflight native executables such as `git`, `gh`, Python, npm/Node, compilers, and installers for PowerShell 5.1 stream behavior.
7. Before retrying a mutating operation after wrapper failure, inspect whether partial state already exists.
8. Preserve failed harness evidence.
9. Bound cleanup to exact owned disposable state and verify the target path before deletion.
10. Require a PowerShell 5.1 compatibility review as part of Windows harness readiness before operator execution.

## Relationship to existing Active signalproof-build doctrine

The Active skill already requires:

- preservation of evidence;
- bounded changes;
- partial-actuation containment;
- exact status reporting;
- recovery protection.

This Candidate would strengthen those rules at the **harness-design layer** by preventing known PowerShell/native-command integration defects before the build is executed.

## signalproof-debug cross-reference

`signalproof-debug` should retain responsibility for classifying a later event as product failure, harness failure, wrapper failure, or operator-shell artifact. No separate PowerShell-specific debug skill is proposed.

## Test requirements before promotion

Test this Candidate across at least:

- Git commands that emit stderr progress;
- `gh` commands;
- Python/native interpreter calls;
- npm/Node commands;
- installer/compiler commands;
- bounded cleanup and rollback;
- interactive operator command blocks;
- complete PowerShell script execution.

Promotion requires evidence that these rules reduce false harness failures without hiding actual native-command failures.

## Current status

**CANDIDATE DELTA TO `signalproof-build` — not Active.**

Do not modify the Active `signalproof-build` baseline until this candidate is tested and approved through normal Signalproof skill governance.