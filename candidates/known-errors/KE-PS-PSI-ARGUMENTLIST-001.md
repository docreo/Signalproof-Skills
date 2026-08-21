# KE-PS-PSI-ARGUMENTLIST-001

**Status:** CANDIDATE  
**Class:** Windows PowerShell 5.1 / .NET Framework / ProcessStartInfo  
**Discovered:** Workbench Core E2 RD1

## Failure fingerprint

A Windows PowerShell 5.1 harness creates `System.Diagnostics.ProcessStartInfo` and attempts to use `.ArgumentList.Add(...)`. Under the target Windows PowerShell/.NET Framework environment, `ProcessStartInfo.ArgumentList` is unavailable and StrictMode terminates with:

`The property 'ArgumentList' cannot be found on this object.`

## Risk

A harness written against newer .NET `ProcessStartInfo` APIs can fail before the intended native process starts, while product/protected state remains untouched.

## Prevention candidate

- Do not assume `ProcessStartInfo.ArgumentList` exists in Windows PowerShell 5.1 / .NET Framework.
- For a bounded argument set that is guaranteed to contain no whitespace or quotes, use `.Arguments` with an explicit fail-closed argument-shape guard.
- If general Windows command-line quoting is required, use a separately validated quoting routine rather than silently joining arbitrary values.
- Classify this failure as HARNESS/ENVIRONMENT when the native target never started.
- Preserve the failed runner/evidence lane and retry only after the process-launch condition materially changes.

## E2 evidence

E2 RD1 verified the normal non-admin user, protected Core baseline, accepted Node runtime, adapter bytes, and test bytes before failing at the first `.ArgumentList.Add(...)`. Node did not start and no production Governor/Core/model/Hermes action occurred.

## Governance

Candidate only. Do not treat as Active PowerShell prevention doctrine until normal Known Errors/Learn promotion and regression coverage are complete.
