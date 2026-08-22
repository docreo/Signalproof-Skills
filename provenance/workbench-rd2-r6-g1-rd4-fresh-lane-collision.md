# Signalproof Workbench RD2 R6 G1 RD4 — Fresh Candidate Lane Collision

**Date:** 2026-08-21  
**Status:** STAGING/EVIDENCE STOP / NO SOURCE MUTATION / PRODUCTION UNCHANGED  
**Failure fingerprint:** `R6-G1-EVIDENCE-LANE-ALREADY-EXISTS-001`  
**Attempt count:** 1

## Owner execution evidence

The build-only RD4 launcher passed:

- exact RD1 base builder identity;
- exact-final RD4 parser state;
- two-argument Workbench self-test contract installation;
- floating badge removal;
- Environment.NewLine generated-source correction;
- H/Get-History alias containment.

The generated RD4 builder then entered execution and passed normal non-elevated-owner verification before stopping at:

```text
STOP: fresh G1 candidate lane
```

The stop occurred before recovered-source mutation, C# generation, compile, self-test, candidate launch, or production mutation.

## Classification

`EVIDENCE / STAGING LANE COLLISION`

The fixed RD4 candidate directory already existed. The existing fresh-lane guard correctly prevented reuse or overwrite.

## Materially changed next condition

Do not delete, overwrite, or reuse the existing RD4 lane. Preserve it as evidence.

R6-G1 RD5 must:

1. use a new fixed candidate/evidence lane `Signalproof-Workbench-GUI-RD2-R6-G1-RD5`;
2. preserve RD1 through RD4 lanes;
3. retain the historical two-argument self-test correction;
4. retain non-overlay candidate identity;
5. retain safe Environment.NewLine source generation;
6. retain no-bypass, Session/Bot, compile, self-test, production-postflight, and launch-liveness gates;
7. stop again rather than overwrite if RD5 is unexpectedly non-fresh.

## Authority

The owner's active `/dsp complete` envelope remains valid. This is a materially changed staging condition, not an unchanged retry.
