# Signalproof Workbench RD2 R6 G1 RD3 — Self-Test Contract Mismatch + Badge Overlap

**Date:** 2026-08-21  
**Status:** COMPILE PASS / SELF-TEST HARNESS STOP / OWNER SCREENSHOT UI FINDING / PRODUCTION UNCHANGED  
**Failure fingerprints:** `R6-G1-SELFTEST-ARG-CONTRACT-001`, `R6-G1-UI-BADGE-OVERLAP-001`  
**Attempt count:** 1 each

## Machine evidence

Owner execution of G1 RD3 established:

- exact base-builder identity;
- fresh RD3 lane;
- exact recovered R5.1 source;
- protected production identity;
- approved logo;
- Governor/no-bypass checks;
- AddMessage/transcript/scroll/send/BuildShell localization;
- generated source SHA-256 `7A8880FCFC0222AE213294521B2928E0F31E46EE0335311FAC98AA6580340013`;
- generated-source PowerShell-backtick guard PASS;
- artifact/version surfaces PASS;
- Session/Bot preservation PASS;
- R5.1 layout/scroll markers PASS;
- C# compiler exit 0;
- candidate EXE created with SHA-256 `3106BA4243165DC552D293F7076E1FBE5E7ADFD0FC3330E7BB9B9A31110A401E`.

The next harness action timed out while executing the candidate self-test.

## Exact self-test contract finding

Historical accepted Workbench builder evidence shows the executable self-test contract is two arguments:

```powershell
& $Exe "--self-test" $SelfTest
```

G1 RD1/RD3 instead invoked one combined argument:

```powershell
--self-test=<path>
```

The candidate therefore entered ordinary GUI launch rather than bounded self-test mode, remained alive, and was killed by the harness timeout. The owner simultaneously observed the GUI render, which is consistent with argument-contract mismatch rather than spontaneous product crash.

## Owner UI evidence

Owner screenshot shows the RD3 red `RD2 R6-G1 CANDIDATE` badge visibly overlaid across existing header controls. This violates the Workbench shell acceptance requirement for no obvious clipping/overlap at supported desktop sizes.

## Classification

1. `HARNESS / SELF-TEST ARGUMENT CONTRACT MISMATCH`
2. `UI / OVERLAY PLACEMENT REGRESSION`

Neither finding permits an unchanged RD3 retry.

## Materially changed next condition

G1 RD4 must:

1. use a fresh RD4 candidate/evidence lane;
2. preserve RD1/RD2/RD3 lanes;
3. retain Environment.NewLine generated-source serialization correction;
4. change bounded self-test invocation to two arguments: `--self-test`, then evidence path;
5. remove the floating candidate badge entirely;
6. preserve truthful candidate identity in the normal Workbench window title without overlaying shell controls;
7. retain code-artifact, non-yanking scroll, gutters, Sessions/Bots, Governor/no-bypass, compile, self-test, protected-production postflight, and launch-liveness gates;
8. only present USER UI TEST after automated PASS.

## Authority

The owner's active `/dsp complete` envelope remains valid for the bounded Signalproof Workbench R6 workstream.
