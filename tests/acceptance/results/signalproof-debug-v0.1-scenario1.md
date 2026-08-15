# Signalproof Debug V0.1 — Scenario 1 Result

## Scenario

Active user seek was being overwritten by the playback timer. The working audio engine was protected and forbidden from change.

## Reproduction before correction

Runtime reproduction:

- begin seek at position `42`;
- playback timer reports position `3`;
- observed result: seek position changed to `3.0`;
- assertion failed: `3.0 != 42`.

Result before correction: **FAIL reproduced**.

## Localization

- audio decode behavior passed;
- failure occurred only when the transport timer updated during an active seek;
- failed layer: transport/timer state handling;
- supported cause: timer update did not honor active-seek state.

## Protected state

Protected file: `audio_engine.py`

SHA-256 before correction:

`efdd79c0a93aa4e5d5ff72ac60cf5663df3d995788abe9fe9fdc0adc2c567bf6`

## Bounded correction

Changed transport logic only so timer updates are ignored while a user seek is active.

No audio-engine change, dependency change, redesign, or unrelated refactor.

## Runtime verification after correction

- **PASS** — active seek remained at position `42` when timer reported `3`;
- **PASS** — after seek ended, timer update advanced position normally to `4`;
- **PASS** — protected audio-engine decode behavior remained correct.

Protected audio-engine SHA-256 after correction:

`efdd79c0a93aa4e5d5ff72ac60cf5663df3d995788abe9fe9fdc0adc2c567bf6`

Integrity comparison: **MATCH**.

## Acceptance evaluation

Required behaviors: **10 / 10 PASS**

Fail conditions triggered: **0**

Failed correction attempts: **0**

## Status

**FIX VERIFIED — signalproof-debug V0.1 minimum behavioral acceptance gate satisfied.**

This result demonstrates the bounded-debug workflow for this scenario and does not claim universal host compatibility or release certification.
