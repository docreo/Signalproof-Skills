# `build-capsule` - Active Operator Command V0.1.0

**Status:** ACTIVE  
**Version:** 0.1.0  
**Owner:** Doc Reo

## Purpose

`build-capsule` is the operator-facing route to `signalproof-build-capsule`.

It creates a compact, human-readable and AI-readable transfer package for moving a substantial build or live-build update between AI systems without repeatedly transcribing the full source material into long prompts.

Accepted forms include:

```text
/dsp build-capsule
/dsp build capsule
dsp build-capsule
/dsp capsule
```

## Default Output

When tools and source material permit:

```text
BUILD CAPSULE IMAGE
+ AUTHORITATIVE PAYLOAD LIST
+ EXECUTION / UPDATE COMMAND
+ INTEGRITY / AUTHORITY SUMMARY
```

Add a Design Capsule when an approved visual baseline exists or the operator asks to preserve/transfer design authority.

## Modes

### `build-capsule`

Create/refine the Build Capsule package for the current bounded build or application.

### `build-capsule design`

Create/refine the companion Design Capsule from the current approved design baseline. For an existing live UI, default to `Preserve. Extend. Do not redesign.`

### `build-capsule live-update`

Create an additive update package for an already-live/current build. The execution command must preserve the existing baseline and must not instruct a from-scratch rebuild unless the owner explicitly changes scope.

## Required Behavior

1. Read the current source/payload enough to establish actual structure before compressing it.
2. Establish the domain authority map: architecture/flow, source data/content, visual design, execution scope, platform constraints, and live baseline where applicable.
3. Keep canonical payload files authoritative; do not copy large datasets into the image/prompt unnecessarily.
4. Extract and expose the smallest non-negotiable invariants.
5. Produce a one-sheet human-legible technical visual when image generation is available; do not use hidden/opaque encoding for critical information.
6. Produce an execution/update command that fits the known target limit and tells the receiving AI how to use the capsule and payload.
7. For multi-message targets, make each command independently actionable, cumulative, and explicit that more commands may follow; never assume future commands were already received.
8. For live builds, update in place and protect working state/design/data by default.
9. Never invent missing source data or claim target-system runtime acceptance that has not been observed.
10. Preserve security, privacy, rights, licensing, platform, and authority boundaries inherited from Signalproof.

## Relationship to Other Skills

- `signalproof-build-capsule` owns the transfer package.
- `signalproof-design` establishes product/design architecture when unresolved.
- `signalproof-cut-chase` may assist salience compression but does not replace source authority.
- `signalproof-handoff` preserves session/conversation continuity; Build Capsule preserves build-transfer structure.
- `signalproof-build` and `signalproof-build-spawn-debug` perform implementation after separately appropriate authority.

## STOP Conditions

STOP or narrow scope when same-domain authorities conflict; canonical payload needed for correctness is missing; live baseline cannot be distinguished from rebuild scope; capsule readability would be lost; critical information would require hidden encoding; private/secret material would be exposed; or the command would fabricate source content, execution authority, or runtime acceptance.

## Completion State

Use the strongest supported state:

- `BUILD CAPSULE / READY`
- `BUILD CAPSULE / READY + DESIGN CAPSULE`
- `BUILD CAPSULE / LIVE-UPDATE READY`
- `BUILD CAPSULE / PARTIAL - SOURCE GAP`
- `BUILD CAPSULE / STOP - AUTHORITY OR SOURCE CONFLICT`

## Signalproof Principle

> **Show the system. Attach the truth. Command the work.**
