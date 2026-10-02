# Audio Editor Empty-State, Strict Manifest, Legacy Relay, and Waveform Evidence — Candidate Learning

**Status:** CANDIDATE  
**Source domain:** governed Windows audio editor / production UI  
**Lifecycle:** DISCOVERED -> CANDIDATE; not Active doctrine

## Failure classes observed

### 1. Legacy transport path compatibility can fail after valid render

A rendered preview can be byte-valid and correctly governed yet still fail a legacy media API when the concrete filesystem path exceeds that API's practical filename/path behavior.

Candidate principle:
- preserve the governed source path as logical authority;
- if a legacy transport requires a compatibility path, stage a byte-identical, hash-verified relay with a bounded basename;
- hand only the compatibility path to the legacy API;
- never weaken source provenance or rewrite the governed source to satisfy the legacy API.

### 2. Zero items is a valid editor state

Deleting the final track or opening an empty session can expose hidden assumptions such as `lanes >= 1` followed by indexing element zero.

Candidate principle:
- collection cardinality and visual-lane count must remain separate concepts;
- zero-track and zero-clip states need explicit rendering paths;
- a visual fallback must not become collection-index authority.

### 3. Strict manifest changes must update every strict consumer

A governed component manifest may have more than one strict consumer. Updating the producer and one consumer can still leave a second consumer rejecting a new provenance field through `DisallowUnknownFields()`.

Candidate principle:
- enumerate all strict consumers before changing a manifest schema;
- preserve strict decoding;
- add the field to every intended consumer;
- validate provenance, not just parse it;
- regression-test both correct identity and drift/fail-closed behavior.

### 4. Human acceptance needs observable editing evidence

A stateful editor can correctly modify trim/split/fade values while remaining difficult to validate if the UI shows only generic rectangles.

Candidate principle:
- audio editing should expose waveform context at the clip level;
- split and trim should visibly change the represented source region;
- loop should repeat the waveform representation;
- fade-in/fade-out should visibly alter the envelope or show an envelope guide;
- source assets remain immutable and waveform caches are derived evidence.

## Regression candidates

- empty session opens without panic;
- deleting the last track leaves a usable empty timeline;
- strict recorder manifest accepts the pinned provenance field and rejects drift;
- preview relay bytes match the governed preview exactly;
- relay cleanup does not modify/delete the governed source;
- imported MP3/WAV/FLAC clips can render governed waveform evidence when their decoder path is available;
- split/trim/fade produce visibly different clip representations;
- success text is emitted only after real operation success.

## Governance note

This is public-safe reusable engineering learning only. Private paths, hashes, screenshots, exact candidate identities, and Build Ledger chronology remain outside this candidate.
