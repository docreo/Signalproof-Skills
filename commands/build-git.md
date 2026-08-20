# `build-git` - Active Operator Command V0.2.3

**Status:** ACTIVE  
**Version:** 0.2.3  
**Owner:** Doc Reo

## Purpose

`build-git` is the governed Signalproof next-action execution workmode for repository-backed work.

> **Verify current Git, learn from prior failures, route the smallest governed next action, execute only that action, preserve recovery, and leave proof.**

The word `build` does not mean every invocation writes code. The command may route to Research, Investigate, Query/Inspect, Evaluate, Plan, Design, Readiness, Build, Debug, Verify, Review, Security, Recovery, Release, Document, Learn, Handoff, or Closeout according to current evidence and authority.

`build-git` is an operator command, not a new authority source.

## Mandatory sequence

1. **Git preflight** - refetch the relevant repository/ref/head before consequential action.
2. **Router preflight** - select the minimum applicable Active Signalproof capability set.
3. **Known Failure Preflight** - inspect applicable merged failure intelligence and relevant current open/draft Signalproof candidate evidence when newer failure knowledge may not yet be on `main`. Candidate evidence may prevent recurrence but does not become Active authority.
4. **PowerShell Guard Preflight when applicable** - when the next step will generate, modify, stage, or execute PowerShell, load current `library/POWERSHELL-FAILURE-REGISTRY.yaml`, recover task-relevant prior PowerShell failure state, and apply `SP-LOOP-POWERSHELL-GUARD` behavior before another runner is generated or retried.
5. **Protected-state contract** - establish baseline, forbidden changes, rollback/non-mutation boundary, work-stream identity, and required evidence.
6. **Consume the current Next Action Contract** when one exists. Do not silently redesign it.
7. **Execute only the routed action** within current authority.
8. **Verify incrementally** before stacking additional uncertainty.
9. Apply Review, Security, provenance, recovery, or release gates when material.
10. **Git recheck** before consequential write, merge, publication, or promotion.
11. Preserve outcome, proof, failures, uncertainty, recovery state, learning, and closeout obligations.

## Known Failure Preflight

Search by supported conditions, not keywords alone: runtime, shell, tool, version, platform, action, wrapper/harness, symptom, schema/parser behavior, path/encoding, dependency, permission/security surface, packaging/provenance/license boundary, and protected-state/chronology pattern.

Possible decisions:

- `NO KNOWN MATCH`
- `POSSIBLE MATCH`
- `KNOWN FAILURE / MITIGATION AVAILABLE`
- `KNOWN FAILURE / CONDITIONS CHANGED`
- `KNOWN FAILURE / NO APPROVED MITIGATION`
- `PROHIBITED / STOP`

A high-confidence known failure must not be repeated under unchanged conditions.

## Mandatory PowerShell guard

PowerShell failure memory is Git-backed and survives chat boundaries. A fresh chat does not reset PowerShell failure history.

When PowerShell is relevant:

1. refetch current `Signalproof-Skills/main`;
2. read `library/POWERSHELL-FAILURE-REGISTRY.yaml` before generating or retrying a runner;
3. recover applicable failure IDs, attempt count, failed artifact identity, last classification, mitigation already tried, and do-not-repeat path from current handoff/evidence when available;
4. apply registry prevention rules during generation, not after another failure;
5. perform a static known-failure check against the completed candidate;
6. parser-preflight the exact final staged `.ps1`;
7. if the file changes after parser validation, invalidate the PASS and parse the new final artifact again;
8. when identity matters, compute SHA-256 only after final serialization and validation;
9. execute at most once for the exact artifact/condition set;
10. before retry, state the material condition that changed;
11. carry same-failure attempt counts across new chats, renamed runners, wrapper changes, and cosmetic prompt/format changes;
12. route a newly proven reusable failure through Learn/Known Errors governance so it becomes durable prevention data.

Required pre-execution states are:

`REGISTRY SEARCHED -> APPLICABLE RULES APPLIED -> EXACT FINAL ARTIFACT IDENTIFIED -> PARSER PREFLIGHT PASS -> KNOWN-FAILURE STATIC CHECK PASS -> AUTHORITY/PROTECTED-STATE PASS`

If a required state is unknown or failed, do not execute the consequential runner.

### Current PowerShell prevention set

The registry is the compact current prevention data. At minimum preserve these rules when applicable:

- use one complete interactive statement, preferably one `& { ... }` block; do not split `if` and `else` across submissions;
- parser-preflight the exact final staged `.ps1` before execution;
- calculate SHA-256 after final serialization and verify the same artifact before execution;
- preserve failed runners rather than broad-patching or overwriting them;
- do not assume Windows PowerShell 5.1 `ConvertFrom-Json` can represent arbitrary or empty external JSON property names;
- distinguish generic dictionary `.ContainsKey()` from non-generic `IDictionary.Contains()`;
- do not assume `.Count` exists on optional, null, scalar, or heterogeneous values; normalize collection intent deliberately and check shape before dereference;
- check property presence before dereferencing heterogeneous report objects;
- compute parser-sensitive multiline values first instead of embedding ambiguous expressions;
- classify parser/harness STOP as harness evidence, not product failure, unless separate evidence proves product actuation;
- keep expected console output outside executable command blocks;
- canonicalize filesystem paths before deriving relative paths;
- capture native stdout, stderr, and exit status separately; stderr presence alone is not failure authority;
- reject nested same-delimiter here-string serialization when it can prematurely terminate the outer payload.

## Exact-final-artifact rule

Before handing an operator a consequential generated runner, patch, manifest, config, or repair artifact, validate the exact final artifact as far as the environment permits. Use parser/compiler/schema checks, structured-literal validation, cross-reference checks, defect-specific micro-fixtures or negative tests, and protected-state checks when applicable.

Do not quote stale hashes or claim runtime validation that did not occur.

## Generated output typography rule

Signalproof-controlled generated build output MUST NOT emit Unicode em dash U+2014 when punctuation is under Signalproof control. Use commas, colons, semicolons, parentheses, or ASCII hyphen-minus instead.

This rule does not authorize rewriting immutable source evidence, quoted external evidence, checksum-covered artifacts, or protected byte-for-byte inputs.

## Build-stream continuity

A work stream may pause while unrelated global Build Ledger chronology advances. Preserve stable work-stream identity and its prior accepted anchor. Never reserve or reuse a projected `C###` number. If canonical ledger action becomes relevant, reverify the live ledger head and use separately authorized chain-safe tooling.

## `build-git spawn`

When multi-role separation materially improves the work, `build-git` may route to Active `build-git spawn`. The main session remains the Signalproof Orchestrator. If actual independent spawning is unavailable, use clearly separated logical lanes and state that accurately.

## STOP conditions

STOP when current Git cannot be established; protected state would be weakened outside authority; a high-confidence failure would be repeated unchanged; relevant newer failure evidence is known but uninspected; PowerShell registry state required for a repeat-prone runner is unavailable; exact-final PowerShell parser validation fails; a retry does not state a material changed condition; the proposed mitigation violates security/licensing/legal/authority boundaries; a concurrent change invalidates the contract; a projected ledger sequence is treated as reserved; unresolved evidence requires investigation before implementation; an output would falsely claim independent agents ran; a Candidate is being silently promoted; or canonical ledger/release/production authority is being inferred from this command.

## Maintenance acceptance

Keep regression coverage proving non-build routing, bounded implementation routing, stale-Git detection, known-failure avoidance, open/draft failure-evidence retrieval, Git-backed PowerShell failure-registry loading, exact-final parser preflight, `.Count`/shape prevention, cross-chat failure-count continuity, changed-condition retest, protected-state preservation, build-stream continuity, spawn authority separation, and the U+2014 generated-output rule.
