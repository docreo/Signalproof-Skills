# Signalproof SkillSpector v2.9.5 Runtime Acceptance Plan

**Status:** BINARY-ONLY DEPENDENCY GATE BLOCKED — TARGET RUNTIME TESTS NOT REACHED  
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

### V4 — binary-only supply-chain gate finding
Run: `F:\SP\SkillSpector-Test\run-20260816-024701`

The governed V4 hash matched. V4 verified the exact NVIDIA release wheel and then reached real uv dependency solving under the retained binary-only/no-cache/hash-lock boundary.

Diagnostic resolution chain:

`SkillSpector 2.9.5`
→ `langgraph-cli[inmem] >=0.4.14`
→ `langgraph-runtime-inmem >=0.7`
→ `blockbuster >=1.5.24`
→ `forbiddenfruit >=0.1.4`

The uv diagnostic reported that `forbiddenfruit==0.1.4` had no usable wheels under this acceptance boundary. Because `blockbuster>=1.5.24` depends on `forbiddenfruit>=0.1.4`, uv concluded that `blockbuster` could not be used; that made `langgraph-runtime-inmem` and then `langgraph-cli[inmem]` unusable, preventing a complete SkillSpector dependency solution.

Classification:

**BINARY-ONLY SUPPLY-CHAIN GATE BLOCKED / NO SKILLSPECTOR INSTALLATION PERFORMED**

This is not a harness defect. It is a real compatibility result for the current Signalproof acceptance policy.

The result does not prove SkillSpector cannot be installed by upstream-supported methods that allow source distributions. It proves that the full v2.9.5 dependency graph cannot pass this Signalproof acceptance run while `--only-binary :all:` is an absolute requirement.

Protected local SkillSpector state remained unchanged and the disposable runtime was removed.

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

V4 completed artifact verification but did not complete the dependency lock. All downstream stages remained `NOT_RUN` and therefore no SkillSpector runtime-behavior acceptance claim is supported.

## Current decision boundary

Do not silently weaken `--only-binary :all:`.

The next Evaluate decision must choose one of the following governed paths:

1. **Keep binary-only as a hard gate** — full upstream v2.9.5 runtime remains BLOCKED and the candidate is not operationally approved.
2. **Review a narrowly scoped source-distribution exception** — inspect the exact source-only dependency, its provenance/license/build behavior/toolchain/network requirements, then decide whether a controlled build is acceptable. This requires new authority and evidence before execution.
3. **Evaluate a reduced/static-only integration path** — determine whether Signalproof can use a bounded subset or adapter that does not require the `langgraph-cli[inmem]` dependency chain. This must be proven from upstream packaging/runtime behavior and must not involve silently editing or repackaging upstream requirements.
4. **Wait for upstream packaging change** — monitor for a usable wheel or dependency change and repeat acceptance against a new exact version.

No path is automatically authorized by this finding.

## Result model

- **PASS** — all required stages reached an evaluated state, no required check failed, and no required proof is blocked.
- **PARTIAL** — every required stage reached an evaluated state, no check failed, but at least one required proof is BLOCKED.
- **FAIL** — any check failed, any required stage is NOT_RUN, or the main sequence did not reach explicit completion.

## Gate after execution

A valid runtime PASS still would not make the scanner an authority source.

`SCANNER RESULT → EVIDENCE → SIGNALPROOF EVALUATION → HUMAN AUTHORITY`

## Current milestone state

**V1 FAIL PRESERVED / V2 INVALID PASS PRESERVED / V3 HARNESS FLAG FAILURE PRESERVED / V4 BINARY-ONLY SUPPLY-CHAIN GATE BLOCKED**

Full SkillSpector Case 2 remains open for Evaluate disposition. No upgrade, activation, or operational integration is authorized.