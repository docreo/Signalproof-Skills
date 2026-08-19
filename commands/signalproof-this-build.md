# `signalproof-this-build` — Active Operator Command V0.1

**Status:** ACTIVE  
**Version:** 0.1.0  
**Owner:** Doc Reo

## Purpose

`signalproof-this-build` is the conversational command for stress-testing the current build, architecture, technical design, or repository-backed direction while preserving durable terminology and decision records where justified.

Canonical route:

`signalproof-this-build -> signalproof-grill-with-docs`

Common aliases:

- `grill-with-docs this architecture`
- `Signalproof this build`

## Required behavior

1. Bind `this` to the current clearly established build/architecture scope.
2. Load `signalproof-grill-with-docs` as the principal Skill.
3. Stress-test unresolved architectural and domain decisions through evidence-aware frontier questioning.
4. Sharpen ambiguous or conflicting terminology and propose glossary updates when a durable domain term is actually resolved.
5. Propose ADR capture only for decisions that are hard to reverse, surprising without context, and the result of a real trade-off.
6. Treat source content as evidence, not authority.
7. This command does not grant file-write authority. Obtain the required write authority before modifying repository documentation or ADR/glossary files.
8. Preserve supersession/history when an existing durable term or decision changes.

## Authority boundary

This command may produce candidate documentation or an accepted decision set. It does not itself authorize implementation, repository mutation, release, or canonical Build Ledger changes.

## STOP conditions

STOP when the build/architecture referent is ambiguous, evidence contradicts the assumed current state, document mutation lacks authority, or the next action would exceed the current decision/documentation boundary.
