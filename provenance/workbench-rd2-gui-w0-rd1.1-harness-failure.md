# Signalproof Workbench GUI RD2 - W0 RD1.1 Harness Failure

**Status:** FAILURE PRESERVED / HARNESS LAYER LOCALIZED / RD1.2 REQUIRED  
**Date:** 2026-08-21  
**Workstream:** Signalproof Workbench GUI RD2  
**Branch:** `candidate/workbench-rd2-gui-build`

## Failed artifact

Artifact:

`SP-WORKBENCH-W0-RD1.1.ps1`

Observed SHA-256:

`CBEF708B96A0DDE4A1CCC64460E3F83266393A89249696B2EFA666A89F85E4AA`

Runtime:

- Windows PowerShell;
- normal non-elevated owner context;
- exact-final parser preflight passed before execution.

## Persisted execution truth

RD1.1 started successfully and passed its early guards:

- normal non-elevated owner;
- fresh RD1.1 evidence-lane prerequisite;
- prior W0 RD1 evidence present;
- prior W0 disposition exact;
- accepted RD3 evidence directory present;
- accepted RD3 source evidence present;
- accepted RD3 source SHA-256 exact;
- production launcher present;
- installed Workbench present;
- installed Workbench SHA-256 exact.

The runner then failed at the beginning of accepted RD3 evidence-directory inventory before source-authority classification completed.

Observed failure:

```text
Argument types do not match
line 150: return @($Hits)
System.ArgumentException
```

## Failure classification

```text
Layer: HARNESS / POWERSHELL COLLECTION SHAPE
Failure fingerprint: Windows PowerShell collection materialization at return @($Hits)
Attempt count for this fingerprint: 1
Product failure: NOT ESTABLISHED
W0 source disposition: NOT REACHED
```

The failure must not be reported as a Workbench, Governor, Core, or source-provenance product failure.

## Known-failure reconciliation

Applicable current PowerShell prevention data includes collection-shape/cardinality protections and the rule that harness/parser failures do not establish product failure.

The exact failed RD1.1 artifact must not be rerun unchanged.

A new filename alone is not a material changed condition. The next runner must alter the failing collection materialization semantics and use a distinct revision/evidence lane.

## Debug Next Action Contract

```text
Symptom: RD1.1 throws System.ArgumentException at return @($Hits)
Supported layer/cause: harness collection materialization in Windows PowerShell
Persisted state: W0 prerequisite verification passed; source-authority inventory/classification did not complete
Prior failed attempts: 1, RD1.1 SHA256 CBEF708B96A0DDE4A1CCC64460E3F83266393A89249696B2EFA666A89F85E4AA
Material changed condition: replace the failing direct array-subexpression materialization with pipeline-normalized output in a new RD1.2 artifact and distinct evidence lane
Protected state: production Workbench/Governor/Core and accepted prior USER UI PASS remain unchanged
Allowed correction surface: W0 harness only
Known-failure constraints: preserve RD1.1; no unchanged retry; parse exact final RD1.2; bind hash after final serialization; execute once
Final-artifact validation: expected-source-hash guard, exact replacement-count guard, revision/evidence-lane separation, parser PASS, final SHA256
Original reproduction: execute exact validated RD1.2 through the same W0 provenance inventory stage
Regression proof: all early RD1.1 prerequisites still pass and production is untouched
Authority dependencies: covered by current bounded build-spawn-debug authorization
STOP: replacement assumption not found exactly, parser fails, revision/evidence lane is not distinct, or RD1.2 hits the same fingerprint after material correction
```

## Spawn challenge

**Builder logical lane:** smallest supported correction is collection normalization in a new RD1.2 artifact, with no Workbench product change.

**Design logical lane:** no GUI/product redesign is implicated by this harness failure.

**Governor logical lane:** PASS for a single materially changed RD1.2 retest if RD1.1 is preserved, the final artifact is parser-validated/hash-bound, and production remains untouched.

No independent agents are claimed.

## Next state

`LOGGED -> DEBUG CONTRACT READY`

Next allowed action: generate/validate `SP-WORKBENCH-W0-RD1.2.ps1` from the exact failed RD1.1 bytes using guarded deterministic replacement, then execute RD1.2 once.
