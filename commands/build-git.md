# `build-git` - Active Operator Command V0.2.5

**Status:** ACTIVE  
**Version:** 0.2.5  
**Owner:** Doc Reo

## Purpose

`build-git` is the governed Signalproof next-action command for repository-backed work.

> **Verify current Git, reuse valid proof, avoid known failures, execute the smallest authorized action, verify it, and leave proof.**

`build` does not imply code mutation. Route through the Active Router to the minimum applicable capability. Detailed specialist doctrine belongs in its Skill, Loop, deterministic registry, or test; this command coordinates rather than duplicates it.

## Runtime context

Use `library/EXECUTION-PIPELINE.yaml` and `library/STATE-CAPSULE.md` when applicable. Load root once, compact routing metadata, current capsule, one principal Skill, zero to two required specialists/Loops, and task evidence. Do not replay full logs or already-satisfied doctrine unless the current claim requires it.

## Mandatory sequence

1. **Git preflight** - refetch repo/ref/head before consequential action or when state may have changed.
2. **Router preflight** - select the minimum applicable Active capability set.
3. **Known Failure Preflight** - inspect merged failure intelligence and relevant current open/draft Signalproof candidate evidence when newer failure knowledge may prevent recurrence. Candidate evidence can block a bad path but is not Active authority.
4. **Protected state** - establish baseline, forbidden change, recovery path, workstream identity, acceptance, and authority boundary.
5. Consume valid current state/Next Action Contract; do not silently redesign it.
6. **Cheap checks first** - deterministic parser/schema/known-error/identity checks before expensive reasoning, spawning, or broad test matrices.
7. Execute one routed action inside current authority.
8. Verify the affected claim and rerun only gates invalidated by the change.
9. Add Review, Security, recovery, Human QC, or Release only when material.
10. **Git recheck** before consequential write, merge, publication, promotion, or deployment.
11. Update compact state/proof, failures/uncertainty, and next gate.

## Cost and completion rules

- Reuse still-valid evidence rather than rerunning unchanged tests.
- Do not automatically regress an already-proven product/security claim because a later harness/reporter/display fails. Reopen only when later evidence contradicts, exposes a missing gate, or invalidates prior proof.
- Prefer deterministic checks before agent spawn or larger-model reasoning when they can settle the claim.
- Spawn Builder/Design/Governor only when independent challenge materially improves quality or risk control.
- Preserve failure fingerprints/attempts across chats; a fresh chat does not grant a fresh retry budget.
- Same-failure retry requires a materially changed condition.
- Stop when evidence is sufficient. Build PASS is not Human QC PASS or deployment authority.

## Known Failure Preflight

Match conditions, not words alone: runtime, shell, version, platform, action, harness, symptom, schema/parser, path/encoding, dependency, permissions/security, packaging/provenance/license, and protected-state/chronology pattern. A high-confidence unchanged known-bad path must not run.

### Executable known-error enforcement

When a recurrence rule is machine-checkable, use its validator before handoff/execution. Current PowerShell validator:

```text
python tools/known_error_preflight.py --mode <operator-powershell|powershell-script> <artifact>
```

A validator `BLOCK` must stop handoff of the unchanged artifact. Resolve warnings, prove them inapplicable, or preserve uncertainty. Never weaken a validator to obtain PASS.

### Git-backed PowerShell persistence guard

When PowerShell is relevant, `library/POWERSHELL-FAILURE-REGISTRY.yaml` and `SP-LOOP-POWERSHELL-GUARD` hold detailed prevention. Do not restate the whole registry in active context; load only applicable entries.

Required behavior:

- restore applicable failure IDs, attempt count, mitigation history, and do-not-repeat path;
- choose interactive submission style from the **observed operator environment**; if it has rejected a leading `& { ... }` wrapper, do not repeat that unchanged transport path;
- run applicable executable known-error preflight;
- parser-preflight the exact final staged `.ps1`; byte changes invalidate that validation;
- bind SHA-256 after final serialization when identity matters;
- execute at most once for the exact artifact/condition set;
- state the materially changed condition before same-failure retry;
- carry attempts across chats, filenames, wrappers, prompt rewrites, and cosmetic changes;
- keep expected console output outside executable command blocks;
- preserve structural contracts: use `@($value).Count` only when collection semantics are intended, keep `reason_codes` array-shaped when applicable, avoid self-referential static guards, and inspect structured fields structurally.

JSON 5.1 shape, dictionary membership, reserved variables, native stderr/exit, here-strings, path normalization, harness-vs-product evidence, and optional-property rules remain in the failure registry/tests.

Required state:

`REGISTRY SEARCHED -> APPLICABLE RULES APPLIED -> EXECUTABLE PREFLIGHT PASS WHEN APPLICABLE -> EXACT FINAL ARTIFACT -> PARSER PASS -> STATIC FAILURE CHECK PASS -> AUTHORITY/PROTECTED STATE PASS`

UNKNOWN/FAIL on a required state blocks execution.

## Evidence sufficiency termination

If product/runtime/security/permission evidence is already sufficient and a downstream harness later fails: preserve the failure, identify the unresolved/contradictory claim, consume already-valid evidence instead of rerunning unchanged tests, and route only the smallest action needed. This prevents a reporting defect from triggering a full acceptance replay.

## Exact-final-artifact rule

Before handing over or executing a consequential runner, patch, manifest, config, repair artifact, or paste-ready command, validate the **exact final artifact** as far as possible with applicable parser/compiler/schema, structured, defect-specific, protected-state, and known-error checks. Never quote stale hashes or claim validation that did not occur.

## Generated output typography rule

Signalproof-controlled generated build output must not emit Unicode em dash U+2014 when punctuation is under Signalproof control. Immutable/protected evidence remains untouched.

## Continuity and spawn

Preserve workstream identity and accepted anchor. Never reserve/reuse projected `C###`; canonical Build Ledger work requires separate live-head verification and authority. Use `build-git spawn` only when role separation materially helps. The main session remains Orchestrator; if independent spawning is unavailable, use truthful logical lanes. Spawn does not justify replaying sufficient evidence.

## Compliance and authority

Law, license, Terms of Service, platform policy, access controls, privacy/security, protected-main rules, release/deployment authority, and canonical Build Ledger rules remain binding. Capability cannot waive them for speed or cost.

## STOP conditions

STOP when Git/protected state is unknown; an unchanged known-bad path would repeat; a validator blocks; failure continuity is missing; exact-final validation fails; retry lacks material change; law/license/TOS/security/authority blocks action; concurrent state invalidates the contract; Investigation is required before implementation; agent execution would be falsely claimed; a Candidate would be silently activated; or release/production/canonical-ledger authority would be inferred rather than proven.

## Maintenance acceptance

Keep tests for routing, stale Git, known failures/candidate evidence, PowerShell recurrence/cross-chat memory, observed-console compatibility, exact-final validation, evidence sufficiency, changed-condition retry, protected state, spawn truth, compliance/authority, and U+2014.
