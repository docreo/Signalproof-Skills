# Signalproof Skills

**Human-controlled, evidence-backed skills for building with AI without losing authority, continuity, readiness, recovery, security boundaries, release integrity, or proof.**

> **Control first. AI second. Software third.**
>
> **Build signal. Cut noise. Leave proof.**

Signalproof Skills is a free, open public skill suite for AI-assisted work. It provides reusable operating disciplines for routing, investigation, planning, readiness, implementation, debugging, verification, review, recovery, defensive security, release governance, milestone closeout, and future specialist workflows.

The suite is designed to help people use capable AI systems without treating capability as permission, mistaking detected prerequisites for readiness, replacing working systems without evidence, overstating verification or security, publishing the wrong artifact, hiding failed attempts, or losing the path back to a known state.

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
| [`signalproof-router`](skills/signalproof-router/SKILL.md) | 0.1.7 | Selects the smallest appropriate active skill/sequence, including Readiness, Verify, Review, Recovery, Security, Release, and Closeout routing |
| [`signalproof-investigate`](skills/signalproof-investigate/SKILL.md) | 0.1.0 | Determines what actually failed or what state is actually true |
| [`signalproof-plan`](skills/signalproof-plan/SKILL.md) | 0.1.0 | Creates a bounded execution contract with scope, authority, acceptance, and recovery |
| [`signalproof-readiness`](skills/signalproof-readiness/SKILL.md) | 0.1.0 | Determines whether the required target-environment prerequisites, capabilities, configuration, authority, security, recovery, and evidence are actually present before consequential execution |
| [`signalproof-build`](skills/signalproof-build/SKILL.md) | 0.1.0 | Executes an approved bounded implementation while preserving protected state |
| [`signalproof-debug`](skills/signalproof-debug/SKILL.md) | 0.1.0 | Reproduces, localizes, corrects, and regression-tests demonstrable defects |
| [`signalproof-verify`](skills/signalproof-verify/SKILL.md) | 0.1.0 | Determines whether a specific claim is actually proven by the required evidence |
| [`signalproof-review`](skills/signalproof-review/SKILL.md) | 0.1.0 | Reviews whether the work itself is sound, scoped correctly, and consistent with protected state/contracts |
| [`signalproof-recovery`](skills/signalproof-recovery/SKILL.md) | 0.1.0 | Selects and verifies a trustworthy rollback, protects persistent data/evidence, and verifies restored state |
| [`signalproof-security`](skills/signalproof-security/SKILL.md) | 0.1.0 | Governs defensive security assessment across trust boundaries, secrets, least privilege, dependencies, unsafe execution, network/data exposure, and control integrity |
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
INVESTIGATE        when current state/cause is unclear
   ↓
PLAN               when consequential work needs a bounded contract
   ↓
READINESS          when target prerequisites/capabilities must be proven before execution
   ↓
BUILD / DEBUG      implement or correct within the approved boundary
   ↓
VERIFY             prove a material claim or acceptance condition
   ↓
REVIEW             assess the actual work for scope/change integrity
   ↓
SECURITY           when trust/privilege/secrets/execution/data/control risk is materially relevant
   ↓
RECOVERY           when a failed/rejected state should return to a verified rollback
   ↓
RELEASE            when an exact candidate may be promoted/distributed to a defined boundary
   ↓
CLOSEOUT           at meaningful milestones and phase boundaries
   ↓
BUILD LEDGER       canonical append when verified; staged delta otherwise
   ↓
LESSON / SKILL CANDIDATE
```

This is not a mandatory conveyor belt. Readiness is used when the central question is whether the required preconditions for a defined objective are actually satisfied on a specific target. Verify is used when a material claim needs proof. Review is used when the work itself needs quality/change-integrity assessment. Security is used when security-sensitive risk materially affects the decision. Recovery is used when restoration to a trustworthy known-good state is the objective. Release is used only when the decision is whether a specific accepted artifact may be promoted or distributed to a defined scope. Closeout is used at meaningful phase boundaries—not every micro-commit.

## Readiness is not detection

`signalproof-readiness` asks:

> **Are the required conditions for this exact objective actually present on this exact target before consequential execution begins?**

Signalproof keeps readiness states separate. A GPU being detected is not proof that the required provider/runtime/model path works. `python.exe` existing is not proof that the correct environment is configured. A credential being present is not authority to use it. A backup existing is not a verified recovery path.

Readiness is inspection-first. It identifies blockers and the smallest path to readiness; it does not silently install packages, elevate privileges, add credentials, change ACLs, open ports, download models, or deploy software merely to make a check turn green.

## Readiness, Verify, Review, Security, Recovery, and Release are different

`signalproof-readiness` asks whether objective-specific prerequisites are actually satisfied on the target.

`signalproof-verify` asks whether a specific claim is proven by the required evidence.

`signalproof-review` asks whether the work itself is sound and consistent with approved intent, protected state, and contracts.

`signalproof-security` asks what security-sensitive trust, privilege, data, execution, dependency, or control risks materially affect the decision.

`signalproof-recovery` asks what trustworthy known-good state should be restored, what must survive, and how recovery is proven.

`signalproof-release` asks whether the exact accepted artifact may be promoted to the exact distribution boundary with truthful provenance, recovery, and claims.

These disciplines do not substitute for one another. A READY environment does not authorize execution or release; a Security SCOPED PASS is not universal certification; and a successful Release decision still applies only to the exact accepted artifact and defined distribution boundary.

## Evidence discipline

Signalproof keeps these classes distinct:

- **Artifact-Backed Fact**
- **Runtime-Verified Fact**
- **Human-Observed Fact**
- **Design Authority**
- **Inference**
- **Proposal**

A compile PASS is not automatically a runtime PASS. Installed is not automatically configured. Detected is not automatically verified. A runtime PASS is not automatically a security audit. A hash proves byte identity, not safety. A valid signature proves the checked signing relationship/integrity, not universal trustworthiness. Release evidence applies only to the artifact/version/environment it actually identifies.

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
READINESS / VERIFY / REVIEW / SECURITY / RECOVERY / RELEASE GATES AS APPLICABLE
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

These remain planned and are **not active** until their skill, tests, governance review, and acceptance state exist:

- `signalproof-research`
- `signalproof-evaluate`
- `signalproof-document`
- `signalproof-learn`

## What Signalproof Skills does not claim

Signalproof Skills does not by itself constitute antivirus software, penetration-testing authority, cybersecurity certification, legal/compliance certification, universal host compatibility, or proof of production readiness from a single static/behavioral test. A readiness PASS is scoped to the declared objective and target environment. A Security SCOPED PASS is limited to its defined boundary and evidence. Recovery success does not itself authorize release. Release readiness applies only to the exact candidate and distribution boundary whose gates and authority were actually established.

## Repository protection

`main` is the canonical public branch. Normal development uses branches and pull requests. Governance is designed to preserve review-thread resolution, block force pushes/deletion, constrain bypass authority, and avoid requiring CI checks that do not actually exist yet.

## License and marks

Signalproof Skills is licensed under the **Apache License 2.0**. See [`LICENSE`](LICENSE), [`NOTICE`](NOTICE), and [`TRADEMARKS.md`](TRADEMARKS.md).

## Created by

**Doc Reo / Signalproof**

Signalproof exists to help people build with AI while keeping meaningful human control, continuity, readiness, recovery, security boundaries, release integrity, and proof.
