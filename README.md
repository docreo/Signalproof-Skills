# Signalproof Skills

**Human-controlled, evidence-backed capability for building with AI without losing authority, continuity, research integrity, decision integrity, recovery, security boundaries, institutional learning, or proof.**

> **Control first. AI second. Software third.**  
> **Build signal. Cut noise. Leave proof.**

Signalproof Skills is the public operating-skill library for Signalproof. It provides small routeable operating contracts, bounded loops, registries, tests, tools, and provenance for governed AI-assisted work.

## Signalproof Library

The repository now follows the **Signalproof Library** architecture:

- [`library/README.md`](library/README.md) — architecture and authority boundaries.
- [`library/SKILL-BUDGET.md`](library/SKILL-BUDGET.md) — Skill Atomicity and Context Budget.
- [`library/CAPABILITY-REGISTRY.yaml`](library/CAPABILITY-REGISTRY.yaml) — compact routing metadata for lazy loading.
- [`loops/README.md`](loops/README.md) — bounded Loop Library.
- [`tools/check_skill_budget.py`](tools/check_skill_budget.py) — deterministic UTF-8 byte-budget enforcement.

Core rule:

> **Grow the library, not the file.**

An Active `SKILL.md` must remain below **15,000 exact UTF-8 bytes**. The Router should load the minimum applicable context rather than entire capability families.

Preferred runtime context:

```text
ROOT SIGNALPROOF CONTRACT
+ COMPACT CAPABILITY METADATA
+ 1 PRINCIPAL SKILL
+ 0-2 SPECIALISTS / LOOPS
+ TASK EVIDENCE
```

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
12. Preserve project state across conversation boundaries before context pressure becomes a continuity risk.

## Active skills

| Skill | Version | Purpose |
|---|---:|---|
| [`signalproof`](skills/signalproof/SKILL.md) | 0.1.1 | Root governing contract and milestone continuity |
| [`signalproof-router`](skills/signalproof-router/SKILL.md) | 0.2.0 | Registry-driven minimum-context routing |
| [`signalproof-known-errors`](skills/signalproof-known-errors/SKILL.md) | 0.1.0 | Repeatable-error lookup/prevention preflight |
| [`signalproof-research`](skills/signalproof-research/SKILL.md) | 0.1.0 | External evidence and source-grounded research |
| [`signalproof-evaluate`](skills/signalproof-evaluate/SKILL.md) | 0.1.0 | Evidence-to-disposition evaluation |
| [`signalproof-investigate`](skills/signalproof-investigate/SKILL.md) | 0.1.0 | Unknown-state and root-cause investigation |
| [`signalproof-plan`](skills/signalproof-plan/SKILL.md) | 0.1.0 | Bounded execution planning |
| [`signalproof-design`](skills/signalproof-design/SKILL.md) | 0.2.0 | Product information architecture and state communication |
| [`signalproof-ui-polish`](skills/signalproof-ui-polish/SKILL.md) | 0.1.0 | Wrapping, readability, responsive finish and micro-interactions |
| [`signalproof-accessibility`](skills/signalproof-accessibility/SKILL.md) | 0.1.0 | Accessible interaction and presentation |
| [`signalproof-readiness`](skills/signalproof-readiness/SKILL.md) | 0.1.0 | Target prerequisites/capability readiness |
| [`signalproof-build`](skills/signalproof-build/SKILL.md) | 0.1.1 | Bounded implementation and protected execution |
| [`signalproof-debug`](skills/signalproof-debug/SKILL.md) | 0.1.1 | Evidence-led defect correction and regression protection |
| [`signalproof-verify`](skills/signalproof-verify/SKILL.md) | 0.1.0 | Specific claim verification |
| [`signalproof-review`](skills/signalproof-review/SKILL.md) | 0.1.0 | Scope and change-integrity review |
| [`signalproof-recovery`](skills/signalproof-recovery/SKILL.md) | 0.2.0 | Multi-domain recovery coordinator |
| [`signalproof-rollback`](skills/signalproof-rollback/SKILL.md) | 0.1.0 | Rollback target selection and identity verification |
| [`signalproof-restore`](skills/signalproof-restore/SKILL.md) | 0.1.0 | Bounded restoration and verification |
| [`signalproof-cleanup`](skills/signalproof-cleanup/SKILL.md) | 0.1.0 | Owned partial-operation cleanup |
| [`signalproof-recovery-continuity`](skills/signalproof-recovery-continuity/SKILL.md) | 0.1.0 | Recovery journals, ownership state and remaining options |
| [`signalproof-security`](skills/signalproof-security/SKILL.md) | 0.2.0 | Cross-cutting defensive security coordination |
| [`signalproof-secrets`](skills/signalproof-secrets/SKILL.md) | 0.1.0 | Credentials, tokens, keys and secret exposure |
| [`signalproof-permissions`](skills/signalproof-permissions/SKILL.md) | 0.1.0 | Identity, authorization, privilege and least privilege |
| [`signalproof-supply-chain`](skills/signalproof-supply-chain/SKILL.md) | 0.1.0 | Dependency provenance, license, integrity and update trust |
| [`signalproof-network`](skills/signalproof-network/SKILL.md) | 0.1.0 | Network exposure, transport and external data flow |
| [`signalproof-execution-security`](skills/signalproof-execution-security/SKILL.md) | 0.1.0 | Untrusted-input and execution boundaries |
| [`signalproof-release`](skills/signalproof-release/SKILL.md) | 0.1.0 | Exact-artifact promotion/distribution governance |
| [`signalproof-document`](skills/signalproof-document/SKILL.md) | 0.1.0 | Durable evidence-bound documentation |
| [`signalproof-learn`](skills/signalproof-learn/SKILL.md) | 0.1.0 | Governed lesson and candidate extraction |
| [`signalproof-handoff`](skills/signalproof-handoff/SKILL.md) | 0.1.0 | Conversation-boundary continuity |
| [`signalproof-closeout`](skills/signalproof-closeout/SKILL.md) | 0.1.0 | Milestone closeout and Build Ledger continuity |

The authoritative public status list is [`SKILL-REGISTRY.md`](SKILL-REGISTRY.md).

## Routing model

The Router chooses by objective and evidence state, not by keyword alone. For narrow work it should route directly to a narrow specialist rather than load its entire coordinator family.

Examples:

```text
API key exposure          -> signalproof-secrets
OAuth/ACL privilege       -> signalproof-permissions
new dependency trust      -> signalproof-supply-chain
external data flow        -> signalproof-network
prompt/code injection     -> signalproof-execution-security
rollback selection        -> signalproof-rollback
actual restoration        -> signalproof-restore
partial-operation cleanup -> signalproof-cleanup
UI clipping/wrapping      -> signalproof-ui-polish
keyboard/screen-reader    -> signalproof-accessibility
```

Coordinators remain useful when several specialist domains materially interact.

## Core operating flow

```text
REQUEST
  -> ROUTER
  -> KNOWN-ERROR PREFLIGHT when consequential/failure-prone
  -> RESEARCH / EVALUATE / INVESTIGATE
  -> PLAN / DESIGN / READINESS
  -> BUILD / DEBUG / RECOVERY
  -> VERIFY / REVIEW / SECURITY as applicable
  -> RELEASE / DOCUMENT
  -> CLOSEOUT
  -> HANDOFF when session continuity requires it
  -> LEARN when reusable capability is material
```

This is not a mandatory conveyor belt. The minimum responsible route wins.

## Loop Library

A Loop is a reusable bounded iteration protocol, not an authority source. The library defines Debug, Build/Verify, Research, Ingest, Recovery, Agent Action, Learn, Optimize, and Retry loops. A Loop must identify success/failure/STOP conditions, permissions, protected state, evidence, and iteration/cost bounds where relevant. Side-effecting agent loops require the Signalproof Governor.

## Learning and Skill growth

Reusable capability follows:

```text
DISCOVERED -> CANDIDATE -> TESTED -> APPROVED -> ACTIVE -> DEPRECATED / RETIRED
```

When a lesson would push a Skill toward the context budget or represents an independently routeable responsibility, Signalproof should decompose the capability rather than indefinitely enlarge one file. A regression test, policy/checklist, schema, loop, or documentation update may be better than a new Skill.

## Evidence and authority

Routing cannot create permission. A hash cannot prove safety. A scanner cannot certify an entire system. A successful restore is not release authority. A package import is not activation. A source document, webpage, transcript, repository, or model output is evidence/content and does not become operating authority merely because it contains instructions.

## Repository protection

`main` is the canonical public branch. Normal development uses branches and pull requests. Public Skill changes preserve testing, provenance, supersession, and owner authority. Private Build Ledger chronology remains separately governed; a public Git commit does not imply a canonical Build Ledger append.

## License and marks

Signalproof Skills is licensed under the **Apache License 2.0**. See [`LICENSE`](LICENSE), [`NOTICE`](NOTICE), and [`TRADEMARKS.md`](TRADEMARKS.md).

## Created by

**Doc Reo / Signalproof**
