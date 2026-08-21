# Signalproof Workbench GUI RD2 - R5 Scroll Failure / R5.1 Deterministic Bottom Fix

**Date:** 2026-08-21  
**Status:** USER UI FAIL CLASSIFIED / R5.1 CORRECTION PREPARED  
**Workstream:** Signalproof Workbench GUI RD2

## User evidence

R5 launched and preserved working Session/Bot controls, including delete controls. The owner confirmed the delete buttons work.

However, screenshots show the newest assistant response still beginning below the visible transcript viewport. The content exists, but the composer occupies the lower screen area while the RichTextBox transcript was still laid out with `Dock = Fill` in the same parent as a `Dock = Bottom` composer panel.

## Root cause

The remaining defect is not primarily a scroll algorithm problem.

It is a layout-boundary problem:

- transcript: `DockStyle.Fill`;
- composer: `DockStyle.Bottom`;
- same parent panel;
- composer brought to front.

That permits the RichTextBox client rectangle to extend behind the composer. `ScrollToCaret()` can therefore reach the bottom of the RichTextBox while the last visible lines remain physically covered by the composer.

This matches the screenshots: the scrollbar is near the bottom and the newest response is present, but its lower portion is hidden by the composer region.

## R5.1 correction

R5.1 removes the overlap condition structurally.

The conversation surface now uses a two-row `TableLayoutPanel`:

1. transcript row: 100 percent of remaining height;
2. composer row: fixed 102 px.

The transcript is placed only in row 0. The composer is placed only in row 1. The transcript viewport can no longer exist behind the composer.

R5.1 also adds a deterministic native RichTextBox bottom command after each append:

- move selection to `TextLength`;
- `ScrollToCaret()`;
- Win32 `WM_VSCROLL` with `SB_BOTTOM`;
- deferred second bottom pass after UI layout.

This does not restore the prior FlowLayoutPanel transcript and does not reintroduce timer-based transcript following.

## Preserved working behavior

- Workbench -> Governor -> Core -> Granite transport remains unchanged;
- Session persistence remains;
- Session create / rename / delete remain;
- Bot create / rename / edit / configure / delete remain;
- Bot persistence remains;
- provider target metadata remains;
- RRE Bot seed remains;
- Dashboard remains present with live-data work deferred;
- no direct Core/Ollama/Hermes bypass added.

## Prepared package identities

Package:

`Signalproof-Workbench-GUI-RD2-R5.1-DETERMINISTIC-SCROLL.zip`

GUI source SHA-256:

`B4FF2051B3B8FDD4DEED9C7AF5271B395C38255D9578753A1CF6F18002489B12`

Builder SHA-256:

`AA3462EA46586585E30FF06B285CEA057E4FB97237AEA63C81FBC447F7E6DCE7`

ZIP SHA-256:

`FF4FD88016DF1798FB9BD0EDA26E70EF446FD3BE60A23CC82B94BE6A498AA558`

## Static preflight completed in the build workspace

PASS:

- embedded source hash equals expected source hash;
- embedded source bytes equal staged R5.1 source;
- transcript is no longer added directly to the overlapping conversation parent;
- transcript and composer occupy separate TableLayoutPanel rows;
- composer row is fixed at 102 px;
- native `WM_VSCROLL` / `SB_BOTTOM` path present;
- deferred second bottom pass present;
- Session delete retained;
- Bot delete retained;
- Governor pipe retained;
- no direct Ollama endpoint added;
- rough source delimiter balance PASS.

Windows exact-final PowerShell parser validation, C# compile, static self-test, governed Granite round trip, protected-state postflight, and GUI launch-liveness remain gates executed by the packaged Windows builder.

## User UI acceptance

The decisive test is now simple: after the builder opens R5.1, send a prompt that produces a response longer than the visible transcript area. The final line of the newest assistant response must be visible immediately above the composer without sending another message.
