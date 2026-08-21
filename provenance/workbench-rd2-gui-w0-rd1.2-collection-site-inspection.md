# Signalproof Workbench GUI RD2 - W0 RD1.2 Collection-Site Inspection

**Status:** INSPECTION COMPLETE / RD1.3 BOUNDED CORRECTION READY  
**Date:** 2026-08-21  
**Workstream:** Signalproof Workbench GUI RD2  
**Branch:** `candidate/workbench-rd2-gui-build`

## Exact inspected artifact

`SP-WORKBENCH-W0-RD1.2.ps1`

SHA-256:

`6A952BA1E7152BC2225608BBFD54421AB12DEF6A7A0DC2D159D161C82D9ECC1D`

Inspection was read-only and reported no file modifications.

## Generic collection definitions

Observed generic-list definitions:

```text
117: $Hits = New-Object System.Collections.Generic.List[object]
131: $Context = New-Object System.Collections.Generic.List[string]
287: $ProjectCandidates = New-Object System.Collections.Generic.List[object]
425: $Report = New-Object System.Collections.Generic.List[string]
```

## Relevant generic-list materialization sites

Observed sites that directly array-materialize those generic lists:

```text
141: context = @($Context)
263: hit_count = @($Hits).Count
264: hits = @($Hits)
327: $Projects = @($ProjectCandidates)
461: @($Report),
```

The RD1.2 failure occurred at line 327:

```text
$Projects = @($ProjectCandidates)
```

with `System.ArgumentException: Argument types do not match`.

## Supported failure pattern

The complete inspection supports one bounded pattern:

> Windows PowerShell in this harness is not reliably materializing these `System.Collections.Generic.List[T]` objects through array-subexpression syntax at collection boundaries.

The correction should not rewrite unrelated `@(...)` expressions whose inputs are ordinary pipeline/PowerShell arrays or XML node sets.

## RD1.3 bounded correction

Only the five generic-list boundary sites above should change:

```text
context = @($Context)
-> context = $Context.ToArray()

hit_count = @($Hits).Count
-> hit_count = $Hits.Count

hits = @($Hits)
-> hits = $Hits.ToArray()

$Projects = @($ProjectCandidates)
-> $Projects = $ProjectCandidates.ToArray()

@($Report),
-> $Report.ToArray(),
```

All other array-subexpression sites remain unchanged unless later evidence independently localizes another defect.

## Attempt discipline

This is same unresolved harness class attempt count 2 before correction.

RD1.3 is the third ordinary correction attempt for this fingerprint. It is permitted because the preceding read-only inspection materially changed the evidence and supports a comprehensive narrow correction rather than another single-line patch.

If RD1.3 fails with the same generic-list array-materialization fingerprint, ordinary correction stops and deeper Investigation is required. A fourth cosmetic or adjacent-site patch is prohibited.

## Logical spawn challenge

**Builder lane:** apply exactly five deterministic replacements, preserve RD1.1/RD1.2, use a distinct RD1.3 evidence lane, parser-validate/hash exact final bytes, execute once.

**Design lane:** no application or GUI design changes are implicated.

**Governor lane:** PASS for RD1.3 if source hash, replacement counts, parser/static checks, distinct evidence lane, and production non-mutation gates pass.

No independent agents are claimed.
