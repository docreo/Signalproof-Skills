# Signalproof Workbench RD2 R6 - COMPLETE G0 Bootstrap State

**Date:** 2026-08-21  
**Status:** COMPLETE / AUTHORIZED-PENDING-PRECONDITION  
**Workstream:** Signalproof Workbench GUI RD2 R6  
**Branch:** `candidate/workbench-rd2-gui-build`

## Complete Authorization Envelope

```text
Workstream: Signalproof Workbench GUI RD2 R6
Objective: implement the approved R6 Workbench UX/code-box/context-card improvements in the actual current Workbench source, preserve working Sessions/Bots behavior and governed runtime architecture, debug through machine-verifiable PASS, then hand the exact candidate to the owner for human UI acceptance.
Protected state: current production Workbench identity and governed Workbench -> Governor -> Core -> Granite path remain unchanged during candidate build/test.
Acceptance target: R6 automated build/regression/governance gates PASS, then human UI test of readability, box/card behavior, gutters, composer, scrolling, and preserved ordinary chat behavior.
Allowed authority: all owner-authorizable actions inside the current /dsp complete -> build-spawn-debug envelope.
Known failures / retry memory: preserve R5/R5.1 FlowLayoutPanel rejection, deterministic-scroll correction, stale transcript_follow_timer harness lesson, parser/exact-final/hash discipline, and unchanged-known-bad retry STOP rule.
Recovery: fresh Quarantine Evidence candidate/evidence lanes; no production overwrite; no canonical ledger mutation.
Excluded authority: production/public release, protected-main bypass, canonical Build Ledger append, Candidate activation, new secrets/credentials, privilege escalation/security weakening, unrelated workstreams.
Consumption: user ACCEPTED, material workstream change, envelope invalidation, or true STOP.
Status: AUTHORIZED-PENDING-PRECONDITION
```

## Current Git truth

Active command chain revalidated from protected `main`:

```text
/dsp complete -> complete -> bounded authorize-all envelope -> build-spawn-debug
```

Current branch already contains:

- `tools/workbench/SP-WORKBENCH-R6-G0-RD1.ps1`
- exact runner SHA256: `365941B1A96CF757EA67021E4A81A47B45A217F290310DCB805403530EDC374E`

The G0 runner is a read-only exact-source-localization gate against the owner Windows environment. It verifies the protected production identity, finds the exact R5.1 source by SHA256, checks the current transcript/governor safety anchors, and writes a fresh source-localization report/evidence lane only.

## Bootstrap added

A hash-pinned bootstrap was added at:

```text
tools/workbench/RUN-SP-WORKBENCH-R6-G0-RD1.ps1
```

Commit:

```text
d7506c3eb2104e3fc7b204b056d4f2dc1bf552ad
```

The bootstrap:

1. requires non-admin execution;
2. downloads the exact candidate-branch G0 runner;
3. verifies SHA256 `365941B1A96CF757EA67021E4A81A47B45A217F290310DCB805403530EDC374E`;
4. parses exact downloaded bytes before staging;
5. refuses to overwrite a same-name target containing different bytes;
6. stages only to `F:\Downloads\Quarantine\Evidence`;
7. parses exact staged bytes again;
8. executes the G0 read-only localization gate through Windows PowerShell;
9. propagates a nonzero child result as STOP.

## Why completion cannot advance further in the current chat runtime

The authoritative R5.1 C# candidate source is on the owner's Windows `F:` drive, not in the current remote/container runtime. R6-G1 patching must be based on that exact source and its localized current control/method anchors. Building from an older or guessed source would violate the current Build Spawn Debug and protected-state contracts.

Therefore the strongest honest state is:

```text
COMPLETE / AUTHORIZED-PENDING-PRECONDITION
```

This is not an owner-authorization wait. The Complete Authorization Envelope remains valid.

## Automatic continuation condition

Once the owner returns either:

- the G0 console output, or
- `F:\Downloads\Quarantine\Evidence\SP-WORKBENCH-R6-G0-EV-RD1\R6-G0-SOURCE-LOCALIZATION.txt`

continue automatically into R6-G1 without requesting another routine authorization.

R6-G1 includes the previously bound native code/artifact box and context-card implementation plus transcript gutters/readable width/message rhythm/composer/scroll polish, while preserving the governed architecture and working Session/Bot behavior.
