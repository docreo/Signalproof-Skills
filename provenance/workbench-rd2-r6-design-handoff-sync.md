# Signalproof Workbench RD2 R6 - Design / Builder Handoff Synchronization

**Date:** 2026-08-21  
**Status:** STAGED / NONCANONICAL / MILESTONE OPEN / BUILDER HANDOFF READY  
**Work stream:** Signalproof Workbench GUI RD2

## Log-skill synchronization

Material state synchronized without claiming closeout.

New R6 design/pre-planning artifact:

`designs/SP-WORKBENCH-RD2-R6-AGENT-CONSOLE-PREPLANNING.md`

Commit:

`a30d2347dcbc8f31cc97e5453219f6794cf79cf3`

New Builder handoff:

`handoffs/SP-WORKBENCH-RD2-R6-BUILDER-HANDOFF.md`

Commit:

`5ec93c56ab05d325ffa303b537d94490a74f1a5f`

## Current owner direction preserved

- improve transcript/content gutters and visual breathing room;
- smooth the Workbench toward mature chat/agent-client behavior;
- preserve working Session/Bot delete functionality;
- complete non-Dashboard agent functionality;
- connect approved AI providers through normalized adapters;
- connect approved external applications through governed connectors;
- support governed local program/tool execution;
- prioritize Workbench capability needed by Signalproof Revenue Recovery Engine;
- keep Dash present but defer live Dashboard functionality;
- keep design and Builder chats synchronized through Git handoffs.

## Architecture preserved

```text
Workbench -> Governor -> Core -> Agent Runtime / Broker -> adapter / provider / tool / worker
```

Already-working local path remains protected:

```text
Workbench -> Governor -> Core -> Granite
```

Signalproof remains canonical owner of Bot, Session, Task, Run, Memory, Evidence, and policy-linked product state.

## Git state at design handoff

Protected main observed:

`f27e5f83172ffdca628f992c3b36297a2967d551`

Candidate branch:

`candidate/workbench-rd2-gui-build`

Before R6 design/handoff commits, compare reported:

- diverged;
- ahead by 20;
- behind by 4;
- merge base `80a21ccb324d96d4970ce9f61a279cb85ffcd16d`.

Receiving Builder must refetch current refs.

## Failure memory preserved

- do not return to per-message FlowLayoutPanel transcript rendering;
- do not overlap transcript/composer;
- do not repeat auto-scroll variants without new localization;
- stale harness assertions must be classified as harness failures rather than target/product failures;
- exact-final PowerShell parser/hash discipline remains required;
- do not retry unchanged known-bad PowerShell runners;
- do not fabricate provider/app/tool/delegation availability;
- do not allow GUI provider selection to create authority;
- do not implement provider-specific GUI branches;
- do not surrender Signalproof canonical state to Hermes/providers;
- do not overwrite production with candidate work.

## Next Builder gate

```text
R6-G0 RECEIVE AND RECONCILE
```

First receiving command:

```text
log-build-git
```

Then current `complete` / `build-spawn-debug` route, followed by:

```text
R6-G1 UX HOUSEKEEPING CANDIDATE
```

First implementation slice is limited to gutters/readable width/message rhythm/composer polish/mature scroll semantics and regression preservation.

## Milestone state

The Workbench milestone remains OPEN.

No canonical Build Ledger append was performed.
No C-number was reserved.
No Candidate was promoted.
No production/release mutation was performed.
