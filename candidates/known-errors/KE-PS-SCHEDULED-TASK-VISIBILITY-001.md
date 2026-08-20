# KE-PS-SCHEDULED-TASK-VISIBILITY-001

**Status:** CANDIDATE  
**Class:** PowerShell / Windows Scheduled Tasks / privilege visibility  
**Discovered:** Build 8A D4 production activation final-user verification

## Failure fingerprint

A non-elevated Windows PowerShell session runs `Get-ScheduledTask -TaskName <known privileged task>` and receives no matching `MSFT_ScheduledTask` object even though a prior elevated phase successfully created the task and separately proved the target runtime is live under the expected service identity.

## Risk

A standard-user ScheduledTasks view can be misinterpreted as authoritative proof that a Local Service or otherwise privileged task is absent. This can create a false product/runtime failure after the task and runtime have already been established by stronger accepted evidence.

## Prevention

- Do not use a standard user's `Get-ScheduledTask` result as sole authority for absence of a task created under a privileged/service context.
- Preserve the evidence class that originally established the task: privileged registration result, principal/logon/trigger checks, runtime identity, expected runtime artifacts, and live protocol behavior.
- When the remaining acceptance claim belongs to the normal user, test the user-visible product contract directly instead of requiring privileged scheduler enumeration.
- Under evidence-sufficiency termination, do not regress already-proven task/runtime claims unless later evidence actually contradicts them.
- If task enumeration itself is a required acceptance claim, perform that check from an authorized context that can reliably observe the task and treat the context as part of the evidence contract.

## Build 8A D4 evidence pattern

The privileged phase established:

- task principal `NT AUTHORITY\LOCAL SERVICE`;
- logon type `ServiceAccount`;
- exactly one `AtStartup` trigger;
- task/runtime-identity/DPAPI readiness PASS;
- runtime SID `S-1-5-19`;
- DPAPI signing key present and non-empty.

The later standard-user `Get-ScheduledTask` query returned no object. A corrected read-only final-user proof avoided scheduler enumeration and required the installed Workbench to authenticate to the live production Governor. That proof returned `ALLOW`, while the Local Service runtime identity and DPAPI key remained present and protected Core remained exact.

## Governance

This file is Candidate failure intelligence only. It does not alter Active prevention data, authorization semantics, release state, or canonical Build Ledger history. Promotion requires normal Known Errors/Learn governance and regression coverage.
