# SP-LOOP-POWERSHELL-GUARD

**Status:** RD1 Candidate  
**Principal:** `signalproof-known-errors` with `build-git` / `log-build-git`

## Purpose

Prevent recurring PowerShell harness failures from consuming repeated build/debug attempts across builds, retries, and fresh chat windows.

Core rule:

> **A new chat is not a new failure history. Search the Git-backed PowerShell failure registry before generating or retrying PowerShell. Carry unresolved failure identity and attempt count forward.**

## Cycle

`LOAD CURRENT GIT -> LOAD POWERSHELL FAILURE REGISTRY -> MATCH APPLICABLE RULES -> GENERATE/EDIT -> STATIC FAILURE CHECK -> PARSE EXACT FINAL .PS1 -> BIND FINAL IDENTITY -> EXECUTE ONCE -> CLASSIFY -> LEARN/STOP/CONTINUE`

## Entry conditions

Use this loop whenever the next consequential step will generate, modify, stage, or execute PowerShell.

On fresh-chat continuation, enter the loop before creating a new runner if the transferred next gate may use PowerShell.

## Contract

1. Refetch current `Signalproof-Skills/main` before consequential PowerShell work.
2. Load `library/POWERSHELL-FAILURE-REGISTRY.yaml` from current Git.
3. Recover task-relevant PowerShell failure IDs, failed runner identities, attempt counts, and unresolved conditions from the current handoff/evidence when available.
4. Match the proposed action against registry conditions before writing another script.
5. Apply all matching prevention rules during generation, not after failure.
6. Run a static known-failure check against the completed candidate script.
7. Parser-validate the exact final staged `.ps1` that would execute.
8. If the script changes after parse validation, invalidate the validation and parse again.
9. When byte identity matters, compute/hash the exact final serialized artifact only after all edits and validation.
10. Execute at most once for the current exact artifact/condition set.
11. Classify failure layer separately: parser, harness/wrapper, path/staging, dependency/runtime, authority/security, or target product.
12. Before retry, state the exact material change from the failed attempt.
13. A new filename, wrapper, prompt, formatting variation, or conversation window does not reset the failure identity or attempt count.
14. When a reusable new failure fingerprint is proven, stage it for Known Errors/Learn governance rather than leaving it only in chat memory.

## Mandatory pre-execution gates

PowerShell execution is blocked unless all applicable gates pass:

- `REGISTRY SEARCHED`
- `APPLICABLE RULES APPLIED`
- `EXACT FINAL ARTIFACT IDENTIFIED`
- `PARSER PREFLIGHT PASS`
- `KNOWN-FAILURE STATIC CHECK PASS`
- `PROTECTED STATE / AUTHORITY PASS` where consequential

If any required gate is `UNKNOWN`, do not execute until resolved or explicitly routed to a safe diagnostic action.

## Retry discipline

A retry requires at least one material change:

- relevant script bytes changed;
- runtime or dependency changed;
- environment/path/staging condition changed;
- prerequisite/authority changed;
- a new discriminating hypothesis is being tested;
- a documented mitigation is being confirmed.

Cosmetic variation does not qualify.

Default maximum remains three materially unsuccessful attempts against the same unresolved failure class, including attempts from prior chats when continuity evidence preserves them.

## Fresh-chat persistence

`handoff-log` must carry the active PowerShell guard state when PowerShell remains relevant:

- applicable registry IDs;
- failed runner identities/hashes when relevant;
- attempt count by failure class;
- last failure classification;
- mitigation already tried;
- exact next allowed test;
- explicit do-not-repeat path.

`log-build-git` receiving-chat bootstrap must reload the current registry and reconcile this guard state before generating another PowerShell runner.

## STOP

STOP when a high-confidence registry match would be repeated under unchanged conditions; exact-final parser validation fails; a proposed retry is cosmetic; failure continuity is required but unavailable; the same unresolved failure class reaches the iteration limit; or mitigation would cross protected-state/security/authority boundaries.

## Evidence

Record: registry version/ref, matched IDs, exact artifact identity, parser result, failure class, attempt count, changed condition, result, mitigation, and next route.

## Authority

This loop prevents recurrence. It does not grant build, execution, privilege, security-change, release, or canonical Build Ledger authority.
