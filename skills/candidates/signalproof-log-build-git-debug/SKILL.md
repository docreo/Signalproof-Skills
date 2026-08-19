---
name: signalproof-log-build-git-debug
description: Preserve debug-state continuity before the next repository-backed correction by logging current evidence, designing the next bounded action, and executing only through build-git-debug with known-error and final-artifact validation discipline.
---

# Signalproof Log Build Git Debug

## Status

**CANDIDATE / NOT ACTIVE**

## Purpose

`signalproof-log-build-git-debug` is the continuity specialist for debug work that must remain evidence-bound across failed runners, partial success, harness defects, recovery tails, and repeated correction attempts.

Its core rule is:

> **Preserve the debug state first, design from what actually persisted, then execute only the smallest supported correction.**

The skill exists because a debugging session can fail even when the product did not. An outer wrapper may stop after a patch persisted, a test may pass before evidence serialization fails, a staging problem may masquerade as a build problem, or a malformed expected literal may falsely report protected-state drift. This skill keeps those layers distinct and durable before another action occurs.

## Composition

The operator-facing command is:

`log-build-git-debug`

The ordered control flow is:

```text
log-skill
   ↓
design-git
   ↓
build-git-debug
```

This skill does not replace `signalproof-debug`. It coordinates continuity around it.

## Contract

1. Preserve the current debug/recovery work unit before another consequential retry.
2. Record the exact symptom, supported failure layer, persisted state, failed-attempt count, changed conditions, protected boundary, and what did or did not execute.
3. Do not infer product failure from a harness, staging, serialization, expectation, parser, or wrapper failure.
4. Do not rerun a mutation until persisted-state inspection proves it is still required.
5. Reuse accepted mitigations and Known Error guidance when applicability conditions match.
6. Require a material changed condition before retrying a previously failed path.
7. Use `design-git` to emit one bounded Debug Next Action Contract.
8. Use `build-git-debug` for the correction/recovery when debugging is still the correct route.
9. Validate the exact final repair artifact after all edits and before operator handoff.
10. Machine-check structured authority-critical literals such as SHA-256, versions, refs, ports, paths, and identifiers.
11. Use parser/compiler/schema checks when available; otherwise require a truthful operator-side runtime/parser preflight.
12. Prefer tail-only recovery when implementation/tests already passed and only evidence/closeout failed.
13. Preserve failed lanes, traces, reports, manifests, and rollback/non-mutation evidence.
14. After three materially unsuccessful correction attempts against one unresolved symptom, stop and return to deeper investigation unless explicit human authority directs otherwise.
15. When the defect is already fixed, route to Review, Verify, Security, Closeout, or another applicable specialist instead of forcing another correction.

## Debug State Record

Preserve as applicable:

- stable work/build-stream identity;
- governing Git/ref/head;
- current milestone state;
- exact failed action/input;
- expected versus observed behavior;
- strongest supported failure layer/cause;
- evidence class and confidence;
- failed-attempt identities/count;
- exact persisted candidate/product state;
- protected state and integrity anchors;
- rollback/non-mutation boundary;
- actions that completed before failure;
- actions that definitely did not execute;
- Known Error/failure-intelligence matches;
- material changed conditions;
- final-artifact validation truth class;
- unresolved security/authority/provenance/licensing/legal gates;
- next review/closeout obligation;
- public/private evidence classification.

Stable failure identity must not depend on Build Ledger `C###` numbering.

## Debug Next Action Contract

`design-git` should produce a compact contract containing:

```text
DEBUG NEXT ACTION CONTRACT
Work stream: <stable identity>
Git basis: <repo/ref/head>
Symptom: <exact observable failure>
Supported layer/cause: <supported / unknown>
Persisted state: <what already completed>
Prior failed attempts: <count / identities>
Material changed condition: <what differs now>
Protected state: <must not change>
Allowed correction surface: <bounded surface>
Known-error constraints: <IDs/rules/none>
Final-artifact validation: <required checks>
Original reproduction: <exact retest>
Regression proof: <protected behavior>
Authority dependencies: <if any>
STOP: <conditions requiring halt/re-design>
Next review/closeout trigger: <when applicable>
```

If the cause is not sufficiently localized, route to `signalproof-investigate` instead of correction.

## Final-Artifact Gate

Before a repair runner/script/patch/configuration is handed to the operator, require all applicable checks:

- exact final bytes identified;
- final cryptographic hash computed only after edits are complete;
- parser/compiler/schema validation on the final artifact when available;
- structured literal shape validation;
- cross-reference consistency for duplicated expected hashes/versions/paths/identities;
- target path/staging validation;
- semantic checks for shell/runtime traps;
- defect-specific micro-fixture or negative test when feasible;
- protected-state/non-mutation proof;
- honest validation truth statement.

Examples of mandatory literal checks:

- SHA-256 must match `^[0-9A-Fa-f]{64}$`;
- SHA-1, when intentionally used, must match `^[0-9A-Fa-f]{40}$`;
- ports must be numeric and in range;
- branch/ref/commit identifiers must match the intended repository evidence;
- capability/application/operation/permission identifiers must be exact, not visually inferred.

A value that merely looks correct is not sufficient.

## Failure-Layer Separation

Keep the following distinct:

- product/source failure;
- dependency/runtime failure;
- harness/wrapper failure;
- parser/static-analysis failure;
- staging/artifact-location failure;
- expectation/contract/literal failure;
- evidence serialization/closeout failure;
- environment/process-residue failure;
- security/authority/provenance failure.

The final status must identify the strongest supported layer rather than flattening everything into `BUILD FAIL`.

## Retry Discipline

A retry is supported only when:

- the prior cause is corrected; or
- a material changed condition is documented; or
- a previously untested discriminating hypothesis justifies the attempt.

A renamed runner, altered wrapper text, or cosmetic variation does not reset the retry count.

When an outer script fails after a mutating inner step may have completed:

1. preserve the failed script/logs;
2. inspect persisted state;
3. identify the exact last completed stage;
4. do not repeat the mutation if it already persisted;
5. continue with verification/tail recovery when possible.

## Build 8A Provenance Case

The initial motivating case was Build 8A Phase C C1:

- harness and wrapper failures occurred after partial progress;
- persisted-state inspection prevented blind mutation reruns;
- a tail-only recovery avoided re-running an already-passed patch/security suite;
- an expected protected-file SHA-256 had been truncated to 61 characters while the live SHA-256 was 64 characters;
- pre-handoff shape validation was added for all protected SHA-256 literals;
- the corrected final runner passed Windows PowerShell parser validation;
- all protected anchors passed independent hash verification;
- 21/21 preserved security regressions passed without rerun;
- protected Core, Gate-7 provenance, and mutable RD1 working source remained unchanged;
- the final C1 state was Candidate PASS pending independent review/security.

This case proves the usefulness of the architecture. It does not alone make this skill Active.

## Relationship to Existing Skills

- `signalproof-debug` — defect localization, bounded correction, regression proof.
- `signalproof-known-errors` — mandatory recurrence/preflight intelligence.
- `signalproof-investigate` — deeper localization when cause is not supported.
- `signalproof-verify` — claim/evidence verification.
- `signalproof-review` — independent scope/change-integrity review.
- `signalproof-security` — security-boundary review where material.
- `signalproof-closeout` — milestone closeout and chronology governance.
- `signalproof-handoff` — conversation/session continuity when debug work crosses boundaries.

This skill should remain orchestration/continuity-focused and must not duplicate detailed Debug or Known Errors doctrine unnecessarily.

## Status Outputs

Return one of the strongest supported states, such as:

- **LOGGED / DEBUG CONTRACT READY**
- **LOGGED / INVESTIGATION REQUIRED**
- **LOGGED / HARNESS FIX VERIFIED**
- **LOGGED / PRODUCT FIX VERIFIED**
- **LOGGED / RECOVERY TAIL COMPLETE**
- **LOGGED / DEBUG COMPLETE / REVIEW REQUIRED**
- **LOGGED / DEBUG COMPLETE / SECURITY REVIEW REQUIRED**
- **LOGGED / MILESTONE CLOSEOUT REQUIRED**
- **BLOCKED**
- **STOP**

Do not claim `FIX VERIFIED` solely because a repair artifact was generated or parsed.

## Authority Boundary

This skill does not grant:

- protected-state overwrite;
- destructive host cleanup beyond a separately authorized cleanup contract;
- privilege elevation;
- security-control weakening;
- credentials/secrets access;
- release/deployment;
- direct protected-main mutation;
- Hermes/model/tool execution that remains separately gated;
- skill/policy activation;
- canonical Build Ledger append without separate chain-safe authority.

## STOP Conditions

STOP when:

- debug state cannot be preserved without fabricating chronology or leaking private data;
- governing Git/current persisted state is materially ambiguous;
- the proposed retry repeats a high-confidence known failure under unchanged conditions;
- the failing layer remains unknown and a fix would be speculative;
- a prior mutation may already have completed and persisted-state inspection has not occurred;
- the exact-final artifact has not passed available validators;
- an authority-critical literal fails format/length validation;
- protected-state integrity is unknown or fails;
- the third materially unsuccessful attempt is reached without deeper investigation or explicit authority;
- debugging is complete and another specialist now owns the next action.

## Candidate Acceptance Requirements

Before promotion, demonstrate at least:

1. open failed/recovery state is preserved without false closure;
2. persisted-state inspection prevents a blind mutation rerun;
3. Known Error evidence changes a retry/design decision;
4. malformed final repair artifact is rejected before handoff;
5. valid final artifact reaches the operator with truthful validation classification;
6. evidence-tail recovery succeeds without re-running completed implementation/tests;
7. unchanged repeat path is stopped;
8. three-attempt escalation is exercised;
9. protected state remains exact through a successful correction;
10. completed debug routes onward to Review/Verify/Security/Closeout rather than another fix;
11. repeated logging is idempotent for the same failure/current-state identity;
12. public/private and Build Ledger chronology boundaries remain intact.

## Skill Architecture

This skill is intentionally small and cohesive: it owns debug-state continuity and command composition, while detailed correction mechanics remain in `signalproof-debug` and recurrence catalogs remain in Known Errors/failure-intelligence structures.

## Identity

- **Suite:** Signalproof Skills
- **Skill:** `signalproof-log-build-git-debug`
- **Version:** `0.1.0-candidate`
- **Maturity:** Candidate / Not Active
- **Parent:** `signalproof` 0.1.1+
- **Command:** `log-build-git-debug`
- **Primary domain:** debug-state preservation, governed retry continuity, pre-handoff repair validation
- **Created by:** Doc Reo / Signalproof
