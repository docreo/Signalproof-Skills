# Signalproof Skills

**Human-controlled, evidence-backed skills for building with AI without losing authority, continuity, recovery, or proof.**

> **Control first. AI second. Software third.**
>
> **Build signal. Cut noise. Leave proof.**

Signalproof Skills is a free, open public skill suite for AI-assisted work. It provides reusable operating disciplines for planning, investigation, implementation, debugging, routing, verification, milestone closeout, and future specialist workflows.

The suite is designed to help people use capable AI systems without treating capability as permission, replacing working systems without evidence, hiding failed attempts, overstating verification, or losing the path back to a known state.

## What makes Signalproof different

Signalproof Skills is not a prompt dump and is not intended to imitate a person.

The suite is governed around a root operating contract:

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

The canonical `main` branch currently contains these active public baselines:

| Skill | Version | Purpose |
|---|---:|---|
| [`signalproof`](skills/signalproof/SKILL.md) | 0.1.1 | Root governing contract for human-controlled, evidence-backed AI collaboration and milestone continuity |
| [`signalproof-router`](skills/signalproof-router/SKILL.md) | 0.1.2-rc1 | Selects the smallest appropriate active skill/sequence, including verification and milestone routing; candidate integration update on this branch |
| [`signalproof-investigate`](skills/signalproof-investigate/SKILL.md) | 0.1.0 | Determines what actually failed or what state is actually true before correction |
| [`signalproof-plan`](skills/signalproof-plan/SKILL.md) | 0.1.0 | Turns intent into a bounded execution contract with scope, authority, acceptance, and recovery |
| [`signalproof-build`](skills/signalproof-build/SKILL.md) | 0.1.0 | Executes an approved bounded implementation while preserving protected state |
| [`signalproof-debug`](skills/signalproof-debug/SKILL.md) | 0.1.0 | Reproduces, localizes, corrects, and regression-tests demonstrable defects |
| [`signalproof-verify`](skills/signalproof-verify/SKILL.md) | 0.1.0 | Verifies whether claims are actually supported by the required evidence and states what remains unverified |
| [`signalproof-closeout`](skills/signalproof-closeout/SKILL.md) | 0.1.0 | Closes meaningful milestones, preserves Build Ledger continuity, extracts reusable learning, and governs the next phase |

The authoritative maturity/status list is [`SKILL-REGISTRY.md`](SKILL-REGISTRY.md).

## Core operating flow

Not every task needs every skill. The router selects the smallest responsible path based on the objective and evidence state.

A typical consequential development flow may look like:

```text
REQUEST
   ↓
signalproof-router
   ↓
INVESTIGATE        when current state or failure cause is unclear
   ↓
PLAN               when consequential implementation needs a bounded contract
   ↓
BUILD / DEBUG      implement or correct within the approved boundary
   ↓
VERIFY             prove the material claim/acceptance condition
   ↓
REVIEW             planned specialist lane for quality/architecture review
   ↓
CLOSEOUT           at meaningful milestones and phase boundaries
   ↓
BUILD LEDGER       canonical append when verified, staged delta otherwise
   ↓
LESSON / SKILL CANDIDATE
```

The suite deliberately does **not** force every micro-commit or ordinary edit through Verify or full milestone closeout. Verify is for material claims and acceptance gates; closeout is for meaningful boundaries where later work depends on the current state being reconstructable.

## How to use the skills

Each skill lives in its own directory under `skills/` and uses a `SKILL.md` file with a YAML name/description followed by its operating contract, workflow, PASS/STOP criteria, and identity.

A compatible AI or agent host can load the relevant `SKILL.md` as operating instructions. If your host supports skill discovery/routing, start with the root `signalproof` contract and `signalproof-router`. If it does not, choose the specialist whose purpose matches the work while preserving the root contract.

For consequential work, the skill should help make these questions explicit:

- What is the actual objective?
- What evidence describes the current state?
- What already works and must remain protected?
- What is the smallest authorized change?
- What exact claim must be proven?
- What evidence class and acceptance gate prove that claim?
- What remains unverified?
- How do we recover if the change fails?
- Has a meaningful milestone been durably closed before the next phase?

## Evidence discipline

Signalproof keeps evidence classes distinct:

- **Artifact-Backed Fact**
- **Runtime-Verified Fact**
- **Human-Observed Fact**
- **Design Authority**
- **Inference**
- **Proposal**

A compile success is not automatically a runtime success. A runtime success is not automatically a security audit. A static dependency scan is not automatically a security review. A human observation is real evidence, but it is not silently upgraded into independent reproduction.

`signalproof-verify` converts that discipline into a dedicated claim/evidence gate with bounded statuses such as PASS, PARTIAL, FAIL, BLOCKED, and UNVERIFIED.

## Skill governance

Public Signalproof learning follows this lifecycle:

```text
DISCOVERED
   ↓
CANDIDATE
   ↓
TESTED
   ↓
APPROVED
   ↓
ACTIVE
   ↓
DEPRECATED / RETIRED
```

A lesson discovered during a build does **not** automatically become a Signalproof rule. Candidate changes should have an evidence basis, bounded scope, acceptance test, public/private review, version impact, and human approval before becoming active.

See [`GOVERNANCE.md`](GOVERNANCE.md) and [`CONTRIBUTING.md`](CONTRIBUTING.md).

## Milestone closeout and Build Ledger

Signalproof treats continuity as part of engineering, not as optional documentation.

At a meaningful milestone, the preferred sequence is:

```text
VERIFY MATERIAL CLAIMS
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

The following lanes are planned but **must not be treated as active until their skill, tests, governance review, and acceptance state exist**:

- `signalproof-review`
- `signalproof-research`
- `signalproof-evaluate`
- `signalproof-security`
- `signalproof-readiness`
- `signalproof-recovery`
- `signalproof-release`
- `signalproof-document`
- `signalproof-learn`

## What Signalproof Skills does not claim

Signalproof Skills does not by itself constitute:

- antivirus or endpoint-protection software;
- cybersecurity certification;
- a substitute for qualified security, legal, privacy, medical, financial, or other regulated professional review;
- universal compatibility with every AI/agent host;
- proof that a system is production-ready merely because a static or behavioral fixture passed.

The skills govern behavior and evidence. Individual products and environments still require their appropriate technical, security, release, and human acceptance gates.

## Repository protection

`main` is the canonical public branch. Normal development uses a branch and pull request. The repository governance is designed to preserve review-thread resolution, block force pushes and branch deletion, keep bypass authority constrained, and avoid requiring CI checks that do not actually exist yet.

See [`GOVERNANCE.md`](GOVERNANCE.md).

## License and marks

Signalproof Skills is licensed under the **Apache License 2.0**. See [`LICENSE`](LICENSE) and [`NOTICE`](NOTICE).

The Apache license permits use, modification, and redistribution under its terms. It does not grant permission to present a fork or derivative as an official Signalproof product or to use Signalproof trade names and marks beyond the license's customary attribution provisions. See [`TRADEMARKS.md`](TRADEMARKS.md).

## Contributing

Useful contributions are welcome, but changes to the canonical suite are governed rather than automatically activated. Contributions should preserve human authority, evidence discipline, protected state, recovery, public/private boundaries, and behavioral acceptance.

See [`CONTRIBUTING.md`](CONTRIBUTING.md).

## Created by

**Doc Reo / Signalproof**

Signalproof exists to help people build with AI while keeping meaningful human control, continuity, recovery, and proof.
