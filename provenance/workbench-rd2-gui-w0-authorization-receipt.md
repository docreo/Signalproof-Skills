# Signalproof Workbench GUI RD2 - W0 Authorization Receipt

**Status:** OPEN / AUTHORIZED / READ-ONLY W0  
**Date:** 2026-08-21  
**Owner:** Doc Reo  
**Work stream:** Signalproof Workbench Bots/Sessions RD1 -> Signalproof Workbench GUI RD2

## Owner direction

Owner invoked:

`/dsp log-build-git authorize all build-spawn-debug`

and directed the next version to use:

`handoffs/SP-WORKBENCH-BUILDER-HANDOFF-RD1-R2.md`

with the same accepted Signalproof color scheme and the front-facing product name:

**Signalproof Workbench**

The next front-facing name must not lead with `LLM`.

## Governing Git

Current `docreo/Signalproof-Skills/main` observed at phase open:

`2560af8d6309720d971ce7ddcb49ca393e07611d`

R2 builder handoff source branch:

`candidate/workbench-bots-rd1`

New isolated build branch:

`candidate/workbench-rd2-gui-build`

## Handoff authority

Builder handoff:

`handoffs/SP-WORKBENCH-BUILDER-HANDOFF-RD1-R2.md`

Required companion contracts:

1. `designs/SP-WORKBENCH-BOTS-SESSIONS-RD1-ARCHITECTURE.md`
2. `designs/SP-WORKBENCH-BOTS-SESSIONS-RD1-UX-AND-ACCEPTANCE.md`
3. `designs/SP-WORKBENCH-BOTS-SESSIONS-RD1-VISUAL-DIRECTION-R2.md`
4. `handoffs/SP-WORKBENCH-WORK-CHAT-HANDOFF-RD1.md`

Where older visual framing conflicts with R2, R2 controls the frame/navigation model. Architecture continues to control runtime/governance boundaries.

## Current reconciled production truth

The handoff predates completion of the governed local-model path. Current accepted production truth now includes a USER UI PASS for:

`Workbench -> Governor -> Core Runtime -> approved general_reasoning capability -> local model`

The new GUI must preserve this working behavior as a protected integration boundary.

Accepted production Governor integration identities from the closed prior milestone:

- Governor server SHA-256 `F966D5DE6BD3009BCE4C3D5BC25D1D91F46239320975B31147F54BCBF4C41616`
- Governor-Core adapter SHA-256 `C440EB58D3592A3BB081138C05067E87886228EE070D88A8F88F7178DCE17E7C`
- Governor accepted manifest SHA-256 `A9BE4C193F615B4745ADF37BDF9F815CEE24FC986C5C850554D3AE07902B5F8F`

The next GUI may consume the existing governed path; it must not bypass Governor/Core or silently rewrite these production boundaries during W0/W1/W2 candidate work.

## W0 next action contract

**Objective:** prove exact authoritative Workbench source and interface authority before implementation.

**Action class:** READ / INVESTIGATE / VERIFY.

Establish exactly:

1. authoritative current Workbench source tree/project;
2. framework/runtime version;
3. exact project/solution files;
4. relationship between authoritative source, installed binary, and launcher;
5. current Workbench registered-client / named-pipe contract;
6. exact Governor request/response integration seam including current model-text behavior;
7. exact Core enforcement boundary relevant to future Agent Runtime tickets;
8. approved brand asset source identity/location;
9. protected production baseline and rollback boundary;
10. isolated candidate source/build/output location that cannot overwrite production.

## Non-negotiable GUI direction

- desktop-first full application window;
- three-column shell: left rail / dominant center conversation / contextual right rail;
- top-level `SESSIONS` and `BOTS` modes;
- persistent bottom composer;
- right rail contextual and collapsible;
- Control/Evidence inspectable but not dumped into ordinary assistant prose;
- Signalproof black / charcoal / red identity;
- restrained application chrome rather than dashboard-card layout;
- full technical detail remains inspectable;
- front-facing name `Signalproof Workbench`.

## Protected architecture

`Human -> Signalproof Workbench UI -> Signalproof Governor -> Signalproof Core Runtime -> Signalproof Agent Runtime -> adapters/models/tools`

For the already-working plain local-model path, the current governed Governor/Core path remains protected until a later separately verified runtime evolution supersedes it.

A Bot is not authority. Hermes is an adapter, not Signalproof product-state authority.

## STOP conditions

STOP implementation if source authority remains ambiguous; the candidate path could overwrite production; current Git/evidence materially drifts; a design would bypass Governor/Core; approved branding identity cannot be verified; or production mutation would be required before an isolated candidate exists.

## Expected W0 disposition

On PASS, freeze W1 contract and begin isolated R2 shell implementation under Build Spawn Debug. No production deployment is implied.
