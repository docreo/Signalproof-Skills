# Git-Backed Workmode Command Candidates v0.1 — Acceptance Contract

**Status:** CANDIDATE ACCEPTANCE CONTRACT

## Scope

This contract governs candidate validation for:

- `/build-git`
- `/design-git`

These are command-layer bootstraps over the existing Active Signalproof Skill Suite. They are not new monolithic specialist skills.

## Required Invariants

A Candidate PASS requires all applicable invariants below.

### Governance freshness

1. Current governing repository identity is fetched at workmode entry.
2. Router and subsequently loaded skills are bound to the same governing ref unless a deliberate ref transition is recorded.
3. A materially advanced `main` is re-evaluated before a consequential new phase.
4. If `main` changed but relevant skill blobs are identical, that fact may be recorded and the work may continue without unnecessary full reload.

### Lazy loading / prompt efficiency

5. The command does not preload every skill body.
6. `signalproof-router` is the bootstrap routing authority.
7. Specialist bodies are loaded only when the current evidence state/objective requires them.
8. Full specialist bodies are not redundantly pasted into user-visible conversation unless specifically useful/requested.
9. Compact route/ref/status summaries may persist in conversation state after full reads.

### Authority preservation

10. Command invocation does not itself grant destructive, privileged, credential, deployment/release, branding, architecture-rewrite, direct-main, skill-activation, or canonical-ledger authority.
11. Existing explicit human authority remains controlling.
12. Protected-state and rollback contracts remain intact.
13. STOP conditions of loaded Active skills remain controlling.

### `/build-git`

14. Build work loads `signalproof-build` only after the objective is sufficiently bounded, directly or through `signalproof-plan`.
15. Design is loaded when information architecture/visual-state semantics materially affect implementation.
16. Readiness/Security/Verify/Review/Recovery are loaded only when their evidence-state triggers occur.
17. A build shortcut does not silently convert discovered defects into scope expansion.
18. Meaningful completed milestones still route through Closeout.

### `/design-git`

19. `signalproof-design` is loaded when product design is the central objective.
20. Product-specific workflows are preserved rather than forced into a universal shell.
21. Design direction/mockup approval remains distinct from runtime acceptance.
22. Health/state/metrics remain evidence-backed.
23. Implementation remains separately authorized through Build.

### Existing-intelligence / learning

24. The commands do not create duplicate specialist skills solely for convenience.
25. Reusable learning follows existing `signalproof-learn` lifecycle rather than auto-activation.
26. Command changes themselves remain Candidate until tested, approved, and promoted.

## Candidate Scenarios

Promotion should use multiple materially different scenarios.

Minimum suggested evidence:

### `/build-git`

- one governed agent/runtime integration build;
- one desktop/media/application feature build;
- one build that triggers Security or Readiness in addition to Build;
- one build where `main` advances during the conversation and the command correctly refreshes/rebinds governance.

### `/design-git`

- one operational/dashboard-oriented product;
- one creative/media-production product;
- one design where the product-specific workflow requires adaptation rather than copying another Signalproof shell;
- one design-to-build handoff demonstrating that Design does not silently implement.

## Evidence To Retain

For each qualifying use, retain proportionately:

- governing repo/ref at entry;
- relevant skill blob identities;
- selected route;
- skills actually loaded;
- protected baseline;
- consequential route transitions;
- acceptance/STOP results;
- whether prompt duplication was reduced in practice;
- unresolved failures/limitations.

## Promotion Rule

Do not mark either command Active merely because its specification exists.

Promotion requires:

`DISCOVERED → CANDIDATE → TESTED → APPROVED → ACTIVE`

with human approval and evidence that the command reduces repeated context work without weakening Signalproof governance.

## Current Candidate Decision

- `/build-git`: **CANDIDATE / NOT ACTIVE**
- `/design-git`: **CANDIDATE / NOT ACTIVE**

No automatic router modification, slash-command runtime registration, skill activation, protected-main merge, or Build Ledger canonical mutation is authorized by this document.
