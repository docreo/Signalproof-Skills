# Signalproof Skills

**Human-controlled, evidence-backed skills for building with AI without losing authority, continuity, research integrity, decision integrity, documentation integrity, readiness, recovery, security boundaries, release integrity, or proof.**

> **Control first. AI second. Software third.**
>
> **Build signal. Cut noise. Leave proof.**

Signalproof Skills is a free, open public skill suite for AI-assisted work. It provides reusable operating disciplines for research, evaluation, routing, investigation, planning, readiness, implementation, debugging, verification, review, recovery, defensive security, release governance, durable documentation, milestone closeout, and future learning workflows.

## Root operating contract

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

## Active skills

| Skill | Version | Purpose |
|---|---:|---|
| [`signalproof`](skills/signalproof/SKILL.md) | 0.1.1 | Root governing contract and milestone continuity |
| [`signalproof-router`](skills/signalproof-router/SKILL.md) | 0.1.10 | Selects the smallest appropriate active skill/sequence, including Document routing |
| [`signalproof-research`](skills/signalproof-research/SKILL.md) | 0.1.0 | Establishes what current external evidence supports |
| [`signalproof-evaluate`](skills/signalproof-evaluate/SKILL.md) | 0.1.0 | Converts evidence into bounded dispositions using explicit criteria and hard gates |
| [`signalproof-investigate`](skills/signalproof-investigate/SKILL.md) | 0.1.0 | Determines what failed or what state is true |
| [`signalproof-plan`](skills/signalproof-plan/SKILL.md) | 0.1.0 | Creates a bounded execution contract |
| [`signalproof-readiness`](skills/signalproof-readiness/SKILL.md) | 0.1.0 | Determines whether target prerequisites and authority are actually present |
| [`signalproof-build`](skills/signalproof-build/SKILL.md) | 0.1.0 | Executes an approved bounded implementation |
| [`signalproof-debug`](skills/signalproof-debug/SKILL.md) | 0.1.0 | Reproduces, localizes, corrects, and regression-tests defects |
| [`signalproof-verify`](skills/signalproof-verify/SKILL.md) | 0.1.0 | Determines whether a specific claim is proven |
| [`signalproof-review`](skills/signalproof-review/SKILL.md) | 0.1.0 | Reviews scope fidelity and change integrity |
| [`signalproof-recovery`](skills/signalproof-recovery/SKILL.md) | 0.1.0 | Selects and verifies trustworthy rollback/restoration |
| [`signalproof-security`](skills/signalproof-security/SKILL.md) | 0.1.0 | Governs defensive security assessment |
| [`signalproof-release`](skills/signalproof-release/SKILL.md) | 0.1.0 | Governs exact-artifact promotion/distribution |
| [`signalproof-document`](skills/signalproof-document/SKILL.md) | 0.1.0 | Creates durable documentation without weakening source-of-truth, evidence, version, privacy, or staleness boundaries |
| [`signalproof-closeout`](skills/signalproof-closeout/SKILL.md) | 0.1.0 | Closes meaningful milestones and preserves Build Ledger continuity |

The authoritative status list is [`SKILL-REGISTRY.md`](SKILL-REGISTRY.md).

## Core operating flow

```text
REQUEST
  ↓
ROUTER
  ↓
RESEARCH → EVALUATE
  ↓
INVESTIGATE / PLAN / READINESS
  ↓
BUILD / DEBUG
  ↓
VERIFY → REVIEW → SECURITY / RECOVERY as applicable
  ↓
RELEASE when an exact candidate is being promoted
  ↓
DOCUMENT when established state/results need durable representation
  ↓
CLOSEOUT
  ↓
BUILD LEDGER
```

This is not a mandatory conveyor belt. The router selects the smallest responsible path.

## Documentation integrity

`signalproof-document` asks:

> **How do we represent established state, decisions, procedures, evidence, provenance, limitations, and history without changing their evidentiary meaning?**

Its governing rule is:

> **Document the strongest supported state, identify its source and scope, and never let polished prose outrank verified system evidence.**

A README, handoff, SOP, report, or generated document is not automatically canonical truth. Candidate is not Active. Planned is not implemented. Compile is not runtime verification. Staged Build Ledger evidence is not a canonical append. Security/Release/Readiness claims remain bounded to the evidence that actually established them.

When the factual truth itself is unresolved, Document hands back to Verify or Investigate rather than inventing a clean narrative.

## Discipline boundaries

- **Research:** What does current external evidence establish?
- **Evaluate:** What disposition best fits explicit criteria and constraints?
- **Readiness:** Are required conditions satisfied on this exact target?
- **Verify:** Is this specific claim proven?
- **Review:** Is the work itself sound and contract-faithful?
- **Security:** What material security-sensitive risks affect the decision?
- **Recovery:** What trustworthy state should be restored and how is recovery proven?
- **Release:** May this exact accepted artifact be promoted to this exact distribution boundary?
- **Document:** How should established state/evidence be represented durably without strengthening the claim?
- **Closeout:** Is the meaningful milestone recorded and safe to transition from?

## Skill governance

```text
DISCOVERED → CANDIDATE → TESTED → APPROVED → ACTIVE → DEPRECATED / RETIRED
```

Discovery is not disposition. Recommendation is not authority. Documentation is not proof or promotion.

## Planned specialist lane

Only one original planned specialist lane remains:

- `signalproof-learn`

It is **not active** until its skill, tests, governance review, and acceptance state exist.

## What Signalproof Skills does not claim

Signalproof Skills does not by itself constitute antivirus software, penetration-testing authority, cybersecurity or compliance certification, universal compatibility, or proof of production readiness from a single test. Documentation cannot create technical, security, architecture, release, or execution authority merely by stating it.

## Repository protection

`main` is the canonical public branch. Normal development uses branches and pull requests. Governance preserves review-thread resolution, blocks force pushes/deletion, constrains bypass authority, and avoids requiring CI checks that do not actually exist yet.

## License and marks

Signalproof Skills is licensed under the **Apache License 2.0**. See [`LICENSE`](LICENSE), [`NOTICE`](NOTICE), and [`TRADEMARKS.md`](TRADEMARKS.md).

## Created by

**Doc Reo / Signalproof**

Signalproof exists to help people build with AI while keeping meaningful human control, evidence integrity, decision integrity, documentation integrity, continuity, recovery, and proof.
