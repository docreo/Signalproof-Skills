# Media Player Transport Lifecycle + Cue/Loop UX — Candidate Learning

**Status:** CANDIDATE  
**Source domain:** Signalproof media/music creation UI  
**Lifecycle:** DISCOVERED -> CANDIDATE; not Active doctrine

## Problem pattern

A media player can appear to work at the transport level while still coupling playback to a page lifecycle. Two failure modes are especially easy to introduce:

1. a library or page refresh implicitly calls STOP/CLOSE, so navigating away and back destroys playback even though the user never requested Stop;
2. duration, seek, loop, IN, and OUT controls become available only after playback starts, forcing the user to miss or chase an intended loop boundary.

A related truthfulness failure occurs when new decode/waveform capability is working but stale UI labels still describe the old capability state.

## Candidate principles

### 1. Transport is session state, not page state

Ordinary navigation, page hiding/showing, list repaint, and non-destructive library refresh should preserve the loaded transport and its current play/pause/seek/loop state.

Intentional transport interruption should have an explicit reason. For a creation tool, a newly completed render may be such a reason because the library must reconcile a new output. Do not make all refresh paths inherit that stronger behavior.

### 2. Distinguish refresh cause

Prefer an explicit refresh policy or event reason rather than a single refresh function that always tears down media state.

Example semantic split:

- navigation/manual refresh -> preserve transport;
- new-render completion -> stop/unload if that is the approved product behavior.

This makes STOP authority visible and testable.

### 3. Select -> cue -> configure -> play

For a playable asset, selection should be able to establish a `CUED` state before playback:

- open/validate the media;
- resolve duration;
- expose seek/waveform position;
- enable IN/OUT/LOOP controls;
- keep audio silent until PLAY.

This supports precise looping without requiring the user to hear past the desired IN point first.

### 4. Loop-first playback starts at IN

When a valid loop is enabled before initial PLAY, start from LOOP IN rather than the current OUT-marker position or an unrelated transport position. IN/OUT should remain adjustable after playback begins.

### 5. Pre-play seek must remain silent

Seeking a cued-but-not-started asset must not accidentally begin audible playback. The backend may need a distinct loaded/cued state so seek does not reuse a play-then-pause implementation intended for already-started media.

### 6. Capability labels are part of correctness

When a format gains governed waveform support, all visible captions/legends must reflect the active format. A working MP3 waveform labeled as native WAV is still a user-visible correctness failure.

### 7. Human evidence is format-specific

Do not generalize one real-project format test to other formats. Machine fixtures can prove decoder/build behavior, but they do not prove real-project human UI behavior. If the user currently has only MP3 assets, record WAV/FLAC human UI status as deferred/unknown rather than PASS.

### 8. Working rollback may preserve known limitations

An owner may designate a candidate as a working rollback even when non-critical UX limitations remain. Preserve the exact private identity and known limitations, but do not silently promote it to fully accepted/release-ready state. Keep older protected rollback lineage intact unless separately superseded.

## Regression candidates

- navigation away/back while audio plays does not change transport state;
- manual library refresh preserves transport;
- new-render completion follows the explicit approved stop/unload policy;
- selected playable media reaches CUED with duration known before PLAY;
- seek + SET IN + seek + SET OUT + LOOP ON can occur before PLAY;
- PLAY with a valid loop begins at IN;
- pre-play seek is silent;
- format caption matches selected waveform format;
- MP3 human PASS does not mutate WAV/FLAC human status.

## Governance note

This candidate is reusable product-learning, not a release record. Private artifact hashes, workstation paths, rollback identities, screenshots, and Build Ledger chronology belong in private evidence, not this public-safe candidate.
