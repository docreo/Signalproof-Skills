# SkillSpector v2.9.5 Static-Core V9 Partial Acceptance

**Status:** PARTIAL — all required stages evaluated; only STATIC-OFFLINE firewall proof blocked by non-elevated PowerShell  
**Target:** `NVIDIA/SkillSpector` v2.9.5  
**Exact upstream commit:** `27fd9620dbfed1a2f405fd8c519661e51511f06e`  
**Authority:** bounded Static-Core acceptance only; no protected upgrade, semantic-provider use, dev-server/MCP approval, automatic activation, or full upstream-install approval.

## Executed harness

Harness SHA-256:

`3f7a947a0d3d9ceef7096618819d27a8db457b27d6c02a66e1911d89b7e045ce`

Observed run:

`F:\SP\SkillSpector-Test\run-20260816-045429`

## PASS evidence

V9 proved:

- isolation guard;
- Python 3.13.5 selection;
- existing uv 0.12.3 selection;
- disposable runtime creation;
- exact NVIDIA v2.9.5 release-wheel identity;
- Static-Core binary-only dependency lock;
- lock SHA-256 `b2b2accf11bedd2476c18c2744facfc7fd7788a03a61683f976605bc6c25750f`;
- hash-locked dependency sync;
- exact SkillSpector wheel install with dependency resolution disabled;
- exact installed SkillSpector 2.9.5;
- metadata divergence visibility showing only the intentional `langgraph-cli[inmem]>=0.4.14` omission;
- runtime inventory capture;
- absence of `langgraph-cli`, `langgraph-api`, `langgraph-runtime-inmem`, `blockbuster`, and `forbiddenfruit`;
- imports of CLI, graph, and static runner without the omitted server chain;
- benign, risky, dependency, and oversized fixture construction;
- clean fixture no-LLM proof (`llm_requested=false`, `meta_analysis_applied=false`, empty `inference_usage`);
- benign clean-fixture behavior;
- risky fixture no-LLM proof;
- risky-fixture detection and risk discrimination (3 issues, 2 high/critical, score 57 > clean score 0);
- STATIC-CONNECTED no-LLM proof;
- STATIC-CONNECTED OSV path without unreachable fallback warning;
- baseline generation;
- author-shipped baseline default execution and JSON creation;
- default baseline not applied without explicit opt-in;
- author-shipped baseline opt-in execution and JSON creation;
- suppression only after explicit `--use-shipped-baseline`;
- completeness-boundary no-LLM proof;
- inspection completeness evidence (coverage 50.0%, partial 0, uninspected 1, ledger exceptions 2, limitations 21);
- missing-target operational failure handling (exit 2, no clean report);
- junction boundary rejection before clean result;
- junction cleanup without touching target;
- acceptance-sequence completion;
- protected local SkillSpector launcher/config identity unchanged;
- disposable runtime cleanup.

## BLOCKED evidence

`STATIC-OFFLINE firewall proof` was BLOCKED because the PowerShell session was not elevated.

This is an environmental authority/precondition block, not a scanner failure and not a harness defect. The V9 harness explicitly requires an elevated PowerShell session for the temporary outbound firewall block used to prove the STATIC-OFFLINE mode.

## Correct classification

**V9 PARTIAL — STATIC-CORE ADAPTER ACCEPTANCE COMPLETE EXCEPT ELEVATED STATIC-OFFLINE FIREWALL PROOF**

No V10 correction is justified from this result. The same exact V9 harness should be rerun from PowerShell opened with **Run as Administrator**.

## Reusable lesson

**A blocked prerequisite must remain distinct from a failed capability. When a test requires elevated authority solely to establish an isolation boundary, lack of elevation should produce PARTIAL/BLOCKED evidence rather than being misclassified as product or harness failure.**

## Next authorized step

Re-run the exact V9 harness from an elevated PowerShell session. If the remaining STATIC-OFFLINE proof passes and no other required stage regresses, evaluate V9 for final Static-Core adapter disposition and Case 2 closeout.