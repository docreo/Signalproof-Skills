# Signalproof Workbench GUI RD2 R2 - Granite Function Pass

**Date:** 2026-08-21  
**Status:** USER-OBSERVED GRANITE FUNCTION PASS / UI REVIEW CONTINUES  
**Workstream:** Signalproof Workbench GUI RD2

## Observed result

The owner supplied a screenshot of the running RD2 R2 candidate showing:

- `Signalproof Workbench` window running;
- `SESSIONS | BOTS | DASH` shell present;
- top-right runtime state shown as `Governed`;
- local Session history visible in the left rail;
- normal user message `yo` receiving normal assistant prose `Hello! How may I assist you today?`;
- subsequent user message `what is Signalproof` receiving a non-empty model response;
- no raw Governor decision object in the normal transcript;
- right rail showing `Workbench -> Governor -> Core -> Granite`;
- local session persistence surfaced as enabled.

## Classification

This is sufficient to establish that the new GUI shell is using the inherited registered-client path successfully enough for normal Granite conversation.

```text
GUI RD2 R2 WINDOW: PASS
REGISTERED-CLIENT TRANSPORT: FUNCTIONALLY PASS
GOVERNOR -> CORE -> GRANITE ROUND TRIP: FUNCTIONALLY PASS
NORMAL MODEL TEXT IN TRANSCRIPT: PASS
LOCAL SESSION PERSISTENCE: OBSERVED
FULL UI ACCEPTANCE: NOT YET CLAIMED
DASHBOARD: DEFERRED BY OWNER DIRECTION
```

## Remaining defect exposed by the same screenshot

The model response to `what is Signalproof` is materially under-grounded and speculates that Signalproof is primarily a privacy/cryptography application. That response proves transport but also proves the Session request currently lacks sufficient Signalproof product context.

This is not a transport regression. It is a prompt/context composition defect in the GUI candidate.

## Next build contract

RD2 R3 should preserve the now-working transport byte-for-byte where practical and improve only the application layer around it:

1. preserve registered-client challenge/response transport;
2. preserve Governor -> Core -> Granite route;
3. add canonical Signalproof grounding to Session/Bot prompts;
4. include bounded persisted conversation history for real multi-turn continuity;
5. keep Bot profiles persistent and governed through Granite;
6. add basic Bot instruction editing and truthful management controls;
7. keep Control/Evidence available on demand;
8. do not claim Hermes execution or Bot-to-Bot delegation until the Agent Runtime exists;
9. keep Dashboard live-data work deferred;
10. keep production Workbench/Governor/Core unchanged.

## Build-spawn-debug disposition

The standing owner authorization remains active for bounded owner-authorizable GUI RD2 build/debug/test work. No new authorization is required to execute the R3 candidate loop.
