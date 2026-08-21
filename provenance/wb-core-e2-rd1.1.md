# Workbench Core E2 RD1.1

**Status:** DEBUGGING / MATERIAL PROGRESS / WINDOWS RETEST PENDING  
**Work stream:** Signalproof Workbench governed Core access  
**Current doctrine basis:** `docreo/Signalproof-Skills` main `adb25389730ebbd8827bc77e052a0f05393ec79e`  
**Branch:** `candidate/wb-core-rd1`

## Failure carried forward

E2 RD1 executed once under Windows PowerShell 5.1 and reached:

- normal non-elevated user PASS;
- protected Core count 39 and all anchors exact;
- accepted Node runtime exact;
- adapter candidate bytes exact;
- adapter test bytes exact.

It then failed before Node launch because `System.Diagnostics.ProcessStartInfo.ArgumentList` is unavailable in the target Windows PowerShell/.NET Framework environment.

Failure classification: `HARNESS / ENVIRONMENT COMPATIBILITY`.

No production Governor call, production Core request, model execution, Hermes execution, protected Core mutation, or canonical Build Ledger append occurred.

## RD1.1 correction

Only the native process-launch wrapper changed:

- removed `.ArgumentList.Add(...)`;
- added a fail-closed guard rejecting process arguments containing whitespace or quotes;
- uses `.Arguments = ($Arguments -join " ")` only for the current bounded safe argument set;
- preserves separate stdout, stderr, exit-code, and timeout handling;
- uses a new E2 RD1.1 evidence lane;
- leaves the adapter/test contract unchanged.

## Working Failure Map

Fingerprint: `ProcessStartInfo.ArgumentList missing`  
Layer: HARNESS / ENVIRONMENT  
Attempt count: 1  
Known-error state: new Candidate `KE-PS-PSI-ARGUMENTLIST-001`  
Last material change: Windows PowerShell 5.1 compatible process argument transport  
Next changed condition: exact RD1.1 staged and parser-validated on target machine  
Status: DEBUGGING / MATERIAL PROGRESS

## Artifact

`B8A-E2-CORE-RD1.1.ps1`

SHA-256:

`6272352D6455D8DD93A29528528DB51EC9A7C1AF2CEB3DBE569CD7954A24D114`

## Authority and protected state

Current `/debug all` / bounded Build Spawn Debug envelope permits this owner-authorizable harness correction and retest. It does not authorize production deployment, privilege/security changes, new credentials, protected-main mutation, Candidate activation, or canonical Build Ledger append.

## Next gate

Stage the exact RD1.1 runner, verify SHA-256, parser-preflight the exact staged file, and execute it once under the same normal non-Administrator Windows PowerShell environment.

If it reaches automated E2 PASS, continue to the next bounded integration gate. If it fails with a new fingerprint, preserve the evidence and continue only after localization and a materially changed condition.
