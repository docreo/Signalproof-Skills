---
name: signalproof-design
description: Govern Signalproof product information architecture, native application layout, dashboards, operational-versus-technical information depth, replaceable brand-asset slots, health/state communication, readability, visual acceptance, and cross-product design consistency without overriding product-specific workflows or implementation authority.
---

# Signalproof Design

## Purpose

`signalproof-design` is the product-design and information-architecture specialist for Signalproof software.

Its central rule is:

> **Make system state understandable without hiding the evidence underneath it.**

Design is not decoration. The skill governs how a product presents state, navigation, decisions, health, evidence, and technical depth so that ordinary use is clear while deeper inspection remains available.

## Inheritance

This skill inherits the active root `signalproof` contract for human authority, protected state, evidence classification, verification, recovery, STOP conditions, public/private boundaries, milestone closeout, and governed learning.

It also consumes the active/candidate Signalproof Product Design Standard when that standard is in scope.

Design does not create authority to rewrite working products, change branding strategy, modify business naming, certify security, promote a release, or bypass product-specific acceptance gates.

## Design Contract

1. **Separate branding from layout.** Brand identity and product information architecture are related but not interchangeable.
2. **Preserve product meaning.** Cross-product consistency must not erase product-specific workflows, terminology, or decision semantics.
3. **Establish replaceable identity slots.** New products should provide stable logo/icon asset slots so later asset replacement does not require unrelated application rewrites.
4. **Use the V1 RD1 candidate rule prospectively.** Newly originated Signalproof software candidates begin at `V1 RD1` unless a governed exception exists; existing histories are not renumbered retroactively.
5. **Require a Dashboard proportionately.** A substantial stateful product should provide an owner-facing operational summary when users would otherwise need multiple screens/logs to understand condition.
6. **Provide two information depths.** Substantial products should distinguish an Operational View from a Technical/Evidence View.
7. **Make health evidence-backed.** Unknown state is not healthy state. Percentages/meters must expose their underlying factors.
8. **Use explicit status language.** Important states must be readable in text and not depend on color alone.
9. **Prefer durable application structure.** Larger products should generally use persistent navigation, clear context, reusable workspaces/cards, visible system state, contextual actions, and human approval points when applicable.
10. **Protect the known-working baseline.** Material redesign occurs in a new governed candidate/version/branch/copy with rollback preserved.
11. **Mock up before large shell replacement when practical.** A concept image may approve direction but does not prove runtime behavior.
12. **Keep visual and functional acceptance distinct.** Compile, runtime, layout, dashboard correctness, technical-view correctness, accessibility/readability, and owner visual acceptance are separate evidence classes.
13. **Design from real state.** Do not fabricate metrics, health percentages, readiness, installed components, evidence, or lifecycle states merely to make a dashboard look complete.
14. **Expose decision provenance.** A dashboard summary should allow the user to reach the evidence or technical state supporting the summary when material.
15. **Stop on product-contract conflict.** If the standard would force a layout that materially harms the product workflow, stop and adapt the standard application rather than blindly reskinning.

## Design Workflow

### 1. Identify Product Stage

Establish:

- product and current version/stage;
- whether this is a new V1 RD1 candidate or an existing product;
- protected baseline/rollback;
- target development version;
- product-specific workflow and user roles;
- current UI evidence/screenshots/mockups;
- applicable design standard and exceptions.

Do not retroactively rename protected versions merely to satisfy the current standard.

### 2. Define Information Architecture

Map the product into only the workspaces it actually needs.

For substantial products, consider:

- Dashboard;
- primary operational workspace(s);
- evidence/history/reporting;
- technical/system view;
- settings;
- contextual inspectors or queues when justified.

Avoid a giant single-screen control surface when separate durable workspaces would reduce density and clarify decisions.

Avoid creating many navigation pages merely to look sophisticated.

### 3. Define Operational View

The Operational View should answer quickly:

```text
WHAT DO I HAVE?
WHAT IS RUNNING?
WHAT CHANGED?
IS SOMETHING WRONG?
WHAT NEEDS ATTENTION?
WHAT SHOULD I DO NEXT?
```

Select metrics and signals from actual product state. Do not invent universal cards.

### 4. Define Technical / Evidence View

Expose material underlying truth such as:

- runtime state;
- dependencies;
- engines/models;
- versions/hashes;
- services/ports;
- paths/permissions;
- capability state;
- provenance;
- security/readiness checks;
- evidence/logs;
- known limitations.

The Technical/Evidence View should explain the Operational View rather than contradict it.

### 5. Define Health / State Semantics

Use explicit evidence-backed states such as:

```text
HEALTHY
ATTENTION
DEGRADED
BLOCKED
UNKNOWN
```

A meter/percentage is optional. If used:

- define the factors;
- define treatment of unknown/unverified factors;
- never silently score unknown as healthy;
- preserve drill-down to supporting evidence;
- avoid false precision when the model does not justify it.

Because Signalproof red may be both brand accent and warning/error color, reinforce warning/error states with labels and/or iconography.

### 6. Define Brand Asset Contract

For new or migrating products, provide stable product asset slots such as:

```text
Assets/
  Brand/
    product-logo.png
    product-icon.png
    product-icon.ico
```

Use a default approved Signalproof identity until a product-specific asset is approved.

Do not make the skill repository the accidental canonical storage location for production artwork.

### 7. Protect the Baseline

Before large design implementation:

- preserve the accepted working baseline;
- create a new version/candidate copy/branch;
- bind acceptance evidence to the new candidate;
- keep rollback accessible.

A redesign may change presentation architecture substantially without invalidating the previous functional baseline.

### 8. Mockup / Concept Gate

For material redesigns, create a concept/mockup when practical and review:

- navigation structure;
- workspace hierarchy;
- dashboard information hierarchy;
- technical/evidence access;
- status/health clarity;
- density/readability;
- product-specific semantics;
- expected 1080p/resizing behavior when relevant.

Approval of a mockup authorizes design direction only, not runtime acceptance.

### 9. Build Handoff

When implementation is authorized, hand off a bounded design contract to `signalproof-build` including:

- protected baseline;
- exact target version/candidate;
- approved layout/workspace structure;
- required asset slots;
- dashboard metrics and source-of-truth fields;
- technical-view requirements;
- health semantics;
- resize/readability requirements;
- acceptance matrix;
- forbidden changes.

Do not let implementation silently redesign the approved information architecture.

### 10. Design Acceptance

Applicable gates may include:

- product workflow fidelity;
- visual acceptance;
- dashboard information correctness;
- Operational View correctness;
- Technical/Evidence View correctness;
- resize/layout acceptance;
- readability/accessibility review;
- brand asset-slot presence;
- health/state semantic correctness;
- owner acceptance.

Design acceptance must use real runtime/product evidence where the claim concerns live state.

### 11. Closeout

After a meaningful design milestone:

- preserve approved mockup/design record;
- preserve acceptance screenshots/evidence;
- record protected baseline and rollback;
- record unresolved UX debt separately;
- route through `signalproof-closeout` before the next material development phase.

## Default Large-Application Pattern

This is a starting discipline, not a mandatory identical layout:

```text
┌─────────────────────────────────────────────────────────────┐
│ PRODUCT IDENTITY     GLOBAL CONTEXT            SYSTEM STATE │
├─────────────┬───────────────────────────────────────────────┤
│             │                                               │
│ Navigation  │               Workspace                       │
│             │                                               │
│ Dashboard   │                                               │
│ Main Tools  │                                               │
│ Evidence    │                                               │
│ Technical   │                                               │
│ Settings    │                                               │
│             │                                               │
├─────────────┴───────────────────────────────────────────────┤
│ Status / active operation / contextual information          │
└─────────────────────────────────────────────────────────────┘
```

Apply only the regions that improve the product.

## Lifecycle State vs Disposition

When a product governs technology/intake decisions, keep lifecycle state and owner disposition separate when both matter.

Example lifecycle:

```text
DISCOVERED → QUARANTINED → UNDER REVIEW → TESTED / ISOLATED → ACCEPTED → INTEGRATED → RETIRED
```

Example disposition:

```text
ADOPT / ADAPT / INTEGRATE / WATCH / HOLD / REJECT / REPLACE
```

Do not use one overloaded field to mean both operational state and strategic decision.

## V1 RD1 Rule

For newly originated Signalproof software:

> **Start at V1 RD1.**

V1 RD1 proves the functional candidate/baseline. Design maturation may begin during RD1 when necessary, but the full standard becomes a required consideration for subsequent governed versions after the functional baseline is established.

Existing products keep their historical numbering and adopt the standard prospectively.

## STOP Conditions

Stop when:

- the redesign would overwrite the only accepted working baseline;
- dashboard metrics have no trustworthy source of truth;
- a health percentage would require treating unknown as healthy;
- the proposed standard conflicts materially with the product workflow and no approved adaptation exists;
- branding artwork is being silently treated as canonical without controlled provenance;
- implementation would require unrelated framework/runtime/security changes outside scope;
- a mockup is being represented as runtime acceptance;
- compile/runtime success is being represented as dashboard-information or visual acceptance;
- technical evidence is being hidden to make the dashboard look cleaner;
- a generic cross-product layout would materially reduce usability of the specific product.

## Anti-Patterns

Fail this skill when Design:

- copies another Signalproof product screen-for-screen instead of applying shared layout discipline;
- adds dashboards with fake or placeholder health numbers that look authoritative;
- requires every tiny utility to have a complex navigation shell;
- hides unknown/unverified state inside green aggregate scores;
- uses color alone for material status;
- rewrites historical versions to fit a new numbering standard;
- scatters logo/icon references throughout code instead of using replaceable asset slots;
- places canonical production artwork in the public skill specification as the source of truth;
- replaces working functionality merely to achieve visual consistency;
- mixes marketing branding decisions with information-architecture governance;
- treats Operational View as a substitute for technical evidence;
- treats Technical View as an excuse for an unusably dense primary interface.

## Candidate Acceptance Requirement

Before `signalproof-design` may become Active, it must pass at least two materially different scenarios:

1. **Competition Radar C3** — dashboard + scanning workspace + technology disposition + security/health + evidence/technical view.
2. **A second materially different Signalproof product** — sufficient to prove that the design standard generalizes without forcing an inappropriate identical layout.

Promotion requires owner approval after scenario evidence is reviewed.

## Status

- **CANDIDATE DESIGN CONTRACT** — information architecture/design contract is defined but not yet implementation-accepted.
- **DESIGN DIRECTION ACCEPTED** — concept/mockup direction accepted; runtime/product acceptance pending.
- **DESIGN ACCEPTED** — applicable design gates pass for the defined candidate.
- **REVISE** — design direction or information hierarchy needs bounded correction.
- **BLOCKED** — required product truth/source-of-state/visual evidence is unavailable.
- **STOP** — continuing would violate protected state, truthfulness, authority, or product workflow.

## Identity

- **Suite:** Signalproof Skills
- **Skill:** `signalproof-design`
- **Version:** `0.1.0-rc1`
- **Maturity:** Candidate
- **Parent:** `signalproof` 0.1.1+
- **Works with:** `signalproof-plan`, `signalproof-build`, `signalproof-verify`, `signalproof-review`, `signalproof-document`, `signalproof-closeout`
- **Domain:** Product design governance, information architecture, dashboard clarity, operational/technical depth, brand asset slots, health/state communication, visual acceptance
- **Created by:** Doc Reo / Signalproof
