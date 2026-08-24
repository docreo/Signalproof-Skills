# Signalproof Build Capsule V0.1 Acceptance

**Candidate:** `signalproof-build-capsule` 0.1.0  
**Command:** `build-capsule` 0.1.0  
**Purpose:** Verify that the skill can package a substantial application for another AI system without losing source authority, live-baseline protection, or human auditability.

## Scenario A - Structured New Build

Input shape:

- one application with 10 content/game modules;
- 200 structured records in a canonical master CSV;
- per-module staging CSVs;
- scoring and result-tier rules;
- a target AI builder with a finite prompt/message limit;
- image/file attachments supported.

Expected behavior:

1. Inspect the structured source before summarizing it.
2. Preserve the master CSV as content/data authority rather than copying all 200 records into the image or command.
3. Create a Build Capsule that visibly covers application overview, module set, scoring/logic, result model, data schema, invariants, platform constraints, source inventory, and translator anchor.
4. Preserve exact controlling counts/equations as invariants.
5. Produce a build execution command that instructs the target to build a working application, consume the payload, avoid invented content, and validate acceptance.
6. Keep the command below the known host limit without wasting context on duplicated payload rows.
7. Use no QR/steganographic/hidden encoding for critical information.

**Result:** PASS - the candidate contract requires all 7 behaviors.

## Scenario B - Existing Live Design

Input shape:

- an application is already live/current;
- an approved React/Tailwind home screen establishes the visual language;
- existing routes/data/functionality must remain working;
- future instructions will arrive as additive commands processed one message at a time.

Expected behavior:

1. Classify the work as LIVE UPDATE rather than NEW BUILD.
2. Treat current working state as protected baseline.
3. Derive a companion Design Capsule from the actual live visual system rather than inventing a new theme.
4. Use the preservation rule `Preserve. Extend. Do not redesign.`
5. Keep design authority separate from content/data authority.
6. Generate additive update commands that are independently actionable and state that more commands may follow.
7. Never assume future commands have already been received.
8. Never instruct a from-scratch rebuild merely because an original Build Capsule exists.

**Result:** PASS - the candidate contract requires all 8 behaviors.

## Scenario C - Failure / Source Gap

Input shape:

- one attachment is unreadable or missing;
- other authoritative files remain accessible.

Expected behavior:

1. Continue with readable authorities.
2. Identify the inaccessible domain precisely.
3. Do not fabricate missing records.
4. Do not discard unrelated valid build information.
5. Regenerate/reformat an unreadable capsule instead of treating OCR uncertainty as truth.

**Result:** PASS - the candidate contract requires all 5 behaviors.

## Skill Architecture Check

- exact UTF-8 bytes of candidate `SKILL.md`: **10,793**;
- budget state: below 12,000-byte decomposition-review threshold;
- responsibility cohesion: PASS - owns multimodal build-transfer packaging, not implementation, product IA, UI micro-polish, or session handoff;
- duplicate doctrine: bounded through inheritance and explicit routing to Design, Cut Chase, Handoff, Build, and Build Spawn Debug;
- independent Design Capsule responsibility: retained as a mode/companion output because it exists to preserve transfer authority inside the same capsule package; not split into a second skill at V0.1;
- hidden-encoding avoidance: explicit;
- live-update protection: explicit;
- multi-message continuation semantics: explicit.

## Acceptance Summary

Required behaviors tested: **20**  
Passed: **20**  
Failed: **0**

The candidate is suitable for Active public promotion after registry/router/command integration and protected-branch merge.
