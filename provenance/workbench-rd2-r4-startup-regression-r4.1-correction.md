# Signalproof Workbench GUI RD2 - R4 Startup Regression / R4.1 Correction

**Date:** 2026-08-21  
**Status:** USER UI FAIL / DEBUG RESUMED / R4.1 CANDIDATE BUILT  
**Workstream:** Signalproof Workbench GUI RD2

## User evidence

RD2 R4 completed its builder pipeline with:

- exact-final PowerShell parser preflight PASS;
- accepted RD3 Workbench source exact PASS;
- installed production Workbench exact PASS;
- .NET Framework compiler available PASS;
- approved logo/icon resolved PASS;
- protected transport/no-bypass source contract PASS;
- C# compile exit 0;
- static self-test PASS;
- real governed Granite round trip PASS;
- production postflight exact PASS;
- accepted RD3 source postflight exact PASS.

The exact R4 candidate reported by the machine was:

`F:\Downloads\Quarantine\Evidence\SP-WORKBENCH-GUI-RD2-R4\build\Signalproof-Workbench-GUI-RD2-R4.exe`

EXE SHA-256:

`A4268051D7561A94DF36B2530A32D42AFFA539693F3E9148C1322F0D2325DD28`

Manifest SHA-256:

`A5D6D73C0511E11A9732D29A36C38284D2E02A2E7B24196A54B383AF09A95505`

After the builder printed `Launching Signalproof Workbench GUI RD2 R4...`, no visible Workbench window appeared. The wrapper still returned success because compile/static/transport gates had already passed and launch visibility was not independently verified.

## Failure classification

`UI / STARTUP REGRESSION`

The R4 long-response fix introduced a deferred `BeginInvoke()` inside `ScrollTranscriptToBottom()`.

`AddMessage()` is also called while `WorkbenchForm` is still being constructed. Calling `BeginInvoke()` before the Form handle exists can throw an invalid-operation startup exception before the candidate window becomes visible.

This explains the evidence split:

- build PASS;
- Granite transport PASS;
- process launch attempted;
- visible UI FAIL.

The defect is not classified as Governor/Core/Granite failure.

## R4.1 correction

R4.1 is a new revision, not an overwrite of R4.

Correction:

1. preserve the immediate transcript layout/scroll attempt;
2. before deferred invocation, require `IsHandleCreated` and not disposed;
3. retain deferred bottom-scroll after the live Form handle exists;
4. add one safe `Shown` event scroll so startup/history rendering reaches the transcript bottom;
5. preserve the existing governed Governor -> Core -> Granite route and R4 long-response intent.

## R4.1 package identities

GUI source SHA-256:

`52BFBA329A9D1AF4F3792C2FCEEF60DF8CFEDA07310EA02D862F0F0FF78BF72C`

Builder SHA-256:

`AB61168437DCE723DBE3CBB7F061E5B536FCDCFBE3BA99F58523C62040B5BAEE`

Download ZIP SHA-256:

`DD7444993BF51AE8E13F556071D69B789A9DDE06D0F0DD8B7BD878CA7778FA01`

Package:

`Signalproof-Workbench-GUI-RD2-R4.1-STARTUP-SAFE-SCROLL-FIX.zip`

## Static correction checks

PASS:

- no accidental `R4.1.1` revision drift;
- protected historical B8A R4 brand lookup paths retained;
- isolated R4.1 candidate lane present;
- R4.1 EXE identity/path used;
- `IsHandleCreated` startup guard present;
- `Shown`-time transcript scroll present;
- governed registered-client transport string retained.

## Acceptance gate

R4.1 still requires the human UI launch test because this environment cannot honestly prove that the Windows desktop Form becomes visible.

Minimum test:

1. run `RUN-SIGNALPROOF-WORKBENCH-GUI-RD2-R4.1.cmd`;
2. confirm the Workbench window becomes visible;
3. send a prompt that produces a long response;
4. confirm the latest response is automatically brought fully into view without sending another message.

If launch succeeds but scrolling still fails, preserve R4.1 and resume the same UI failure class with the new observation.
