# Signalproof `/design-git` Workmode Command Candidate

**Status:** CANDIDATE / NOT ACTIVE

## Purpose

`/design-git` is a lightweight operator command for entering a Git-governed Signalproof product-design workmode without duplicating the full design/planning/review guidance inside the conversation prompt.

Its central rule is:

> **Verify the governing Git state, load the current Active design-governance stack needed for this product, preserve the product contract and protected baseline, and keep design context compact.**

This is a routing/bootstrap command. It does not replace `signalproof-router`, `signalproof-design`, `signalproof-plan`, `signalproof-review`, or `signalproof-verify`.

## Canonical Operator Forms

Preferred slash command:

- `/design-git`

Conversational alias:

- `design-git`

Potential parser alias, if a future hierarchical command surface supports it:

- `/design/git`

The hyphenated slash form is canonical for this Candidate.

## Intended Expansion

When the operator invokes `/design-git`, the workmode should:

1. Resolve the governing repository. Default for Signalproof product design: `docreo/Signalproof-Skills`, unless explicitly overridden.
2. Fetch current protected/default `main` identity before consequential design work.
3. Load `signalproof-router` from that exact governing ref.
4. Establish the product, version/candidate, protected baseline, real workflow, users, and available visual/runtime evidence.
5. Route to `signalproof-design` when information architecture, layout, dashboard/state communication, operational/technical depth, brand asset slots, readability, or visual acceptance are central.
6. Load supporting Active skills only when evidence requires them, typically:
   - `signalproof-plan` when design scope/authority/acceptance is not yet bounded;
   - `signalproof-research` or `signalproof-investigate` when product truth or external design constraints are unresolved;
   - `signalproof-security` when design choices affect secrets, permissions, trust boundaries, data/network exposure, or security controls;
   - `signalproof-verify` when a state/health/metric/design claim must be proven;
   - `signalproof-review` for design-contract fidelity and quality acceptance;
   - `signalproof-build` only after implementation is separately authorized;
   - `signalproof-document`, `signalproof-closeout`, `signalproof-learn`, and `signalproof-handoff` only when their evidence-state triggers are reached.
7. Bind design decisions to actual product state and evidence; never invent metrics or health for presentation.
8. Preserve the governing Git ref and loaded skill identities in the work trace.
9. Re-fetch governing `main` before a consequential new design phase if freshness may matter.
10. Keep design capability separate from implementation authority.

## Lazy-Loading Rule

`/design-git` MUST NOT preload the entire Signalproof suite.

Use progressive disclosure:

- bootstrap with current repo identity + Router;
- load Design immediately when design is the central objective;
- load Plan/Research/Security/Verify/Review/Build only when the current evidence state requires them;
- retain compact summaries and blob/ref identities after full reads;
- reload exact current bodies if the governing ref advances materially.

## Design Workmode Contract

The command should maintain these fields proportionately:

- **Product / candidate version**
- **Governing repository/ref**
- **Protected baseline / rollback**
- **Primary user/workflow**
- **Existing UI/runtime evidence**
- **Current information architecture**
- **Operational View requirements**
- **Technical/Evidence View requirements**
- **Health/state semantics**
- **Brand asset-slot requirements**
- **Resize/readability/accessibility expectations**
- **Visual acceptance gates**
- **Functional/runtime gates kept separate from visual gates**
- **Current loaded skills / route**
- **Current next authorized design action**

These do not need to be repeated verbatim in every response.

## Authority Boundary

Invoking `/design-git` authorizes Git-backed skill retrieval and design routing. It does **not** by itself authorize:

- implementation changes;
- overwriting a working baseline;
- framework/runtime migration;
- branding replacement or canonical artwork selection;
- fabricated dashboard metrics or system state;
- security-control changes;
- production release/deployment;
- direct protected-main overwrite;
- skill/policy activation;
- canonical Build Ledger mutation from an unverified head.

Mockup/concept approval remains design-direction approval only unless runtime/product acceptance is separately proven.

## Interaction With Existing Skills

```text
/design-git
   ↓
verify current governance repo/ref
   ↓
signalproof-router
   ↓
signalproof-design
   ↓
lazy-load plan/research/security/verify/review as needed
   ↓
implementation handoff to signalproof-build only when authorized
   ↓
closeout/learn/handoff when triggered
```

## Product-Specific Design Rule

`/design-git` must preserve the Active Design doctrine that cross-product consistency must not erase product-specific workflows.

It must not force every Signalproof product into the same dashboard shell. It should derive the appropriate information architecture from the product's real operational needs while maintaining Signalproof standards for truth, state clarity, evidence access, protected baselines, and visual acceptance.

## Freshness Rule

At workmode entry:

- fetch current `docreo/Signalproof-Skills/main`;
- bind Router and Design to that exact ref;
- load other supporting skills from the same governing ref.

If `main` later advances only through unrelated metadata and relevant skill blobs remain identical, record that and continue without unnecessary reload churn.

## Expected Status Output

When useful, summarize compactly:

```text
DESIGN-GIT MODE
Governance: docreo/Signalproof-Skills @ <current-main-sha>
Route: Design → Review
Loaded now: Router, Design
Product: <product/version>
Protected: <baseline>
Current design gate: <gate>
Next authorized action: <action>
```

Do not repeatedly restate the full Design skill body.

## Acceptance Criteria for Candidate Promotion

Before `/design-git` becomes Active, demonstrate at least:

1. successful use across materially different Signalproof product types;
2. current Git governance is actually fetched;
3. Router + Design are loaded from the exact governing ref;
4. supporting skills are lazy-loaded only when needed;
5. product-specific workflows remain intact rather than being homogenized;
6. mockup/design acceptance is not confused with runtime acceptance;
7. protected baselines and rollback survive design work;
8. design state/metrics remain evidence-backed;
9. prompt/context duplication is materially reduced without losing design continuity;
10. build implementation remains separately authorized.

## Failure Conditions

Fail this Candidate if it:

- assumes remembered Design doctrine instead of checking current Git;
- preloads every specialist skill without need;
- turns a design shortcut into build authority;
- fabricates system health/state or metrics;
- overwrites a protected UI/application baseline;
- forces one generic application shell onto all products;
- silently makes branding or architecture decisions outside authority;
- treats a mockup as runtime acceptance;
- directly changes protected `main` merely because `/design-git` was invoked.

## Candidate Identity

- **Command:** `/design-git`
- **Alias:** `design-git`
- **Potential future alias:** `/design/git`
- **Type:** Git-backed design workmode/bootstrap command
- **Maturity:** Candidate / not Active
- **Governing suite:** Signalproof Skills
- **Primary router:** `signalproof-router`
- **Primary specialist:** `signalproof-design`
- **Supporting specialists:** `signalproof-plan`, `signalproof-research`, `signalproof-investigate`, `signalproof-security`, `signalproof-verify`, `signalproof-review`, `signalproof-build`, with other Active skills loaded only when evidence state requires
- **Created by:** Doc Reo / Signalproof
