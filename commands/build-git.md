# `build-git` - Active Operator Command V0.2.2

**Status:** ACTIVE  
**Version:** 0.2.2  
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
4. **Protected-state contract** - establish baseline, forbidden changes, rollback/non-mutation boundary, work-stream identity, and required evidence.
5. **Consume the current Next Action Contract** when one exists. Do not silently redesign it.
6. **Execute only the routed action** within current authority.
7. **Verify incrementally** before stacking additional uncertainty.
8. Apply Review, Security, provenance, recovery, or release gates when material.
9. **Git recheck** before consequential write, merge, publication, or promotion.
10. Preserve outcome, proof, failures, uncertainty, recovery state, learning, and closeout obligations.

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

### Current PowerShell prevention set

For generated or modified Windows PowerShell harnesses when applicable:

- use one complete interactive statement, preferably one `& { ... }` block; do not split `if` and `else` across submissions;
- parser-preflight the exact final staged `.ps1` before execution;
- calculate SHA-256 after final serialization and verify the same artifact before execution;
- preserve failed runners rather than broad-patching or overwriting them;
- do not assume Windows PowerShell 5.1 `ConvertFrom-Json` can represent arbitrary or empty external JSON property names;
- distinguish generic dictionary `.ContainsKey()` from non-generic `IDictionary.Contains()`;
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

STOP when current Git cannot be established; protected state would be weakened outside authority; a high-confidence failure would be repeated unchanged; relevant newer failure evidence is known but uninspected; the proposed mitigation violates security/licensing/legal/authority boundaries; a concurrent change invalidates the contract; a projected ledger sequence is treated as reserved; unresolved evidence requires investigation before implementation; an output would falsely claim independent agents ran; a Candidate is being silently promoted; or canonical ledger/release/production authority is being inferred from this command.

## Maintenance acceptance

Keep regression coverage proving non-build routing, bounded implementation routing, stale-Git detection, known-failure avoidance, open/draft failure-evidence retrieval, PowerShell harness prevention, changed-condition retest, protected-state preservation, build-stream continuity, spawn authority separation, and the U+2014 generated-output rule.
