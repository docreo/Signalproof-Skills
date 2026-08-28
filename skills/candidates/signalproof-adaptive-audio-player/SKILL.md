---
name: signalproof-adaptive-audio-player
description: Build and adapt lightweight browser-native audio players for music, audiobooks, spoken-word series, and other multi-track collections using external media URLs, artwork-driven presentation, responsive custom controls, dynamic playlist wraparound, and cross-browser playback safeguards.
---

# Signalproof Adaptive Audio Player

**Status:** CANDIDATE / NOT ACTIVE  
**Version:** 0.1.0  
**Parent:** `signalproof` 0.1.1+  
**Primary collaborators:** `signalproof-design`, `signalproof-ui-polish`, `signalproof-accessibility`, `signalproof-build`, `signalproof-verify`

## Purpose

`signalproof-adaptive-audio-player` captures the reusable method learned while building browser-native audio experiences from one player family for different content classes.

> **The primary content image dictates its own presentation. The player shell adapts to the image; the player must not force every image into one cover shape.**

A square album image should remain square. A portrait/book cover should remain portrait. Another source aspect ratio should remain intact unless the product contract explicitly requires a crop.

Use this Skill for lightweight HTML/CSS/JavaScript players that stream audio from externally hosted URLs instead of embedding audio bytes in the page.

## Supported Content Classes

Applicable examples include music playlists/albums, audiobooks, spoken-word series, podcasts, course audio, guided lessons, and branded multi-track collections.

Do not assume that all content classes use square artwork.

## Core Build Pipeline

```text
CONTENT CONTRACT
  -> MEDIA + ARTWORK INVENTORY
  -> IMAGE-RATIO DECISION
  -> EXTERNAL AUDIO CONFIG
  -> PLAYER SHELL
  -> TRANSPORT + SEEK
  -> PLAYLIST STATE
  -> DYNAMIC WRAPAROUND
  -> RESPONSIVE/CROSS-BROWSER HARDENING
  -> FUNCTIONAL VERIFICATION
  -> NARROW-VIEWPORT VISUAL VERIFICATION
```

## 1. Content Contract First

Before styling, identify:

- collection title and byline;
- content class;
- primary content artwork;
- optional separate brand/profile image;
- ordered track/chapter list;
- whether continuous autoplay-next is required;
- whether saved position/progress is required;
- supported browsers and minimum viewport targets.

Do not infer image shape from content type. Preserve the supplied image itself unless a crop is explicitly required.

## 2. Image-Driven Presentation

### Primary content artwork

Default main-artwork behavior:

```css
width: auto;
height: auto;
max-width: 100%;
object-fit: contain;
```

Use container max-height/max-width constraints as needed, but preserve source aspect ratio.

Do **not** set a fixed `aspect-ratio` such as `1 / 1` on main artwork unless a square crop is explicitly required.

Do **not** default to `object-fit: cover` for book/portrait artwork because it can crop the source.

### Separate brand/profile image

A profile or brand portrait is a different semantic role from primary content artwork. It may intentionally use a circular/square frame and `object-fit: cover` when the design calls for an avatar.

Keep the roles separate:

```text
brand/profile image -> intentional avatar crop may be valid
content artwork      -> preserve native source ratio by default
```

### Acceptance invariant

Changing a square content image to a portrait/book image should not require rewriting player layout logic. Supplying the new image should normally be enough unless the product contract changes.

## 3. Keep Audio External

Prefer direct, publicly reachable media URLs and keep audio bytes outside the HTML/CSS/JavaScript artifact.

Benefits include smaller initial page payload, faster revision/deployment, CDN/browser caching, easy track replacement/reordering, and reuse of one player shell across collections.

Use one browser-native `<audio>` element and normally start with:

```html
<audio preload="metadata"></audio>
```

`preload="metadata"` keeps initial loading bounded while still allowing duration metadata when the host/browser provides it.

Test the media host for actual playback and seeking on target browsers.

## 4. Configuration-Driven Track Inventory

Keep collection-specific values in a bounded config object and track array rather than scattering URLs/titles through event handlers.

Conceptual contract:

```text
CONFIG
  title
  byline
  brand/profile image
  content artwork
  maximum track count
  autoplay-next default
  remember-progress default

TRACKS[]
  title
  src
  optional duration label
```

Adding tracks should normally require only appending items to `TRACKS[]`.

Never hardcode logic to a named final track such as "Track 8".

## 5. One Media Element, Explicit State

Prefer one persistent `<audio>` element whose `src` changes with track selection.

Track state should include at minimum current index, current time, playback rate, volume, autoplay-next state, and pending resume position when restoring progress.

Keep rendered UI and audio state synchronized on each track change.

## 6. Dynamic Continuous Wraparound

When continuous autoplay-next is enabled, the playlist is circular.

Use playlist length, not a fixed final index:

```js
const nextIndex = (currentIndex + 1) % tracks.length;
```

This guarantees:

```text
actual current last track -> first track
```

for 8, 9, 20, 50, or any later valid track count.

Manual Next may use the same circular behavior when required.

Previous can wrap dynamically with:

```js
const previousIndex = (currentIndex - 1 + tracks.length) % tracks.length;
```

If Previous should restart the current song after several seconds, preserve that rule before wrapping.

## 7. Browser Autoplay Reality

"Autoplay next" is not the same as "start audible audio automatically when the page opens."

Modern browsers may block programmatic audible playback until the user interacts with the page. Treat this as an environment constraint rather than a playlist defect.

Always handle the Promise returned by `audio.play()`:

```js
const result = audio.play();
if (result && typeof result.catch === "function") {
  result.catch(() => {
    // Tell the user to press Play.
  });
}
```

Do not promise page-load audible autoplay across Safari, Chrome, Firefox, or mobile browsers.

Once the user initiates playback, sequential next-track playback should still use the same safe playback path so a browser rejection remains recoverable.

## 8. Cross-Browser Transport Controls

Do not depend on platform-specific emoji or text glyphs for essential transport controls.

Prefer inline SVG for previous, play, pause, and next. Inline SVG keeps icon geometry under application control across Safari/WebKit, Chromium browsers, Firefox, Windows, macOS, iOS, and Android.

For custom buttons, neutralize unwanted native styling where appropriate:

```css
appearance: none;
-webkit-appearance: none;
```

Use touch-friendly interaction rules such as `touch-action: manipulation` where appropriate.

Every icon-only button must retain an accessible name through `aria-label` or equivalent text.

## 9. Narrow-Screen Control Geometry

A desktop flex row can fail on narrow phones when five transport controls have minimum widths, padding, gaps, and browser-native button metrics.

For a fixed five-control transport set, prefer a five-column responsive grid:

```css
display: grid;
grid-template-columns: repeat(5, minmax(0, 1fr));
```

Let the central Play/Pause button receive visual emphasis without forcing siblings outside the viewport.

At narrow breakpoints reduce gaps/padding, permit controls to shrink with `min-width: 0`, keep tap targets usable, and verify all controls remain inside the card.

## 10. Seek, Time, Volume, and Speed

Use browser-native audio state as authority.

Recommended behavior:

- seek range maps proportionally to `audio.duration`;
- current time comes from `audio.currentTime`;
- duration comes from `audio.duration`;
- ±15-second controls clamp to valid bounds;
- speed updates `audio.playbackRate`;
- volume updates `audio.volume`.

Treat unknown duration as a loading state rather than an error.

## 11. Saved Progress

When continuity is required, store bounded non-sensitive player state in `localStorage`, potentially including track index, current time, rate, volume, autoplay-next state, and timestamp.

Storage can fail or be unavailable in some browsing modes. Wrap read/write/remove operations in `try/catch`; playback must continue even if persistence fails.

Use a collection-specific storage key so separate players do not overwrite one another.

## 12. Failure Lessons Preserved

### Forced-square artwork

**Failure:** main artwork used `aspect-ratio: 1 / 1` with `object-fit: cover`.  
**Effect:** portrait/book artwork was presented like square album art and could be cropped.  
**Rule:** preserve native content-image ratio by default.

### Tight flex-row transport

**Failure:** five controls with minimum widths and gaps were packed into a narrow flex row.  
**Effect:** controls could disappear or clip on narrow mobile layouts.  
**Rule:** reserve explicit responsive columns for fixed transport controls.

### Platform-dependent transport symbols

**Failure:** essential icons relied on browser/OS symbol rendering.  
**Effect:** visual consistency depended on platform font behavior.  
**Rule:** use inline SVG for essential transport icons.

### Hardcoded final track

**Failure:** end behavior was coupled to a specific numbered track or stopped at the final item.  
**Effect:** future track additions required logic changes and continuous playback could terminate.  
**Rule:** compute traversal from current playlist length.

### Browser autoplay mistaken for player failure

**Failure:** programmatic playback rejection can look like broken player logic.  
**Rule:** distinguish user-gesture policy from playlist auto-advance and catch `play()` rejection.

## 13. Verification Contract

Before claiming completion, verify separately:

### Structure

- one intended media element;
- valid config and track inventory;
- no fixed final-track number in traversal logic;
- content artwork and brand/profile image have separate roles.

### Playback

- Play/Pause;
- seek;
- back/forward;
- Previous/Next;
- rate;
- volume;
- track selection;
- duration update;
- error state.

### Continuous mode

With autoplay-next enabled, verify a normal transition and then verify that the **actual last item** loads the first item next using `tracks.length`.

With autoplay-next disabled, verify no automatic transition occurs.

### Responsive/browser

Verify desktop, mobile, and at least one narrow-phone width; all transport controls visible; no horizontal clipping; source artwork ratio preserved; icon controls accessibly named.

Where available, test representative Safari/WebKit, Chromium, and Firefox engines. If an engine is unavailable, state that rather than claiming execution coverage.

## 14. External Compatibility Anchors

Recheck current browser guidance during consequential builds.

Baseline references:

- MDN Autoplay guide: audible programmatic playback may be blocked until user interaction.
- MDN `appearance`: native form-control styling varies by browser/OS and can be suppressed with `appearance: none`.
- MDN `touch-action`: touch behavior should be specified deliberately for custom controls.

These are compatibility constraints, not proof of target-browser execution.

## Explicit Non-Scope

This Candidate does not by itself own audio mastering/encoding, DRM, streaming-service licensing, authentication, analytics, server/CDN provisioning, waveform generation, video playback, or generic UI polish unrelated to media behavior.

## Candidate Evidence and Disposition

Observed reusable evidence includes:

1. a chaptered/book-oriented audio player with portrait cover requirements;
2. a music-series player derived from the same shell with a different content model;
3. a requirement to support square and book-shaped artwork without player rewrites;
4. a mobile control failure requiring cross-browser hardening;
5. a playlist requirement changing from finite completion to dynamic continuous wraparound.

Workflow Mine-style score:

- Repetition: 3/5
- Distinct responsibility: 4/5
- Gap: 4/5
- Value: 5/5
- Testability: 5/5
- **Total: 21/25 — CANDIDATE / DESIGN REVIEW**

This score does not authorize activation.

## Acceptance Requirements Before Promotion

Test against at least:

1. square music artwork;
2. portrait/book artwork;
3. a third non-square ratio;
4. a playlist whose size changes after initial implementation;
5. last-to-first continuous autoplay;
6. autoplay-next disabled;
7. narrow mobile transport visibility;
8. representative Safari/WebKit, Chromium, and Firefox coverage where available;
9. storage-unavailable behavior;
10. invalid/unreachable audio URL behavior.

Promotion remains governed by the normal Signalproof lifecycle.

## STOP Conditions

STOP when main content artwork is force-cropped without explicit requirement; a browser engine is claimed tested without evidence; audible page-load autoplay is promised across browsers; traversal depends on a fixed numbered final track; external media URLs are unauthorized or not publicly playable for the intended audience; cross-browser defects are hidden by removing controls; accessibility labels are removed from icon-only controls; a one-off visual preference is confused with a reusable media-player rule; or Candidate state is represented as Active.

## Identity

- **Suite:** Signalproof Skills
- **Skill:** `signalproof-adaptive-audio-player`
- **Version:** 0.1.0
- **Maturity:** Candidate / Not Active
- **Domain:** browser audio players, artwork-driven presentation, external media streaming, circular playlists, cross-browser controls
- **Created by:** Doc Reo / Signalproof
