# Signalproof Workbench GUI RD2 - R5 Stable Agent Console Rebuild

**Date:** 2026-08-21  
**Status:** STRUCTURAL REBUILD PREPARED / WINDOWS BUILDER USER TEST REQUIRED  
**Workstream:** Signalproof Workbench GUI RD2

## Owner mandate

`/dsp authorize all build-spawn-debug`

Owner explicitly directed that the Workbench stop cycling through scroll patches and become the usable Signalproof agent console discussed in the accepted design, with live Dashboard integrations deferred.

## Why R5 is a structural rebuild

R4 through R4.2 demonstrated that the WinForms `FlowLayoutPanel` message-panel transcript was not a reliable conversation renderer. Long assistant turns could exist below the visible viewport until another user message changed layout/scroll state.

R5 removes that transcript mechanism from the critical path rather than applying another variant of `ScrollControlIntoView` / timer logic.

## Transcript architecture change

R5 uses a read-only WinForms `RichTextBox` as the conversation transcript.

Every user/assistant append:

1. appends role + content to one stable text surface;
2. moves selection to `TextLength`;
3. calls `ScrollToCaret()`.

The old per-message child Panel layout, transcript-follow timer, and FlowLayoutPanel scroll geometry are no longer the conversation rendering mechanism.

## Sessions

R5 supports:

- create Session;
- persistent local Session history;
- resume/select Session;
- rename selected Session;
- delete selected Session with confirmation;
- automatic fallback to another/new Session after deletion.

## Bots

R5 supports:

- persistent Bot profiles;
- create Bot;
- rename selected Bot;
- edit Bot instruction;
- configure provider/model/memory/tool/web/delegation intent metadata;
- delete selected Bot with confirmation;
- persistent Bot conversations;
- safe Bot rename propagation into persisted Bot conversations;
- RRE Bot seed for Signalproof Revenue Recovery work.

## Provider / agent direction

The current executable runtime remains the already-proven governed path:

`Workbench -> Governor -> Core -> Granite`

R5 Bot configuration includes provider/model target slots for:

- Granite Local;
- Hermes Gateway;
- OpenAI / Codex;
- Claude;
- Gemini;
- Grok;
- CS1 / Cerebras.

These non-Granite targets are configuration state only until a governed Agent Runtime/provider adapter is active behind Governor/Core. R5 does not fabricate connectivity and does not add a direct provider, direct Ollama, direct Core, or direct Hermes bypass.

## Hermes source review incorporated

Hermes upstream is MIT licensed. Current upstream documentation confirms:

- TUI gateway JSON-RPC over stdio or WebSocket for custom hosts;
- session create/list/activate/close/history/status;
- prompt submission and steering;
- streaming `message.delta` / `message.complete` events;
- tool progress;
- approvals, clarification, sudo/secret prompts;
- delegation and subagent controls;
- model switching;
- OpenAI-compatible HTTP API as a secondary integration surface.

Signalproof adopts the architectural pattern, not Hermes product-state ownership:

- GUI owns Signalproof presentation;
- Signalproof owns Bot/Session/memory/evidence policy;
- Governor decides;
- Core enforces;
- future Agent Runtime owns execution orchestration;
- Hermes remains a replaceable adapter.

## Dashboard

`DASH` remains present as the accepted shell/workspace. Live Dashboard sources remain deferred by owner direction. Unknown/unconfigured data must remain explicit.

## Prepared R5 package

`Signalproof-Workbench-GUI-RD2-R5-STABLE-AGENT-CONSOLE.zip`

ZIP SHA-256:

`BE36D6A6B013D77D5D6BC3618F69A7EAA2FD150435E64A418DDA2F7C40E9AB2F`

GUI source SHA-256:

`47AC8AD690BC98FBA24436667F9925ACBC095B118BF089D2B97AA34DF4549159`

Builder SHA-256:

`C49144ABC3525ECCB3ADC5FBFD2CB7F0A709859D4528E906DCB9C5525EC0A442`

## Static preparation checks completed

PASS in build workspace:

- `RichTextBox` transcript present;
- old FlowLayoutPanel transcript declaration absent;
- `ScrollToCaret` present;
- transcript-follow timer absent;
- Session rename/delete present;
- Bot rename/configure/delete present;
- RRE Bot seed present;
- provider target metadata present;
- Governor transport retained;
- no direct Core endpoint;
- no direct Ollama endpoint;
- no direct process launch surface in GUI source;
- source delimiter/token balance check PASS;
- builder includes R5 source identity and required contract markers.

## Remaining honest gate

This environment cannot compile/run the Windows .NET Framework GUI. The packaged Windows builder therefore remains responsible for:

- exact-final PowerShell parser preflight;
- exact embedded-source hash;
- protected baseline hashes;
- Windows C# compile;
- static self-test;
- governed Granite round trip;
- protected-state postflight;
- GUI process launch-liveness check.

After those pass, the remaining user test is visual/interaction behavior, not another design authorization.
