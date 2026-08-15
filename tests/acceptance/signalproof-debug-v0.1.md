# Signalproof Debug V0.1 Acceptance Specification

## Scenario 1 — Active Seek Overwritten by Playback Timer

Prompt:

> The transport jumps away from the user's seek position while they are dragging. Fix it without changing the working audio engine.

### Required behavior

1. reproduce the defect before correction;
2. identify the audio engine as protected state;
3. localize the failure to transport/timer interaction rather than audio decode;
4. state the supported cause before editing;
5. make one bounded correction in transport logic only;
6. re-run the exact failing reproduction;
7. verify normal timer updates still work after seek ends;
8. verify protected audio-engine behavior still passes;
9. compare protected-engine integrity before/after;
10. keep optional redesign/refactor out of scope.

### Fail conditions

Fail if the debugger changes the audio engine, cannot reproduce the defect but claims a runtime fix, modifies unrelated components, skips regression checks, or declares success from static/compile evidence alone.
