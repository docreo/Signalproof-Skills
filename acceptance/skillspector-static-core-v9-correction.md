# SkillSpector v2.9.5 Static-Core V9 Correction

**Status:** V8 SCANNER PATH PROVEN / BASELINE WRAPPER DEFECT IDENTIFIED — V9 RUNTIME ACCEPTANCE AUTHORIZED  
**Target:** `NVIDIA/SkillSpector` v2.9.5  
**Exact upstream commit:** `27fd9620dbfed1a2f405fd8c519661e51511f06e`  
**Authority:** bounded Static-Core acceptance only; no protected upgrade, semantic-provider use, dev-server/MCP approval, automatic activation, or full upstream-install approval.

## V8 runtime evidence

V8 harness SHA-256:

`286d180714a0780afb9bec1ae141e495876478bc37f7413ca9dcc08c2bc92325`

Observed run:

`F:\SP\SkillSpector-Test\run-20260816-044503`

V8 proved:

- exact NVIDIA v2.9.5 release-wheel identity PASS;
- Static-Core binary-only dependency lock PASS;
- hash-locked dependency sync PASS;
- exact SkillSpector wheel install PASS;
- exact installed version 2.9.5 PASS;
- exact intentional metadata divergence visibility PASS;
- runtime inventory PASS;
- server-chain isolation PASS;
- Static-Core CLI/graph/static-runner import boundary PASS;
- fixture construction PASS;
- clean fixture no-LLM proof PASS;
- benign clean fixture behavior PASS;
- risky fixture no-LLM proof PASS;
- risky fixture detection/risk discrimination PASS;
- STATIC-CONNECTED no-LLM proof PASS;
- STATIC-CONNECTED OSV path PASS;
- baseline generation PASS;
- protected local SkillSpector state unchanged PASS;
- runtime cleanup PASS.

The STATIC-OFFLINE firewall proof was BLOCKED because the PowerShell session was not elevated.

## Baseline evidence

Baseline generation created:

`F:\SP\SkillSpector-Test\run-20260816-044503\fx\risky\.skillspector-baseline.yaml`

The next default scan emitted only:

`Shipped baseline detected (not applied): ...`

and the harness then failed because `baseline-not-applied.json` was not created.

At the exact frozen NVIDIA v2.9.5 source, the CLI intentionally reports a discovered top-level baseline to stderr without applying it when `--use-shipped-baseline` is absent, then proceeds with the scan. With `--use-shipped-baseline`, the discovered baseline becomes the explicit suppression input. This establishes the intended upstream behavior for the acceptance test.

## Correct classification

**V8 ACTUAL STATIC SCANNER PATH PROVEN — BASELINE DEFAULT TEST INTERRUPTED BY LEGACY POWERSHELL STDERR WRAPPER**

SkillSpector deliberately wrote the baseline notice to stderr. V8 still invoked SkillSpector through the legacy PowerShell `2>&1` wrapper while `$ErrorActionPreference = "Stop"`, allowing informational stderr to be converted into a false harness exception before the graph completed and the JSON report was written.

This is not evidence that the shipped baseline applied silently, that baseline generation failed, or that the scanner failed.

## V9 correction

V9 changes the SkillSpector child-process boundary:

- SkillSpector commands use `Start-Process`;
- stdout and stderr are preserved separately;
- the actual native exit code is authoritative;
- combined evidence still records both streams;
- baseline default and opt-in scans validate native exit status before reading their JSON artifacts.

All substantive acceptance controls remain unchanged:

- exact upstream wheel identity;
- omission of only `langgraph-cli[inmem]>=0.4.14`;
- all other direct runtime dependencies retained;
- binary-only policy;
- hash-lock / required-hash sync;
- no-cache;
- no automatic Python downloads;
- no-LLM boundary;
- server-chain absence proof;
- clean/risky/connected/offline static fixtures;
- author-shipped baseline default-off and explicit opt-in behavior;
- completeness, failure-handling, and junction tests;
- protected-state verification and cleanup.

V9 harness SHA-256:

`3f7a947a0d3d9ceef7096618819d27a8db457b27d6c02a66e1911d89b7e045ce`

V9 bundle SHA-256:

`b0dc688fa4aeac44622fe844e1a0b200672775219933b48a5a58dc6c600c3de8`

For a complete STATIC-OFFLINE result, V9 must be run from PowerShell opened with **Run as Administrator**. A non-elevated otherwise-clean run may only reach PARTIAL because the firewall proof remains BLOCKED.

## Success meaning

A complete V9 PASS may support only:

**ADAPT CANDIDATE — STATIC-CORE SIGNALPROOF ADAPTER**

It does not establish full upstream-install acceptance, NVIDIA-supported reduced packaging, semantic mode, dev-server/Studio, MCP, protected upgrade, or automatic activation.

## Reusable lesson

**When a child process uses stderr for informational or policy-boundary notices, acceptance must bind the real native exit code and persisted outputs instead of treating stderr presence as failure. This applies to the product under test as well as package-management tooling.**

## Next authorized step

Run the exact V9 harness from an elevated PowerShell session and evaluate all remaining required stages before any operational disposition.