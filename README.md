# Signalproof Skills

**Human-controlled, evidence-backed skills for building with AI without losing authority, continuity, research integrity, decision integrity, readiness, recovery, security boundaries, release integrity, or proof.**

> **Control first. AI second. Software third.**
>
> **Build signal. Cut noise. Leave proof.**

Signalproof Skills is a free, open public skill suite for AI-assisted work. It provides reusable operating disciplines for research, evaluation, routing, investigation, planning, readiness, implementation, debugging, verification, review, recovery, defensive security, release governance, milestone closeout, and future specialist workflows.

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

## Active skills

| Skill | Version | Purpose |
|---|---:|---|
| [`signalproof`](skills/signalproof/SKILL.md) | 0.1.1 | Root governing contract and milestone continuity |
| [`signalproof-router`](skills/signalproof-router/SKILL.md) | 0.1.9 | Selects the smallest appropriate active skill/sequence, including Research, Evaluate, Readiness, Verify, Review, Recovery, Security, Release, and Closeout routing |
| [`signalproof-research`](skills/signalproof-research/SKILL.md) | 0.1.0 | Establishes what current external evidence supports while preserving source quality, freshness, contradictions, and provenance |
| [`signalproof-evaluate`](skills/signalproof-evaluate/SKILL.md) | 0.1.0 | Converts researched evidence into bounded dispositions using explicit criteria, hard gates, reversibility, and strategic/technical fit |
| [`signalproof-investigate`](skills/signalproof-investigate/SKILL.md) | 0.1.0 | Determines what actually failed or what state is actually true in a specific system/runtime |
| [`signalproof-plan`](skills/signalproof-plan/SKILL.md) | 0.1.0 | Creates a bounded execution contract with scope, authority, acceptance, and recovery |
| [`signalproof-readiness`](skills/signalproof-readiness/SKILL.md) | 0.1.0 | Determines whether target-environment prerequisites, capabilities, configuration, authority, security, recovery, and evidence are actually present |
| [`signalproof-build`](skills/signalproof-build/SKILL.md) | 0.1.0 | Executes an approved bounded implementation while preserving protected state |
| [`signalproof-debug`](skills/signalproof-debug/SKILL.md) | 0.1.0 | Reproduces, localizes, corrects, and regression-tests demonstrable defects |
| [`signalproof-verify`](skills/signalproof-verify/SKILL.md) | 0.1.0 | Determines whether a specific claim is actually proven by the required evidence |
| [`signalproof-review`](skills/signalproof-review/SKILL.md) | 0.1.0 | Reviews whether the work itself is sound, scoped correctly, and consistent with protected state/contracts |
| [`signalproof-recovery`](skills/signalproof-recovery/SKILL.md) | 0.1.0 | Selects and verifies a trustworthy rollback, protects persistent data/evidence, and verifies restored state |
| [`signalproof-security`](skills/signalproof-security/SKILL.md) | 0.1.0 | Governs defensive security assessment across trust boundaries, secrets, privilege, dependencies, unsafe execution, network/data exposure, and controls |
| [`signalproof-release`](skills/signalproof-release/SKILL.md) | 0.1.0 | Governs the exact artifact/version allowed to be promoted or distributed, with evidence binding, provenance, rollback, truthful claims, and release authority |
| [`signalproof-closeout`](skills/signalproof-closeout/SKILL.md) | 0.1.0 | Closes meaningful milestones, preserves Build Ledger continuity, and governs the next phase |

The authoritative status list is [`SKILL-REGISTRY.md`](SKILL-REGISTRY.md).

## Core operating flow

Not every task needs every skill. The router selects the smallest responsible path.

```text
REQUEST
   ↓
ROUTER
   ↓
RESEARCH           establish what external evidence supports
   ↓
EVALUATE           decide disposition against explicit criteria and hard gates
   ↓
INVESTIGATE        when a specific system state/cause is unclear
   ↓
PLAN               when authorized work needs a bounded execution contract
   ↓
READINESS          prove target prerequisites/capabilities
   ↓
BUILD / DEBUG      implement or correct within the approved boundary
   ↓
VERIFY             prove a material claim
   ↓
REVIEW             assess scope/change integrity
   ↓
SECURITY           assess material trust/privilege/data/control risk
   ↓
RECOVERY           restore a trustworthy known-good state when needed
   ↓
RELEASE            govern exact-artifact promotion/distribution
   ↓
CLOSEOUT           close meaningful milestones
   ↓
BUILD LEDGER       canonical append when verified; staged delta otherwise
```

This is not a mandatory conveyor belt.

## Research is not Evaluate

`signalproof-research` asks:

> **What does the best available evidence actually establish?**

`signalproof-evaluate` asks:

> **Given that evidence, our explicit criteria, and our constraints, what disposition best serves this decision?**

Research does not secretly choose the winner. Evaluate does not invent missing research. A high benchmark, popularity signal, or weighted score is not automatic adoption authority.

Evaluate can return **ADOPT, ADAPT, INTEGRATE, PILOT / ISOLATE, DEFER, RESEARCH MORE, REJECT, BUILD FROM SCRATCH, or WATCHLIST**, but those are governed recommendations. Plan/Build still require separate authority before implementation.

## Evidence and decision discipline

Signalproof keeps evidence classes distinct and prevents hard gates from being averaged away. Licensing prohibitions, security blockers, unsupported required platforms, prohibited data flows, unavailable authority, or unacceptable recovery boundaries remain hard gates when the project defines them that way.

UNKNOWN remains unknown; it is not assigned a convenient middle score merely to produce a total.

## Research, Evaluate, Readiness, Verify, Review, Security, Recovery, and Release are different

- **Research:** What does current external evidence establish?
- **Evaluate:** What disposition best fits the evidence, constraints, and explicit criteria?
- **Readiness:** Are the required conditions satisfied on this exact target?
- **Verify:** Is this specific claim proven?
- **Review:** Is the work itself sound and contract-faithful?
- **Security:** What material security-sensitive risks affect the decision?
- **Recovery:** What trustworthy state should be restored and how is recovery proven?
- **Release:** May this exact accepted artifact be promoted to this exact distribution boundary?

These disciplines do not substitute for one another.

## Skill governance

Public Signalproof learning follows:

```text
DISCOVERED → CANDIDATE → TESTED → APPROVED → ACTIVE → DEPRECATED / RETIRED
```

A discovered lesson, research finding, or evaluation recommendation does not automatically become a Signalproof rule or implementation decision.

## Milestone closeout and Build Ledger

At a meaningful milestone, applicable Research / Evaluate / Readiness / Verify / Review / Security / Recovery / Release gates are resolved, accepted state is protected, the Build Ledger is updated canonically when the verified live head is available or staged explicitly when it is not, failures/open gates are preserved, reusable learning is extracted, and only then is the next phase authorized.

## Planned specialist lanes

These remain planned and are **not active** until their skill, tests, governance review, and acceptance state exist:

- `signalproof-document`
- `signalproof-learn`

## What Signalproof Skills does not claim

Signalproof Skills does not by itself constitute antivirus software, penetration-testing authority, cybersecurity certification, legal/compliance certification, universal host compatibility, or proof of production readiness from a single test. Research findings do not authorize adoption. Evaluate recommendations do not authorize implementation. Readiness does not authorize execution or release. Security findings are scope-bound. Recovery success does not itself authorize release. Release readiness applies only to the exact candidate and distribution boundary whose gates and authority were actually established.

## Repository protection

`main` is the canonical public branch. Normal development uses branches and pull requests. Governance preserves review-thread resolution, blocks force pushes/deletion, constrains bypass authority, and avoids requiring CI checks that do not actually exist yet.

## License and marks

Signalproof Skills is licensed under the **Apache License 2.0**. See [`LICENSE`](LICENSE), [`NOTICE`](NOTICE), and [`TRADEMARKS.md`](TRADEMARKS.md).

## Created by

**Doc Reo / Signalproof**

Signalproof exists to help people build with AI while keeping meaningful human control, evidence integrity, decision integrity, continuity, readiness, recovery, security boundaries, release integrity, and proof.
