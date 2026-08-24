---
name: signalproof-build-capsule
description: Create compact human-readable, AI-readable Build Capsules that separate architecture, authoritative payloads, design authority, invariants, platform constraints, and execution commands so complex builds can transfer between AI systems without repeatedly re-encoding the full source material.
---

# Signalproof Build Capsule

## Purpose

`signalproof-build-capsule` packages a complex build into a compact, inspectable transfer unit for another AI system.

> **Show the system. Attach the truth. Command the work.**

Default package:

```text
BUILD CAPSULE IMAGE
+ AUTHORITATIVE PAYLOAD FILES
+ EXECUTION / UPDATE COMMAND
```

The capsule is deliberately human-readable as well as AI-readable. It is not hidden encoding, a replacement for source files, or permission to redesign/rebuild a working system.

## Inheritance

Inherits the Active root `signalproof` contract. It creates no implementation, deployment, publication, credential, Candidate-activation, or canonical Build Ledger authority.

Route product architecture to `signalproof-design`, interface detail to `signalproof-ui-polish`, supporting compression to `signalproof-cut-chase`, session continuity to `signalproof-handoff`, and actual implementation to `signalproof-build` / `signalproof-build-spawn-debug`.

## When to Use

Use when a substantial build must move between AI systems and prompt limits, structured payloads, live-build continuity, or separate design/data authority make a normal text-only handoff inefficient.

Do not create a capsule merely to turn a small prompt into an image.

## Capsule Types

### Build Capsule

Primary one-sheet visual specification. Adapt sections to the task, normally covering:

1. application/work-unit overview;
2. modules, screens, stages, or content sets;
3. business logic, scoring, calculations, or state transitions;
4. results/status model;
5. data schema and field meaning;
6. build rules and invariants;
7. platform/import/runtime constraints;
8. source/payload inventory;
9. short translator/execution anchor.

It maps the system but does not duplicate an entire authoritative dataset merely to appear self-contained.

### Design Capsule

Create a companion Design Capsule when an approved visual baseline exists or visual continuity is material. Cover design authority, principles, colors/tokens, typography, visual language, components/states, representative screen patterns, interaction, responsive behavior, and explicit preservation rules.

For a live approved design:

> **Preserve. Extend. Do not redesign.**

A Design Capsule never overrides functional/data authority.

## Authority Map

Assign authority by domain before composing the capsule.

```text
ARCHITECTURE / FLOW     -> Build Capsule
SOURCE CONTENT / DATA   -> canonical payload file(s)
VISUAL DESIGN           -> approved live UI/code/screenshots or Design Capsule
EXECUTION SCOPE         -> current execution/update command
PLATFORM REQUIREMENTS   -> verified platform rules / supplied platform notes
LIVE BASELINE           -> current working project state
```

Do not use a blanket precedence rule when sources govern different domains. If two sources materially conflict in the same domain, expose the conflict or STOP rather than silently choosing.

## Workflow

### 1. Establish Transfer Target

Identify target AI/platform, new build vs live update, known message limit, supported attachments, accepted baseline, desired outcome, authoritative source files, design authority, protected state, and material platform constraints.

If the target accepts files/images, prefer attachments over transcribing their full contents into the prompt.

### 2. Inspect Before Compressing

Read enough source material to establish real structure. For structured payloads verify material counts, grouping, schemas/headers, formulas/scoring, IDs/keys, thresholds, required fields, and known transformations.

Do not infer missing source facts from the desired design.

### 3. Separate the Authorities

Explicitly distinguish:

- what the capsule explains;
- what the payload proves/contains;
- what the design baseline controls;
- what the command tells the target AI to do.

### 4. Extract Invariants

Identify the smallest facts the receiving AI must not change: canonical names/IDs, counts, equations, state transitions, required field semantics, protected routes/components, live/new-build state, forbidden mechanics, responsive/accessibility requirements, and source-preservation rules.

Prefer explicit invariants over repeated prose.

### 5. Compose the Human-Legible Visual

Primary style: one-sheet technical infographic / systems card that a human can audit at a glance.

Requirements:

- clear title and capsule type;
- numbered or strongly separated sections;
- concise text and visible relationships;
- readable hierarchy at normal viewing size;
- no critical information conveyed only by color;
- no microscopic paragraphs intended only for OCR;
- no QR, steganography, hidden pixels, or opaque encoding for critical build information.

Dense is acceptable; unreadable is not.

### 6. Preserve the Payload

Keep structured/source files authoritative whenever practical: CSV/XLSX, JSON/YAML, source code, documents, approved visual references, or other canonical inputs.

The capsule may summarize counts and structure but must not silently rewrite the payload.

### 7. Create the Execution Command

For a **new build**, direct the receiving AI to read the capsule, use each payload in its authority domain, build the working application rather than a plan/mockup, preserve invariants, avoid invented content, and validate defined acceptance conditions.

For a **live build**, state that the application already exists, update it in place, preserve working routes/state/data/design, make the smallest necessary change, do not restart/rebuild without explicit authority, and expect additional additive commands if applicable.

### 8. Split Commands When Needed

A capsule reduces prompt burden; it does not eliminate platform limits.

When multiple messages are needed:

1. make each independently actionable;
2. identify the same current build;
3. state that additional commands may follow;
4. preserve cumulative continuity;
5. never assume future instructions were already received;
6. do not repeat canonical payload content just to fill context;
7. do not depend on hidden reasoning from a prior message.

### 9. Validate the Package

Verify:

```text
CAPSULE readable
AUTHORITY MAP unambiguous
PAYLOAD present/canonical
INVARIANTS represented
NEW BUILD vs LIVE UPDATE correct
DESIGN authority preserved
COMMAND within known target limit
NO critical data hidden only in image
NO canonical payload silently rewritten
NO unsupported completion claim
```

## Refinement Rules

Refine toward exact nouns/IDs, controlling counts/equations, domain-specific authority, concise invariants, visible module/state/data relationships, source inventory, exclusions, live-baseline protection, and a short translator message.

Remove decorative prose, duplicated payload rows, speculative features, non-authoritative implementation detail, and generic AI instructions that do not change behavior.

## New Build vs Live Update

### New Build

May instruct construction of the complete application from the capsule and attached payload, while preserving source truth and withholding runtime-success claims until verified.

### Live Update

Treat the existing project as accepted baseline:

> **Inspect current state -> preserve what works -> update the smallest surface -> verify regression boundaries.**

Never tell a live system to rebuild from scratch merely because the original Build Capsule exists.

## Design Continuity

When code, screenshots, or a live UI establish design authority:

1. inspect the baseline;
2. derive the Design Capsule from what actually exists;
3. preserve its visual grammar rather than inventing a theme;
4. keep design authority separate from application/data authority;
5. make future commands reference the live design as canonical.

## Safety and Rights

Do not place credentials, secrets, protected Build Ledger internals, unnecessary personal/customer data, or unauthorized redistributed content into a capsule. Do not use visual encoding to evade platform, policy, license, rights, privacy, or security boundaries.

If an attachment is unreadable, continue with readable authoritative sources, identify the inaccessible domain precisely, and never hallucinate the missing records. Regenerate an unreadable capsule rather than treating OCR uncertainty as truth.

## Acceptance Criteria

A package passes when:

1. a human can understand the major structure from the capsule;
2. a vision-capable AI can recover the same major structure without hidden encoding;
3. authoritative payloads remain separate and intact;
4. domain authority and critical invariants are explicit;
5. new-build/live-update state is correct;
6. live builds are protected from accidental rebuild/redesign instructions;
7. the command fits the known host limit and avoids unnecessary payload transcription;
8. missing source data cannot be silently invented;
9. an optional Design Capsule preserves an accepted visual baseline;
10. another additive command can continue the build without repeating the entire original prompt.

## Output Contract

When tools permit, return:

```text
1. BUILD CAPSULE IMAGE
2. DESIGN CAPSULE IMAGE (when applicable)
3. AUTHORITATIVE PAYLOAD LIST
4. EXECUTION / UPDATE COMMAND
5. SHORT INTEGRITY / AUTHORITY SUMMARY
```

If image generation is unavailable, provide the exact capsule content/layout specification without pretending an image was produced.

## STOP Conditions

STOP or narrow scope when authoritative sources conflict in the same domain; live baseline cannot be distinguished from a rebuild request; required payload is missing and invention would be necessary; the capsule is unreadable; critical information would exist only in opaque encoding; private/secret material would be exposed; rights/platform constraints would be violated; or the command would claim unobserved build/runtime acceptance.

## Completion Criteria

Complete when transfer target, authority map, payload, invariants, capsule type(s), live/new-build status, execution command, platform constraints, and acceptance checks are explicit and the package reduces repeated prompt transcription without sacrificing source truth or human auditability.

## Identity

- **Suite:** Signalproof Skills
- **Skill:** `signalproof-build-capsule`
- **Version:** `0.1.0`
- **Maturity:** Active public baseline
- **Parent:** `signalproof` 0.1.1+
- **Domain:** Multimodal AI build-transfer packaging and continuity
- **Created by:** Doc Reo / Signalproof
