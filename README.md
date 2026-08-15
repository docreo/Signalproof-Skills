# Signalproof Skills

**Human-controlled, evidence-backed skills for building with AI without losing authority, continuity, recovery, or proof.**

> **Control first. AI second. Software third.**
>
> **Build signal. Cut noise. Leave proof.**

Signalproof Skills is a free, open public skill suite for AI-assisted work. It provides reusable operating disciplines for routing, investigation, planning, implementation, debugging, verification, review, recovery, milestone closeout, and future specialist workflows.

The suite is designed to help people use capable AI systems without treating capability as permission, replacing working systems without evidence, overstating verification, hiding failed attempts, or losing the path back to a known state.

## Root operating contract

Signalproof is governed around these rules:

1. Human authority remains meaningful.
2. Inspect before rebuilding.
3. Protect what already works.
4. Change the smallest necessary surface.
5. Separate evidence from inference.
6. Verify before declaring success.
7. Preserve recovery.
8. Stop unproductive loops.
9. Leave proof.
10. Turn solved problems into future capability.
11. Close meaningful milestones before opening the next development phase.

Specialist skills may become more restrictive, but they must not silently weaken the root contract.

## Active skills

| Skill | Version | Purpose |
|---|---:|---|
| [`signalproof`](skills/signalproof/SKILL.md) | 0.1.1 | Root governing contract and milestone continuity |
| [`signalproof-router`](skills/signalproof-router/SKILL.md) | 0.1.4 | Selects the smallest appropriate active skill/sequence, including Verify, Review, Recovery, and Closeout routing |
| [`signalproof-investigate`](skills/signalproof-investigate/SKILL.md) | 0.1.0 | Determines what actually failed or what state is actually true |
| [`signalproof-plan`](skills/signalproof-plan/SKILL.md) | 0.1.0 | Creates a bounded execution contract with scope, authority, acceptance, and recovery |
| [`signalproof-build`](skills/signalproof-build/SKILL.md) | 0.1.0 | Executes an approved bounded implementation while preserving protected state |
| [`signalproof-debug`](skills/signalproof-debug/SKILL.md) | 0.1.0 | Reproduces, localizes, corrects, and regression-tests demonstrable defects |
| [`signalproof-verify`](skills/signalproof-verify/SKILL.md) | 0.1.0 | Determines whether a specific claim is actually proven by the required evidence |
| [`signalproof-review`](skills/signalproof-review/SKILL.md) | 0.1.0 | Reviews whether the work itself is sound, scoped correctly, and consistent with protected state/contracts |
| [`signalproof-recovery`](skills/signalproof-recovery/SKILL.md) | 0.1.0 | Selects and verifies a trustworthy rollback, protects persistent data/evidence, and verifies restored state |
| [`signalproof-closeout`](skills/signalproof-closeout/SKILL.md) | 0.1.0 | Closes meaningful milestones, preserves Build Ledger continuity, and governs the next phase |

The authoritative status list is [`SKILL-REGISTRY.md`](SKILL-REGISTRY.md).

## Core operating flow

Not every task needs every skill. The router selects the smallest responsible path.

```text
REQUEST
   ↓
ROUTER
   ↓
INVESTIGATE        when current state/cause is unclear
   ↓
PLAN               when consequential work needs a bounded contract
   ↓
BUILD / DEBUG      implement or correct within the approved boundary
   ↓
VERIFY             prove the material claim or acceptance condition
   ↓
REVIEW             assess the actual work for scope/change integrity
   ↓
RECOVERY           when a failed/rejected state should return to a verified rollback
   ↓
CLOSEOUT           at meaningful milestones and phase boundaries
   ↓
BUILD LEDGER       canonical append when verified; staged delta otherwise
   ↓
LESSON / SKILL CANDIDATE
```

This is not a mandatory conveyor belt. For a narrow task, one specialist may be sufficient. Verify is used when a material claim needs proof. Review is used when the work itself needs quality/change-integrity assessment. Recovery is used when the objective is restoration to a trustworthy known-good state. Closeout is used at meaningful phase boundaries—not every micro-commit.

## Verify, Review, and Recovery are different

`signalproof-verify` asks:

> **Is the claim proven by the required evidence?**

`signalproof-review` asks:

> **Is the work itself sound and consistent with the approved intent, protected state, and governing contracts?**

`signalproof-recovery` asks:

> **What trustworthy known-good state should be restored, what must survive, and how do we prove recovery actually worked?**

A feature can pass its functional test while Review still finds scope creep or unsafe design. A clean Review can coexist with an unverified target-runtime claim. And a folder named `backup` is not automatically a safe rollback. These disciplines do not substitute for one another.

## Evidence discipline

Signalproof keeps these classes distinct:

- **Artifact-Backed Fact**
- **Runtime-Verified Fact**
- **Human-Observed Fact**
- **Design Authority**
- **Inference**
- **Proposal**

A compile PASS is not automatically a runtime PASS. A runtime PASS is not automatically a security audit. A static dependency scan is not automatically a security review. Human observation is legitimate evidence at its own class.

## Skill governance

Public Signalproof learning follows:

```text
DISCOVERED → CANDIDATE → TESTED → APPROVED → ACTIVE → DEPRECATED / RETIRED
```

A lesson discovered during a build does **not** automatically become a Signalproof rule. Candidate changes need an evidence basis, bounded scope, acceptance testing, public/private review, version impact, and human approval before becoming Active.

See [`GOVERNANCE.md`](GOVERNANCE.md) and [`CONTRIBUTING.md`](CONTRIBUTING.md).

## Milestone closeout and Build Ledger

At a meaningful milestone:

```text
VERIFY / REVIEW / RECOVERY GATES AS APPLICABLE
   ↓
PROTECT ACCEPTED STATE
   ↓
UPDATE BUILD LEDGER
   ├─ verified canonical append when the live ledger head is available
   └─ explicitly staged noncanonical delta when it is not
   ↓
PRESERVE FAILURES / OPEN GATES
   ↓
EXTRACT REUSABLE LEARNING
   ↓
AUTHORIZE NEXT PHASE
```

Signalproof does not hand-edit a canonical append-only ledger merely to make the record look complete.

## Planned specialist lanes

These are planned but **not active** until their skill, tests, governance review, and acceptance state exist:

- `signalproof-research`
- `signalproof-evaluate`
- `signalproof-security`
- `signalproof-readiness`
- `signalproof-release`
- `signalproof-document`
- `signalproof-learn`

## What Signalproof Skills does not claim

Signalproof Skills does not by itself constitute antivirus software, cybersecurity certification, universal host compatibility, or proof of production readiness from a single static/behavioral test. Review findings are not a complete security audit unless the defined security review occurred. Recovery success does not itself authorize release or establish security clearance.

## Repository protection

`main` is the canonical public branch. Normal development uses branches and pull requests. Governance is designed to preserve review-thread resolution, block force pushes/deletion, constrain bypass authority, and avoid requiring CI checks that do not actually exist yet.

## License and marks

Signalproof Skills is licensed under the **Apache License 2.0**. See [`LICENSE`](LICENSE), [`NOTICE`](NOTICE), and [`TRADEMARKS.md`](TRADEMARKS.md).

## Created by

**Doc Reo / Signalproof**

Signalproof exists to help people build with AI while keeping meaningful human control, continuity, recovery, and proof.
