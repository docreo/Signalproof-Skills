# Signalproof Workbench GUI RD2 - W0 RD1.2 Harness Failure

**Status:** FAILURE PRESERVED / SAME HARNESS CLASS ATTEMPT 2 / INSPECTION REQUIRED BEFORE RD1.3  
**Date:** 2026-08-21  
**Workstream:** Signalproof Workbench GUI RD2  
**Branch:** `candidate/workbench-rd2-gui-build`

## Failed artifact

Artifact:

`SP-WORKBENCH-W0-RD1.2.ps1`

Observed exact-final SHA-256:

`6A952BA1E7152BC2225608BBFD54421AB12DEF6A7A0DC2D159D161C82D9ECC1D`

Parser:

`PASS`

Runtime:

- Windows PowerShell;
- normal non-elevated owner context.

## Persisted execution truth

RD1.2 materially corrected the RD1.1 failure at `return @($Hits)` and successfully progressed beyond the accepted RD3 evidence-directory inventory.

Observed successful new progress:

- evidence file count: 21;
- text-hit file count: 2;
- expected accepted RD3 source hash discovered in recovery evidence;
- expected installed Workbench hash discovered in self-test/recovery evidence;
- project/solution search began across configured roots.

The runner then failed later at:

```text
$Projects = @($ProjectCandidates)
```

Observed error:

```text
Argument types do not match
System.ArgumentException
```

## Failure classification

```text
Layer: HARNESS / POWERSHELL COLLECTION SHAPE
Failure fingerprint: Windows PowerShell generic collection array-subexpression materialization
Attempt count for this unresolved fingerprint: 2
RD1.1 manifestation: return @($Hits)
RD1.2 manifestation: $Projects = @($ProjectCandidates)
Product failure: NOT ESTABLISHED
W0 source disposition: NOT REACHED
```

This is the same unresolved failure class at a second collection materialization site, not a new product defect.

## Anti-loop decision

Do not generate a third patch by changing only the currently visible line and waiting for another identical collection-shape failure.

The next action must first inspect the exact RD1.2 source for all generic-list definitions and all array-subexpression materialization sites so RD1.3 can address the supported pattern comprehensively but narrowly.

The default same-failure limit remains binding. RD1.3 is the final ordinary correction attempt for this unresolved harness class before deeper Investigation/STOP is required if the same fingerprint persists.

## Next Action Contract

```text
Objective: inspect RD1.2 collection definitions/materialization sites without mutation
Action class: READ / INVESTIGATE
Protected state: production Workbench/Governor/Core and accepted prior USER UI PASS unchanged
Allowed surface: exact RD1.2 script text only
Known failure: Windows PowerShell generic collection array-subexpression materialization, attempt 2
Acceptance evidence: line-numbered inventory of generic List declarations plus every @($Variable) materialization and nearby assignment/return context
Next route: design one RD1.3 correction from complete site inventory
STOP: source inspection is incomplete, collection type cannot be established, or proposed RD1.3 would become a broad regex rewrite without evidence
```

## Spawn challenge

**Builder logical lane:** no third execution until complete collection-site inventory is available.

**Design logical lane:** no GUI/product redesign implicated.

**Governor logical lane:** PASS for read-only source inspection. A third same-class execution is allowed only after the correction materially addresses the supported pattern, exact-final validation passes, and RD1.1/RD1.2 remain preserved.

No independent agents are claimed.
