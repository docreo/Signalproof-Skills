# `build-git-debug` — Operator Command V0.1 Candidate

**Status:** CANDIDATE / NOT ACTIVE  
**Version:** 0.1.0-candidate  
**Date:** 2026-08-19

## Purpose

`build-git-debug` is the governed Signalproof **repository-backed defect-correction workmode**.

It combines the current-state, known-failure, protected-state, evidence, and Git discipline of `build-git` with the evidence-led localization, bounded correction, regression protection, and failed-loop controls of `signalproof-debug`.

Its central rule is:

> **Do not hand the operator a repair artifact until the defect is localized, the correction is bounded, the exact final artifact has been self-validated as far as the environment permits, and the next run cannot knowingly repeat the same failed condition.**

`build-git-debug` does not grant implementation, security, production, release, privilege, skill-activation, or canonical Build Ledger authority. It coordinates existing authority and current Active skills.

## When to use

Use `build-git-debug` when repository-backed work has a reproducible defect, failed runner, failed build harness, failed validation path, failed test, stale expectation, malformed generated artifact, or recovery state that requires correction rather than ordinary next-action routing.

Examples:

- a generated PowerShell runner fails before or after target execution;
- a native-process wrapper misreads success/failure;
- a static assertion is semantically wrong;
- a hash, manifest, path, version, schema, or literal embedded in a runner is malformed or stale;
- a patch has already persisted but its outer wrapper failed;
- a prior correction must not be repeated because the conditions are unchanged;
- a failed lane must be preserved while work continues from the exact persisted stage.

Do not use `build-git-debug` merely because implementation is difficult. If the failing layer is unknown, route first to investigation. If no defect exists, use normal `build-git`.

## Governing sequence

For consequential debugging:

1. **Git preflight** — refetch the current repository branch/head and verify the intended base.
2. **Known Failure Preflight** — read `signalproof-known-errors` and applicable prior evidence before selecting a correction path.
3. **Failure-layer classification** — distinguish product/source, dependency/runtime, harness/wrapper, evidence/serialization, operator/staging, environment, security/authority, and expectation/contract failures.
4. **Persisted-state inspection before retry** — determine exactly how far the failed operation progressed. Never assume an outer STOP means the inner mutation did not occur.
5. **Reproduction / changed-condition contract** — state the exact symptom, expected result, observed result, prior attempts, and what materially changed before any retest.
6. **Bounded correction contract** — identify target cause, changed surface, protected surfaces, rollback/non-mutation boundary, acceptance test, regression tests, and STOP conditions.
7. **Artifact self-validation before operator handoff** — validate the exact final artifact, not an earlier draft or inferred equivalent.
8. **Execute only the smallest supported correction.**
9. **Retest the original failing condition exactly.**
10. **Run protected-state and regression verification.**
11. **Git recheck before consequential repository write/publication/promotion.**
12. **Closeout** — preserve failed attempts, final evidence, recovery state, known-error recurrence/mitigation learning, and the next governed action.

## Mandatory artifact self-validation gate

Before a consequential generated runner, script, patch, manifest, configuration, or repair artifact is handed to the operator, perform every applicable check below.

### 1. Exact-final-byte validation

- validate the artifact **after all edits**;
- compute its final cryptographic hash only after validation-relevant edits are complete;
- do not quote a stale hash from a prior draft;
- when byte identity matters, ensure the handed-off artifact is the same byte sequence that was validated.

### 2. Parser / compiler / syntax validation

When the required parser/runtime/compiler is available, run it against the exact final artifact.

Examples:

- PowerShell AST parser for `.ps1`;
- `node --check` for JavaScript;
- Python compile/parser checks;
- schema validation for JSON/YAML/XML;
- compiler/build-system validation where appropriate.

If the environment cannot run the required validator, state that limitation explicitly and embed a safe operator-side preflight. Never claim a validator was run when it was not.

### 3. Structured literal-shape validation

Machine-check literals that have a defined format before handoff. Examples include:

- SHA-256: `^[0-9A-Fa-f]{64}$`;
- SHA-1: `^[0-9A-Fa-f]{40}$` when intentionally required;
- GUID/UUID shape;
- semantic versions;
- ports and numeric ranges;
- timestamps;
- exact filenames/extensions;
- application/capability/operation/permission identifiers;
- branch/ref/commit identifiers.

A visually plausible value is not sufficient. Validate length and grammar programmatically.

### 4. Cross-reference consistency

For repeated authority-critical literals:

- compare all copies of the same expected hash/version/path/identity;
- ensure a correction changed every intended reference and no unrelated reference;
- detect truncated, stale, transposed, or partially copied literals;
- prefer one authoritative variable over duplicated literals when feasible.

### 5. Path / staging validation

Before handoff:

- verify the intended filename and controlled destination;
- account for the operator's actual staging/download pattern;
- provide auto-stage only when it can identify the exact artifact by cryptographic hash;
- never overwrite an unexpected file at the controlled target;
- avoid recursive broad searches when a narrower bounded location is known.

### 6. Shell/runtime semantic validation

Do not rely on syntax validation alone. Check known semantic traps for the target environment, including:

- PowerShell collection scalar unwrapping;
- automatic/read-only variable collisions;
- wildcard semantics in `-like` and similar operators when exact literals are intended;
- native process stdout/stderr/exit-code behavior;
- generated-language escaping and delimiter framing;
- Windows path normalization and quoting;
- async process completion and post-exit state;
- serialization depth, cycles, or high-CPU evidence writers.

### 7. Minimal synthetic / micro-fixture test

When feasible, run the changed helper or logic against a synthetic fixture before operator handoff.

Examples:

- prove a hash validator accepts a 64-character SHA-256 and rejects a 61-character truncation;
- prove an exact-string matcher handles `?`, `[`, and `]` literally;
- prove a process wrapper returns integer exit `0` and nonzero correctly;
- prove a serializer completes on the intended object shape;
- prove a recovery runner refuses an already-mutated or already-closed state.

The fixture must exercise the **specific defect mechanism**, not merely unrelated syntax.

### 8. Negative test

For guards whose purpose is to reject invalid state, test at least one invalid input when feasible. A guard is not proven merely because the valid case passes.

### 9. Protected-state proof

A repair artifact must preserve the declared protected boundary. When the correction is harness-only, the product/runtime should remain untouched unless separate authority explicitly permits otherwise.

### 10. Handoff truth statement

Before the operator runs the artifact, report only what was actually validated:

- `VALIDATED LOCALLY` — exact relevant validator/test ran on the final artifact;
- `STATICALLY VALIDATED / OPERATOR RUNTIME CHECK REQUIRED` — local environment lacks the required runtime;
- `UNVALIDATED / DO NOT RUN` — a required safety gate could not be completed.

Do not collapse these evidence classes.

## Failure-layer rules

### Harness / wrapper failure

If a wrapper fails after an inner action may have completed:

1. preserve the failed runner and logs;
2. inspect persisted state;
3. determine the exact last completed stage;
4. do not rerun a mutating operation unless the persisted state proves it did not occur;
5. continue with a validator or tail-only recovery when possible.

### Staging failure

A missing downloaded/staged runner is an operator-artifact-location failure, not a product failure. Correct staging without generating a new implementation artifact.

### Expected-literal failure

When actual runtime evidence is correct but an embedded expected value is malformed or stale, classify the failure as harness/expectation failure. Correct the expected authority only from trusted evidence, then self-test its format and cross-references before handoff.

### Static assertion failure

Exact source literals must use exact/literal-safe comparison. Do not let shell wildcard syntax reinterpret source characters such as `?`, `[`, or `]`.

### Native-process failure

Capture stdout/stderr independently and rely on the actual exit/result contract plus required artifacts. Do not infer native failure from stderr presence alone.

### Serialization / closeout failure

If implementation and tests already passed but evidence serialization hangs/fails, preserve the completed candidate and use a tail-only recovery. Do not rerun implementation merely to recreate evidence.

## Failed-loop escalation

`build-git-debug` inherits the `signalproof-debug` failed-fix loop rule.

After each unsuccessful correction:

- preserve the attempt;
- state what new evidence was gained;
- revise the hypothesis;
- refuse the same approach under unchanged conditions.

After **three materially unsuccessful correction attempts against the same unresolved symptom**, default to STOP and return to deeper investigation unless explicit human authority directs otherwise.

A superficial rename or wrapper variation does not reset the count.

## Relationship to `build-git`

`build-git` is the general governed next-action execution workmode and may route to Debug when appropriate.

`build-git-debug` is the explicit **debug-specialized invocation**. It means:

> `build-git` governance + forced Debug/Known-Error discipline + mandatory pre-handoff artifact self-validation.

Use `build-git-debug` when the user wants the debugging discipline explicitly applied and retained as part of the command contract.

## Relationship to `signalproof-debug`

`signalproof-debug` remains the Active specialist skill defining evidence-led debugging behavior.

`build-git-debug` does not replace it. The command coordinates:

- `build-git` current-Git / protected-state / continuity discipline;
- `signalproof-debug` defect localization and bounded correction;
- `signalproof-known-errors` recurrence prevention;
- `signalproof-investigate` when root cause is not yet supported;
- `signalproof-build` only when an implementation correction is actually justified;
- verification/security/review/closeout skills as required by the affected boundary.

## Initial acceptance scenarios

Before promotion from Candidate, prove at least the following on real or controlled repository-backed work:

1. **Malformed SHA literal prevention** — a truncated SHA-256 embedded in a generated runner is detected before operator handoff; a valid 64-hex SHA passes.
2. **Harness-versus-product discrimination** — a wrapper failure after persisted work does not cause a blind re-run of the mutation.
3. **Exact-literal wildcard prevention** — source containing `?`, `[` or `]` is matched literally rather than through wildcard semantics.
4. **Native exit-code handling** — a successful native process returns success even if stderr contains non-fatal text, while nonzero exit remains a failure.
5. **Changed-condition retest** — the same previously failed path is allowed only after the command records a material changed condition.
6. **Three-attempt STOP rule** — repeated unsuccessful correction against one unresolved symptom routes back to investigation.
7. **Protected-state regression** — the correction passes while protected hashes/state remain exact.
8. **Staging separation** — a missing runner is classified and corrected as staging, not product failure.
9. **Evidence-tail recovery** — completed implementation/test state can be closed without repeating implementation when only serialization/closeout failed.

## STOP conditions

STOP when:

- current Git state is unknown before consequential action;
- the failing layer is still unknown and the proposed correction is speculative;
- a required final-artifact validator is available but has not been run;
- a structured authority-critical literal fails its shape/length test;
- a quoted expected hash/version/path cannot be traced to trusted evidence;
- the proposed retry repeats the same failed path under unchanged conditions;
- persisted-state inspection is required before mutation retry but has not occurred;
- protected state must be modified outside authority;
- the third materially unsuccessful correction attempt has been reached without deeper investigation or explicit authority;
- the command would claim runtime validation that did not actually run;
- Git moved and invalidated the candidate base before write/promotion;
- canonical ledger/release/production authority is being inferred from this command.

## Closeout learning

At meaningful debug closeout, determine whether the defect supports:

- a recurrence of an existing Known Error;
- a stronger prevention rule;
- a new candidate Known Error;
- a regression fixture;
- a command test;
- a root/specialist skill update.

Do not activate or promote new policy solely because one candidate command was created. Follow normal Signalproof skill/command governance.

## Identity

- **Suite:** Signalproof Skills
- **Command:** `build-git-debug`
- **Version:** `0.1.0-candidate`
- **Maturity:** Candidate / not Active
- **Parent workmode:** `build-git`
- **Primary specialist:** `signalproof-debug`
- **Mandatory recurrence catalog:** `signalproof-known-errors`
- **Domain:** governed repository-backed defect correction, harness recovery, pre-handoff artifact self-validation
- **Created by:** Doc Reo / Signalproof
