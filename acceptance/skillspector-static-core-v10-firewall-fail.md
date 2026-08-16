# SkillSpector v2.9.5 Static-Core V10 — Firewall Enforcement Failure

**Status:** VALID FAIL — STATIC-OFFLINE ENFORCEMENT NOT PROVEN  
**Target:** `NVIDIA/SkillSpector` v2.9.5  
**Harness:** Signalproof Static-Core Acceptance V10  
**Harness SHA-256:** `246a1499aff7fa6e8b0ae4424bd0a5285d38631e3f10a0b80f52a9c161962296`

## Runtime evidence

Run:

`F:\SP\SkillSpector-Test\run-20260816-070731`

Elevation was explicitly verified in the same PowerShell process before execution:

`Elevated = True`

V10 passed the exact-release, dependency, controlled-divergence, server-chain isolation, import, fixture, no-LLM, connected OSV, baseline, completeness, failure-handling, junction, protected-state, and cleanup checks.

The corrected V10 OSV preflight reached the real enforcement test. The decisive result was:

`[FAIL] STATIC-OFFLINE firewall proof - Disposable Python still reached api.osv.dev:443 after scoped outbound block.`

The harness then reported:

`[PASS] Firewall rollback - Temporary acceptance firewall rules were removed.`

Overall:

`SIGNALPROOF SKILLSPECTOR v2.9.5 STATIC-CORE ACCEPTANCE V10: FAIL`

## Classification

**V10 VALID FAIL — SCOPED WINDOWS FIREWALL ENFORCEMENT NOT PROVEN**

This is no longer a PowerShell elevation problem, transport-precondition problem, or native-process wrapper problem. The corrected preflight reached the enforcement stage and the disposable Python process remained able to connect after the harness created its scoped outbound block rule(s).

The result does not yet prove why Windows permitted the connection. Possible causes must be diagnosed rather than assumed, including rule applicability to the actual process image, firewall profile/service/policy state, application-path behavior, or other Windows filtering semantics.

## Harness implementation under test

V10 creates outbound block rules with:

`New-NetFirewallRule -Direction Outbound -Action Block -Program <program> -Profile Any -Enabled True`

for the disposable runtime Python and, when present, the SkillSpector executable.

The acceptance contract remains unchanged: STATIC-OFFLINE requires a positively established reachable-before state and a positively established denied-after state before an offline scanner result can be accepted.

## Reusable lesson

**Creating a firewall rule is not proof that the rule is enforcing the intended process boundary. Isolation acceptance must verify rule identity, rule applicability, filtering-policy state, and observed before/after behavior; a successfully created-and-removed rule that does not change connectivity is an enforcement failure until explained.**

## Next authorized step

Run bounded, read-only Windows Firewall diagnostics against the exact disposable runtime/process boundary before changing the harness or creating V11. Do not weaken the offline acceptance standard.

Case 2 remains open. Case 3 remains unauthorized.