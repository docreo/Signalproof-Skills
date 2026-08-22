# Signalproof Workbench RD2 R6 - G0 RD4 Evidence Lane STOP / RD4.1 Ready

**Date:** 2026-08-21  
**Status:** HARNESS STOP CLASSIFIED / RD4.1 READY  
**Workstream:** Signalproof Workbench GUI RD2 R6  
**Complete envelope:** remains active

## Owner execution evidence

RD4 launcher verified exact runner SHA-256:

`9B9B2ACFCF67097A733BA0A6EEE15C1EDA387A6BE0EB9E9C3B5AF605C7E693C0`

The staged runner parser state passed and RD4 executed once.

RD4 then passed:

- normal non-elevated owner;

and stopped at:

`STOP: fresh RD4 evidence lane absent`

before recovered-source introspection.

## Classification

`HARNESS / PRE-EXISTING EVIDENCE LANE`

This is not product-failure evidence and does not invalidate the exact R5.1 source recovery already proven by RD3.

The unchanged RD4 path must not be retried because its hard requirement that `SP-WORKBENCH-R6-G0-EV-RD4` be absent is already contradicted by local state.

## Materially changed correction

RD4.1 replaces the brittle fresh-directory assertion with evidence-preserving logic:

1. if the existing RD4 report + JSON are complete, source/production identity-bound, and disposition is `PASS_EXACT_SOURCE_LOCALIZED_FOR_G1`, reuse them and stop successfully;
2. otherwise preserve the pre-existing RD4 directory under a unique timestamped `SP-WORKBENCH-R6-G0-EV-RD4-PRESERVED-*` name;
3. create a fresh canonical RD4 evidence lane;
4. execute the same source introspection and identity checks;
5. verify the newly written JSON is structurally reusable.

No prior evidence is deleted or overwritten.

## RD4.1 runner

`tools/workbench/SP-WORKBENCH-R6-G0-RD4.1.ps1`

Expected SHA-256:

`4860507185662BFC09BE491A299AB9992208412F62DD17A3B77B4A96D38775AE`

Runner commit:

`79114a3d9ff516b61ba4009c1c1cbf5f549cb944`

Launcher:

`tools/workbench/SP-WORKBENCH-R6-G0-RD4.1-LAUNCH.ps1`

Launcher commit:

`61c978f9ab4a5a356ee4c85673486341eab06b2c`

## Next gate

Execute RD4.1 once through the exact download/hash/parser launcher.

On PASS, continue under the existing Complete envelope to R6-G1 without a new owner authorization cycle.
