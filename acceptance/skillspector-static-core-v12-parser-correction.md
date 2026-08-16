# SkillSpector v2.9.5 Static-Core V12 Parser Correction

**Status:** V12 AUTHORIZED — FIELD-SAFE OFFLINE FALLBACK PARSER  
**Target:** `NVIDIA/SkillSpector` v2.9.5  
**Prior proven state:** V11 firewall isolation and OSV fallback evidence preserved

## Exact V11 report evidence

The preserved `deps-offline.json` from run `F:\SP\SkillSpector-Test\run-20260816-100328` contains exactly one issue entry.

That issue exposes:

- `id = SC4`
- `pattern = SC4: OSV.dev unreachable, using static fallback (15 packages). Results may be incomplete...`
- `finding = SC4 fallback active`

It does not expose a `message` property.

V11 failed only because `Test-ContainsMessage` dereferenced `issues[*].message` under strict PowerShell semantics.

## V12 bounded correction

V12 changes only `Test-ContainsMessage`:

- iterates issue entries safely;
- checks field existence before dereference;
- inspects `message`, `pattern`, and `finding` in that order;
- preserves the exact regex requested by the caller;
- returns false when no supported textual field matches.

No firewall logic, isolation standard, package graph, no-LLM boundary, baseline logic, completeness logic, failure-handling logic, junction logic, protected-state logic, or cleanup logic is weakened or changed.

## Artifact identity

V12 harness SHA-256:
`60c67350498f00be0f6b0c78ba3fc39d81a243f4df83d8abb3b25d3bd21039cb`

V12 bundle SHA-256:
`09ec6397646351f0a94ccba1adc4cf426aa1d53c80715508620bfdeec47cb267`

## Acceptance requirement

Run exact V12 elevated. A complete PASS must still prove all prior gates, including:

- exact release artifact identity;
- binary-only Static-Core dependency lock;
- intentional single metadata divergence;
- server-chain absence;
- static-core import boundary;
- clean/risky no-LLM fixtures;
- STATIC-CONNECTED OSV path;
- effective execution-image firewall rule identity;
- reachable-before / denied-during STATIC-OFFLINE causality;
- explicit OSV static-fallback evidence;
- baseline default/opt-in behavior;
- completeness boundary;
- operational failure handling;
- junction boundary;
- protected state unchanged;
- cleanup.

## Claim boundary

Even on complete PASS, the result applies only to the bounded experimental Signalproof Static-Core adapter. The reduced runtime deliberately omits upstream hard dependency `langgraph-cli[inmem]>=0.4.14`; it is not upstream package-conformant or an NVIDIA-supported reduced mode. Semantic-provider, dev-server/Studio, MCP, protected upgrade, and automatic activation remain outside approval.
