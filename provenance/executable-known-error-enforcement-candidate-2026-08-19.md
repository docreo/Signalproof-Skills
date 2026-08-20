# Executable Known-Error Enforcement Candidate

**Status:** CANDIDATE / NOT ACTIVE  
**Date:** 2026-08-19  
**Basis:** Build 8A repeated harness recurrence review

## Problem

Signalproof already records repeatable failures in the Build Ledger and public-safe known-error catalog, but human-readable recurrence guidance alone did not prevent the same machine-checkable PowerShell/harness mistakes from being generated again during consequential work.

Build 8A demonstrated that a known-error system can correctly remember a failure yet still fail operationally if the build path does not mechanically enforce the applicable prevention rule before handoff.

## Candidate correction

1. `build-git` must use observed operator-environment evidence instead of forcing a generic shell recipe.
2. Machine-checkable recurrence rules should be executable before consequential artifact handoff.
3. Evidence classes remain separate: once required product/security acceptance is independently sufficient, a later harness/report/finalizer defect does not automatically regress the accepted claim.
4. Repeated expensive acceptance matrices should not be rerun when the unresolved evidence gap is downstream and narrower.

## Candidate implementation

- `tools/known_error_preflight.py`
  - blocks the observed rejected leading `& {` operator-console wrapper in the `operator-powershell` mode;
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
  - verify the validator behavior;
  - prevent command doctrine from drifting back to unconditional wrapper advice or evidence-regression loops.

## Evidence

The executable preflight micro-suite was run outside GitHub against the exact candidate tool/test design before repository write: 6 tests passed.

Exact GitHub branch bytes were refetched after write for the candidate tool, command, and tests.

## Governance

This candidate does not modify `main`, does not activate a new Known Error, does not claim canonical Build Ledger chronology, and does not grant production/release/privilege/security authority.

Promotion requires review of false-positive/false-negative behavior, consistency-suite verification in a repository checkout or CI environment, and normal owner/governance acceptance.
