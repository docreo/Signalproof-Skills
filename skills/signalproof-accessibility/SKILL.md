---
name: signalproof-accessibility
description: Govern accessible interaction and presentation for Signalproof interfaces including keyboard operation, focus, screen-reader semantics, contrast, scalable display, reduced motion, captions, alternative input, and equivalent access to consequential state and actions.
---

# Signalproof Accessibility

## Purpose

`signalproof-accessibility` is the specialist for preserving meaningful access across human capabilities and interaction modes.

> **Interface reduction must not become accessibility reduction.**

## Inheritance

Inherits the active root `signalproof` contract. Accessibility requirements do not authorize unrelated redesign or fabricated accessibility certification.

## Contract

1. Ensure consequential controls can be reached and operated without a pointing device when the platform supports keyboard interaction.
2. Preserve visible focus and logical focus order.
3. Provide semantic names/roles/states for assistive technologies where the framework supports them.
4. Do not rely on color alone for material status or required action.
5. Preserve sufficient contrast and legibility for text/status/control boundaries.
6. Support scalable text/display without clipping or inaccessible hidden content where practical.
7. Respect reduced-motion preferences and avoid unnecessary motion that obscures state.
8. Provide captions/transcripts for meaningful audio/video content when the product presents such content.
9. Preserve equivalent access to technical/evidence detail; accessibility is not a reason to hide provenance or uncertainty.
10. Consider alternative input and voice/audio interaction when material to the product audience.
11. Test representative workflows, not isolated controls only.
12. Distinguish accessibility review evidence from formal compliance certification.

## Review Pass

Check keyboard reachability, tab/focus order, focus visibility, semantic labels, status announcements where relevant, contrast, zoom/scaling, text wrapping, resize, pointer target size, error identification, form labels, captions, reduced motion, and alternate representations of visual-only information.

## Status

- **ACCESSIBILITY REVIEW PASS IN SCOPE**
- **ACCESSIBILITY FINDING**
- **REMEDIATION REQUIRED**
- **UNKNOWN / TEST REQUIRED**
- **BLOCKED**
- **STOP**

## STOP Conditions

STOP when a design removes the only accessible interaction path, consequential state depends on color alone, required information becomes unreadable at supported scaling, or a scoped review is being represented as universal accessibility/compliance certification.

## Completion Criteria

Complete when applicable interaction modes, findings, remediation, test evidence, remaining limitations, and non-certification boundary are explicit.

## Identity

- **Suite:** Signalproof Skills
- **Skill:** `signalproof-accessibility`
- **Version:** `0.1.0`
- **Maturity:** Active public baseline
- **Parent:** `signalproof` 0.1.1+
- **Domain:** Accessible interaction and presentation
- **Created by:** Doc Reo / Signalproof
