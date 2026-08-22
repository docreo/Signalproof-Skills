# `build-git` - Active Operator Command V0.2.5

**Status:** ACTIVE  
**Version:** 0.2.5  
**Owner:** Doc Reo

## Purpose

`build-git` is the governed Signalproof next-action execution command for repository-backed work.

> **Verify current Git, reuse valid proof, avoid known failures, execute the smallest authorized action, verify it, and leave proof.**

`build` does not imply code mutation. Route by current state through the Active Router to the minimum applicable Research, Investigate, Evaluate, Plan, Design, Readiness, Build, Debug, Verify, Review, Security, Recovery, Release, Document, Learn, Handoff, or Closeout capability.

Detailed specialist doctrine belongs in the relevant Skill, Loop, deterministic registry, or test. This command coordinates it; it does not duplicate it.

## Runtime context

Use `library/EXECUTION-PIPELINE.yaml` and `library/STATE-CAPSULE.md` when applicable.

Default load target:

```text
ROOT CONTRACT once
+ COMPACT ROUTING METADATA
+ CURRENT STATE CAPSULE
+ 1 PRINCIPAL SKILL
+ 0-2 REQUIRED SPECIALISTS / LOOPS
+ TASK EVIDENCE
```

Do not replay full logs, handoffs, registries, or already-satisfied stage doctrine unless needed to resolve the current claim.

## Mandatory sequence

1. **Git preflight** - refetch the relevant repo/ref/head before consequential action or when state may have changed.
2. **Router preflight** - select the minimum applicable Active capability set.
3. **Known Failure Preflight** - inspect merged failure intelligence and relevant current open/draft Signalproof candidate evidence when newer failure knowledge may prevent recurrence. Candidate evidence may prevent a bad path but does not become Active authority.
4. **Protected state** - establish baseline, forbidden change, recovery/non-mutation path, workstream identity, acceptance, and authority boundary.
5. **Consume current state/Next Action Contract** when valid; do not silently redesign it.
6. **Cheap checks first** - run applicable deterministic parser/schema/known-error/identity checks before expensive reasoning, spawning, or broad test matrices.
7. **Execute one routed action** inside current authority.
8. **Verify the affected claim** and rerun only gates invalidated by the change.
9. Apply Review, Security, provenance, recovery, Human QC, or Release only when material to the current stage/claim.
10. **Git recheck** before consequential write, merge, publication, promotion, or deployment.
11. Update compact state/proof, preserve failures/uncertainty, and route the next gate.

## Cost and completion rules

- Reuse still-valid evidence rather than rerunning unchanged tests.
- Do not automatically regress an already-proven product/security claim because a later harness/reporter/display fails. Reopen it only when later evidence contradicts it, exposes a missing gate, or invalidates the earlier proof.
- Prefer deterministic checks before agent spawn or larger-model reasoning when they can settle the claim.
- Spawn Builder/Design/Governor lanes only when independent challenge materially improves risk, design, or acceptance quality.
- Preserve failure fingerprints and attempts across chats; a fresh chat does not grant a fresh retry budget.
- A failed path requires a materially changed condition before retry.
- Stop when evidence is sufficient; do not spend more tokens proving an already-proven claim.
- Completion follows the current execution-pipeline boundary. Build PASS is not Human QC PASS, and neither is deployment authority.

## Known Failure Preflight

Match supported conditions, not words alone: runtime, shell, version, platform, action, harness, symptom, schema/parser, path/encoding, dependency, permissions/security, packaging/provenance/license, and protected-state/chronology pattern.

Possible states:

`NO KNOWN MATCH | POSSIBLE MATCH | KNOWN FAILURE / MITIGATION AVAILABLE | KNOWN FAILURE / CONDITIONS CHANGED | KNOWN FAILURE / NO APPROVED MITIGATION | PROHIBITED / STOP`

A high-confidence unchanged known-bad path must not run.

### Executable known-error enforcement

When an applicable recurrence rule is machine-checkable, use its validator before handoff/execution. Current PowerShell validator:

```text
python tools/known_error_preflight.py --mode <operator-powershell|powershell-script> <artifact>
```

A validator `BLOCK` must stop handoff of the unchanged artifact. Warnings must be resolved, shown inapplicable by evidence, or preserved as uncertainty. Never weaken a validator merely to obtain PASS.

### Git-backed PowerShell persistence guard

When PowerShell is relevant, `library/POWERSHELL-FAILURE-REGISTRY.yaml` and `SP-LOOP-POWERSHELL-GUARD` are the detailed prevention authority/data path. Do not restate the whole registry in the active command context.

Required behavior remains:

- restore applicable failure IDs, prior attempt count, mitigation history, and do-not-repeat path;
- choose interactive submission style from the **observed operator environment**; if it has rejected a leading `& { ... }` wrapper, do not repeat that unchanged transport path;
- run applicable executable known-error preflight;
- parser-preflight the exact final staged `.ps1`; if bytes change afterward, validation is invalid and must be repeated on the new exact final artifact;
- bind SHA-256 only after final serialization when byte identity matters;
- execute at most once for the exact artifact/condition set;
- state the material changed condition before same-failure retry;
- carry attempt count across chats, filenames, wrappers, prompt rewrites, and cosmetic changes;
- keep expected console output outside executable command blocks;
- preserve structural contracts: normalize optional collection intent such as `@($value).Count` only when semantically correct; preserve `reason_codes` as array-shaped when the schema allows multiples; avoid self-referential static guards; inspect structured fields structurally rather than using broad text rejection.

PowerShell detailed prevention cases such as JSON 5.1 shape, dictionary membership, reserved variables, native stderr/exit semantics, here-strings, path normalization, harness-vs-product evidence, and optional-property handling remain in the current failure registry and executable tests. Load only applicable entries.

Required pre-execution state:

`REGISTRY SEARCHED -> APPLICABLE RULES APPLIED -> EXECUTABLE PREFLIGHT PASS WHEN APPLICABLE -> EXACT FINAL ARTIFACT -> PARSER PASS -> STATIC FAILURE CHECK PASS -> AUTHORITY/PROTECTED STATE PASS`

UNKNOWN/FAIL on a required state blocks consequential execution.

## Evidence sufficiency termination

Acceptance evidence is claim-specific. If product/runtime/security/permission evidence is already sufficient and a downstream harness later fails:

1. preserve the new failure;
2. identify the exact unresolved or contradictory claim;
3. consume already-valid evidence instead of rerunning unchanged tests;
4. route only the smallest action needed to close that gap.

This prevents a cheap reporting defect from triggering an expensive full acceptance replay.

## Exact-final-artifact rule

Before handing over or executing a consequential runner, patch, manifest, config, repair artifact, or paste-ready command, validate the **exact final artifact** as far as the environment permits. Use applicable parser/compiler/schema checks, structured validation, defect-specific micro-tests, protected-state checks, and known-error preflight. Never quote stale hashes or claim runtime validation that did not occur.

## Generated output typography rule

Signalproof-controlled generated build output must not emit Unicode em dash U+2014 when punctuation is under Signalproof control. This does not permit modifying immutable evidence or protected byte-for-byte inputs.

## Build-stream continuity

Preserve stable workstream identity and accepted anchor even when unrelated chronology moves. Never reserve or reuse a projected `C###`. Canonical Build Ledger action requires separate live-head verification and authority.

## `build-git spawn`

Use Active `build-git spawn` only when role separation materially helps. The main session remains Orchestrator. If independent spawning is unavailable, use truthful logical lanes. Spawn does not justify replaying sufficient evidence; each lane should identify the unresolved evidence class it is addressing.

## Compliance and authority

Technical capability is not authority. Law, license, Terms of Service, platform policy, access controls, privacy/security, protected-main rules, release/deployment authority, and canonical Build Ledger rules remain binding. A command cannot waive them to finish faster or cheaper.

## STOP conditions

STOP when current Git/protected state cannot be established; an unchanged known-bad path would repeat; an applicable validator blocks; required failure continuity is missing; exact-final parser/validation fails; a retry lacks a material changed condition; law/license/TOS/security/authority blocks the action; concurrent state invalidates the contract; evidence is unresolved enough to require Investigation before implementation; an output would falsely claim independent agents ran; a Candidate would be silently activated; or release/production/canonical-ledger authority would be inferred rather than proven.

## Maintenance acceptance

Keep regression coverage for non-build routing, stale-Git detection, known-failure/candidate-evidence retrieval, executable known-error enforcement, PowerShell registry and cross-chat attempt memory, observed-console compatibility, exact-final validation, evidence-sufficiency termination, changed-condition retry, protected state, spawn truth, compliance/authority, and the U+2014 rule.
