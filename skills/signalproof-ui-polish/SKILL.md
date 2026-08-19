---
name: signalproof-ui-polish
description: Refine interface readability, wrapping, spacing, alignment, density, radii, typography, responsive behavior, hit targets, micro-interactions, motion restraint, and visual finish after product information architecture is established.
---

# Signalproof UI Polish

## Purpose

`signalproof-ui-polish` is the narrow specialist for interface finish and micro-layout quality.

> **Polish should clarify the interface without changing the product contract.**

## Inheritance

Inherits the active root `signalproof` contract. It does not authorize product rearchitecture, branding replacement, fabricated data, or unrelated framework changes.

## Contract

1. Work from an established product/design contract when one exists.
2. Fix clipping, overlap, hidden text, broken wrapping, unreadable density, inconsistent spacing, and alignment before decorative refinement.
3. Use responsive layout that preserves meaning at supported widths.
4. Keep related controls visually grouped and unrelated controls distinguishable.
5. Use typography hierarchy deliberately; avoid tiny status text and accidental visual noise.
6. Maintain consistent control sizing, padding, radii, icon treatment, and state affordances.
7. Prefer optical alignment when strict geometric centering appears visually wrong.
8. Use tabular numerals for changing numeric readouts when alignment matters.
9. Keep hit targets large enough for reliable interaction.
10. Use motion only when it improves state understanding; respect reduced-motion requirements through Accessibility.
11. Preserve explicit text labels for consequential state/action; icons alone should not carry ambiguous meaning.
12. Verify resize behavior and visual acceptance separately from runtime/functional correctness.

## Review Pass

Check:

- text wrapping and ellipsis behavior;
- overflow, clipping, z-order, and covered headings/bylines;
- spacing rhythm and container padding;
- alignment and baseline consistency;
- control density and hit targets;
- responsive breakpoints/minimum widths;
- long labels, paths, hashes, and error messages;
- table/cell sizing and word wrapping;
- status readability;
- hover/focus/pressed/disabled states;
- scroll behavior;
- motion/transitions;
- high-density screens at common desktop resolutions.

## STOP Conditions

STOP when a polish change would alter workflow semantics, hide evidence, replace the accepted IA, fabricate state, reduce accessibility, or require unrelated framework/runtime changes outside scope.

## Completion Criteria

Complete when the defined interface surfaces are free of material clipping/overlap/readability defects, responsive behavior is acceptable, control states are clear, and visual evidence is preserved separately from functional/runtime proof.

## Identity

- **Suite:** Signalproof Skills
- **Skill:** `signalproof-ui-polish`
- **Version:** `0.1.0`
- **Maturity:** Active public baseline
- **Parent:** `signalproof` 0.1.1+
- **Domain:** UI detail, readability, responsive polish and micro-interactions
- **Created by:** Doc Reo / Signalproof
