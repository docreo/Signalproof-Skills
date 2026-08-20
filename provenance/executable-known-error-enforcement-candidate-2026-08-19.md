# Executable Known-Error Enforcement Promotion Record

**Status:** ACTIVE / PROMOTED  
**Date:** 2026-08-19  
**Basis:** Build 8A repeated harness recurrence review

## Problem

Signalproof already recorded repeatable failures in the Build Ledger and public-safe known-error catalog, but human-readable recurrence guidance alone did not prevent the same machine-checkable PowerShell/harness mistakes from being generated again during consequential work.

Build 8A demonstrated that a known-error system can correctly remember a failure yet still fail operationally if the build path does not mechanically enforce the applicable prevention rule before handoff.

## Promoted correction

1. `build-git` uses observed operator-environment evidence instead of forcing a generic shell recipe.
2. Machine-checkable recurrence rules are executable before consequential artifact handoff where an applicable validator exists.
3. Evidence classes remain separate: once required product/security acceptance is independently sufficient, a later harness/report/finalizer defect does not automatically regress the accepted claim.
4. Repeated expensive acceptance matrices are not rerun when the unresolved evidence gap is downstream and narrower.

## Active implementation

- `tools/known_error_preflight.py`
  - blocks the observed rejected leading `& {` operator-console wrapper in `operator-powershell` mode;
  - blocks `$Host` assignment;
  - warns on recurrence-prone direct `.Count` access under StrictMode-sensitive PowerShell;
  - warns on standalone interactive `else`;
  - warns when stderr appears to be used directly as failure authority.
- `commands/build-git.md`
  - adds executable known-error enforcement;
  - replaces generic wrapper preference with observed-console compatibility;
  - adds evidence-sufficiency termination;
  - adds shape/structural prevention rules learned from Build 8A.
- consistency tests
  - verify validator behavior;
  - prevent command doctrine from drifting back to unconditional wrapper advice or evidence-regression loops.

## Promotion evidence

- focused executable-preflight micro-suite: **6/6 PASS**;
- exact GitHub branch bytes refetched after candidate write;
- candidate branch compared against `main`: ahead only, no divergence before promotion;
- pull request **#136** opened from the exact tested candidate head;
- full **Signalproof Suite Consistency** GitHub Actions run completed **SUCCESS** on the pull-request head;
- owner authorized merge;
- PR #136 merged to `main` at `9ba4cd1d846521b395761c25870235cd4cd8d875`.

## Post-promotion synchronization

A post-merge `log-build-git` check correctly detected lifecycle/version drift left by the candidate labels in the merged files. The follow-up bounded correction synchronizes:

- `commands/build-git.md` to Active `0.2.3`;
- `commands/COMMAND-REGISTRY.md` to `build-git` version `0.2.3`;
- this provenance record to Active/Promoted state;
- regression coverage so future command-file and registry versions cannot silently diverge.

## Governance

Promotion of this public build-system capability does not claim canonical private Build Ledger chronology and does not grant production, deployment, privilege, credential, security-exception, destructive, or protected-state mutation authority.
