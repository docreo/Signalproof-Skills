# Signalproof SkillSpector v2.9.5 Runtime Acceptance Plan

**Status:** V3 TEST INSTRUMENT PREPARED — VALID RUNTIME EVIDENCE PENDING  
**Target:** `NVIDIA/SkillSpector` v2.9.5  
**Exact upstream commit:** `27fd9620dbfed1a2f405fd8c519661e51511f06e`  
**Expected release wheel SHA-256:** `e8a514d620107ae9aaf4d9600aedf474c69e9bdfd40032ca51a478480484db9f`  
**Authority:** bounded acceptance testing only; no upgrade, activation, semantic-provider use, automatic install authority, or public MCP exposure.

## Instrument lineage

### V1

`SkillSpector-V295-Acceptance.ps1`

SHA-256:

`b2c0d640a65ee0ded3b2b8580b74c99404f36746edb2be31c51ce28af6a261f9`

### V2

`SkillSpector-V295-Acceptance-V2.ps1`

SHA-256:

`e58b7f8e109b125414075800d7a440e56b3d9f6d52c3d6929d92da2443032b9a`

### V3

`SkillSpector-V295-Acceptance-V3.ps1`

SHA-256:

`f90b4eb1b48c08b284ba8f6b1621de0612c77cedd1583835ed0756b0e0641cf2`

Runtime results, not the existence of an instrument, determine acceptance disposition.

## Protected state

Default protected local root:

`F:\SP\SkillSpector`

Default disposable acceptance root:

`F:\SP\SkillSpector-Test`

The harness rejects a work root inside the protected root and records protected launcher/config identity before and after the run. It does not upgrade, invoke, uninstall, or overwrite the known protected SkillSpector installation.

## V1 execution evidence — preserved failure

First Windows runtime attempt:

`F:\SP\SkillSpector-Test\run-20260815-223924`

Observed sequence:

- isolation guard: PASS;
- Python 3.13.5 selected: PASS;
- disposable venv creation: PASS;
- exact NVIDIA v2.9.5 wheel SHA-256: PASS;
- dependency resolution: FAIL;
- protected local state unchanged: PASS;
- disposable runtime cleanup: PASS;
- temporary wheelhouse cleanup: PASS.

Decisive resolver log:

`error: resolution-too-deep`

Classification:

**DEPENDENCY RESOLUTION FAILURE / NO SKILLSPECTOR INSTALLATION PERFORMED**

This is not evidence that a binary wheel was unavailable. The V1 failure remains material acceptance evidence.

## V2 resolver correction

The owner verified an existing resolver:

`uv 0.12.3 (507230998 2026-08-07 x86_64-pc-windows-msvc)`

V2 changed only the resolver/install gate: exact NVIDIA wheel, binary-only, no-build, no-cache, generated hashes, exact wheel digest required in the lock, and hash-required uv sync into the disposable environment.

## V2 execution evidence — invalid overall PASS

Second Windows runtime attempt:

`F:\SP\SkillSpector-Test\run-20260816-023054`

The executed script hash matched the governed V2 artifact:

`e58b7f8e109b125414075800d7a440e56b3d9f6d52c3d6929d92da2443032b9a`

Observed output contained only:

- isolation guard: PASS;
- Python 3.13.5 selected: PASS;
- existing uv 0.12.3 selected: PASS;
- disposable venv creation: PASS;
- protected local state unchanged: PASS;
- disposable runtime cleanup: PASS.

It did **not** show completion of the required:

- exact release artifact verification;
- dependency hash lock;
- hash-required install;
- dependency consistency/inventory;
- fixture construction;
- benign/risky scans;
- connected/offline network tests;
- baseline opt-in tests;
- inspection-completeness test;
- operational-failure test;
- junction-boundary test.

Despite that missing coverage, V2 emitted:

`SIGNALPROOF SKILLSPECTOR v2.9.5 ACCEPTANCE: PASS`

Classification:

**INVALID PASS / HARNESS RESULT-MODEL DEFECT**

The exact reason the main sequence ended early is not yet established from the console output alone. The stronger verified finding is that the V2 result model allowed an incomplete run to be represented as PASS.

Therefore the V2 PASS is explicitly rejected as acceptance evidence. It does not authorize SkillSpector integration or upgrade.

## V3 fail-closed correction

V3 preserves the V2 resolver and security boundaries but adds mandatory acceptance-stage accounting.

Required stages are explicitly tracked:

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

If execution reaches cleanup before any required stage completes, V3 records that stage as:

`NOT_RUN`

Any `NOT_RUN` forces overall **FAIL**.

V3 also requires the main sequence to emit an explicit acceptance-sequence completion check before PASS is possible.

This makes early interruption, premature control-flow exit, or partial execution fail closed rather than silently becoming PASS.

## Resolver/install boundary retained in V3

V3 still requires:

- exact NVIDIA v2.9.5 wheel download;
- NVIDIA-published wheel SHA-256 before install;
- existing uv resolver only;
- public PyPI as the package index;
- source builds prohibited;
- binary distributions only;
- cache reuse disabled;
- automatic Python downloads disabled;
- generated dependency hashes;
- exact SkillSpector wheel digest present in the generated lock;
- `uv pip sync --require-hashes` into the disposable environment;
- `uv pip check` and `uv pip freeze` evidence.

## No-LLM boundary

Every acceptance scan uses `--no-llm`.

Provider credentials and common tracing/secret environment variables are removed from the scan child-process environment. The provider path is forced away from local authenticated agent CLI providers.

Acceptance JSON must show:

- `metadata.llm_requested == false`;
- `metadata.meta_analysis_applied == false`;
- empty `metadata.inference_usage`.

## Result model

- **PASS** — all required stages reached an evaluated state, no required check failed, and no required proof is blocked.
- **PARTIAL** — every required stage reached an evaluated state, no check failed, but at least one required proof is BLOCKED.
- **FAIL** — any check failed, any required stage is NOT_RUN, or the main sequence did not reach explicit completion.

Exit codes:

- `0` = PASS
- `3` = PARTIAL
- `2` = FAIL

## Recovery

Temporary Windows Firewall rules are removed in `finally` even after an earlier failure or incomplete run.

The disposable runtime is removed by default. Protected-state preservation is checked independently from the acceptance result.

## Gate after execution

A valid runtime PASS still does **not** make the scanner an authority source.

`SCANNER RESULT → EVIDENCE → SIGNALPROOF EVALUATION → HUMAN AUTHORITY`

## Current milestone state

**V1 FAIL PRESERVED / V2 INVALID PASS PRESERVED / V3 BUILT / V3 EXECUTION PENDING**

Do not close the full SkillSpector Case 2 milestone until a valid V3 evidence package has been reviewed and recorded.