# Signalproof Workbench RD2 R6 G1 RD6 — Launcher Alias-Block Localization STOP

**Date:** 2026-08-21  
**Status:** LAUNCHER-TRANSFORM STOP / BUILDER NOT ACTUATED / PRODUCTION UNCHANGED  
**Failure fingerprint:** `R6-G1-LAUNCHER-ALIAS-BLOCK-LOCALIZATION-001`

## Owner execution evidence

RD6 downloaded and parser-verified the exact build-only RD4 launcher, then stopped at:

```text
STOP: expected inherited alias-suppression block not localized for removal.
```

The failure occurred before RD6 materialized or executed a builder candidate. No candidate source mutation, compile, self-test, GUI launch, or production mutation occurred.

## Root cause

RD6 attempted exact whole-block localization of the inherited RD4 alias-suppression block. That equality was too brittle for nested launcher transformation. The launcher had already proven its exact file identity; block removal should have been anchored structurally rather than by a large exact multiline literal.

## Tested correction

The next attempt uses:

1. start anchor: `$AliasH = Get-Alias -Name H -ErrorAction SilentlyContinue`;
2. end anchor: the exact RD4 PASS line for alias absence;
3. index-based removal of the inclusive block;
4. targeted helper renames after all RD4 builder patch anchors have already been consumed:
   - `function H($p)`;
   - `$self=H $PSCommandPath`;
   - `(H $Base)`;
   - `(H $Prod)`;
   - `(H $_)`;
   - `$ss=H $Src`;
   - `$es=H $Exe`;
5. residual assertion that no `function H(` definition and no `H $...` command invocation remain.

The transformation logic was exercised locally against the exact RD4 alias-block text and the exact observed RD1 helper/invocation forms from the repository. Both tests passed before publication.

## Next condition

Use a fresh `R6-G1-RD7` lane. Preserve RD1-RD6 evidence. Do not retry RD6 unchanged.
