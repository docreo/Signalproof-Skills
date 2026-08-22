# Signalproof Workbench RD2 R6 G1 RD5 — Alias Suppression STOP

**Date:** 2026-08-21  
**Status:** HARNESS STOP / BUILDER NOT ACTUATED / PRODUCTION UNCHANGED  
**Failure fingerprint:** `PS-ALIAS-H-SUPPRESSION-INEFFECTIVE-002`  
**Attempt count:** 2 for the H/Get-History collision family

## Owner execution evidence

The RD5 launcher successfully:

- downloaded and parser-verified the build-only RD4 launcher;
- materialized a parser-clean RD5 launcher;
- switched the fixed candidate lane from RD4 to RD5;
- preserved RD4 evidence;
- downloaded the exact RD1 base builder SHA;
- materialized the corrected RD5 builder;
- installed the historical two-argument self-test contract;
- retained non-overlay version identity;
- retained Environment.NewLine generated-source correction.

It then found the built-in alias:

```text
H -> Get-History
```

and attempted removal, but the following guard still observed `H`, causing:

```text
STOP: conflicting H alias remains in RD5 execution scope.
```

The RD5 builder itself was not executed. No candidate source mutation, compile, self-test, GUI launch, or production mutation occurred.

## Classification

`HARNESS / POWERSHELL COMMAND-NAMESPACE COLLISION / MITIGATION FAILURE`

The previous mitigation attempted to suppress the environment by deleting the alias. That mitigation is now disproven for this nested script scope and must not be retried.

## Materially changed correction

R6-G1 RD6 must remove dependency on alias suppression entirely:

1. preserve RD1 through RD5 lanes;
2. use a fresh RD6 candidate/evidence lane;
3. materialize from the pinned build-only RD4 launcher lineage;
4. remove the alias-removal/alias-presence STOP block from the execution path;
5. before the base builder is transformed, rename its helper definition `H` to `Get-SignalproofFileSha256`;
6. rewrite all builder invocations of `H $...` to `Get-SignalproofFileSha256 $...`;
7. assert that the materialized builder contains no `function H(` definition and no `H $` command invocation;
8. keep all earned corrections: historical two-argument self-test, non-overlay title identity, Environment.NewLine source generation, no-bypass, Session/Bot, compile, self-test, protected-production postflight, and launch-liveness.

## Failure-memory rule

Do not retry alias removal. Resolve the namespace collision by changing the generated command name.

## Authority

The owner's active `/dsp complete` envelope remains valid for the bounded Workbench R6 build-only lane.
