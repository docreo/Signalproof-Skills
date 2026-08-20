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

### Executable known-error enforcement

When a recurrence rule is machine-checkable and an applicable validator exists, run the validator before handing the consequential artifact or paste-ready command to the owner. Human-readable known-error doctrine remains the source of meaning; executable checks are recurrence-prevention gates, not new authority.

Current validator:

```text
python tools/known_error_preflight.py --mode <operator-powershell|powershell-script> <artifact>
```

A validator `BLOCK` must stop handoff of the unchanged artifact. A validator warning must be resolved, explicitly justified as inapplicable, or preserved as uncertainty before consequential execution. Do not weaken a validator merely to obtain PASS.

### Current PowerShell prevention set

For generated or modified Windows PowerShell harnesses when applicable:

- choose interactive submission style from the **observed operator environment**, not from a generic PowerShell recipe. If the current console/workflow has rejected a leading `& { ... }` wrapper, do not emit that wrapper again for that environment; prefer validated file execution or sequential statements compatible with the observed console path;
- do not split an `if` and its `else` across separate interactive submissions; where line-by-line console transport is in use, prefer control flow that does not require a separately submitted `else`;
- parser-preflight the exact final staged `.ps1` before execution;
- calculate SHA-256 after final serialization and verify the same artifact before execution;
- preserve failed runners rather than broad-patching or overwriting them;
- do not assume Windows PowerShell 5.1 `ConvertFrom-Json` can represent arbitrary or empty external JSON property names;
- distinguish generic dictionary `.ContainsKey()` from non-generic `IDictionary.Contains()`;
- check property presence before dereferencing heterogeneous report objects;
- normalize values that may be null/scalar before cardinality checks under StrictMode, for example `@($value).Count` when collection semantics are intended;
- compute parser-sensitive multiline values first instead of embedding ambiguous expressions;
- classify parser/harness STOP as harness evidence, not product failure, unless separate evidence proves product actuation;
- keep expected console output outside executable command blocks;
- canonicalize filesystem paths before deriving relative paths;
- capture native stdout, stderr, and exit status separately; stderr presence alone is not failure authority;
- reject nested same-delimiter here-string serialization when it can prematurely terminate the outer payload;
- avoid self-referential static guards whose forbidden literal appears inside the guard itself; construct the needle or inspect parsed structure instead;
- preserve array-shaped contracts such as `reason_codes` as arrays; use membership checks rather than collapsing them into fragile scalar equality when the schema permits multiple values;
- inspect structured fields structurally. Do not use broad text regexes that reject safe metadata merely because a field name contains a sensitive term, such as a boolean explicitly recording that private-key persistence is false.

## Evidence sufficiency termination

Acceptance claims belong to evidence classes. Once the required product, runtime, security, or permission claim has been independently established by sufficient accepted evidence, a later harness, reporter, finalizer, display, or transport defect must be classified against its own evidence class.

Do not automatically regress an already-proven product/security claim or replay an expensive acceptance matrix merely because a downstream harness reports a false negative. Reopen the proved claim only when the later evidence actually contradicts the accepted evidence, reveals a missing required gate, or establishes that the prior evidence was invalid.

When evidence is sufficient but a harness fails afterward:

1. preserve the harness failure;
2. identify the exact unproven or contradictory claim, if any;
3. consume already-valid evidence instead of rerunning unchanged tests;
4. route the smallest read-only or corrective action needed to close the remaining evidence gap.

## Exact-final-artifact rule

Before handing an operator a consequential generated runner, patch, manifest, config, repair artifact, or paste-ready command, validate the exact final artifact as far as the environment permits. Use parser/compiler/schema checks, structured-literal validation, cross-reference checks, defect-specific micro-fixtures or negative tests, protected-state checks, and applicable executable known-error preflight.

Observed target-environment behavior outranks a generic language recipe for handoff formatting. Do not quote stale hashes or claim runtime validation that did not occur.

## Generated output typography rule

Signalproof-controlled generated build output MUST NOT emit Unicode em dash U+2014 when punctuation is under Signalproof control. Use commas, colons, semicolons, parentheses, or ASCII hyphen-minus instead.

This rule does not authorize rewriting immutable source evidence, quoted external evidence, checksum-covered artifacts, or protected byte-for-byte inputs.

## Build-stream continuity

A work stream may pause while unrelated global Build Ledger chronology advances. Preserve stable work-stream identity and its prior accepted anchor. Never reserve or reuse a projected `C###` number. If canonical ledger action becomes relevant, reverify the live ledger head and use separately authorized chain-safe tooling.

## `build-git spawn`

When multi-role separation materially improves the work, `build-git` may route to Active `build-git spawn`. The main session remains the Signalproof Orchestrator. If actual independent spawning is unavailable, use clearly separated logical lanes and state that accurately.

Spawn does not require replaying already-sufficient evidence. Builder, Design, and Governor lanes must each identify which evidence class remains unresolved before proposing another consequential test.

## STOP conditions

STOP when current Git cannot be established; protected state would be weakened outside authority; a high-confidence failure would be repeated unchanged; an applicable executable known-error validator blocks the artifact; relevant newer failure evidence is known but uninspected; the proposed mitigation violates security/licensing/legal/authority boundaries; a concurrent change invalidates the contract; a projected ledger sequence is treated as reserved; unresolved evidence requires investigation before implementation; an output would falsely claim independent agents ran; a Candidate is being silently promoted; or canonical ledger/release/production authority is being inferred from this command.

## Maintenance acceptance

Keep regression coverage proving non-build routing, bounded implementation routing, stale-Git detection, known-failure avoidance, open/draft failure-evidence retrieval, PowerShell harness prevention, observed-console compatibility, executable known-error enforcement, evidence-sufficiency termination, changed-condition retest, protected-state preservation, build-stream continuity, spawn authority separation, and the U+2014 generated-output rule.
