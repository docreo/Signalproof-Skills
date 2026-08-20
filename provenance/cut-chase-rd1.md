# Signalproof Cut Chase RD1 Provenance

## Status

Public provenance record for the Signalproof-native `signalproof-cut-chase` Skill and `cut-chase` operator command.

## Upstream reference studied

Repository:

`mattpocock/skills`

Historical upstream file:

`skills/productivity/caveman/SKILL.md`

Historical commit containing the file:

`694fa30311e02c2639942308513555e61ee84a6f`

Historical Caveman blob:

`85770a38992a7c74d2b3467b03fe5bd4b1287fe6`

Upstream license:

MIT, copyright Matt Pocock 2026.

Later removal commit:

`47bde84da032afb2e5058f997f3bbca47d321dbd`

The later upstream change states that `caveman` was a duplicate of another skill being tested and was never meant to be public. Signalproof therefore does not install, invoke, or depend on Caveman as an upstream runtime capability.

## What was learned

The useful general lesson was narrow:

- aggressive compression can reduce filler while preserving technical substance;
- compression needs a clarity exception when risk or sequence makes extreme brevity unsafe.

## What Signalproof does differently

Signalproof Cut Chase is not an upstream copy and is not intended to reproduce Caveman's voice.

Its core objective is **decision-load reduction**, not maximum token reduction.

Signalproof adds:

- salience ranking;
- explicit bottom-line extraction;
- evidence and uncertainty preservation;
- authority-boundary preservation;
- action-note extraction;
- protected-state / rollback preservation when material;
- one-shot behavior by default rather than sticky compression;
- readable Dr. Signalproof voice rather than intentionally telegraphic grammar;
- a rare, context-earned humor/Docism budget rather than a continuous persona gimmick;
- STOP conditions for unsafe over-compression.

## Public Library boundary

`signalproof-cut-chase` belongs to the public `docreo/Signalproof-Skills` Signalproof Library. The public repository's registries and `main` Skill definitions are the capability authority after governed promotion.

Private Build Ledger material may record implementation/provenance history, but private records do not become the `/dsp` public Skill Library authority.

## Promotion boundary

This record does not by itself promote the Skill or command. Promotion requires registry consistency, acceptance tests, governed PR review/merge, and synchronized Active versions on protected `main`.
