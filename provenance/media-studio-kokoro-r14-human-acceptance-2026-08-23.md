# Signalproof Media Studio — Kokoro R14 Human Acceptance Learning Record

**Status:** LOGGED / NONCANONICAL / PUBLIC-SAFE  
**Date:** 2026-08-23  
**Command:** `/dsp log-skill`  
**Work unit:** Signalproof Media Studio V5 RD2 C2D-C2R1 — governed Signalproof-Kokoro integration

## Evidence state

Human UI testing established that the governed Signalproof-Kokoro narration path works in Media Studio after the R14 dual-mode correction.

Observed accepted behavior:

- Media Studio reports `Signalproof-Kokoro NORMAL` for general narration.
- `US Female - Bella` / `af_bella` is accepted by the governed provider path.
- General narration generates successfully.
- Generated audio is surfaced in the Media Studio audio workspace and is ready for playback.
- The earlier `Voice is not governed by this provider configuration: af_bella` failure is no longer present.
- The earlier `CONTROLLED mode requires explicit phonemes or a governed registry entry` failure is no longer applied to ordinary narration.

This record does **not** claim closure of unrelated Media Studio AI-writing functionality.

## Separate unresolved lane

The local AI Writing / Granite path remains unresolved in the observed UI state:

- Media Studio's AI Writing connection cannot currently reach a compatible local AI service.
- This is a separate connectivity/runtime lane from the Kokoro/TTS acceptance.
- Do not regress, reopen, or invalidate the accepted Kokoro work merely because the Granite/AI Writing lane remains open.

## Reusable learning

### 1. Controlled pronunciation and general narration are different operating modes

Do not force a full narration UI into `CONTROLLED` mode.

Use:

- `CONTROLLED` for exact, owner-approved pronunciation tests or requests that provide explicit governed phoneme evidence.
- `NORMAL` for arbitrary sentences, paragraphs, and production narration.

A valid integration may prove a protected pronunciation in `CONTROLLED`, then transition the production narration runtime to `NORMAL` before launching the human UI.

### 2. Provider voice governance must align with the product-visible voice contract

If the UI exposes a voice such as `af_bella`, the governed provider configuration used by that runtime must authorize the same voice identity and verified local asset. A UI/provider mismatch must fail closed and be corrected at the governance boundary rather than bypassed.

### 3. Do not weaken CONTROLLED mode to make prose work

The correct recovery for arbitrary prose rejected by `CONTROLLED` is not to weaken the provider's pronunciation rules. Preserve the fail-closed pronunciation contract and route general prose through `NORMAL`.

### 4. Human acceptance must be separated by capability lane

A successful TTS lane does not imply that AI Writing, Granite, Ollama, CS1, transcription, or other Media Studio capabilities are working. Record PASS/FAIL at the narrow capability boundary so an unrelated failure cannot contaminate accepted work.

### 5. Harness failures are not product failures

The R1-R13 recovery sequence surfaced multiple PowerShell/parser/staging defects before the final product behavior could be evaluated. Preserve these as harness failure classes and do not increment product/runtime failure conclusions when target actuation did not occur.

### 6. Prefer an easy-button runner that proves both machine modes before UI handoff

For this class of governed TTS integration, the strongest completion envelope is:

`verify exact candidate -> verify provider/assets -> CONTROLLED protected-pronunciation machine gate -> stop controlled backend -> NORMAL arbitrary-prose machine gate -> launch UI on the already-proven NORMAL backend -> human playback acceptance`

This materially reduces repeated human diagnostic cycles.

## Lifecycle governance

No `SKILL.md` is created or materially changed by this log.

Reusable learning status:

`DISCOVERED -> CANDIDATE`

Candidate theme:

**Governed local TTS integration / dual-mode pronunciation and narration acceptance**

Do not auto-promote this learning to Active. If it is later extracted into a routeable Skill or known-error rule, run normal Skill Architecture, tests, and lifecycle governance first.

## Closure boundary

Kokoro/TTS lane: **HUMAN-ACCEPTED**.  
Granite/AI Writing lane: **OPEN / UNRESOLVED**.  
Overall Media Studio program: **NOT CLOSED BY THIS RECORD**.

No canonical Build Ledger sequence is reserved or claimed by this log.
