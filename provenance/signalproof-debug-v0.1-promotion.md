# signalproof-debug V0.1 Promotion Evidence

## Status

Promotion candidate for `signalproof-debug` from `0.1.0-rc1` to `0.1.0` Active public baseline.

## Acceptance evidence

- Runtime defect reproduced before correction: active seek position `42` changed to `3.0` when the playback timer updated.
- Failure localized to transport/timer state handling rather than the protected audio engine.
- One bounded transport-only correction applied.
- Original reproduction passed after correction.
- Normal timer updates still passed after the seek ended.
- Protected audio-engine behavior remained correct.
- Protected audio-engine SHA-256 remained unchanged before and after:
  `efdd79c0a93aa4e5d5ff72ac60cf5663df3d995788abe9fe9fdc0adc2c567bf6`
- Required debug behaviors: 10/10 PASS.
- Fail conditions: 0.
- Failed correction attempts: 0.

## Governance

PR #9 carried the candidate skill, acceptance specification, and runtime evidence into protected `main`. This promotion changes only skill maturity/version metadata, registry status, and durable promotion evidence. It does not alter the accepted debugging operating rules.
