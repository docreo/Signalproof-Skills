# Signalproof Workbench RD2 R6 G1 RD1 — PowerShell H Alias Collision

**Date:** 2026-08-21  
**Status:** HARNESS FAILURE CLASSIFIED / PRODUCT BUILD NOT ACTUATED / COMPLETE ENVELOPE CONTINUES  
**Failure fingerprint:** `PS-ALIAS-H-GET-HISTORY-001`  
**Attempt count:** 1

## Owner execution evidence

The exact R6-G1 RD1 launcher downloaded and verified builder SHA-256:

`BF605F672910E17BC4116FE4F13A8A68E319508DFB38AFBF073EE4072CA8E30A`

The staged builder parser check passed, then execution stopped immediately at:

```text
$self=H $PSCommandPath
```

Windows PowerShell resolved `H` as its built-in alias for `Get-History`, producing:

```text
Get-History : Cannot bind parameter 'Id'. Cannot convert value
"F:\Downloads\Quarantine\Evidence\SP-WORKBENCH-R6-G1-RD1.ps1"
to type "System.Int64".
```

The failure occurred before the builder's first candidate/preflight action and before source mutation, C# compile, candidate launch, production mutation, Governor/Core mutation, or UI actuation.

## Classification

`HARNESS / POWERSHELL COMMAND-RESOLUTION ALIAS COLLISION`

The RD1 script defined a helper function named `H`, but command precedence allowed the pre-existing alias `H -> Get-History` to win at invocation time.

This is distinct from `PS-RESERVED-VARIABLE-001`: the collision is a command/alias namespace issue, not an automatic-variable assignment.

## Materially changed correction

Preserve the exact already-reviewed G1 RD1 builder bytes and exact SHA. Do not rewrite the implementation solely to address this harness issue.

R6-G1 RD1 H1 launcher must:

1. download/verify the exact RD1 builder SHA;
2. parser-check the exact builder;
3. inspect the `H` alias in the disposable `-NoProfile` build process;
4. remove only the conflicting `H` alias from that process scope;
5. verify the alias is absent;
6. execute the exact RD1 builder once;
7. leave all product/build acceptance gates unchanged.

This is a materially changed execution condition and is not an unchanged retry.

## Learning candidate

Generated PowerShell should avoid terse single-letter helper names where Windows PowerShell aliases may take command precedence. Prefer collision-resistant domain-specific function names, or explicitly preflight command-name collisions before execution.

Do not auto-promote this observation into protected-main doctrine from one workstream; route it through governed learning after resolution.

## Authority

The owner's active `/dsp complete` envelope remains valid for the bounded Workbench R6 stream. No new routine authorization is required.
