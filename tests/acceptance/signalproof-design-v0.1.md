# Signalproof Design V0.1 Acceptance Specification

## Purpose

Validate that `signalproof-design` generalizes across materially different Signalproof products without turning cross-product consistency into a forced reskin, fake dashboard metrics, or loss of technical evidence.

Promotion requires two materially different scenarios and explicit owner approval.

---

## Scenario 1 — Competition Radar C3

### Request

Redesign Signalproof Competition Radar after its accepted C2 scanner baseline so the current scan screen becomes a dedicated **Scan & Intelligence** workspace and the product gains a strategic **Dashboard** plus technology-disposition and technical/evidence views.

### Protected State

- accepted C2 scanner behavior;
- Routine / Notable / Material classification logic;
- canonical competition database and scan history;
- C2 rollback package/baseline;
- GitHub read-only intake boundary;
- evidence/report generation.

### Required Design Direction

The design must propose, proportionately:

- persistent navigation;
- Dashboard as strategic landing page;
- Scan & Intelligence as an operational workspace;
- Material Signals / Watchlist visibility;
- Technology Registry / Review Queue / Quarantine / Isolated / Accepted / Integrated states as appropriate;
- Security & Health view;
- Evidence / Reports;
- Technical/System view;
- replaceable product logo/icon slots;
- explicit operational summary and deeper technical/evidence depth.

### Dashboard Requirements

The dashboard must answer at face value:

- what is tracked;
- what requires review;
- what is quarantined/isolated/accepted/integrated;
- what material/notable signals exist;
- current health/security posture;
- what needs attention next.

No metric may be invented merely to make the dashboard appear complete.

### Health Requirements

If a health meter is used:

- factors must be defined;
- unknown/unverified factors must not count as healthy;
- drill-down to supporting evidence must exist in the design;
- red must not be the only indicator of a critical state.

### Required Behaviors

Pass when the design:

1. preserves C2 as rollback rather than rewriting it;
2. moves the existing scan function into a clearer workspace rather than discarding it;
3. distinguishes Operational View from Technical/Evidence View;
4. uses real source-of-truth fields for proposed dashboard metrics;
5. separates technology lifecycle state from disposition;
6. gives Material/Notable signals a direct owner-facing path to supporting evidence;
7. uses replaceable brand-asset slots rather than hard-wiring a one-off logo path;
8. remains recognizably Signalproof without copying Greenlight content or product semantics;
9. defines visual/layout acceptance separately from runtime acceptance;
10. identifies STOP conditions and rollback.

### Fail Conditions

Fail immediately if the design:

- overwrites the accepted C2 baseline;
- invents a security percentage without defined factors;
- hides unknown state in a healthy aggregate;
- removes evidence/detail access to simplify the dashboard;
- forces lifecycle and disposition into one ambiguous field;
- treats a concept image as proof that scanning still works;
- copies Greenlight screen-for-screen;
- changes scanner/network/security architecture merely for visual consistency.

---

## Scenario 2 — Materially Different Signalproof Product

### Target

Use a Signalproof product whose workflow is materially different from Competition Radar, such as Media Studio / Signal Flow, Greenlight, Core Runtime, Workstation Manager, or another owner-approved product.

### Required Behaviors

The skill passes Scenario 2 when it:

1. applies the same design doctrine without requiring Radar-specific navigation or metrics;
2. preserves the product's own workflow and terminology;
3. identifies whether a Dashboard is proportionate to product complexity;
4. defines Operational and Technical/Evidence depth appropriate to that product;
5. uses replaceable brand-asset slots;
6. treats health/readiness truthfully and product-specifically;
7. preserves the accepted baseline/rollback;
8. defines an appropriate concept/mockup gate for a material redesign;
9. defines layout/resize/readability acceptance relevant to the target;
10. does not force an identical Greenlight/Radar shell where it harms usability.

### Fail Conditions

Fail if Scenario 2 merely reuses Radar's page names, metrics, or technology-disposition model without product justification.

---

## Cross-Scenario Promotion Gate

`signalproof-design` may advance from Candidate only when:

- Scenario 1 passes;
- Scenario 2 passes;
- no fail conditions remain unresolved;
- the owner explicitly approves promotion;
- the registry/router are updated only after approval;
- a provenance/promotion record binds the evidence to the exact skill candidate.

Until then, the skill remains non-routable Candidate state.
