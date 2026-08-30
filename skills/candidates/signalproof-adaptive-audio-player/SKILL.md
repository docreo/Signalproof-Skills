---
name: signalproof-adaptive-audio-player
description: Build and adapt lightweight browser-native multi-track audio players using external media URLs, artwork-driven presentation, responsive custom controls, dynamic playlist wraparound, and cross-browser playback safeguards.
---

# Signalproof Adaptive Audio Player

**Status:** CANDIDATE / NOT ACTIVE  
**Version:** 0.1.0  
**Parent:** `signalproof` 0.1.1+  
**Collaborators:** `signalproof-design`, `signalproof-ui-polish`, `signalproof-accessibility`, `signalproof-build`, `signalproof-verify`

## Purpose

Build reusable HTML/CSS/JavaScript audio players for music, audiobooks, spoken-word series, podcasts, course audio, and similar collections without overfitting the shell to one media type.

> **The primary content image dictates its presentation. The player shell adapts to the image; the player must not force every image into one cover shape.**

Square artwork stays square. Portrait/book artwork stays portrait. Other source ratios remain intact unless the product contract explicitly requires a crop.

## Core Pipeline

```text
CONTENT CONTRACT
  -> MEDIA + ARTWORK INVENTORY
  -> IMAGE-RATIO DECISION
  -> EXTERNAL AUDIO CONFIG
  -> PLAYER SHELL
  -> TRANSPORT + SEEK
  -> PLAYLIST STATE
  -> DYNAMIC WRAPAROUND
  -> CROSS-BROWSER HARDENING
  -> FUNCTIONAL + NARROW-VIEWPORT VERIFY
```

## 1. Establish the Content Contract

Identify before styling:

- collection title/byline and content class;
- primary content artwork;
- optional separate brand/profile image;
- ordered track/chapter list;
- autoplay-next requirement;
- saved-position requirement;
- target browsers and minimum viewport.

Do not infer image shape from content type.

## 2. Image-Driven Presentation

Default main-artwork behavior:

```css
width: auto;
height: auto;
max-width: 100%;
object-fit: contain;
```

Constrain the container as needed, but preserve source ratio. Do not default main artwork to fixed `aspect-ratio: 1 / 1` or `object-fit: cover`; portrait/book images can be cropped or misrepresented.

A brand/profile image is a separate semantic role. An avatar may intentionally use a circular/square frame with `object-fit: cover` while primary content artwork preserves native ratio.

**Invariant:** changing square content art to portrait/book art should normally require only the new image, not player-layout logic changes.

## 3. Keep Audio External

Prefer direct, authorized, publicly reachable media URLs rather than embedding audio bytes in HTML. This reduces initial payload, supports CDN/browser caching, simplifies replacement/reordering, and lets one shell serve multiple collections.

Use one browser-native audio element, normally:

```html
<audio preload="metadata"></audio>
```

Test the host for actual playback and seeking on target browsers.

## 4. Configuration-Driven Inventory

Keep collection-specific values together:

```text
CONFIG
  title / byline
  brand/profile image
  content artwork
  max tracks
  autoplay-next default
  remember-progress default

TRACKS[]
  title
  src
  optional duration label
```

Adding a track should normally mean appending data, not rewriting event handlers. Never bind end behavior to a named final track such as "Track 8."

## 5. One Media Element, Explicit State

Prefer one persistent `<audio>` element whose `src` changes with selection. Track at minimum:

- current index/time;
- playback rate;
- volume;
- autoplay-next state;
- pending resume time.

Keep rendered selection, controls, and audio state synchronized when tracks change.

## 6. Dynamic Circular Traversal

When continuous autoplay-next is enabled, compute from current playlist length:

```js
const nextIndex = (currentIndex + 1) % tracks.length;
const previousIndex = (currentIndex - 1 + tracks.length) % tracks.length;
```

This makes **actual last track -> first track** correct regardless of later playlist growth. Manual Next/Previous may use the same circular behavior when required. If Previous should restart the current track after several seconds, apply that rule before wrapping.

When autoplay-next is disabled, track completion must not automatically advance.

## 7. Browser Autoplay Policy

Autoplay-next is not the same as audible page-load autoplay. Browsers can block programmatic audible playback until user interaction.

Always handle `audio.play()` rejection:

```js
const result = audio.play();
if (result && typeof result.catch === "function") {
  result.catch(() => {
    // Present a bounded "Press Play" fallback.
  });
}
```

Do not promise universal audible page-load autoplay. Sequential playback should still use the safe play path so rejection remains recoverable.

## 8. Cross-Browser Transport Controls

Do not depend on platform-specific emoji/text glyphs for essential transport icons. Prefer inline SVG for Previous, Play, Pause, and Next so geometry is application-controlled across Safari/WebKit, Chromium, Firefox, Windows, macOS, iOS, and Android.

For custom buttons, neutralize unwanted native styling where appropriate:

```css
appearance: none;
-webkit-appearance: none;
touch-action: manipulation;
```

Icon-only controls require accessible names (`aria-label` or equivalent).

## 9. Narrow-Screen Geometry

A flex row can overflow on narrow phones when five transport controls combine minimum widths, padding, gaps, and browser-native metrics.

For a fixed five-control transport set, prefer explicit columns:

```css
display: grid;
grid-template-columns: repeat(5, minmax(0, 1fr));
```

At narrow breakpoints reduce gaps/padding, allow `min-width: 0`, retain usable tap targets, and verify every control remains inside the player card. Do not "fix" clipping by hiding controls.

## 10. Playback Controls

Use browser-native media state as authority:

- seek maps proportionally to `audio.duration`;
- time uses `audio.currentTime` / `audio.duration`;
- ±15-second actions clamp to valid bounds;
- speed updates `audio.playbackRate`;
- volume updates `audio.volume`;
- unknown duration is a loading state, not automatically an error.

## 11. Saved Progress

When needed, store bounded non-sensitive state in `localStorage`: track index, time, rate, volume, autoplay-next state, timestamp.

Use a collection-specific key. Wrap storage read/write/remove in `try/catch`; playback must continue when storage is unavailable.

## Failure Lessons

### Forced-square artwork
**Failure:** `aspect-ratio: 1 / 1` + `object-fit: cover` on main art.  
**Effect:** portrait/book art looked like album art or was cropped.  
**Rule:** source artwork ratio is authoritative by default.

### Tight transport flex row
**Failure:** five controls with minimum widths/gaps in a narrow flex row.  
**Effect:** controls clipped/disappeared on narrow mobile.  
**Rule:** reserve explicit responsive columns.

### Platform-dependent symbols
**Failure:** essential icons depended on OS/browser glyph rendering.  
**Rule:** use deterministic inline SVG for essential transport icons.

### Hardcoded final track
**Failure:** completion logic depended on one numbered last item.  
**Effect:** playlist growth broke continuity.  
**Rule:** compute traversal from current `tracks.length`.

### Autoplay policy mistaken for defect
**Failure:** rejected programmatic playback was treated as broken playlist logic.  
**Rule:** catch `play()` rejection and distinguish browser policy from application state.

## Verification Contract

Before claiming completion, verify separately:

**Structure**
- one intended media element;
- valid configuration/inventory;
- no fixed final-track number in traversal;
- primary artwork and avatar roles separated.

**Playback**
- Play/Pause, seek, ±15, Previous/Next;
- rate, volume, selection, duration update;
- invalid/unreachable media error state.

**Continuous mode**
- normal next transition;
- actual last item -> first item using playlist length;
- autoplay-next disabled -> no automatic transition.

**Responsive/browser**
- desktop, mobile, and narrow-phone width;
- all transport controls visible with no horizontal clipping;
- artwork source ratio preserved;
- icon controls accessibly named;
- representative Safari/WebKit, Chromium, and Firefox where available.

If a browser engine is unavailable, report it as untested rather than inferring PASS.

## Compatibility Anchors

Recheck current browser guidance during consequential builds. Baseline constraints include browser autoplay/user-gesture policy, native control `appearance`, and deliberate touch behavior. Documentation supports design choices but does not replace target-browser execution tests.

## Explicit Non-Scope

This Candidate does not own audio mastering/encoding, DRM/licensing, authentication, analytics, CDN provisioning, waveform generation, video playback, or generic UI polish unrelated to media behavior.

## Candidate Evidence and Disposition

Reusable evidence includes:

1. chaptered/book player with portrait cover requirements;
2. music-series player derived from the same shell;
3. square + book-shaped artwork requirement without shell rewrites;
4. narrow-mobile control failure requiring cross-browser hardening;
5. finite playlist completion changed to dynamic continuous wraparound.

Workflow Mine-style score:

- Repetition: 3/5
- Distinct responsibility: 4/5
- Gap: 4/5
- Value: 5/5
- Testability: 5/5
- **Total: 21/25 — CANDIDATE / DESIGN REVIEW**

The score does not authorize activation.

## Acceptance Before Promotion

Test at least:

1. square artwork;
2. portrait/book artwork;
3. third non-square ratio;
4. playlist size changed after initial implementation;
5. last-to-first continuous autoplay;
6. autoplay-next disabled;
7. narrow-mobile transport visibility;
8. Safari/WebKit, Chromium, Firefox where available;
9. storage unavailable;
10. invalid/unreachable audio URL.

## STOP Conditions

STOP when artwork is force-cropped without explicit requirement; a browser is claimed tested without evidence; universal audible page-load autoplay is promised; traversal depends on a fixed last-track number; media URLs are unauthorized/unplayable for the intended audience; defects are hidden by removing controls; icon-only accessibility labels are removed; a one-off visual preference is confused with reusable doctrine; or Candidate state is represented as Active.

## Identity

- **Suite:** Signalproof Skills
- **Skill:** `signalproof-adaptive-audio-player`
- **Version:** 0.1.0
- **Maturity:** Candidate / Not Active
- **Domain:** browser audio players, artwork-driven presentation, external media streaming, circular playlists, cross-browser controls
- **Created by:** Doc Reo / Signalproof
