# SkillSpector v2.9.5 Static-Core V8 Correction

**Status:** V7 INSTALL / IMPORT BOUNDARY PROVEN — V8 RUNTIME ACCEPTANCE AUTHORIZED  
**Target:** `NVIDIA/SkillSpector` v2.9.5  
**Exact upstream commit:** `27fd9620dbfed1a2f405fd8c519661e51511f06e`  
**Authority:** bounded Static-Core acceptance only; no protected upgrade, semantic-provider use, dev-server/MCP approval, automatic activation, or full upstream-install approval.

## V7 runtime evidence

V7 harness SHA-256:

`5c595faf136b818973f5b8a0c27e2628f7f11570a50b332a533702e15c35bde6`

Observed run:

`F:\SP\SkillSpector-Test\run-20260816-042830`

V7 proved:

- isolation guard PASS;
- Python 3.13.5 PASS;
- uv 0.12.3 PASS;
- disposable runtime PASS;
- exact NVIDIA v2.9.5 release-wheel identity PASS;
- Static-Core binary-only dependency lock PASS;
- lock SHA-256 `c81d079bd791c88b4d9dd586de3c191c2458eac48a98b4e149642bf7bbab9b7e`;
- hash-locked dependency sync reached and succeeded;
- exact SkillSpector wheel install with dependency resolution disabled succeeded;
- exact installed SkillSpector version 2.9.5 PASS;
- runtime inventory PASS;
- server-chain isolation PASS;
- imports of `skillspector.cli`, `skillspector.graph`, and `skillspector.nodes.analyzers.static_runner` PASS;
- protected local SkillSpector state unchanged PASS;
- disposable runtime cleanup PASS.

## Exact metadata divergence evidence

`uv pip check` returned non-zero with exactly one actual incompatibility:

`The package `skillspector` requires `langgraph-cli[inmem]>=0.4.14`, but it's not installed`

uv also emitted normal informational lines:

- `Using Python 3.13.5 environment at: ...`
- `Checked 67 packages in 104ms`
- `Found 1 incompatibility`

V7's parser treated those informational lines as additional dependency findings and therefore failed the metadata-divergence gate.

## Correct classification

**STATIC-CORE INSTALL / VERSION / SERVER-CHAIN-ABSENCE / IMPORT BOUNDARY PROVEN — V7 METADATA-PARSER FALSE POSITIVE**

This is not a dependency, installation, version, import, or server-chain failure.

## V8 correction

V8 changes only the metadata-divergence parser.

The parser now requires:

1. `uv pip check` remains non-zero, preserving visibility of the intentional upstream-metadata divergence;
2. exactly one actual dependency finding line beginning with `The package`;
3. that line must exactly identify the SkillSpector requirement `langgraph-cli[inmem]>=0.4.14` as not installed;
4. uv must report exactly `Found 1 incompatibility`.

Any additional actual dependency finding still fails closed.

All other controls remain unchanged:

- exact NVIDIA wheel identity;
- omission of only `langgraph-cli[inmem]>=0.4.14`;
- all other direct upstream dependencies retained;
- binary-only policy;
- hash-lock / required-hash sync;
- no-cache;
- no Python downloads;
- no-LLM boundary;
- server-chain absence proof;
- import probes;
- fixture tests;
- connected/offline distinction;
- baseline, completeness, failure-handling, and junction tests;
- protected-state verification and cleanup.

V8 harness SHA-256:

`286d180714a0780afb9bec1ae141e495876478bc37f7413ca9dcc08c2bc92325`

V8 bundle SHA-256:

`70942c7526b4c87785903914e74ad6f6551a8005102ae06e1675b9039711681b`

## Success meaning

A complete V8 PASS may support only:

**ADAPT CANDIDATE — STATIC-CORE SIGNALPROOF ADAPTER**

It does not establish full upstream-install acceptance, NVIDIA-supported reduced packaging, semantic mode, dev-server/Studio, MCP, protected upgrade, or automatic activation.

## Reusable lesson

**A dependency-check parser must distinguish tool context/progress lines from actual incompatibility findings. When a controlled divergence is expected, acceptance should verify the exact adverse finding rather than merely searching every emitted line for a keyword.**

## Next authorized step

Execute the exact V8 harness and review the full scanner-fixture evidence before any operational disposition.