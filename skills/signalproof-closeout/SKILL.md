---
name: signalproof-closeout
description: Close a meaningful build milestone before the next development phase by protecting accepted state, recording evidence in the Build Ledger or a staged delta, preserving failures and open gates, evaluating reusable lessons for skill extraction, and explicitly authorizing the next phase. Use at phase boundaries, baseline promotions, owner acceptance, major capability completion, significant defect closure, security/governance decisions, releases, or handoffs.
---

# Signalproof Closeout

## Purpose

`signalproof-closeout` is the milestone-closeout and continuity specialist in the Signalproof Skill Suite. It inherits the active root `signalproof` contract.

Its central rule is:

> **Close the milestone before opening the next one.**

For meaningful milestones, the default sequence is:

**Validate → Record → Extract → Govern → Authorize Next Phase**

A milestone is not complete merely because a feature works, a pull request merged, or a human says “next.” The accepted state, evidence, failures, recovery, and reusable learning must be preserved so the next phase starts from a reconstructable state rather than conversation memory.

## Inheritance

This skill inherits the root Signalproof requirements for human authority, protected state, evidence classification, verification, recovery, STOP conditions, public/private boundaries, proof, and continuity.

It coordinates closeout. It does not create release authority, destructive authority, security clearance, or permission to mutate an unverified canonical Build Ledger.

## Milestone Trigger

Use full milestone closeout when work reaches a meaningful boundary such as:

- owner acceptance of a working candidate;
- designation of a protected or active baseline;
- RD/phase transition;
- release candidate or release promotion;
- completion of a major capability;
- closure of a significant defect;
- architecture/governance boundary decision;
- security, privacy, licensing, or recovery decision;
- transfer/handoff to another builder, account, model, or team;
- a point where the next work depends on the current state being remembered accurately.

Ordinary micro-commits and intermediate edits do not each require full closeout unless explicitly designated as a milestone.

## Closeout Contract

1. **Declare the milestone.** State project, build/release/milestone identity, owner, objective achieved, and exact status.
2. **Protect accepted state.** Identify parent/baseline, rollback/recovery, hashes/manifests where practical, persistent data, and forbidden-change boundaries.
3. **Gather actual evidence.** Record repository/branch/commit/PR/tag, changed files, tests actually run, runtime results, owner observations, artifact hashes, dependencies/licenses where relevant, and known limitations.
4. **Preserve evidence classes.** Static, compile, automated, runtime, owner-observed, security, signing, and release acceptance remain separate.
5. **Update the Build Ledger safely.** Verify the actual canonical ledger identity/head/chain/projection before append. Never hand-edit canonical JSONL or SQLite.
6. **Stage when canonical head is unavailable.** Produce a clearly labeled noncanonical delta and identify the last verified checkpoint instead of inventing a sequence/hash.
7. **Preserve failures and uncertainty.** Later success may supersede state but must not erase failed attempts, blockers, deferred gates, disagreements, or unverified claims.
8. **Extract reusable learning.** Ask whether the milestone created a generalizable lesson, test, policy, checklist, or skill candidate.
9. **Govern reusable capability.** A discovered lesson is not automatically Active. It must follow candidate/testing/approval governance.
10. **Close with explicit next-phase authority.** Begin the next phase only after closeout passes or the human authority explicitly records a justified deferral.

## Workflow

### 1. Declare Milestone

Capture:

- project/product;
- milestone/release/build identity;
- human owner;
- objective achieved;
- current status: candidate, accepted, active, blocked, reverted, retired, etc.;
- next proposed phase.

### 2. Freeze / Protect State

Identify:

- source ref / commit / package;
- accepted baseline;
- protected rollback target(s);
- artifact hashes/manifests where practical;
- customer/user data that must survive;
- security and permission boundaries;
- active configuration/runtime identity where relevant.

A temporary backup is not automatically an approved rollback.

### 3. Gather Evidence

Collect only evidence relevant to reconstructing the milestone:

- repository, branch, commits, PRs, tags;
- changed-file inventory;
- test names and actual results;
- compile/runtime/visual/owner acceptance distinctions;
- artifact hashes;
- SBOM/license/signing status when applicable;
- failures and lessons;
- open blockers and deferred work;
- handoff/report artifacts.

Do not copy secrets, raw credentials, customer data, private reasoning, or unnecessary conversation content into evidence.

### 4. Determine Ledger Path

#### Canonical append path

Use only when the actual current private Build Ledger is available and can be verified.

Before append:

1. locate the canonical `working-ledger` pair;
2. verify ledger ID;
3. verify event count and current head;
4. verify sequence/hash chain;
5. verify SQLite projection;
6. deduplicate proposed stable event IDs.

Then append through approved Build Ledger tooling and re-run chain/projection verification.

#### Staged path

Use when the canonical head is unavailable, inaccessible, stale, or cannot be verified.

Required behavior:

- do not assign a fake canonical sequence;
- do not invent a new canonical event hash;
- do not hand-edit JSONL/SQLite;
- create a staged milestone delta;
- identify the last verified checkpoint;
- mark the record `STAGED / NONCANONICAL / PENDING CHAIN-SAFE INGESTION`;
- preserve enough evidence for later deduplicated ingestion.

### 5. Preserve Failure / Uncertainty

Record material failures that influenced the current state.

Do not:

- rewrite a failed candidate as though it never existed;
- remove blockers to make a promotion look cleaner;
- convert a pending gate into PASS;
- describe security/signing/release clearance that was not actually performed.

### 6. Extract Reusable Learning

Ask:

1. What problem was solved?
2. Is it likely to recur?
3. Is the solution generalizable?
4. What authority was required?
5. What protected state mattered?
6. What failed or wasted time?
7. What test proved success?
8. What should cause STOP next time?
9. Can the lesson survive a model/tool/vendor change?
10. Should it become documentation, a regression test, a policy, or a formal skill?

Classify as:

- no reusable lesson;
- documentation update;
- test/regression update;
- Skill Candidate;
- governance/policy candidate.

### 7. Govern Skill / Policy Changes

Use the Signalproof lifecycle:

**Discovered → Candidate → Tested → Approved → Active → Deprecated/Retired**

Automatic lesson detection must not mean automatic activation.

For public skills, remove private paths, credentials, customer data, private reasoning, and proprietary internals before publication.

### 8. Close the Milestone

Report:

- **Outcome**
- **Changed**
- **Protected**
- **Proof**
- **Failures / lessons**
- **Rollback / recovery**
- **Ledger status** — canonical append or staged delta
- **Skill extraction decision**
- **Open gates**
- **Next phase authorization**

## Closeout Status

Return one of:

- **CLOSED / NEXT PHASE AUTHORIZED** — closeout complete and required authority exists.
- **CLOSED / NEXT PHASE DEFERRED** — closeout complete but next work intentionally deferred.
- **STAGED / PENDING LEDGER INGESTION** — milestone evidence preserved safely but canonical append awaits local-head verification.
- **AWAITING OWNER ACCEPTANCE** — technical evidence exists but required human acceptance is missing.
- **BLOCKED** — required state/evidence/ledger access prevents responsible closeout.
- **STOP** — proceeding would hide failure, lose recovery, expose private data, or mutate an unverified canonical ledger.

## PASS Criteria

Closeout passes when:

- current state can be reconstructed without conversation memory;
- protected state/rollback is explicit where applicable;
- evidence level is honest;
- Build Ledger continuity is canonical or explicitly staged;
- material failures/open gates are preserved;
- reusable lessons were evaluated for skill/test/policy extraction;
- the next builder can identify the correct starting state;
- next phase is explicitly authorized or deliberately deferred.

## STOP Conditions

Stop phase transition when:

- canonical ledger mutation is attempted without verifying the current head;
- the accepted parent/baseline cannot be identified;
- required owner acceptance is missing;
- a failure is being hidden by promotion;
- rollback/recovery would be lost;
- private/secrets content would enter public evidence;
- a proposed skill is being promoted without governance/testing;
- the evidence does not support the success claim being made.

## Standard Phase Boundary

```text
WORK
  ↓
VALIDATE
  ↓
MILESTONE REACHED
  ↓
PROTECT CURRENT STATE
  ↓
UPDATE BUILD LEDGER
  ↓
EXTRACT LESSON / SKILL CANDIDATE
  ↓
GOVERN + TEST REUSABLE CAPABILITY
  ↓
CLOSE OPEN GATES / RECORD DEFERRALS
  ↓
AUTHORIZE NEXT PHASE
```

## Completion Criteria

A Signalproof milestone is closed when the accepted state, evidence, failures, recovery, ledger continuity, reusable learning decision, open gates, and next-phase authority are explicit enough that the project can continue without reconstructing the milestone from chat history.

## Identity

- **Suite:** Signalproof Skills
- **Skill:** `signalproof-closeout`
- **Version:** `0.1.0`
- **Maturity:** Active public baseline
- **Parent:** `signalproof` 0.1.0+
- **Domain:** Milestone closeout, Build Ledger continuity, phase transition, skill extraction, institutional learning
- **Created by:** Doc Reo / Signalproof
