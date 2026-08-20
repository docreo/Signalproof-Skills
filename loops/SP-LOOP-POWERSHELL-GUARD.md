# SP-LOOP-POWERSHELL-GUARD

**Status:** RD1 Candidate  
**Principal:** `signalproof-known-errors` with `build-git` / `log-build-git`

## Purpose

Prevent recurring PowerShell harness failures from consuming repeated build/debug attempts across builds, retries, and fresh chat windows.

> **A new chat is not a new failure history. Search the Git-backed PowerShell failure registry before generating or retrying PowerShell. Carry unresolved failure identity and attempt count forward.**

## Cycle

`LOAD CURRENT GIT -> LOAD POWERSHELL FAILURE REGISTRY -> MATCH APPLICABLE RULES -> GENERATE/EDIT -> EXECUTABLE/STATIC KNOWN-ERROR CHECK -> PARSE EXACT FINAL .PS1 -> BIND FINAL IDENTITY -> EXECUTE ONCE -> CLASSIFY -> LEARN/STOP/CONTINUE`

## Contract

1. Refetch current `Signalproof-Skills/main` before consequential PowerShell work.
2. Load `library/POWERSHELL-FAILURE-REGISTRY.yaml` from current Git.
3. Recover task-relevant PowerShell failure IDs, failed runner identities, attempt counts, and unresolved conditions from handoff/evidence when available.
4. Match the proposed action against registry conditions before writing another script.
5. Apply all matching prevention rules during generation, not after failure.
6. Run the executable known-error preflight when applicable.
7. Run a static known-failure check against the completed candidate script.
8. Parser-validate the exact final staged `.ps1` that would execute.
9. If the script changes after parse validation, invalidate the validation and parse again.
10. When byte identity matters, compute/hash the exact final serialized artifact only after all edits and validation.
11. Execute at most once for the current exact artifact/condition set.
12. Classify failure layer separately: parser, harness/wrapper, path/staging, dependency/runtime, authority/security, or target product.
13. Before retry, state the exact material change from the failed attempt.
14. A new filename, wrapper, prompt, formatting variation, or conversation window does not reset failure identity or attempt count.
15. When a reusable new failure fingerprint is proven, stage it for Known Errors/Learn governance rather than leaving it only in chat memory.

## Mandatory pre-execution gates

PowerShell execution is blocked unless applicable gates pass:

- `REGISTRY SEARCHED`
- `APPLICABLE RULES APPLIED`
- `EXECUTABLE KNOWN-ERROR PREFLIGHT PASS` when applicable
- `EXACT FINAL ARTIFACT IDENTIFIED`
- `PARSER PREFLIGHT PASS`
- `KNOWN-FAILURE STATIC CHECK PASS`
- `PROTECTED STATE / AUTHORITY PASS` where consequential

If a required gate is `UNKNOWN`, do not execute until resolved or routed to a safe diagnostic action.

## Retry discipline

A retry requires at least one material change: relevant script bytes, runtime/dependency, environment/path/staging condition, prerequisite/authority, new discriminating hypothesis, or a documented mitigation being confirmed.

Cosmetic variation does not qualify. Default maximum remains three materially unsuccessful attempts against the same unresolved failure class, including attempts from prior chats when continuity evidence preserves them.

## Fresh-chat persistence

`handoff-log` must carry PowerShell guard state when PowerShell remains relevant: applicable registry IDs, failed runner identities/hashes when relevant, attempt count by failure class, last failure classification, mitigation already tried, exact next allowed test, and explicit do-not-repeat path.

`log-build-git` receiving-chat bootstrap must reload the current registry and reconcile this guard state before generating another PowerShell runner.

## STOP

STOP when a high-confidence registry match would be repeated under unchanged conditions; exact-final parser validation fails; applicable executable known-error preflight blocks; a proposed retry is cosmetic; failure continuity is required but unavailable; the same unresolved failure class reaches the iteration limit; or mitigation would cross protected-state/security/authority boundaries.

## Evidence

Record registry version/ref, matched IDs, exact artifact identity, parser result, failure class, attempt count, changed condition, result, mitigation, and next route.

## Authority

This loop prevents recurrence. It does not grant build, execution, privilege, security-change, release, or canonical Build Ledger authority.
