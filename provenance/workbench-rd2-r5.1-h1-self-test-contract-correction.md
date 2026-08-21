# Signalproof Workbench GUI RD2 - R5.1 H1 Self-Test Contract Correction

**Date:** 2026-08-21  
**Status:** HARNESS FAILURE CLASSIFIED / H1 CORRECTION PREPARED  
**Workstream:** Signalproof Workbench GUI RD2

## User execution evidence

The R5.1 Windows builder reached:

- exact-final PowerShell parser preflight PASS;
- accepted RD3 Workbench source exact PASS;
- installed production Workbench exact PASS;
- existing .NET Framework compiler PASS;
- approved logo/icon resolution PASS;
- candidate immutable RD3 lineage copy exact PASS;
- GUI RD2 R5.1 source exact PASS;
- candidate/runtime brand hashes PASS;
- protected transport/no-bypass source contract PASS;
- C# compile exit 0;
- RD2 R5.1 executable built PASS.

It then stopped during STATIC SELF TEST with:

`STOP: transcript follow timer self-test failed.`

## Classification

`HARNESS / STALE ACCEPTANCE ASSERTION`

This is not evidence that the R5.1 GUI source failed to compile or that the deterministic scroll implementation failed at runtime.

R5.1 intentionally removed the timer-based transcript-follow mechanism. Its self-test output correctly reports:

- `transcript_follow_timer: false`;
- `transcript_native_bottom_scroll: true`;
- `composer_overlap_prevented: true`.

The PowerShell builder still contained the obsolete R4.2-era assertion:

`if (-not [bool]$Self.transcript_follow_timer) { STOP }`

Therefore the harness rejected the intended R5.1 contract.

This classification follows `PS-HARNESS-EVIDENCE-001`: a harness stop before target UI actuation must not be reported as a product failure.

## H1 correction

R5.1 H1 is a harness-only correction. The embedded GUI source identity is unchanged.

Corrected self-test assertions:

1. fail if the removed transcript-follow timer is unexpectedly present;
2. require `transcript_native_bottom_scroll = true`;
3. require `composer_overlap_prevented = true`;
4. retain Session/Bot persistence, delete, governed Granite, grounding, and bounded-context assertions.

The source-marker preflight is also strengthened to require `transcript_native_bottom_scroll` explicitly.

## Identity

Unchanged R5.1 GUI source SHA-256:

`B4FF2051B3B8FDD4DEED9C7AF5271B395C38255D9578753A1CF6F18002489B12`

R5.1 H1 builder SHA-256:

`D462707C7323E8D714109532F445734ED581115B773E6515232EE28E7A0236FA`

R5.1 H1 ZIP SHA-256:

`A89CBBC62E3C0061160D25F9A2E2322B3A8B03804210A030F10CD8EABCE3D74F`

Package:

`Signalproof-Workbench-GUI-RD2-R5.1-H1-SELF-TEST-FIX.zip`

## Static correction verification

PASS in build workspace:

- obsolete positive timer requirement absent;
- removed timer is required to remain false;
- native bottom-scroll self-test field required true;
- composer-overlap prevention self-test field required true;
- native-bottom source marker required;
- embedded GUI source SHA equals unchanged expected R5.1 GUI SHA;
- exact-final PowerShell parser preflight logic remains in the Windows builder.

## Next gate

Execute the H1 builder once on Windows.

If automated gates pass and the GUI launches, perform the previously blocked R5.1 UI acceptance test: produce a long assistant response and verify the final line is visible immediately above the composer without sending another user message.
