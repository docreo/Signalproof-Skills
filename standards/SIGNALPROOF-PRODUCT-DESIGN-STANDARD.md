# Signalproof Product Design Standard

**Status:** Candidate standard

**Scope:** Signalproof software products, desktop applications, utilities, device-facing tools, and governed product shells.

## Core Principle

Signalproof products should make system state understandable at face value without hiding the technical evidence underneath it.

This standard separates three things that must not be conflated:

1. **Brand identity** — logo/icon asset slots and Signalproof visual identity.
2. **Application layout** — information architecture, navigation, dashboard structure, workspaces, and human decision surfaces.
3. **Technical truth** — evidence, runtime state, dependencies, provenance, security/readiness state, logs, and known limitations.

The goal is consistency without forcing every Signalproof product into an identical reskin.

## 1. Candidate Versioning Standard

All newly originated Signalproof software product candidates begin at **V1 RD1** unless an explicit governed exception is recorded.

`V1 RD1` means the first governed functional candidate or proof baseline. It does not imply commercial release readiness.

Typical progression:

```text
V1 RD1
Functional candidate / proof baseline
        ↓
accepted working baseline
        ↓
V1 RD2+
Signalproof product-shell and experience maturation
        ↓
Alpha / Beta / RC / Release as separately governed
```

Existing products are not renumbered retroactively. They adopt this standard prospectively at the next appropriate governed development version.

## 2. Brand Asset Slot Standard

Every Signalproof product establishes replaceable brand-asset slots from the beginning, including R&D candidates.

Recommended minimum contract:

```text
Assets/
  Brand/
    product-logo.png
    product-icon.png
    product-icon.ico
```

Application code should point to the asset slot rather than scatter image paths throughout the product.

A Signalproof master logo/icon may be used as the default identity until an approved product-specific asset replaces it.

The skill/standard repository defines the **asset contract**, not the canonical production artwork. Canonical brand masters belong in a controlled Signalproof brand-asset source with version/hash provenance as required.

Recommended derivative icon sizes for Windows/product use include 2048, 1024, 512, 256, 128, 64, 48, 32, and 16 pixels plus `.ico` where applicable.

## 3. Branding Is Not Layout

Signalproof Brand Identity governs:

- replaceable logo/icon slots;
- product identity placement;
- the Signalproof dark visual family where applicable;
- typography conventions;
- semantic state treatment;
- cross-product visual consistency.

Signalproof Application Layout governs:

- information architecture;
- navigation;
- dashboards;
- workspaces;
- operational versus technical information depth;
- resizing/readability;
- information hierarchy and contextual actions.

Greenlight Readiness Tracker may inform the layout discipline, but another Signalproof product should not become a Greenlight reskin merely to comply with this standard.

## 4. Two Information Depths

Every substantial Signalproof application should expose two complementary information depths.

### Operational View

Answers:

> What is happening, how are we doing, and what needs my attention?

Typical content:

- current status;
- health/readiness;
- important counts;
- current signals;
- warnings;
- next actions;
- recent activity;
- progress or readiness.

This view should be understandable without requiring the user to inspect logs or raw evidence.

### Technical / Evidence View

Answers:

> Why does the system say that, what is actually installed/configured/running, and what evidence supports it?

Typical content:

- runtime state;
- dependencies;
- models/engines;
- versions and hashes;
- services and ports;
- paths and permissions;
- capabilities;
- provenance;
- health checks;
- security findings;
- logs/evidence;
- known limitations.

Do not hide material system truth behind a simplified dashboard. Do not force ordinary users to parse technical evidence merely to understand basic state.

## 5. Dashboard Requirement

A substantial stateful Signalproof product should provide a real Dashboard when the user would otherwise need to inspect multiple screens, logs, controls, or files to understand system condition.

The dashboard should answer quickly:

```text
WHAT DO I HAVE?
WHAT IS RUNNING?
WHAT CHANGED?
IS SOMETHING WRONG?
WHAT NEEDS ATTENTION?
WHAT SHOULD I DO NEXT?
```

Not every small utility requires a large multi-page dashboard. Apply the requirement proportionately to product complexity and persistent state.

## 6. Health and Readiness Communication

Health/readiness must be evidence-backed rather than decorative.

Preferred common states:

```text
HEALTHY
ATTENTION
DEGRADED
BLOCKED
UNKNOWN
```

A percentage or meter may be used only when the underlying factors justify aggregation and remain inspectable.

**Unknown must never silently count as healthy.**

A health surface should expose the factors that materially contribute to the result, such as source trust, hash verification, static review, license state, isolation, permissions, network exposure, evidence freshness, unresolved warnings, or other product-specific dimensions.

Because red is a Signalproof brand color, errors and critical states must not depend on red alone; reinforce them with text, iconography, or explicit state labels.

## 7. Lifecycle State and Disposition Are Separate

For intake/technology/governance products, lifecycle state and owner disposition are distinct dimensions.

Example lifecycle states:

```text
DISCOVERED
QUARANTINED
UNDER REVIEW
TESTED
ISOLATED
ACCEPTED
INTEGRATED
RETIRED
REJECTED
```

Example dispositions:

```text
ADOPT
ADAPT
INTEGRATE
WATCH
HOLD
REJECT
REPLACE
```

Do not reduce these to a single overloaded status field when both are materially useful.

## 8. Default Large-Application Layout Discipline

For larger native applications, the preferred starting information architecture is:

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

Expected design discipline includes, when applicable:

- persistent navigation;
- global product/project context;
- clear workspace title and task context;
- large central work surface;
- reusable cards/panels;
- visible system/state indicators;
- contextual actions;
- durable navigation;
- consistent status language;
- explicit human approval points.

Products may omit or adapt regions when their function does not require them.

## 9. Design Acceptance Gates

Significant UI/product-shell work should treat design acceptance as a real gate distinct from compile/runtime acceptance.

Applicable gates may include:

- functional acceptance;
- visual acceptance;
- layout/resize acceptance;
- dashboard-information acceptance;
- Technical/Evidence View acceptance;
- readability/accessibility review;
- brand-asset-slot verification;
- human owner acceptance.

A screenshot or mockup may approve design direction but cannot prove runtime behavior. A compiled UI cannot prove that the dashboard communicates correct state.

For material redesigns, create and approve a concept/mockup before large-scale styling or shell replacement when practical.

## 10. Protected-Baseline Rule

A major design migration must not destroy the last accepted functional baseline.

New layout work should occur in a new governed development version/candidate copy/branch so the prior accepted version remains available for rollback until the replacement passes the applicable gates.

## 11. Product-Specific Semantics

This standard defines the structure of clarity, not universal metrics.

A Competition Radar dashboard may emphasize tracked technologies, quarantine, review, material signals, and security health. A Media Studio dashboard may emphasize projects, engines, jobs, assets, QA, and runtime health. A readiness application may emphasize readiness, risks, evidence, and next actions.

Cross-product consistency must not erase product-specific meaning.

## 12. Governance

The standard is governed through the Signalproof lifecycle:

```text
DISCOVERED → CANDIDATE → TESTED → APPROVED → ACTIVE → DEPRECATED / RETIRED
```

Existing products migrate prospectively through governed versions. Protected working baselines are not rewritten merely to satisfy a new visual standard.

## Candidate Validation Plan

Before this standard is treated as Active doctrine:

1. apply it to Competition Radar C3 Intelligence Dashboard & Technology Disposition;
2. apply it to at least one materially different Signalproof product;
3. verify that the standard generalizes without forcing inappropriate identical layouts;
4. verify Operational View and Technical/Evidence View remain truthful and coherent;
5. verify default brand-slot replacement does not require unrelated product rewrites;
6. obtain owner approval before promotion.

## Identity

- **Standard:** Signalproof Product Design Standard
- **Version:** Candidate 0.1
- **Maturity:** Candidate
- **Owner:** Signalproof / Doc Reo
- **Related skill candidate:** `signalproof-design`
