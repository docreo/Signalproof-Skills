# Signalproof Workbench RD2 R6 - G0 RD3 Session Marker Harness STOP

**Date:** 2026-08-21  
**Status:** G0 RD3 HARNESS STOP / EXACT SOURCE RECOVERY PASS / PRODUCTION UNCHANGED  
**Failure fingerprint:** `R6-G0-HARNESS-GUESSED-SESSION-METHOD-001`  
**Attempt count:** 1

## Evidence-backed progress

Owner execution of R6-G0 RD3 established:

- launcher/download identity exact;
- runner SHA-256 exact `6A3292B3F15F404C8E6AA27BDFFAE9316C1C26272DB0E672EEEEA0B2BC324921`;
- non-elevated execution;
- protected production Workbench identity exact;
- exact R5.1 deterministic-scroll ZIP located;
- exact R5.1 H1 ZIP located;
- exact R5.1 builder located;
- exact H1 builder located;
- exact R5.1 GUI source recovered from embedded Base64 through multiple provenance-bound artifacts;
- recovered source SHA-256 exact `B4FF2051B3B8FDD4DEED9C7AF5271B395C38255D9578753A1CF6F18002489B12`;
- RichTextBox transcript architecture present;
- `WM_VSCROLL` present;
- `SB_BOTTOM` present;
- `transcript_native_bottom_scroll` present;
- `composer_overlap_prevented` present;
- Governor request pipe contract present;
- direct Ollama endpoint absent;
- direct `Process.Start` absent.

The runner then stopped at:

```text
STOP: Session surface markers present
```

## Classification

`HARNESS / GUESSED IMPLEMENTATION IDENTIFIER`

RD3 used the following synthetic marker assumption as an acceptance condition:

```text
CreateSession OR DeleteSession
```

Those names were not evidence-backed identifiers from the recovered source. Their absence therefore does not establish absence or regression of the Session product surface.

The running owner UI evidence already shows the `SESSIONS` mode, and prior owner evidence established working Session/Bot product behavior. Exact source recovery also succeeded before this stop.

## Materially changed next condition

Do not rerun RD3 unchanged.

R6-G0 RD4 must:

1. consume the exact recovered source already written by RD3 rather than repeat package discovery;
2. verify the exact source SHA and protected production identity;
3. remove guessed method-name PASS requirements;
4. enumerate actual C# method names and control fields from source syntax patterns;
5. report actual lines/context for visible Session/Bot labels and relevant controls;
6. localize transcript append, send/composer, scroll/layout, Governor transport, persistence, version/build identity, and candidate code-artifact insertion surfaces;
7. remain read-only against product/production state;
8. write and print a bounded localization report sufficient to construct R6-G1 without another speculative method-name gate.

## Failure-memory rule

This failure fingerprint remains attempt 1. A filename change does not reset it. The materially changed RD4 approach is source introspection rather than guessed identifier verification.

## Complete envelope

The owner's active `/dsp complete` authorization remains valid for the bounded Signalproof Workbench R6 workstream. No new routine authorization is required.
