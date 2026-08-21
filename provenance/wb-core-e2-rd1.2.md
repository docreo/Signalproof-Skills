# Workbench Core E2 RD1.2

**Status:** FULL DEBUG / MATERIAL PROGRESS / WINDOWS RETEST PENDING  
**Work stream:** Signalproof Workbench governed Core access  
**Current doctrine basis:** `docreo/Signalproof-Skills` main `adb25389730ebbd8827bc77e052a0f05393ec79e`  
**Branch:** `candidate/wb-core-rd1`

## Failure carried forward

E2 RD1.1 executed once under Windows PowerShell 5.1 and reached:

- normal non-elevated user PASS;
- protected Core count 39 and all anchors exact;
- accepted Node runtime exact;
- adapter candidate bytes exact;
- adapter test bytes exact.

It then stopped before Node launch because the RD1.1 fail-closed `.Arguments` guard rejected the real adapter path, which contains whitespace:

`STOP: E2 process argument requires unsupported quoting: F:\Downloads\Quarantine\Evidence\B8A-E2-CORE-RD1.1\src\governor-core-adapter.js`

Classification: `HARNESS / ENVIRONMENT COMPATIBILITY / ARGUMENT QUOTING`.

No production Governor call, production Core request, model execution, Hermes execution, protected Core mutation, or canonical Build Ledger append occurred.

## Working Failure Map

Fingerprint: `Windows PowerShell 5.1 ProcessStartInfo argument transport for whitespace path`  
Layer: HARNESS / ENVIRONMENT  
Attempt count: 2  
Prior attempt 1: `.ArgumentList` unavailable  
Prior attempt 2: `.Arguments` narrow guard correctly rejected whitespace path  
Known-error Candidate: `KE-PS-PSI-ARGUMENTLIST-001`  
Ruled out: adapter contract defect, Core mutation, production Governor/Core invocation  
Last material change: bounded `.Arguments` path with fail-closed guard  
New evidence: the actual Node script path requires quoting  
Next changed condition: bounded Windows quoting encoder plus micro-fixtures  
Status: DEBUGGING / MATERIAL PROGRESS

## RD1.2 correction

Only process-argument transport changes.

RD1.2:

- continues to use Windows PowerShell 5.1-compatible `ProcessStartInfo.Arguments`;
- quotes arguments containing whitespace;
- preserves plain arguments without quoting;
- rejects embedded quote characters rather than guessing at a broader Windows quoting algorithm;
- rejects a quoted argument ending in backslash, which would require a broader escaping routine;
- runs micro-fixtures before Node launch proving plain-switch preservation, whitespace-path quoting, and embedded-quote rejection;
- preserves stdout, stderr, exit status, and timeout separation;
- creates a fresh `B8A-E2-CORE-RD1.2` evidence lane;
- leaves embedded adapter/test bytes and product architecture unchanged.

## Artifact

`B8A-E2-CORE-RD1.2.ps1`

SHA-256:

`1676286917AB55F0C4B0B9B8DDAB89AD1D779E4634E0F8C3CC716AE7FF530F2C`

Authoring-side static correction checks: PASS.

Exact Windows PowerShell parser validation and runtime remain pending on the owner machine.

## Full Debug lanes

**Builder:** smallest correction is argument encoding only; adapter/test contract remains unchanged.  
**Design:** no redesign; durable path remains `Workbench -> Governor -> Core`.  
**Governor:** attempt 3 is allowed because the material failing condition changed and prior failed evidence lanes remain preserved. This is the final normal same-fingerprint correction budget before Investigation/replan if the same transport class remains unresolved.

## Authority exclusions

This Full Debug operation does not authorize production deployment, production Governor/Core mutation, new credentials, privilege/security changes, protected-main mutation, Candidate activation, or canonical Build Ledger append.

## Next gate

Stage exact RD1.2, verify SHA-256, parser-preflight the exact staged file, and execute once under the same normal non-Administrator Windows PowerShell environment.

If RD1.2 reaches E2 automated PASS, the isolated Governor-to-Core adapter contract is accepted for the stated E2 evidence class. If the same process-argument transport class fails again, STOP normal retry and route to Investigation/replan rather than attempt a fourth cosmetic correction.
