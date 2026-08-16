# SkillSpector v2.9.5 Static-Core V7 Correction

**Status:** V6 SYNC PROOF PRESERVED / V7 RUNTIME ACCEPTANCE AUTHORIZED  
**Target:** `NVIDIA/SkillSpector` v2.9.5  
**Exact upstream commit:** `27fd9620dbfed1a2f405fd8c519661e51511f06e`  
**Authority:** bounded Static-Core acceptance only; no protected upgrade, semantic-provider use, dev-server/MCP approval, automatic activation, or full upstream-install approval.

## V6 runtime result

V6 harness SHA-256:

`f1ced6786b41770265ec1dc0cbf136370e44ad7b7c8da204f6d2683be3b0e471`

Observed V6 run:

`F:\SP\SkillSpector-Test\run-20260816-040600`

V6 successfully completed:

- isolation guard;
- Python 3.13.5 selection;
- existing uv 0.12.3 selection;
- disposable runtime creation;
- exact NVIDIA v2.9.5 release-wheel verification;
- Static-Core binary-only dependency resolution;
- Static-Core hash-lock materialization.

V6 lock SHA-256:

`b43557b7c6ee828c884508ae23ce60351e43fa18440252b9d1ba34a3e829f20d`

V6 then reported FAIL at the hash-locked dependency sync stage through the legacy PowerShell `Invoke-Native` wrapper. No SkillSpector wheel installation occurred, all downstream required stages remained `NOT_RUN`, protected local state remained unchanged, and the disposable runtime was removed.

## Independent sync diagnostic

A fresh disposable Python 3.13.5 environment was created under the same run root and the exact V6 lock was synced through `Start-Process` with the same policy controls:

- `--only-binary :all:`
- `--require-hashes`
- `--strict`
- `--no-cache`
- `--no-python-downloads`

Observed native result:

`UV_SYNC_EXIT=0`

uv reported:

- `Resolved 65 packages`
- `Prepared 65 packages`
- `Installed 65 packages`

The installed package list did not include the intentionally excluded server chain:

- `langgraph-cli`
- `langgraph-api`
- `langgraph-runtime-inmem`
- `blockbuster`
- `forbiddenfruit`

The hardlink warning was non-fatal; uv fell back to full copy and completed successfully.

The diagnostic runtime was then removed.

## Correct classification

**HASH-LOCKED STATIC-CORE SYNC PROVEN / V6 LEGACY NATIVE-WRAPPER DEFECT**

This is not a dependency-resolution, binary-artifact, Python-version, or package-installability failure for the retained Static-Core dependency set.

Two independent uv stages have now demonstrated the same PowerShell 5.1 boundary problem: the legacy `Invoke-Native` implementation captures native stderr with `2>&1` while the harness uses fail-fast PowerShell semantics. Routine uv progress on stderr can therefore be misclassified as a harness failure even when the native process succeeds.

## V7 correction

V7 fixes that recurring uv boundary once.

All remaining uv commands use a `Start-Process` based helper with separate stdout/stderr evidence:

- hash-locked dependency sync;
- exact SkillSpector wheel install with dependency resolution disabled;
- `uv pip check` metadata-divergence evidence;
- `uv pip freeze` runtime inventory.

The following are unchanged:

- exact SkillSpector v2.9.5 release-wheel identity;
- omission of only `langgraph-cli[inmem]>=0.4.14`;
- all other direct upstream runtime dependencies retained;
- binary-only policy;
- no-cache policy;
- generated hashes and required-hash sync;
- no automatic Python downloads;
- no-LLM acceptance boundary;
- server-chain absence proof;
- fail-closed required-stage accounting;
- protected-state verification;
- cleanup/recovery controls.

V7 harness SHA-256:

`5c595faf136b818973f5b8a0c27e2628f7f11570a50b332a533702e15c35bde6`

V7 bundle SHA-256:

`6dfcf52fd6ba4020a6d8f3db5ff7fa8ea27bbaf3043be594144efa5b7b09b9ea`

## Success meaning

A complete V7 PASS may support only:

**ADAPT CANDIDATE — STATIC-CORE SIGNALPROOF ADAPTER**

It does not establish:

- full upstream SkillSpector installation acceptance;
- NVIDIA-supported reduced packaging;
- semantic/LLM mode acceptance;
- LangGraph dev server/Studio acceptance;
- MCP acceptance;
- protected local upgrade approval;
- automatic activation authority.

## Reusable lesson

**When a native tool legitimately uses stderr for progress or diagnostics, PowerShell fail-fast semantics must not be allowed to convert stderr presence into a false process failure. Native acceptance must bind the actual process exit code and persisted artifacts, while preserving stdout/stderr separately as evidence.**

## Next authorized step

Execute the exact V7 harness and review all required-stage evidence before any operational disposition.