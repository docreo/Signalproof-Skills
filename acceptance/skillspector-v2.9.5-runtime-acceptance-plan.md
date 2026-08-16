# Signalproof SkillSpector v2.9.5 Runtime Acceptance Plan

**Status:** V4 TEST INSTRUMENT PREPARED — VALID RUNTIME EVIDENCE PENDING  
**Target:** `NVIDIA/SkillSpector` v2.9.5  
**Exact upstream commit:** `27fd9620dbfed1a2f405fd8c519661e51511f06e`  
**Expected release wheel SHA-256:** `e8a514d620107ae9aaf4d9600aedf474c69e9bdfd40032ca51a478480484db9f`  
**Authority:** bounded acceptance testing only; no upgrade, activation, semantic-provider use, automatic install authority, or public MCP exposure.

## Instrument lineage

### V1
`SkillSpector-V295-Acceptance.ps1`  
SHA-256: `b2c0d640a65ee0ded3b2b8580b74c99404f36746edb2be31c51ce28af6a261f9`

### V2
`SkillSpector-V295-Acceptance-V2.ps1`  
SHA-256: `e58b7f8e109b125414075800d7a440e56b3d9f6d52c3d6929d92da2443032b9a`

### V3
`SkillSpector-V295-Acceptance-V3.ps1`  
SHA-256: `f90b4eb1b48c08b284ba8f6b1621de0612c77cedd1583835ed0756b0e0641cf2`

### V4
`SkillSpector-V295-Acceptance-V4.ps1`  
SHA-256: `2f099e62620055938539ab91c994d0aafc7fc3b4c535bcb951d450f9115b4885`

Runtime results, not the existence of an instrument, determine acceptance disposition.

## Preserved runtime evidence

### V1 — resolver depth failure
Run: `F:\SP\SkillSpector-Test\run-20260815-223924`  
Result: `error: resolution-too-deep` before installation.  
Classification: **DEPENDENCY RESOLUTION FAILURE / NO SKILLSPECTOR INSTALLATION PERFORMED**.

### V2 — invalid overall PASS
Run: `F:\SP\SkillSpector-Test\run-20260816-023054`  
The governed V2 hash matched, but only setup/cleanup checks executed and the harness still emitted PASS.  
Classification: **INVALID PASS / HARNESS RESULT-MODEL DEFECT**.

### V3 — fail-closed behavior proven; uv flag conflict exposed
Run: `F:\SP\SkillSpector-Test\run-20260816-023948`  
The governed V3 hash matched. V3 correctly marked downstream required stages `NOT_RUN` and returned FAIL. The decisive uv log was:

`error: the argument '--no-build' cannot be used with '--only-binary <ONLY_BINARY>'`

Classification: **HARNESS UV FLAG-CONFIGURATION FAILURE / NO SKILLSPECTOR INSTALLATION PERFORMED**.

This is not evidence that SkillSpector's dependency graph is unsatisfiable and is not evidence that a required binary wheel is unavailable.

## V4 correction

Astral uv documents `--no-build` as an alias for `--only-binary :all:`. V4 removes the redundant `--no-build` argument and retains `--only-binary :all:` as the single source-build prohibition.

V4 therefore keeps:

- exact NVIDIA v2.9.5 release wheel download;
- NVIDIA-published wheel SHA-256 verification before resolution or install;
- existing uv resolver only;
- public PyPI as the package index;
- `--only-binary :all:`;
- `--no-cache`;
- `--generate-hashes` during compile;
- `--require-hashes` during sync;
- `--no-python-downloads`;
- exact SkillSpector wheel digest required in the generated lock;
- disposable isolated Python runtime;
- V3 fail-closed required-stage accounting;
- no-LLM boundary;
- protected-state verification;
- firewall rollback and runtime cleanup.

Removing `--no-build` does not weaken the binary-only boundary because uv treats that option as the alias of the retained `--only-binary :all:` setting.

## Required acceptance stages

1. artifact verification;
2. dependency lock;
3. installation;
4. dependency consistency/inventory;
5. fixture construction;
6. benign fixture;
7. intentionally risky fixture;
8. connected static path;
9. offline static path;
10. baseline behavior;
11. inspection completeness;
12. operational failure handling;
13. junction boundary.

Any required stage not executed is `NOT_RUN` and forces FAIL. The main sequence must also reach explicit completion before PASS is possible.

## Result model

- **PASS** — all required stages reached an evaluated state, no required check failed, and no required proof is blocked.
- **PARTIAL** — every required stage reached an evaluated state, no check failed, but at least one required proof is BLOCKED.
- **FAIL** — any check failed, any required stage is NOT_RUN, or the main sequence did not reach explicit completion.

Exit codes: `0` PASS, `3` PARTIAL, `2` FAIL.

## Gate after execution

A valid runtime PASS still does not make the scanner an authority source.

`SCANNER RESULT → EVIDENCE → SIGNALPROOF EVALUATION → HUMAN AUTHORITY`

## Current milestone state

**V1 FAIL PRESERVED / V2 INVALID PASS PRESERVED / V3 HARNESS FLAG FAILURE PRESERVED / V4 BUILT / V4 EXECUTION PENDING**

Do not close the full SkillSpector Case 2 milestone until a valid V4 evidence package has been reviewed and recorded.