# Signalproof Workbench GUI RD2 - Handoff Receipt and Build Spawn Debug Envelope

**Status:** HANDOFF RECEIVED / AUTHORIZED-PENDING-W0 / PRODUCTION UNCHANGED  
**Date:** 2026-08-21  
**Owner:** Doc Reo  
**Workstream:** Signalproof Workbench GUI RD2  
**Build branch:** `candidate/workbench-rd2-gui-build`

## Handoff receipt

`/dsp handoff-log RECEIVED`

Transferred state:

- prior governed-model milestone: `CLOSED / USER UI PASS`;
- protected behavior: `Workbench -> Governor -> Core Runtime -> general_reasoning -> local model`;
- current gate: `W0 SOURCE AND INTERFACE AUTHORITY`;
- action class: `READ / INVESTIGATE / VERIFY`;
- canonical Build Ledger chronology: do not invent;
- production GUI mutation: none in this phase so far.

The prior milestone remains closed. This GUI stream does not reopen it unless new evidence materially contradicts the accepted proof.

## Current Git reconciliation

Current protected `docreo/Signalproof-Skills/main`:

`2560af8d6309720d971ce7ddcb49ca393e07611d`

Current build branch:

`candidate/workbench-rd2-gui-build`

Build branch compared with current main:

- status: diverged;
- ahead: 9 commits;
- behind: 3 commits;
- merge base: `80a21ccb324d96d4970ce9f61a279cb85ffcd16d`.

The build branch is exactly one commit ahead of the accepted design branch head `f4cc84058427b3621115ed28ba95e7ed4ae70f85`; that added commit is the W0 authorization receipt `9183866b1599b7cef6dcbc9f7f5817d811053d1b`.

No protected-main mutation is authorized by this receipt.

## Current design authority reconciliation

The transferred RD2 handoff summarizes the earlier R2 `SESSIONS / BOTS` frame. Current owner-accepted design evidence already present on the build branch includes the later R3 Dash addendum and Builder handoff.

Therefore the current GUI shell contract for implementation is:

```text
SESSIONS    BOTS    DASH
```

- Sessions: ordinary resumable LLM conversation/history workspace.
- Bots: persistent governed worker workspace with visible real delegation when runtime support exists.
- Dash: mostly read-only operational overview with explicit customization mode.

Dash widget domains:

- Calendar;
- Meetings;
- Tasks;
- Opportunities;
- Growth;
- Current Status;
- Alerts.

The Greenlight reference governs dashboard composition inspiration only. It does not replace the accepted Workbench shell.

## Protected visual/product contract

- desktop-first full application;
- left rail / dominant center conversation or Dash canvas / contextual collapsible right rail;
- persistent bottom composer in conversational modes;
- Signalproof black / charcoal / red identity;
- front-facing name `Signalproof Workbench`;
- approved circular red Signalproof logo identity SHA-256 `4B660A3C4F9F75BEF0F6552747A61FD8178ACD0AA6C0B4F441FB9EB69CC88EDD`;
- Control/Evidence available on demand, not dumped into ordinary assistant prose;
- no fabricated Bot activity or live widget state.

## Protected runtime contract

```text
Human
-> Signalproof Workbench UI
-> Signalproof Governor
-> Signalproof Core Runtime
-> Signalproof Agent Runtime / Broker
-> replaceable adapters, including Hermes
-> approved models / tools / web / environments
```

The already-proven plain local-model path remains protected behavior while the GUI evolves.

## Authorization handler result

Owner invocation:

`/dsp authorize all build-spawn-debug`

Canonical target:

`build-spawn-debug`

Authorization subject:

all normal owner-authorizable build/debug/test actions required inside this exact `Signalproof Workbench GUI RD2` envelope through automated PASS.

Status:

`AUTHORIZED-PENDING-PRECONDITION`

Precondition:

`W0 SOURCE AND INTERFACE AUTHORITY` must establish a non-guessed authoritative/reproducible source basis before implementation.

Authority does not include:

- production/release/deployment;
- protected-main bypass;
- canonical Build Ledger append;
- Candidate activation;
- privilege escalation;
- new credentials/access;
- security-control weakening;
- unrelated workstreams.

## Current PowerShell prevention state

Current registry:

`library/POWERSHELL-FAILURE-REGISTRY.yaml`

Git blob SHA:

`d8260bd0dfad5a15948def93e9af8f47b19debb9`

Version/status:

`0.1 / ACTIVE_PREVENTION_DATA`

The exact staged W0 script must be hash-bound and parser-preflighted before one execution. A renamed or fresh-chat artifact does not reset same-failure continuity.

## W0 artifact evidence currently available

Known W0 scripts:

- `SP-WORKBENCH-W0-RD1.ps1`: read-only source/worktree/project inventory;
- `SP-WORKBENCH-W0-RD1.1.ps1`: read-only build-provenance/toolchain reconstruction, valid only when RD1 evidence exists with disposition `SOURCE_AUTHORITY_UNRESOLVED`.

The handoff requires local re-hash of the exact staged artifact before execution. No receipt claim is made that either script has executed merely because the artifact exists.

Known accepted Workbench build history also shows the original candidate lineage used the installed Windows .NET Framework C# compiler directly rather than requiring a conventional `.csproj` source tree. That historical evidence may become relevant if W0 confirms there is no surviving authoritative development worktree, but an Evidence copy must not be silently relabeled as source authority.

## Build Spawn Debug Envelope

```text
BUILD SPAWN DEBUG ENVELOPE
Objective: produce an isolated Signalproof Workbench GUI RD2 candidate implementing the owner-accepted Sessions / Bots / Dash shell while preserving the already-working governed local-model path.
Repository / Git basis: docreo/Signalproof-Skills main 2560af8d6309720d971ce7ddcb49ca393e07611d + candidate/workbench-rd2-gui-build
Protected state: accepted production Workbench/Governor/Core integration, cryptographic identity, production activation state, protected Core, prior USER UI PASS
Allowed surfaces: W0 read-only evidence; then isolated candidate source/build/evidence surfaces established by W1
Current acceptance gap: source/rebuild authority for the current Workbench is not yet proven
Known-error matches: current PowerShell prevention registry loaded; revision discipline and source-authority anti-guess rules active
Prior failure memory: no new W0 execution result asserted by this receipt
Automated gates: W0 source/provenance, W1 contract freeze, compile/build, static UI contract, protected-state regression, runtime integration regression, security/provenance review
User UI gate: owner launches exact isolated candidate and visually/interaction-tests Sessions / Bots / Dash plus governed conversational path
Recovery: do not overwrite production; preserve failed candidate/evidence lanes; new material runner revision gets a new identity
Authority exclusions: production/release, protected-main bypass, canonical ledger append, Candidate activation, privilege/security expansion, new secrets/access, unrelated work
STOP: source/rebuild authority cannot be established; candidate threatens production; Governor/Core bypass; known-bad retry unchanged; same-failure limit reached; required excluded authority; evidence cannot support the acceptance claim
```

## Exact next action

Verify the exact local W0 artifact identity and parser state, execute the applicable W0 read-only path once, inspect its report/evidence, and classify source/rebuild authority.

If RD1 evidence does not yet exist, execute RD1.

If RD1 evidence already exists with exact disposition `SOURCE_AUTHORITY_UNRESOLVED` and the RD1.1 evidence lane is fresh, execute RD1.1 instead of repeating RD1.

If W0 establishes a reproducible authoritative basis, freeze W1 and continue automatically under `build-spawn-debug` toward the isolated R3 shell candidate.

If W0 remains unresolved, continue only with the smallest materially new read-only provenance investigation. Do not build from a guess.
