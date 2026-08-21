# Signalproof Workbench GUI RD2 - R4.1 Scroll Failure / R4.2 Follow and Delete Correction

**Date:** 2026-08-21  
**Status:** USER UI FAIL / DEBUG RESUMED / R4.2 CANDIDATE PREPARED  
**Workstream:** Signalproof Workbench GUI RD2

## User evidence

R4.1 successfully launched, but the owner observed that after a new user message such as `hello`, Granite's response was not automatically brought into the visible transcript viewport. The reply became visible only after another user message caused the transcript to move again.

The screenshot shows the latest user message at the bottom of the visible transcript while the awaited assistant response remains below the viewport.

This preserves the distinction between:

- startup regression fixed in R4.1;
- post-response transcript follow still failing in R4.1.

## Failure localization

`UI / POST-RESPONSE TRANSCRIPT FOLLOW`

The prior fix relied primarily on `ScrollControlIntoView`. With a long child message panel, WinForms can consider that child visible without aligning the viewport to the child's bottom. A later user message adds another child below it, and scrolling to that later child exposes the previously hidden bottom portion.

R4.2 therefore uses a materially different mechanism rather than repeating the same fix.

## R4.2 transcript correction

R4.2:

1. adds a one-shot WinForms transcript-follow timer;
2. schedules the final follow after the asynchronous Governor/Granite response callback completes;
3. performs layout before the final scroll;
4. drives `AutoScrollPosition` and the vertical scrollbar to the transcript bottom rather than depending only on `ScrollControlIntoView`;
5. retains startup-safe behavior by not requiring a deferred Form invocation before the handle exists.

## Additional owner requirement

The owner also requested deletion controls for both Sessions and Bots.

R4.2 adds:

- `Delete Selected Session` in Sessions;
- `Delete Selected Bot` in Bots;
- confirmation dialogs before deletion;
- local persisted Session history removal for a deleted Session;
- local persisted Bot profile and Bot conversation removal for a deleted Bot;
- safe fallback to another Session/Bot or an empty Bot state;
- default Bots seed only when Bot state is first initialized, so a deliberately deleted default Bot is not silently recreated at the next launch.

## Protected behavior

R4.2 does not change the governed transport contract:

`Workbench -> Governor -> Core -> Granite`

It does not add direct Core, direct model, direct Ollama, or direct Hermes execution paths.

## Candidate package prepared

Package:

`Signalproof-Workbench-GUI-RD2-R4.2-RESPONSE-FOLLOW-DELETE.zip`

GUI source SHA-256:

`2629B7DCDBC105D165011AC71092F50FED48F463C5AACC79AC5781BAD6578133`

Builder SHA-256:

`BC24DC8BEA6B157C18EC916898871C7F52CE8CADAA55BDAE5B9AA9FCA675574B`

ZIP SHA-256:

`D9E05E71F2E0404D62CDFA0970F96DF90958E56B941CC9E55835917C4E4DD52E`

## Builder gate improvement

R4.2 also strengthens launch verification. After build and governed Granite round-trip checks, the builder starts the candidate with `-PassThru`, waits briefly, and fails the gate if the GUI process has already exited. This prevents a repeat of the R4 condition where compile/transport checks passed but a startup crash could still be printed as a successful launch attempt.

## Static preflight completed in the build workspace

Confirmed in the prepared source/builder:

- R4.2 isolated candidate path;
- version increment to `2.0.0.6`;
- transcript follow timer and final async scheduling present;
- bottom-targeted `AutoScrollPosition` logic present;
- Session delete method/button present;
- Bot delete method/button present;
- deleted Bot persistence behavior present;
- governed named-pipe transport retained;
- no direct Ollama endpoint added;
- builder launch-liveness check present.

Windows C# compilation, exact-final PowerShell parser validation, static self-test, governed Granite round trip, protected-production postflight, and visible UI acceptance remain machine/user gates executed by the packaged Windows builder.

## User UI gate

After the packaged builder reaches automated PASS, the owner should verify only:

1. Workbench opens and remains visible;
2. send a prompt that produces a long reply;
3. the latest Granite reply is automatically visible without another user message;
4. `Delete Selected Session` removes the selected Session after confirmation;
5. `Delete Selected Bot` removes the selected Bot after confirmation and it does not silently return after restart.

If the long-response follow still fails, preserve R4.2 and resume UI debugging with the new observation rather than repeating R4/R4.1 logic.
