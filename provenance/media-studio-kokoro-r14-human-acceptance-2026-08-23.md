# Signalproof Media Studio — Kokoro R14 Short-Form Acceptance / Long-Form Revocation

**Status:** LOGGED / NONCANONICAL / PUBLIC-SAFE / SUPERSEDED FOR PRODUCTION LONG-FORM  
**Original observation date:** 2026-08-23  
**Revocation evidence date:** 2026-08-24  
**Command family:** `/dsp log-skill`  
**Work unit:** Signalproof Media Studio V5 RD2 C2D-C2R1 — governed Signalproof-Kokoro integration

## Evidence correction

The original R14 human UI observation proved only a short-form narration sample. Later owner testing established that production long-form Kokoro remained broken/insufficient and that the visible narration workflow still presented a 50,000-word planning ceiling.

Therefore the prior broad `HUMAN-ACCEPTED` conclusion is revoked for production long-form use.

R14 may still be cited for the narrower facts it actually proved:

- Media Studio could route ordinary short narration through `Signalproof-Kokoro NORMAL`.
- `US Female - Bella` / `af_bella` was governed and usable on that short path.
- the earlier Bella-not-governed failure was corrected;
- arbitrary prose was no longer incorrectly forced through `CONTROLLED` mode;
- the exact governed `Signalproof` pronunciation remained a separate CONTROLLED-mode concern.

R14 did **not** establish audiobook/book-length completion, resume, final-source coverage, or removal of an arbitrary application word ceiling.

## Root acceptance gap

The governed consumer milestone was built around the `generate_first` compatibility contract while the streaming/long-form `generate_all` path was explicitly outside that candidate's scope. Short UI testing therefore exercised a path that was not representative of production manuscript narration.

The later audit also identified additional production-long-form constraints that short acceptance did not exercise:

- a visible 50,000-word planning target in the narration UI;
- one synchronous `/api/generate` request for the full narration;
- a governed consumer subprocess timeout that was suitable for short calls but not a book-length job;
- lack of a durable chunk manifest/resume/final-stitch acceptance gate.

## Reusable learning

### 1. Short-form TTS PASS must not be promoted to long-form acceptance

For narration products, acceptance must exercise the actual production topology. A paragraph-sized sample proves routing and basic acoustics; it does not prove manuscript completeness.

### 2. Long-form acceptance requires source-completeness evidence

A production gate should prove at least:

`source identity -> deterministic chunk plan -> every chunk completed or verified-resumed -> final stitched output -> end-of-source human playback check`

A non-acoustic planning gate may use a source larger than the former UI threshold, while a smaller forced multi-chunk acoustic gate can prove real synthesis/stitch/resume behavior without wasting hours of compute.

### 3. CONTROLLED and NORMAL remain separate

- `CONTROLLED`: exact governed pronunciation / explicit approved phoneme evidence.
- `NORMAL`: arbitrary production narration.

Do not weaken CONTROLLED rules to make prose work, and do not force all narration into CONTROLLED.

### 4. Product-visible voice governance must match provider governance

If the UI offers `af_bella`, the runtime provider configuration must govern the same verified local voice asset. Fail closed on mismatch.

### 5. Harness failures remain separate from product failures

PowerShell/parser/staging defects must not be counted as product runtime failures when target actuation never occurred.

## Current lifecycle state

Reusable learning remains:

`DISCOVERED -> CANDIDATE`

No `SKILL.md` is created or activated by this record. No canonical Build Ledger event number is reserved or claimed.

## Closure boundary

Kokoro short-form R14 lane: **NARROW PASS / HISTORICAL EVIDENCE**.  
Kokoro production long-form lane: **REOPENED / R14 ACCEPTANCE REVOKED**.  
Granite/AI Writing lane: **OPEN / SEPARATE**.  
Overall Media Studio program: **NOT CLOSED BY THIS RECORD**.

A later long-form recovery candidate must earn a new machine and human acceptance state; it must not inherit R14 production acceptance by implication.
