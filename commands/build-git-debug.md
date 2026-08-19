# `build-git-debug` - Active Operator Command V0.1

**Status:** ACTIVE  
**Version:** 0.1.0  
**Owner:** Doc Reo

## Purpose

`build-git-debug` is the debug-specialized form of `build-git` for repository-backed defects, failed runners, failed build/test harnesses, stale expectations, malformed generated artifacts, and recovery states requiring bounded correction.

> **Localize the defect, inspect what actually persisted, correct the smallest supported cause, validate the exact final repair artifact, retest the original failure, and leave proof.**

It combines Active `build-git`, `signalproof-debug`, `signalproof-known-errors`, and applicable Verify/Investigate/Recovery/Security disciplines. It does not grant new authority.

## Mandatory sequence

1. **Git preflight** - refetch current repo/ref/head and verify the intended base.
2. **Known Failure Preflight** - inspect merged and relevant current candidate failure evidence before selecting a correction path.
3. **Failure-layer classification** - distinguish product/source, dependency/runtime, harness/wrapper, parser/static, staging/path, expectation/contract, evidence/serialization, environment, and security/authority failures.
4. **Persisted-state inspection before retry** - determine exactly how far the failed operation progressed. An outer STOP does not prove an inner mutation did not occur.
5. **Reproduction / changed-condition contract** - state exact symptom, expected result, observed result, prior attempts, and what materially changed.
6. **Bounded correction contract** - identify supported cause, allowed changed surface, protected surfaces, rollback/non-mutation boundary, acceptance test, regression tests, and STOP conditions.
7. **Exact-final artifact validation before handoff**.
8. Execute only the smallest supported correction.
9. Retest the original failing condition exactly.
10. Verify protected state and regressions.
11. Recheck Git before consequential repository write, merge, publication, or promotion.
12. Preserve failed attempts, final evidence, recovery state, recurrence learning, and next governed action.

## Exact-final artifact gate

For consequential generated runners, scripts, patches, manifests, configs, or repair artifacts, perform every applicable check after all edits:

- identify exact final bytes;
- compute final cryptographic hash only after validation-relevant edits are complete;
- parser/compiler/schema validate the exact final artifact when tooling exists;
- validate structured authority-critical literals programmatically, such as SHA-256 `^[0-9A-Fa-f]{64}$`, versions, ports, identifiers, refs, and paths;
- cross-check duplicated expected hashes/versions/paths/identities for truncation or stale copies;
- verify controlled filename/destination and staging identity;
- check target-shell/runtime semantics, including PowerShell parser behavior, native stdout/stderr/exit status, collection scalar behavior, path normalization, and serialization boundaries;
- run a defect-specific micro-fixture when feasible;
- run a negative test for guards when feasible;
- verify protected-state/non-mutation requirements;
- report validation truth accurately.

Validation truth classes:

- `VALIDATED LOCALLY`
- `STATICALLY VALIDATED / OPERATOR RUNTIME CHECK REQUIRED`
- `UNVALIDATED / DO NOT RUN`

Never claim a validator ran when it did not.

## Failure-layer rules

### Harness/wrapper failure

If an outer wrapper fails after an inner action may have completed, preserve the runner/logs, inspect persisted state, identify the last completed stage, and avoid repeating the mutation when it already persisted.

### Staging failure

A missing downloaded/staged runner is a staging/artifact-location failure until product evidence says otherwise. Correct staging without manufacturing a product repair.

### Expected-literal failure

If runtime state is correct but the embedded expected value is malformed or stale, classify it as harness/expectation failure. Correct only from trusted evidence and validate shape/cross-references before handoff.

### Native-process failure

Capture stdout/stderr independently and use the actual exit/result contract plus required artifacts. Do not infer native failure from stderr presence alone.

### Evidence/serialization tail failure

If implementation/tests already passed but evidence writing failed, preserve the completed candidate and prefer tail-only recovery. Do not rerun implementation simply to recreate closeout evidence.

## Retry discipline

After each unsuccessful correction, preserve the attempt, state what new evidence was gained, revise the hypothesis, and refuse the same approach under unchanged conditions.

After **three materially unsuccessful correction attempts against the same unresolved symptom**, default to STOP and return to deeper Investigation unless explicit human authority directs otherwise. Cosmetic wrapper changes do not reset the count.

## Authority boundary

This command does not grant protected-state overwrite, destructive cleanup, privilege elevation, credentials/secrets use, security weakening, production/release, Candidate activation, Hermes/model execution, or canonical Build Ledger append.

## STOP conditions

STOP when current Git is unknown; failing layer remains too uncertain for a bounded correction; a required available final-artifact validator has not run; an authority-critical literal fails its shape test; expected identity cannot be traced to trusted evidence; the proposed retry repeats an unchanged failed condition; persisted-state inspection is required but incomplete; protected state would change outside authority; the third materially unsuccessful attempt is reached without deeper Investigation/authority; runtime validation would be falsely claimed; or Git movement invalidates the correction basis.

## Maintenance acceptance

Retain regression cases for malformed literal prevention, harness-versus-product discrimination, exact-literal comparison, native exit handling, changed-condition retest, three-attempt STOP, protected-state preservation, staging separation, and evidence-tail recovery. Historical evidence may support a rule without being rewritten into stronger claims than it proves.
