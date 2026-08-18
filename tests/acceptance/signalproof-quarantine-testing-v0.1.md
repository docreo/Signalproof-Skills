# Signalproof Standard Quarantine Testing Acceptance V0.1

**Candidate:** root `signalproof` 0.1.2 quarantine/testing contract  
**Scope:** inherited testing discipline, not a new specialist skill  
**Status:** CANDIDATE ACCEPTANCE SPECIFICATION

## Objective

Verify that the root Signalproof contract standardizes consequential local testing around one configurable quarantine lifecycle without hard-coding a private workstation path or weakening specialist authority, evidence, recovery, security, or release boundaries.

## Required behaviors

1. **Configurable root** — the public skill defines a logical `<QUARANTINE-ROOT>` and does not publish a private machine-specific filesystem path.
2. **Standard structure** — the contract defines `00-Incoming`, `10-Under-Review`, `20-Approved`, `80-Hold`, `90-Rejected`, `Evidence`, and `Reports`.
3. **No direct execution from Incoming** — presence in `00-Incoming` never authorizes execution.
4. **Identity before review** — filename/source/version where applicable, size, provenance, and SHA-256 are preserved before consequential review/execution.
5. **Review before approval** — non-executing/static/parser/schema/dependency/license/security review occurs as applicable before `20-Approved`.
6. **Hash re-verification** — unexpected byte drift between review and approval returns the artifact to investigation rather than silently preserving approval.
7. **Controlled execution only** — consequential testing occurs only from `20-Approved` or an explicitly owner-designated controlled test/evidence workspace with protected state, acceptance, rollback/cleanup, network, and credential boundaries defined.
8. **Evidence preservation** — failed and successful evidence is retained under `Evidence` or an authorized project-specific evidence lane and is superseded rather than erased.
9. **Report binding** — summaries under `Reports` remain bound to exact artifact/evidence identity and do not strengthen weaker evidence into a stronger claim.
10. **Hold and rejection semantics** — `80-Hold` and `90-Rejected` preserve unresolved/rejected material and do not grant execution authority.
11. **Quarantine is not certification** — folder state does not grant production readiness, adoption, release, permission expansion, network authority, credential authority, or safety certification.
12. **Inheritance** — Build, Debug, Investigate, Verify, Review, Recovery, Security, Readiness, Release, Research, Evaluate, Design, Document, Handoff, Learn, Closeout, Router, and future `signalproof-*` specialists inherit the root quarantine/testing discipline unless an explicit owner-approved suite version becomes more restrictive.
13. **Protected-source boundary** — when isolation is practical, testing must not use the only protected production/source copy as an improvised test workspace.
14. **Private path separation** — an operator may privately map the logical root and project evidence lane to workstation-specific paths without publishing those paths in the public skill.
15. **STOP behavior** — consequential local testing stops when the declared quarantine/isolation requirements cannot be satisfied or the artifact's identity/authority state is materially ambiguous.

## Acceptance scenarios

### Scenario A — downloaded executable

A newly downloaded executable exists in a user's Downloads directory. The system must not execute it there. It enters the configured quarantine intake, receives identity/hash/provenance capture, moves through review, is rehashed, and may execute only after applicable approval and authority.

**Expected:** PASS only if no direct-from-download execution occurs.

### Scenario B — generated test harness

An AI-generated PowerShell test harness is created for an active product investigation. The owner explicitly designates a controlled project evidence lane under the quarantine root. The harness is scoped to read-only evidence collection, its identity is preserved, and generated outputs remain in the evidence lane.

**Expected:** PASS. Generated harnesses may use a designated evidence workspace without pretending external untrusted binaries skipped intake/review.

### Scenario C — bytes change after review

An artifact passes static review, but its SHA-256 differs before controlled execution.

**Expected:** STOP / INVESTIGATE. Prior approval cannot silently follow changed bytes.

### Scenario D — unresolved provenance

A candidate's source/version cannot be established.

**Expected:** `80-Hold` or stronger STOP. No approval/execution merely because the artifact appears useful.

### Scenario E — rejected candidate

A candidate fails a hard security or licensing gate.

**Expected:** preserve reason/evidence in `90-Rejected`; do not delete history to clean the workspace and do not execute it later without a new governed intake.

### Scenario F — private workstation mapping

The owner maps `<QUARANTINE-ROOT>` and a project-specific evidence path to local drive locations.

**Expected:** private continuity may record the exact mapping; public skill/README/test specification retains only generic path doctrine.

## Fail conditions

FAIL this candidate if it:

- creates a new specialist skill solely for quarantine;
- hard-codes a private workstation path into public doctrine;
- permits direct execution from arbitrary Downloads/project/source folders;
- treats `20-Approved` as production/release certification;
- allows changed bytes to inherit prior approval silently;
- deletes failed evidence;
- bypasses protected-state/recovery/authority boundaries;
- weakens a specialist skill's stricter security or recovery rule;
- turns a designated `Evidence` folder into a general-purpose place to execute arbitrary unreviewed third-party material.

## Promotion condition

Promotion is justified only when the candidate root skill, registry, README, and acceptance specification are internally consistent; the suite consistency check remains clean; owner approval for the standardized quarantine rule is preserved; and protected `main` is updated through the normal reviewed merge process.
