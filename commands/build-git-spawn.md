# `build-git spawn` — Operator Command V0.1 Candidate

**Status:** CANDIDATE / NOT ACTIVE  
**Version:** 0.1.0-candidate  
**Date:** 2026-08-18  
**Purpose:** orchestrate three governed work lanes under the existing `build-git` discipline for Signalproof / SIA Stack development.

## Core idea

`build-git spawn` creates a coordinated three-lane build protocol:

1. **Builder lane** — implementation, code/configuration changes, bounded execution, recovery, and implementation evidence.
2. **Design lane** — product information architecture, workflow fidelity, UI/state semantics, visual acceptance planning, and design constraints.
3. **Governor lane** — governance, security, provenance, authority boundaries, evidence quality, lifecycle/release controls, and Build Ledger continuity.

The command must distinguish **real runtime agents** from **logical governed lanes**. If the current environment can instantiate independent agents, the three roles may run as separate workers. If it cannot, the same role-separated protocol runs sequentially or interleaved in one session. Never claim independent agents were spawned when they were not.

## Governing rule

> **Independent roles, shared evidence, no self-approval.**

The Builder does not approve its own build. The Design lane does not grant implementation authority. The Governor does not silently rewrite requirements, execute unauthorized changes, or grant itself canonical/release authority.

## Builder lane

Use the Active `signalproof-build` contract.

Responsibilities:

- consume the bounded plan/design contract;
- preserve protected baselines and rollback;
- implement the smallest effective change surface;
- preserve failures and partial-actuation state;
- run incremental technical checks;
- return exact changed-file/component inventory;
- expose unverified gates rather than converting them to PASS;
- produce implementation evidence for independent review.

The Builder lane may discover design/security/governance issues, but material changes outside scope are routed back to Design/Governor/human authority rather than silently absorbed.

## Design lane

Use the Active `signalproof-design` contract.

Responsibilities:

- preserve product-specific workflow and information architecture;
- define operational versus technical/evidence presentation where applicable;
- define real state/health semantics and visual acceptance needs;
- define protected presentation/interaction boundaries;
- identify design divergence before implementation becomes expensive;
- review implemented UI/workflow changes against the approved design contract;
- keep mockup/design acceptance distinct from runtime acceptance.

The Design lane does not directly mutate protected implementation unless the routed build contract separately grants that authority.

## Governor lane

The Governor lane is a role composition, not yet a separate Active `signalproof-governor` skill.

It routes across current Active governance disciplines as required, including:

- `signalproof-security`;
- `signalproof-verify`;
- `signalproof-review`;
- `signalproof-readiness`;
- `signalproof-release`;
- `signalproof-closeout`;
- `signalproof-learn`;
- provenance/public-private boundary rules;
- Build Ledger / `log-skill` / `handoff-log` chronology rules.

Responsibilities:

- define and inspect authority boundaries before and after actuation;
- review security-sensitive privilege, secret, dependency, network/data, and control surfaces;
- verify provenance/version/source identity where material;
- preserve evidence classes and UNKNOWN state;
- detect protected-state, lifecycle, release, or canonical-ledger boundary violations;
- require independent verification for consequential success claims;
- distinguish candidate/test/acceptance/approval/Active/release states;
- require closeout before phase transition when applicable;
- connect the build to the correct Build Ledger stream without reserving a C-number.

The Governor lane may return PASS / REVISE / BLOCK / STOP recommendations under the applicable Active contracts, but final human authority remains external to the lane for approvals that require owner authority.

## Default orchestration

```text
Human objective / authority
        ↓
build-git preflight
        ↓
┌─────────────────┬─────────────────┬────────────────────┐
│ Builder lane    │ Design lane     │ Governor lane      │
│ implementation  │ product/design  │ gov/sec/provenance │
└─────────────────┴─────────────────┴────────────────────┘
        ↓ shared evidence / challenge loop
        ↓
Independent verification + owner gates
        ↓
Closeout / log-skill / handoff-log
        ↓
Next authorized phase
```

## Challenge loop

The lanes are expected to disagree when evidence warrants it.

Examples:

- Builder proposes touching a protected file -> Governor STOPs and returns to authority/plan.
- Builder implementation works but changes workflow semantics -> Design REVISE.
- Design requests a convenience integration that widens credentials or host access -> Governor requires security review or rejects it.
- Governor proposes a safer implementation that materially changes user workflow -> Design and human authority must review; Governor cannot silently substitute product requirements.
- Builder reports compile PASS while runtime/visual/security acceptance is missing -> Governor preserves PARTIAL / UNVERIFIED.

## Evidence contract

Each lane should emit a compact role record:

- role/lane;
- baseline consumed;
- scope examined;
- changes proposed or made;
- evidence generated/checked;
- failures/uncertainty;
- protected state;
- status;
- requested decision or next gate.

Shared artifacts should be hash-bound where practical. The orchestration record must distinguish evidence generated by each lane from final owner acceptance.

## Build Ledger / chronology integration

`build-git spawn` does not reserve a canonical event number.

Every governed build has a stable build-stream identity. A resumed build appends later at the current global ledger head while preserving its own prior stream anchor and any dependency links. The command must record:

- build stream ID;
- current milestone/phase;
- prior stream anchor;
- relevant dependency anchors;
- current global canonical head if verified;
- whether the output is OPEN / STAGED / CLOSED / RECONCILIATION_REQUIRED;
- any `close-when-complete` obligation.

## Spawn semantics

### Real multi-agent mode

Use only when the execution environment actually supports independent agents/workers. Each receives bounded role instructions and a shared evidence package. The orchestrator reconciles outputs without converting majority opinion into authority.

### Logical-lane mode

When independent workers are unavailable, execute the same three roles in a disciplined sequence with role boundaries clearly marked. Do not say "three agents ran"; say the three governed lanes were executed in one session.

## STOP conditions

STOP when:

- the command would fabricate agent/runtime capabilities;
- Builder requires protected-state mutation outside authority;
- Design requires invented system state or unsupported metrics;
- Governor lacks evidence for a consequential security/provenance conclusion;
- one lane is being allowed to approve its own work;
- a candidate is being auto-promoted to Active/release state;
- canonical Build Ledger chronology cannot be distinguished from a build-stream lineage;
- a stale projected C-number is being treated as reserved;
- private provenance/recovery evidence would leak publicly;
- disagreement affects human-owned scope, risk acceptance, release, or canonical authority and has not been resolved by the human owner.

## Initial acceptance plan

Test this command on at least one real Signalproof build with meaningful design and governance surfaces. PASS requires evidence that:

1. role separation was preserved;
2. the Builder could not self-approve;
3. Design and Governor produced independent findings;
4. protected state and rollback remained intact;
5. security/provenance concerns were surfaced without silently redesigning the product;
6. build-stream chronology was recorded without C-number reservation;
7. final status distinguished technical, visual, governance/security, owner, release, and ledger states;
8. logical-lane mode did not falsely claim real spawned agents if unavailable.

Only after this acceptance evidence and owner approval should `build-git spawn` become Active.
