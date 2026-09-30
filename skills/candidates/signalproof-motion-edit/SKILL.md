---
name: signalproof-motion-edit
description: Turn an existing talking-head recording into a clean, beat-synced motion-graphics edit (HyperFrames HTML-to-video) where every graphic, card, reframe, and sound effect lands on a transcript-verified word and the music grid, the speaker is reframed or cut out between beats, and the final render is proven by frame-level QC rather than assumed.
---

# Signalproof Motion Edit

**Status:** CANDIDATE / NOT ACTIVE  
**Version:** 0.1.0  
**Parent:** `signalproof` 0.1.1+  
**Collaborators:** `signalproof-design` (visual authority), `signalproof-verify` (render proof), `signalproof-known-errors` (preflight), `signalproof-learn` (post-run lessons)

## Purpose

Package an owner-recorded talking-head clip into a finished edit with Apple-style motion graphics, synced to what is said and to the music, without changing what the speaker said.

> **Lock the words first. Then the beat. Then the pixels. Prove the render before calling it done.**

The source clip and the owner's instructions are Design Authority. Tool skills (for example HyperFrames `talking-head-recut`, `hyperframes-core`, `media-use`) are implementation evidence, not Signalproof authority.

## Inputs

1. Source talking-head video (owner original stays untouched; work on a copy).
2. Owner direction: which spoken lines trigger which visuals.
3. Optional music bed, brand pack, links/repos to feature, subscribe/CTA wording.
4. Output target: aspect ratio, length, delivery channel, upload size limit.

If a named asset (logo, provider, product) is not supplied and cannot be sourced legitimately, use a neutral generic version and report it as a placeholder. Never guess a brand.

## Pipeline

```text
PREFLIGHT -> TRANSCRIPT LOCK -> BEAT GRID -> CUE SHEET -> PARALLEL PREP
-> COMPOSE -> SNAPSHOT QC -> RENDER -> AUDIO MIX -> MUX -> FRAME QC -> DELIVER -> LEARN
```

### 1. Preflight

- Probe media (duration, fps, resolution, audio channels, embedded subtitle/caption streams).
- Check tool availability: renderer, headless browser path, background-removal model, transcription model, network reach for model/asset downloads.
- Run `signalproof-known-errors` against the Known Failure table below.

### 2. Transcript Lock

- Prefer an embedded caption track as the text source; otherwise local ASR.
- Obtain word-level timestamps. When ASR models are unreachable, force-align the known text per caption segment (whole-file alignment is fragile).
- Correct brand spellings; keep timestamps.
- Output: word array `{word, start, end}` plus a human-readable transcript.

### 3. Beat Grid

- Detect tempo, beats, and energy sections of the music.
- Choose the music start offset so the strongest musical event (drop) lands on the most important visual reveal. Record the offset.
- Convert beats to video time.

### 4. Cue Sheet (Design Authority check)

Map every owner instruction to a spoken word and a time:

- Cue time = word onset, snapped to the nearest beat only when within about 0.1 s; words win over beats.
- Entry animations may start up to about 0.15 s early so the visual is readable on the word.
- Keep all graphics on the side opposite the speaker (default: speaker right, graphics left).
- Record the cue sheet before building. It is the contract the render is checked against.

### 5. Parallel Prep

Start slow jobs immediately and in parallel: speaker background removal (cutout with alpha), dense-keyframe re-encode of the source at the render fps, asset staging, SFX conversion.

### 6. Compose

One paused, seek-safe timeline. Reusable visual vocabulary:

- **Speaker frame modes:** full frame, portrait box, landscape box, cutout over branded stage. Change mode on beats, with the reframe driven by animating a clipping wrapper and an inner transform.
- **Logo card:** liquid-glass tile pops in; an information panel slides out from behind it; a row of fact chips staggers in. Never a bare logo.
- **UI simulation:** generic, non-branded dashboard or console; cursor moves and clicks exactly on the spoken words, with pressed states, toasts, and click SFX.
- **Flip reveal:** 3D card flip from front-end UI to back-end terminal on the key line; the speaker can break out of the frame into the cutout on the same beat.
- **Repo / link moment:** show the real repository structure, flag the change being discussed, then a cursor copies the clone link; leave a link pill on screen afterward.
- **Kinetic text:** words rise in, strike-through, and a slam replacement word for contrasts ("NOT the easy way").
- **Outro:** brand lockup, subscribe/CTA with click, then fade.

Rules: third-party logos come from official or officially distributed marks, never redrawn by hand; no imitation of a real product UI presented as genuine; brand colors and logo from the owner's brand pack.

### 7. Snapshot QC

Capture stills at every cue time before the full render. Confirm speaker visibility in every segment, readable text, no overlaps, and correct state at each cue.

### 8. Render

Render video only. Use segmented, resumable capture for long or heavy compositions so a stalled segment does not restart the whole render.

### 9. Audio Mix

- Voice: high-pass, light compression.
- Music: duck to roughly 16 dB below voice under speech, lift before voice starts and in the outro, fade at the end.
- SFX: align each effect's measured peak, not its file start, to the cue.
- Limit before loudness normalization; deliver at about -14 LUFS integrated, true peak at or below -1 dBTP.

### 10. Mux, Frame QC, Deliver

- Mux the mix onto the silent render; confirm duration equals the composition.
- Build a contact sheet at every cue time from the final file and check it against the cue sheet.
- If the delivery channel has a size limit, re-encode a delivery copy and state the tradeoff.
- Deliver the video plus the transcript and cue sheet so the owner can request retiming by time.

## Known Failures (preflight)

| Symptom | Cause | Prevention |
|---|---|---|
| ASR/model download refused | network allowlist | use embedded captions plus forced alignment |
| Whole-file forced alignment fails | long-utterance grammar mismatch | align per caption segment with padding |
| Speaker invisible early in the timeline | later `fromTo` tweens pre-render their start state | set `immediateRender: false` on non-first `fromTo` tweens |
| Render stalls and restarts from frame 0 | single sequential screenshot session | segmented capture with resume and browser recycling |
| Render cannot find a browser | no bundled headless shell | point the renderer at the installed headless shell |
| Mix clips on impacts | SFX stacked on voice | limiter before loudness normalization |
| Delivered file rejected | channel upload limit | size-targeted delivery re-encode |
| Brand/provider unknown | asset not supplied | generic placeholder, reported as such |

## Output Contract

```text
Final video (and delivery copy if size-limited)
Word-level transcript
Cue sheet (time -> word -> visual -> SFX)
Music offset and beat alignment note
Placeholders and non-claims
Frame-QC evidence (contact sheet at cue times)
```

## Evidence Classes

Render completion is Runtime-Verified only for the exact file checked. Sync is Artifact-Backed only at the cue times actually sampled. Owner creative acceptance is a separate Human-Observed gate; automated QC never claims it.

## Acceptance

See `tests/acceptance/signalproof-motion-edit-v0.1.md`.

## STOP Conditions

STOP when:

- the source clip would be altered in a way that changes what the speaker said;
- a cue cannot be tied to a transcript-verified word;
- a real brand, product UI, or person would be imitated as genuine, or a third-party logo would be hand-redrawn;
- private paths, credentials, or unreleased material would appear on screen or in public artifacts;
- a render is reported complete without a frame check of the exact delivered file;
- owner creative acceptance is claimed without the owner reporting it;
- this Candidate is treated as Active without governed promotion.

## Identity

- **Suite:** Signalproof Skills
- **Skill:** `signalproof-motion-edit`
- **Version:** `0.1.0`
- **Maturity:** Candidate / Not Active
- **Domain:** talking-head motion-graphics editing, transcript-locked cueing, beat sync, speaker reframing, audio mix, render verification
- **Created by:** Doc Reo / Signalproof
