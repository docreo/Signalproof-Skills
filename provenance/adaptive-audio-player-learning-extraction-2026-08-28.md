# Adaptive Audio Player Learning Extraction — 2026-08-28

**Disposition:** CANDIDATE / NOT ACTIVE  
**Candidate:** `signalproof-adaptive-audio-player` V0.1.0  
**Public/private classification:** Public-safe abstraction

## Work Unit

Extract reusable process knowledge from an iterative custom browser audio-player build that evolved across chaptered/book and music-series uses.

This record preserves method and failure lessons rather than source-media URLs, private chronology, or local evidence paths.

## Reusable Learning

### 1. Artwork is authoritative for presentation

The player shell must not assume square album art. Primary content artwork preserves native source ratio by default: square remains square, portrait/book remains portrait, and other ratios remain intact unless the design contract explicitly calls for a crop.

A separate profile/brand avatar can intentionally use a circular or square crop because it is a different semantic image role.

### 2. Keep media external

Direct hosted media URLs keep the HTML artifact lightweight, improve caching, simplify replacement/reordering, and allow one reusable shell to serve multiple collections.

### 3. Traversal depends on data, not numbered tracks

Continuous mode derives the next item from the current playlist length:

```text
next = (current + 1) modulo count
```

This makes actual last-track -> first-track behavior correct even when more tracks are added later.

### 4. Narrow mobile transport needs explicit geometry

A flex row with minimum widths, padding, gaps, and browser-native button metrics can overflow a narrow card. A fixed five-control transport set is more robust when each control receives explicit responsive grid space.

### 5. Browser rendering and autoplay policy are environment constraints

Essential transport actions should not depend on platform-specific emoji/symbol rendering; inline SVG provides deterministic geometry.

Custom button appearance may need browser-neutral styling. Programmatic audible playback can be blocked until user interaction, so `HTMLMediaElement.play()` rejection must be handled rather than misclassified as broken playlist logic.

### 6. Saved state must fail soft

`localStorage` may be unavailable. Persistence errors must not break audio playback.

## Known-Error Preflight

Canonical Known-Errors guidance and current Skill Library were reviewed before Candidate creation.

Result: **NO KNOWN MATCH** for an existing Signalproof media-player specialist or a cataloged recurrence matching this exact work unit.

Current public browser documentation was also checked for autoplay/user-gesture policy, native control appearance, and touch behavior. These are compatibility constraints, not proof that an unavailable browser engine was executed.

## Existing-Library Check

Overlap exists but is not duplicative:

- `signalproof-ui-polish` owns generic responsive finish, clipping, hit targets, and visual consistency;
- `signalproof-accessibility` owns accessibility requirements;
- `signalproof-design` owns information architecture/design contract;
- `signalproof-build` owns bounded implementation;
- `signalproof-verify` owns evidence-backed completion claims.

**Gap:** none owns the coherent transformation from external audio inventory + source artwork into a reusable browser audio player with circular playlist semantics and browser playback safeguards.

## Workflow-Mine Classification

- Repetition: 3/5
- Distinct responsibility: 4/5
- Gap: 4/5
- Value: 5/5
- Testability: 5/5
- **Total: 21/25 — CANDIDATE / DESIGN REVIEW**

The moderate Repetition score reflects evidence from a small player family rather than many unrelated implementations. Candidate status is therefore appropriate; Active promotion is not claimed.

## Skill Architecture Check

Initial Candidate size was **13,792 UTF-8 bytes**, which was below the hard 15,000-byte ceiling but inside the registry's 12,000–14,999 conciseness/decomposition-review band.

A conciseness pass was performed before log completion. The final Candidate is **10,635 UTF-8 bytes**, verified from the branch tree, placing it below both the 12,000-byte review band and the 15,000-byte hard ceiling.

Responsibilities remain cohesive around one routeable job:

> construct/adapt lightweight browser audio-player experiences while preserving content-artwork geometry, external-media architecture, circular playlist behavior, and cross-browser control reliability.

Generic polish, accessibility, deployment, licensing, and media production remain outside the Candidate.

## Acceptance Scope

Promotion evidence must include:

- square, portrait/book, and third-ratio artwork;
- playlist-length change after initial implementation;
- actual last-to-first continuous wrap;
- autoplay-next disabled;
- narrow-phone control visibility;
- programmatic playback rejection handling;
- storage-unavailable handling;
- invalid media URL handling;
- representative browser-engine testing with unavailable engines identified explicitly.

## Lifecycle

```text
DISCOVERED
  -> CANDIDATE  [this record]
  -> TESTED
  -> APPROVED
  -> ACTIVE
```

No canonical Build Ledger event number is claimed or reserved by this public log.
