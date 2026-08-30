# Acceptance Plan — Signalproof Adaptive Audio Player V0.1

**Target:** `skills/candidates/signalproof-adaptive-audio-player/SKILL.md`  
**Maturity under test:** Candidate / Not Active

## Purpose

Verify that the Candidate captures a reusable browser-audio build process rather than overfitting one branded player.

## A. Image-Ratio Preservation

### A1 — Square art
Given a square content image, the main artwork renders square without forced portrait dimensions.

**PASS:** no crop and no source-ratio distortion.

### A2 — Book/portrait art
Given a portrait/book cover, the main artwork preserves the portrait ratio.

**PASS:** no forced `1 / 1` constraint or equivalent crop on primary content artwork.

### A3 — Third ratio
Given landscape or another non-square source, the shell adapts without changing player/traversal logic.

**PASS:** source ratio remains intact inside bounded layout constraints.

### A4 — Separate profile image
Given a separate avatar/profile role, it may use intentional circular/square cropping without changing the primary-artwork rule.

**PASS:** avatar crop and content-image preservation are independently configurable.

## B. External Media Architecture

Given multiple direct media URLs:

- audio binary is not embedded in page source;
- one browser-native audio element is used;
- initial preload is bounded to metadata unless product requirements differ;
- adding a track requires inventory/configuration change rather than traversal rewrite.

## C. Dynamic Playlist Size

Run with at least two playlist lengths.

**PASS:** traversal contains no hardcoded final-track number.

Expected circular formulas:

```text
next     = (current + 1) modulo trackCount
previous = (current - 1 + trackCount) modulo trackCount
```

## D. Continuous Autoplay-Next

With autoplay-next enabled:

1. user initiates playback;
2. a normal track completes and the next item starts;
3. the actual last track completes;
4. the first item is selected and played next.

**PASS:** sequence can continue until the user pauses/stops or disables autoplay-next, subject to browser playback policy.

With autoplay-next disabled:

**PASS:** completed track does not automatically advance.

## E. Browser Policy Handling

Simulate or observe `audio.play()` rejection.

**PASS:** rejection is caught; UI remains functional; user receives a bounded instruction to press Play; failure is not misclassified as corrupted playlist state.

No acceptance claim may assert universal audible page-load autoplay.

## F. Transport Geometry

Verify this fixed transport set at desktop, mobile, and narrow-phone widths:

```text
Previous | Back | Play/Pause | Forward | Next
```

**PASS:** all five controls remain visible; no horizontal clipping; controls are not removed to make layout pass; central Play/Pause may be emphasized; icon-only controls retain accessible names.

## G. Cross-Browser Icon Stability

Essential transport icons use deterministic application-controlled rendering such as inline SVG.

**PASS:** no essential action depends solely on emoji/symbol-font rendering.

## H. Saved State

When persistence is enabled:

- save track index, time, rate, volume, and autoplay-next state;
- restore only bounded valid values;
- isolate storage key by collection;
- catch storage read/write/remove failures.

**PASS:** playback continues if storage is unavailable.

## I. Error Handling

Use one invalid or unreachable media URL.

**PASS:** an understandable error state appears; controls remain recoverable; playlist data is not silently rewritten.

## J. Browser Coverage Reporting

Preferred representative engines:

- Safari/WebKit;
- Chromium;
- Firefox.

**PASS:** actual tested engines are named. Unavailable engines are explicitly marked untested; no inferred PASS is allowed.

## K. Skill Architecture

Measure exact UTF-8 bytes after the final Candidate edit.

**PASS:** Skill remains below 15,000 bytes; if 12,000–14,999 bytes, conciseness/decomposition review is explicitly recorded; responsibilities remain cohesive around browser audio construction/adaptation; generic UI polish remains delegated.

## Promotion Gate

Passing this plan establishes test evidence only. It does not itself change Candidate status to Active.
