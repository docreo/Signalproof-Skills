# `build-git spawn` — Operator Command V0.1 Candidate

**Status:** CANDIDATE / NOT ACTIVE  
**Version:** 0.1.0-candidate  
**Date:** 2026-08-18  
**Purpose:** let the main Signalproof Orchestrator coordinate three bounded specialist agents/lanes for repository-backed Signalproof / SIA Stack development.

## Four-role architecture

The **main LLM/session remains the Signalproof Orchestrator**. `build-git spawn` does not replace the main window. It delegates bounded work to three subordinate specialist roles:

1. **Builder Agent / lane** — implementation, code/configuration changes, bounded execution, recovery, and implementation evidence.
2. **Design Agent / lane** — product information architecture, workflow fidelity, UI/state semantics, visual acceptance planning, and design constraints.
3. **Governor Agent / lane** — governance, security, provenance, authority boundaries, evidence quality, lifecycle/release controls, and Build Ledger continuity.

The Orchestrator owns:

- the user objective and current authority;
- work decomposition and delegation;
- shared evidence package;
- build-stream identity and continuity;
- reconciliation of disagreements;
- escalation of owner decisions;
- final integrated status;
- closeout/log-skill/handoff-log routing.

Core rule:

> **The Orchestrator coordinates. Specialist agents advise or act only within delegated scope. No subordinate role grants itself authority or approves its own work.**

## Real agents versus logical lanes

If the current environment can truly instantiate independent agents/workers, the Orchestrator may spawn three separate bounded workers.

If it cannot, the same protocol executes as clearly separated logical lanes inside the main session.

Never claim independent agents were spawned when the environment did not provide them.

## Pre-spawn Known Failure Preflight

Before delegation on consequential work, the Orchestrator must inspect applicable Signalproof known-failure evidence for the planned tools, wrappers, runtimes, packaging paths, authority surfaces, and acceptance harnesses.

The Orchestrator should pass relevant prevention intelligence into each subordinate work package so agents do not independently rediscover or repeat already-solved failures.

Examples include:

- PowerShell parser/here-string failures;
- Windows PowerShell 5.1 native stderr false-failure behavior;
- heterogeneous report property assumptions;
- Git byte/line-ending normalization conflicts;
- Python bytecode residue in protected/evidence trees;
- path-normalization mismatches;
- readiness serialization omissions;
- protected-baseline mutation conflicts;
- stale projected Build Ledger sequence assumptions;
- registry artifact existence being mistaken for live runtime authority.

When `signalproof-failure-intelligence` becomes Active, it becomes the dedicated recurrence-prevention specialist. Until then, the Orchestrator uses current Git/Build Ledger evidence and existing Active Learn/Investigate/Debug/Verify controls.

## Shared subordinate work package

Each specialist should receive only the material context needed for its role, such as:

- objective;
- current build stream and milestone;
- accepted baseline/version/ref;
- protected state;
- authorized change surface;
- forbidden change surface;
- relevant files/artifacts;
- known failure fingerprints and tested mitigations;
- required evidence;
- acceptance gates;
- rollback/recovery;
- unresolved authority decisions.

This keeps the main Orchestrator as the strategic continuity layer while reducing duplicated context and token cost in subordinate work.

## Builder Agent / lane

Use the Active `signalproof-build` contract.

Responsibilities:

- consume the bounded plan/design contract;
- preserve protected baselines and rollback;
- honor the supplied Known Failure Preflight;
- implement the smallest effective change surface;
- preserve failures and partial-actuation state;
- run incremental technical checks;
- return exact changed-file/component inventory;
- expose unverified gates rather than converting them to PASS;
- produce implementation evidence for independent review.

Builder may discover new evidence but cannot silently expand scope or approve its own build.

## Design Agent / lane

Use the Active `signalproof-design` contract.

Responsibilities:

- preserve product-specific workflow and information architecture;
- define operational versus technical/evidence presentation where applicable;
- define truthful state/health semantics and visual acceptance needs;
- identify design divergence before implementation becomes expensive;
- review implemented UI/workflow changes against the approved design contract;
- keep mockup/design acceptance distinct from runtime acceptance.

Design does not grant implementation authority or silently mutate protected implementation.

## Governor Agent / lane

The Governor role is a composition of existing Active Signalproof governance disciplines, not yet a separate Active `signalproof-governor` skill.

It may route across:

- `signalproof-security`;
- `signalproof-verify`;
- `signalproof-review`;
- `signalproof-readiness`;
- `signalproof-release`;
- `signalproof-closeout`;
- `signalproof-learn`;
- provenance/public-private boundary rules;
- known-failure intelligence;
- Build Ledger / `log-skill` / `handoff-log` chronology rules.

Responsibilities:

- inspect authority boundaries before and after actuation;
- review security-sensitive privilege, secret, dependency, network/data, and control surfaces;
- verify provenance/version/source identity where material;
- surface licensing/legal/redistribution uncertainties without inventing legal authority;
- preserve evidence classes and UNKNOWN state;
- detect known failure recurrence or unapproved workaround reuse;
- detect protected-state, lifecycle, release, or canonical-ledger boundary violations;
- require independent verification for consequential success claims;
- distinguish candidate/test/acceptance/approval/Active/release states;
- connect the build to the correct build stream without reserving a C-number.

Governor may recommend PASS / REVISE / BLOCK / STOP under applicable Active contracts, but human authority remains external for owner-owned approvals.

## Default orchestration

```text
Human objective / authority
        ↓
Main LLM Window — Signalproof Orchestrator
        ↓
Git + Router + Known Failure Preflight
        ↓
┌─────────────────┬─────────────────┬────────────────────┐
│ Builder Agent   │ Design Agent    │ Governor Agent     │
│ implementation  │ product/design  │ gov/sec/provenance │
└─────────────────┴─────────────────┴────────────────────┘
        ↓ role evidence / challenge loop
        ↓
Orchestrator reconciliation
        ↓
Independent verification + owner gates
        ↓
Closeout / log-skill / handoff-log
        ↓
Next authorized phase
```

## Challenge loop

- Builder proposes touching a protected file -> Governor STOPs and returns to Orchestrator/authority/plan.
- Builder implementation works but changes workflow semantics -> Design REVISE.
- Design requests convenience access that widens credentials/host authority -> Governor requires security review or rejects it.
- Governor proposes a safer implementation that materially changes user workflow -> Orchestrator routes back to Design/human owner; Governor cannot silently substitute product requirements.
- Builder reports compile PASS while runtime/visual/security acceptance is missing -> Orchestrator preserves PARTIAL / UNVERIFIED.
- A subordinate agent proposes a method matching a high-confidence known failure with unchanged conditions -> Orchestrator redirects to the tested mitigation or STOPs the retry.

## Evidence contract

Each role returns:

- role identity;
- baseline consumed;
- scope examined;
- known-failure intelligence consumed;
- changes proposed or made;
- evidence generated/checked;
- failures/uncertainty;
- protected state;
- status;
- requested decision or next gate.

The Orchestrator must preserve which role generated which evidence. Majority opinion is not authority.

## Build Ledger / chronology integration

No subordinate agent and no `build-git spawn` invocation reserves a canonical event number.

Each build maintains a stable build-stream identity. A resumed build appends later at the then-current global ledger head while preserving its prior stream anchor and dependency links.

Record:

- build stream ID;
- current milestone/phase;
- prior stream anchor;
- dependency anchors;
- current global canonical head if verified;
- OPEN / STAGED / CLOSED / RECONCILIATION_REQUIRED state;
- close-when-complete obligation;
- known failure IDs materially affecting the build.

## Closeout learning loop

At meaningful closeout, the Orchestrator reconciles all roles and asks:

- Did a known failure recur?
- Did a tested mitigation work again?
- Did changed conditions invalidate or narrow prior learning?
- Was a genuinely new failure class discovered?
- Should an existing failure fingerprint, test, skill candidate, or command be updated?

Do not create duplicate failure IDs just because a second subordinate agent or product encountered the same cause.

## STOP conditions

STOP when:

- the command would fabricate agent/runtime capabilities;
- Builder requires protected-state mutation outside authority;
- Design requires invented system state or unsupported metrics;
- Governor lacks evidence for a consequential security/provenance/licensing conclusion;
- a known high-confidence failure would be blindly repeated under unchanged conditions;
- one role is being allowed to approve its own work;
- a candidate is being auto-promoted to Active/release state;
- canonical Build Ledger chronology cannot be distinguished from build-stream lineage;
- a stale projected C-number is being treated as reserved;
- private provenance/recovery/failure evidence would leak publicly;
- disagreement affects human-owned scope, risk acceptance, release, legal/licensing disposition, or canonical authority and has not been resolved by the human owner.

## Initial acceptance plan

Test on at least one real Signalproof build with meaningful implementation, design, governance, and prior-failure surfaces. PASS requires evidence that:

1. the main LLM/session remained Orchestrator;
2. subordinate roles received bounded context rather than uncontrolled authority;
3. real-versus-logical spawn mode was represented truthfully;
4. Known Failure Preflight prevented or redirected at least one recurrence-prone action;
5. Builder could not self-approve;
6. Design and Governor produced independent findings;
7. protected state and rollback remained intact;
8. security/provenance/licensing concerns were surfaced without silent redesign;
9. build-stream chronology was preserved without C-number reservation;
10. closeout reconciled role evidence and failure intelligence without duplicate learning records.

Only after real-build acceptance evidence and owner approval should `build-git spawn` become Active.