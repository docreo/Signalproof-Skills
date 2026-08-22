# Signalproof Workbench R5 Slice 1 RD2 - Top Navigation Acceptance

**Status:** OWNER ACCEPTED / CANDIDATE UX BASELINE / NO PRODUCTION MUTATION  
**Work stream:** Signalproof Workbench Desktop Experience R5  
**Owner:** Doc Reo  
**Branch:** `candidate/workbench-desktop-experience-r5`  
**Parent design:** `designs/SP-WORKBENCH-DESKTOP-EXPERIENCE-R5.md`  
**R4 authority matrix:** `designs/SP-WORKBENCH-DESKTOP-EXPERIENCE-MATRIX-RD1-R4.md` on `candidate/workbench-bots-rd1`  
**Protected public Skills main checked at acceptance:** `a1bf4633d1adc1a1229fc338daa45c57014d37c0`  
**Acceptance date:** 2026-08-22

## 1. Locked Owner Decision

The R5 Slice 1 RD2 top-navigation shell is accepted as the continuing Workbench UX baseline.

Primary destinations are arranged horizontally in the top application bar:

```text
DASH | SESSIONS | BOTS | COMMAND CENTER | MEMORY | SETTINGS
```

The owner explicitly accepted this arrangement after rejecting the prior RD1 layout that stacked all six destinations vertically in the left rail.

The accepted interaction rule is:

- top bar = persistent primary Workbench destinations;
- left rail = local controls, lists, filters, and objects for the active destination;
- center = dominant conversation/task/work canvas;
- right rail/workpane = contextual information, evidence, files, preview, terminal, Git, artifacts, or other scoped utilities;
- Signalproof branding and Governor/Core authority remain visible without turning ordinary use into an admin console.

This shell does not need to visually clone Hermes Desktop or Grok. Familiar desktop-agent interaction patterns may be adopted or adapted, but Signalproof owns the product identity and operating model.

## 2. Human Acceptance Evidence

The owner reviewed the RD2 candidate visually and stated that the changed layout is acceptable and should be locked in before further Hermes-approved functionality is integrated.

Human-observed facts:

- primary navigation is visibly across the top;
- left rail is available for mode-specific content;
- Sessions remains usable as the ordinary conversational workspace;
- current Signalproof black/charcoal/red visual language remains acceptable;
- the next phase should expand approved Hermes-style desktop-agent capabilities rather than redesign this shell again.

This is human UX acceptance of the layout direction. It is not production deployment authority and is not canonical Build Ledger authority.

## 3. Protected UX Baseline

Do not reopen these decisions without contradictory evidence or a new owner direction:

1. Dash is first/default.
2. Primary navigation is horizontal across the top.
3. Sessions, Bots, Command Center, Memory, and Settings remain first-class destinations.
4. Left rail is mode-specific, not a permanent six-destination menu.
5. Center remains the dominant work surface.
6. Right rail/workpane remains contextual and collapsible.
7. Signalproof branding remains primary.
8. Governance detail is inspectable but should not flood normal chat.
9. The application should feel like a strong modern desktop AI workspace, not a seven-destination enterprise portal.

## 4. Protected Runtime Baseline

The UX acceptance does not change the required runtime chain:

```text
Human
  -> Signalproof Workbench
  -> Signalproof Governor
  -> Signalproof Core Runtime
  -> Signalproof Agent Runtime / Broker
  -> governed adapters / models / tools / environments
```

The already-working governed Granite path remains protected until a later Agent Runtime / Hermes adapter path proves equivalent or stronger governed behavior.

Do not add direct Workbench -> model, Workbench -> Core bypass, or Workbench -> Hermes-process authority paths.

## 5. Next Phase

The next builder should preserve this RD2 shell while implementing the approved Hermes-derived capability family through incremental Signalproof-owned slices.

The next authoritative plan is:

`plans/SP-WORKBENCH-R5-HERMES-APPROVED-INTEGRATION-CODEX-PLAN.md`

The receiving-builder continuity packet is:

`handoffs/SP-WORKBENCH-R5-CODEX-COMPLETE-HANDOFF.md`

## 6. Completion State

```text
R5 SLICE 1 RD2 TOP NAVIGATION: OWNER ACCEPTED
PRIMARY SHELL DIRECTION: LOCKED
RUNTIME / GOVERNANCE BASELINE: PROTECTED
PRODUCTION DEPLOYMENT: NOT AUTHORIZED
CANONICAL BUILD LEDGER APPEND: NOT CLAIMED
NEXT: CODEX-LEVEL HERMES-APPROVED FUNCTIONALITY INTEGRATION
```
