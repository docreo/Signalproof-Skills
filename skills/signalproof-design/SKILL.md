---
name: signalproof-design
description: Govern Signalproof product information architecture, workflow hierarchy, operational-versus-technical depth, state semantics, navigation, evidence access, product identity slots, and design acceptance without absorbing micro-polish or accessibility doctrine that belongs to dedicated specialists.
---

# Signalproof Design

## Purpose

`signalproof-design` is the product information-architecture and state-communication specialist.

> **Make system state understandable without hiding the evidence underneath it.**

This skill owns product structure and meaning. Use `signalproof-ui-polish` for micro-layout/visual finish and `signalproof-accessibility` for accessible interaction/presentation requirements.

## Inheritance

Inherits the active root `signalproof` contract. Design does not grant authority to rewrite a working baseline, replace branding strategy, fabricate state, or promote a release.

## Contract

1. Preserve product meaning; cross-product consistency must not erase product-specific workflows.
2. Separate branding assets from information architecture.
3. Newly originated Signalproof software candidates begin at `V1 RD1` unless governed otherwise; do not renumber history retroactively.
4. Substantial stateful products should provide an owner-facing summary when multiple screens/logs would otherwise be required to understand condition.
5. Distinguish Operational from Technical/Evidence depth when the product warrants it; this need not be two literal screens.
6. Health/status must be evidence-backed; UNKNOWN is not healthy.
7. Important status must be textual and evidence-drillable.
8. Prefer persistent navigation and durable workspaces when product scale warrants them.
9. Protect the known-working baseline; material redesign occurs in a governed candidate.
10. Separate concept, visual, runtime, data-correctness, accessibility, and owner acceptance evidence.
11. Stop when a generic Signalproof shell would materially harm the specific workflow.
12. Hand UI micro-detail and accessibility requirements to their dedicated specialists instead of growing this Skill indefinitely.

## Workflow

### 1. Establish Product Contract

Identify product/version, protected baseline, target candidate, primary users, workflows, decisions, current state sources, existing screenshots/mockups, and non-negotiable product semantics.

### 2. Information Architecture

Define only the workspaces needed, such as Dashboard, primary operational workspaces, evidence/history, technical/system view, settings, inspectors, queues, or contextual actions.

Avoid both giant single-screen control surfaces and decorative page proliferation.

### 3. Operational View

Answer proportionately:

```text
WHAT DO I HAVE?
WHAT IS RUNNING?
WHAT CHANGED?
WHAT NEEDS ATTENTION?
WHAT SHOULD I DO NEXT?
```

Values must map to real product state.

### 4. Technical / Evidence Depth

Expose material underlying truth such as versions, hashes, dependencies, services, models/engines, paths, permissions, provenance, evidence, known limitations, or security/readiness state when relevant.

Technical depth should explain operational summaries rather than contradict them.

### 5. State Semantics

Use explicit states such as HEALTHY, ATTENTION, DEGRADED, BLOCKED, UNKNOWN only when defined by product evidence. If percentages/meters are used, define factors and treatment of unknowns and preserve drill-down.

### 6. Product Identity Slots

For applicable products, use stable replaceable assets such as:

```text
Assets/Brand/product-logo.png
Assets/Brand/product-icon.png
Assets/Brand/product-icon.ico
```

Do not make the public Skill repository the canonical production-artwork store.

### 7. Candidate / Mockup Gate

For material redesign, preserve baseline and review navigation, hierarchy, workspace density, technical evidence access, product semantics, and expected resize behavior before broad implementation.

Mockup approval proves direction, not runtime behavior.

### 8. Specialist Handoff

Route micro-layout, wrapping, spacing, alignment, motion, responsive polish, control affordances, and optical detail to `signalproof-ui-polish`.

Route keyboard navigation, screen readers, contrast, scalable display, captions, alternative input, reduced motion, and semantic accessibility to `signalproof-accessibility`.

### 9. Build Handoff

Provide Build with protected baseline, target version, approved IA, data/state sources, asset slots, state semantics, resize requirements, applicable specialist requirements, acceptance matrix, and forbidden changes.

### 10. Acceptance

Keep separate evidence for workflow fidelity, dashboard/state correctness, technical/evidence correctness, runtime/resize, UI polish, accessibility, and owner visual acceptance.

## Lifecycle vs Disposition

When both matter, keep technology lifecycle and strategic disposition separate.

```text
DISCOVERED -> QUARANTINED -> UNDER REVIEW -> TESTED -> ACCEPTED -> INTEGRATED -> RETIRED
```

is not the same field as:

```text
ADOPT / ADAPT / INTEGRATE / WATCH / HOLD / REJECT / REPLACE
```

## STOP Conditions

STOP when redesign would overwrite the only accepted baseline, state/health has no trustworthy source, UNKNOWN would be represented as healthy, mockup/compile success is being represented as runtime/data acceptance, technical evidence is hidden for visual cleanliness, or a shared layout would materially reduce product usability.

## Completion Criteria

Design is complete when product workflow, IA, operational/technical depth, state semantics, source-of-truth fields, identity slots, specialist handoffs, protected baseline, build contract, and acceptance evidence classes are explicit.

## Identity

- **Suite:** Signalproof Skills
- **Skill:** `signalproof-design`
- **Version:** `0.2.0`
- **Maturity:** Active public baseline
- **Parent:** `signalproof` 0.1.1+
- **Domain:** Product information architecture and state communication
- **Created by:** Doc Reo / Signalproof
