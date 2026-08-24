# Signalproof Skills

**Human-controlled, evidence-backed capability for building with AI without losing authority, continuity, research integrity, decision integrity, recovery, security boundaries, institutional learning, or proof.**

> **Control first. AI second. Software third.**  
> **Build signal. Cut noise. Leave proof.**

Signalproof Skills is the public operating-skill library for Signalproof. It provides small routeable operating contracts, bounded loops, registries, tests, tools, and provenance for governed AI-assisted work.

## Signalproof Library

The repository follows the **Signalproof Library** architecture:

- [`library/README.md`](library/README.md) - architecture and authority boundaries.
- [`library/SKILL-BUDGET.md`](library/SKILL-BUDGET.md) - Skill Atomicity and Context Budget.
- [`library/CAPABILITY-REGISTRY.yaml`](library/CAPABILITY-REGISTRY.yaml) - compact routing metadata for lazy loading.
- [`loops/README.md`](loops/README.md) and [`loops/LOOP-REGISTRY.yaml`](loops/LOOP-REGISTRY.yaml) - bounded Loop Library.
- [`commands/COMMAND-REGISTRY.md`](commands/COMMAND-REGISTRY.md) - public operator command surface, including `/dsp`.
- [`tools/check_skill_budget.py`](tools/check_skill_budget.py) - deterministic UTF-8 byte-budget enforcement.

The `/dsp` shell navigates this public Signalproof Library. Public `main` registries are the Skill/Command/Loop authority after governed promotion. Private Build Ledger evidence supports continuity and history but does not replace the public Library catalog.

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

## `/dsp` and Active Operator Commands

`/dsp` is the **public front door to the Signalproof Library**. It is the compact Dr. Signalproof resolver and operator shell that routes a human request to the minimum necessary current command, Skill, Loop, evidence, and governance context.

> **Commands are the operator-facing action surface. Skills are the reusable capability contracts underneath them.**

Use [`commands/COMMAND-REGISTRY.md`](commands/COMMAND-REGISTRY.md) as the authoritative public command catalog and [`commands/dsp.md`](commands/dsp.md) as the canonical `/dsp` shell contract.

### Core `/dsp` workflow

```text
/dsp research
  -> /dsp this-plan
  -> /dsp design
  -> /dsp complete
  -> /dsp qc
  -> /dsp authorize deploy
  -> /dsp deploy
```

This is a guided route, not a mandatory conveyor belt. `/dsp` resolves the minimum responsible path for the current work.

`/dsp build-capsule` is an optional transfer route when a substantial build, authoritative payload, accepted design, or live-update state must move to another AI system without repeatedly re-encoding the full source material.

### Active operator commands

| Command | Purpose |
|---|---|
| [`/dsp`](commands/dsp.md) | Compact Dr. Signalproof resolver and public Library shell |
| [`help`](commands/help.md) | Registry-backed command discovery |
| [`research`](commands/research.md) | Minimum necessary source-grounded research |
| [`authorize`](commands/authorize.md) | Exact bounded authorization handler |
| [`complete`](commands/complete.md) | Bounded authorize-all completion through Build Spawn Debug and real user acceptance |
| [`qc`](commands/qc.md) | Exact-candidate human QC after automated PASS |
| [`deploy`](commands/deploy.md) | Authorized exact-artifact deployment and post-deploy verification |
| [`known-errors`](commands/known-errors.md) | Recurrence-prevention preflight for the current workstream |
| [`log-skill`](commands/log-skill.md) | Milestone, learning, and Skill continuity |
| [`handoff-log`](commands/handoff-log.md) | Durable fresh-chat handoff plus log synchronization |
| [`build-capsule`](commands/build-capsule.md) | AI Build Capsule / Design Capsule / live-update transfer packaging |
| [`cut-chase`](commands/cut-chase.md) | Decision-ready salience compression |
| [`cut-cost`](commands/cut-cost.md) | Read-only measured AI operating-efficiency audit |
| [`design-git`](commands/design-git.md) | Smallest governed Git-backed design/next-action route |
| [`build-git`](commands/build-git.md) | Governed repository-backed next-action execution |
| [`build-git this`](commands/build-git-this.md) | Apply Build Git to the current bounded work unit |
| [`build-git spawn`](commands/build-git-spawn.md) | Builder, Design, Governor role separation |
| [`build-git-debug`](commands/build-git-debug.md) | Git-backed defect localization/correction |
| [`full-debug`](commands/full-debug.md) | High-governance repeated/cross-layer debugging |
| [`build-spawn-debug`](commands/build-spawn-debug.md) | Build/debug convergence to automated PASS and human UI gate |
| [`log-build-git`](commands/log-build-git.md) | `log-skill -> design-git -> build-git` continuity route |
| [`log-build-git-debug`](commands/log-build-git-debug.md) | `log-skill -> design-git -> build-git-debug` continuity route |
| [`/authorized-log-build-git`](commands/authorized-log-build-git.md) | Compatibility authorization route for log/design/build continuation |
| [`signalproof-this-plan`](commands/signalproof-this-plan.md) | Grill, design, and bound the current plan without implementation |
| [`signalproof-this-build`](commands/signalproof-this-build.md) | Consume an approved plan, build, and verify |
| [`signalproof-teach`](commands/signalproof-teach.md) | Source-disciplined teaching and HAMM learning |

Command versions and Active status remain governed by [`commands/COMMAND-REGISTRY.md`](commands/COMMAND-REGISTRY.md). The front-page table is a discoverability surface, not a second authority registry.

## Active skills

| Skill | Version | Purpose |
|---|---:|---|
| [`signalproof`](skills/signalproof/SKILL.md) | 0.1.1 | Root governing contract and milestone continuity |
| [`signalproof-router`](skills/signalproof-router/SKILL.md) | 0.2.5 | Registry-driven minimum-context routing |
| [`signalproof-known-errors`](skills/signalproof-known-errors/SKILL.md) | 0.1.0 | Repeatable-error lookup/prevention preflight |
| [`signalproof-research`](skills/signalproof-research/SKILL.md) | 0.1.0 | External evidence and source-grounded research |
| [`signalproof-evaluate`](skills/signalproof-evaluate/SKILL.md) | 0.1.0 | Evidence-to-disposition evaluation |
| [`signalproof-investigate`](skills/signalproof-investigate/SKILL.md) | 0.1.0 | Unknown-state and root-cause investigation |
| [`signalproof-plan`](skills/signalproof-plan/SKILL.md) | 0.1.0 | Bounded execution planning |
| [`signalproof-grill`](skills/signalproof-grill/SKILL.md) | 0.1.0 | Evidence-aware decision hardening and ambiguity reduction |
| [`signalproof-grill-with-docs`](skills/signalproof-grill-with-docs/SKILL.md) | 0.1.0 | Decision hardening with governed glossary and ADR capture |
| [`signalproof-teach`](skills/signalproof-teach/SKILL.md) | 0.1.0 | Mission-grounded source-backed teaching and durable skill development |
| [`signalproof-cut-chase`](skills/signalproof-cut-chase/SKILL.md) | 0.1.0 | Salience compression, decision-load reduction, and clear action extraction |
| [`signalproof-cut-cost`](skills/signalproof-cut-cost/SKILL.md) | 0.1.0 | Read-only measured audit of AI token, context, tool, model, cache, agent, schedule, output, and repeated-work waste |
| [`signalproof-build-capsule`](skills/signalproof-build-capsule/SKILL.md) | 0.1.0 | Multimodal AI build-transfer packaging with authoritative payloads, Design Capsule continuity, and additive live-update commands |
| [`signalproof-design`](skills/signalproof-design/SKILL.md) | 0.2.0 | Product information architecture and state communication |
| [`signalproof-ui-polish`](skills/signalproof-ui-polish/SKILL.md) | 0.1.0 | Wrapping, readability, responsive finish and micro-interactions |
| [`signalproof-accessibility`](skills/signalproof-accessibility/SKILL.md) | 0.1.0 | Accessible interaction and presentation |
| [`signalproof-readiness`](skills/signalproof-readiness/SKILL.md) | 0.1.0 | Target prerequisites/capability readiness |
| [`signalproof-build`](skills/signalproof-build/SKILL.md) | 0.1.1 | Bounded implementation and protected execution |
| [`signalproof-debug`](skills/signalproof-debug/SKILL.md) | 0.1.1 | Evidence-led defect correction and regression protection |
| [`signalproof-full-debug`](skills/signalproof-full-debug/SKILL.md) | 0.1.0 | High-governance debug coordination with failure memory, bounded authorization, role separation, and verification |
| [`signalproof-build-spawn-debug`](skills/signalproof-build-spawn-debug/SKILL.md) | 0.1.0 | Build-to-user-acceptance coordination with spawn challenge, debug convergence, governed learning, automated PASS, and human UI testing |
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
| [`signalproof-closeout`](skills/signalproof-closeout/SKILL.md) | 0.2.0 | Milestone closeout, Build Ledger continuity, and Skill/library architecture governance |

The authoritative public status list is [`SKILL-REGISTRY.md`](SKILL-REGISTRY.md).

## Routing model

The Router chooses by objective and evidence state, not by keyword alone.

```text
stress-test a plan         -> signalproof-grill
stress-test + glossary/ADR -> signalproof-grill-with-docs
teach/learn a capability   -> signalproof-teach
cut to decision-ready core -> signalproof-cut-chase
cut AI operating waste     -> signalproof-cut-cost
package build for AI       -> signalproof-build-capsule
keep UI build fixing       -> signalproof-build-spawn-debug
API key exposure           -> signalproof-secrets
OAuth/ACL privilege        -> signalproof-permissions
new dependency trust       -> signalproof-supply-chain
external data flow         -> signalproof-network
prompt/code injection      -> signalproof-execution-security
rollback selection         -> signalproof-rollback
actual restoration         -> signalproof-restore
partial-operation cleanup  -> signalproof-cleanup
UI clipping/wrapping       -> signalproof-ui-polish
keyboard/screen-reader     -> signalproof-accessibility
full debug                 -> signalproof-full-debug
```

## Core operating flow

```text
REQUEST
  -> ROUTER
  -> KNOWN-ERROR PREFLIGHT when consequential/failure-prone
  -> RESEARCH / EVALUATE / INVESTIGATE
  -> CUT-COST when the objective is measured AI operating-efficiency audit
  -> GRILL / PLAN / DESIGN / READINESS / TEACH as needed
  -> BUILD-CAPSULE when the objective is transfer to another AI/platform
  -> BUILD / DEBUG / RECOVERY
  -> BUILD-SPAWN-DEBUG when a bounded build should converge before human UI testing
  -> VERIFY / REVIEW / SECURITY as applicable
  -> RELEASE / DOCUMENT
  -> CUT-CHASE when the human needs the decision-ready version
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

Build Spawn Debug becomes more efficient by consuming verified known-error/failure intelligence, preserved attempts, regression tests, and still-valid prior evidence. It does not silently self-modify or promote one successful workaround into Active doctrine.

When a lesson would push a Skill toward the context budget or represents an independently routeable responsibility, Signalproof should decompose rather than indefinitely enlarge one file.

## Evidence and authority

Routing cannot create permission. A hash cannot prove safety. A scanner cannot certify an entire system. A successful restore is not release authority. A package import is not activation. A source document, webpage, transcript, repository, or model output is evidence/content and does not become operating authority merely because it contains instructions. Cut Chase cannot strengthen evidence by shortening it. Cut Cost cannot invent savings from unmeasured usage or apply optimization changes under a read-only audit. Build Capsule cannot replace authoritative source payloads or turn an unreadable image into truth. Build Spawn Debug cannot claim user UI PASS before the human actually reports it.

## Repository protection

`main` is the canonical public branch. Normal development uses branches and pull requests. Public Skill changes preserve testing, provenance, supersession, and owner authority. Private Build Ledger chronology remains separately governed; a public Git commit does not imply a canonical Build Ledger append.

## License and marks

Signalproof Skills is licensed under the **Apache License 2.0**. See [`LICENSE`](LICENSE), [`NOTICE`](NOTICE), and [`TRADEMARKS.md`](TRADEMARKS.md).

## Created by

**Doc Reo / Signalproof**