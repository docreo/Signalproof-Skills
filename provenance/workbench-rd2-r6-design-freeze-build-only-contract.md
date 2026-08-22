# Signalproof Workbench RD2 R6 — Design Freeze / Build-Only Contract

**Date:** 2026-08-21  
**Status:** ACTIVE FOR CURRENT R6 BUILD LOOP  
**Branch:** `candidate/workbench-rd2-r6-build-only`

## Reason

Owner observed that Designer activity was continuing to influence the product while Builder was implementing, creating visible drift and avoidable role collision.

Current Signalproof governance already supports separation:

- `signalproof-design` owns product structure, workflow hierarchy, state semantics, and design acceptance, and explicitly hands micro-layout/polish to specialist lanes.
- `signalproof-build` states that implementation is not permission to redesign the task and forbids mixing optional redesign with required correction.
- the R6 Builder handoff already says not to redesign the product shell unless current evidence materially contradicts the accepted design.

The current workstream therefore freezes design authority for R6-G1 implementation.

## Frozen design authority

Builder consumes these as the bounded design packet:

- `designs/SP-WORKBENCH-RD2-R6-AGENT-CONSOLE-PREPLANNING.md`
- `handoffs/SP-WORKBENCH-RD2-R6-BUILDER-HANDOFF.md`
- `designs/SP-WORKBENCH-RD2-R6-G1-CODE-ARTIFACT-WORKSPACE-ADDENDUM.md`
- `provenance/workbench-rd2-r6-g1-version-legibility-requirement.md`
- subsequent owner UI evidence and bug findings that materially affect acceptance

## Build-time role boundary

During the active G1 build loop:

### Builder MAY

- implement the frozen requirements;
- correct compile/runtime/harness defects;
- make the smallest effective layout correction needed to satisfy an already-frozen requirement;
- fix clipping, overlap, unreadable text, broken focus, broken scroll behavior, or other acceptance defects proven by evidence;
- preserve and test Sessions, Bots, Governor/Core/Granite, and Code Artifact functionality;
- create fresh isolated candidate lanes and evidence.

### Builder MUST NOT

- invent a new shell;
- redesign information architecture;
- add decorative or structural UI elements merely to satisfy an abstract design idea;
- move major navigation or workflows without a material contradiction in evidence;
- introduce optional visual concepts during debug;
- accept new Designer changes automatically while the build is in progress.

### Designer MAY

- review the built candidate against the frozen design packet;
- identify a concrete mismatch against an already-approved requirement;
- record future design proposals for a later governed design cycle.

### Designer MUST NOT

- silently change the active G1 build contract;
- add new layout, styling, workflow, interaction, information-architecture, or product-surface requirements during Builder debug;
- mutate the build-only branch.

## Change-control rule

A design change during implementation enters the active build only when one of the following is true:

1. owner explicitly changes the design requirement;
2. runtime/UI evidence proves the frozen design cannot satisfy acceptance;
3. a protected-state, safety, accessibility, or product-meaning conflict requires bounded redesign.

Otherwise, the proposal is deferred to a future design candidate.

## Branch separation

Active execution branch:

`candidate/workbench-rd2-r6-build-only`

The earlier shared branch remains historical/design/build evidence but is no longer the moving execution authority for the current loop.

All subsequent R6-G1 build corrections should be committed to the build-only branch until owner UI acceptance or an explicit material design re-open.

## Current acceptance focus

R6-G1 remains limited to the already-approved scope:

- transcript gutters/readable width/message rhythm;
- composer and mature scroll behavior;
- clear non-overlapping version/build identity;
- Code Artifact recognition, View/Edit, Copy, Save As, Back to Chat;
- no automatic code execution;
- preserve Sessions/Bots;
- preserve Governor -> Core -> Granite;
- no direct provider/shell bypass;
- machine gates before owner UI acceptance.

## Authority

The owner's active `/dsp complete` envelope continues for the bounded Workbench R6 workstream.
