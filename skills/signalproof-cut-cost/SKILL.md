---
name: signalproof-cut-cost
description: Audit AI and agent operating cost, context waste, tool overhead, cache inefficiency, repeated work, and avoidable compute using measured evidence only. Read-only by default. Use when the user asks to cut token cost, audit context/tool/model/cache waste, reduce AI operating expense, or find the highest-leverage efficiency change without modifying the system.
---

# Signalproof Cut Cost

## Purpose

`signalproof-cut-cost` is the Signalproof read-only AI operating-efficiency auditor.

> **Measure waste. Rank it. Cut cost without cutting proof.**

It identifies measurable token, context, tool, model, cache, agent, scheduler, and repeated-work waste. It reports the highest-leverage action but does not modify files, settings, models, hooks, schedules, routes, or infrastructure in V1.

## Core rule

Measure, do not estimate.

If a quantity or state cannot be established from available evidence, report `UNKNOWN`. Do not turn assumptions into savings claims.

## Audit surfaces

Inspect only surfaces that exist in the current environment and are accessible under current authority.

### Context / memory

Measure loaded instruction, memory, project-context, handoff, imported, or equivalent persistent-context artifacts where the platform exposes them.

Report exact bytes/tokens when measurable. Flag duplication, oversized always-loaded context, stale material loaded into active work, and multiple sources carrying the same instruction.

Do not assume Claude-specific filenames. Provider-specific files such as `CLAUDE.md` are valid probes only when actually present.

### Tools / MCP / connectors

Measure connected tool servers, connectors, MCPs, schemas, exposed tool counts, and always-loaded tool definitions when observable.

Identify unnecessary exposure, duplicate tools, broad servers used for narrow work, proxy/gateway effects, or disabled deferral/lazy-loading only when evidenced.

### Model / effort / routing

Report the active model, effort/reasoning mode, routing mode, and where they are configured when observable.

Flag automatic switching, unnecessarily expensive defaults, repeated cache-invalidating changes, or stronger models used for work that a cheaper verified route can perform only when the platform behavior and evidence support the claim.

### Hooks / output volume

Inspect output-filtering, command wrappers, hooks, log truncation, summarization, or equivalent mechanisms that materially control how much build/test/tool output enters context.

If noisy output is entering context verbatim and measurable, report it. Do not recommend hiding evidence required for verification.

### Agents / spawned lanes

Measure agent definitions, explicit/inherited models, repeated context inheritance, duplicated prompts, unnecessary parallel lanes, and agent/tool fan-out where observable.

Do not treat Builder/Design/Governor separation as waste merely because it uses multiple lanes. Evaluate whether each lane materially contributes to the current risk/acceptance need.

### Scheduled / repeated work

Inspect recurring jobs, loops, scheduled tasks, polling, background checks, or repeated workflow calls when observable.

Compare cadence with cache/session lifetime only when both are known. Flag jobs that repeatedly miss cache, duplicate another process, or re-fetch unchanged state.

### Cache / usage

Use provider/session usage logs, APIs, or telemetry when available.

Measure cache reads, cache creation/writes, fresh input, output, first/last context size, model switches, repeated tool-schema load, or equivalent metrics exposed by the platform.

Never infer cache behavior merely from elapsed time if the provider does not expose the necessary semantics.

### Signalproof-specific waste

Also check for measurable:

- duplicate Skill/context loading beyond Router's minimum justified set;
- repeated Git retrieval when exact current evidence remains valid;
- rerunning still-valid gates after irrelevant changes;
- repeating known failed approaches without a changed condition;
- oversized handoffs or durable records injected wholesale when a smaller current-state slice would suffice;
- duplicated public/private registry material loaded simultaneously when only one authority source is needed;
- unnecessary spawn lanes for trivial work;
- verbose build/test output retained beyond its evidentiary value;
- repeated normalization or transformation of unchanged artifacts.

Signalproof governance, verification, security, rollback, provenance, and protected-state evidence are not waste merely because they consume tokens or compute. A cost recommendation must preserve the proof required by the claim.

## Focused scopes

Accepted conceptual scopes include:

`all | context | memory | tools | mcp | model | cache | hooks | agents | scheduled | output | signalproof`

Unknown scopes should be clarified rather than guessed.

## Evidence standard

Every non-GREEN finding requires concrete evidence such as:

- numeric token/byte/tool/job counts;
- measured percentages or durations;
- exact file/config/log path;
- exact model/setting identity;
- exact repeated call/gate/failure fingerprint;
- provider-reported usage field;
- runtime-observed state.

`Evidence` must never be only an adjective.

Where dollar cost is not directly computable from verified pricing and measured usage, report the measurable waste quantity instead of inventing currency savings.

## Severity

- `RED` - high-confidence material avoidable cost/waste or repeated expensive work with a clear lower-cost path that preserves required proof.
- `AMBER` - measurable inefficiency with bounded impact or incomplete optimization evidence.
- `GREEN` - measured efficient/appropriate state or no actionable waste found on that surface.
- `UNKNOWN` is evidence state, not severity. When evidence is insufficient, use severity `AMBER` only if the uncertainty itself has a measured operational cost; otherwise report the finding as UNKNOWN without fabricated severity.

## Output

Default output is one table sorted by measured cost/waste impact, highest first:

```text
FINDING | SEVERITY | EVIDENCE | COST / WASTE | ACTION
```

Then one final line:

`Highest-leverage action: <one measured, evidence-supported change>`

If no change is justified:

`Highest-leverage action: No change justified by current evidence.`

Keep the report compact. Detailed measurement notes may follow only when requested or necessary to explain UNKNOWN evidence.

## Read-only boundary

V1 audits and reports only.

Do not:

- edit or delete files;
- change model/effort settings;
- disable tools, MCPs, hooks, agents, jobs, caches, logs, tests, or governance;
- modify schedules;
- change routing/proxies/gateways;
- install/uninstall dependencies;
- mutate Git or the Build Ledger;
- apply the recommended action automatically.

A later explicitly authorized fix command may consume an accepted Cut Cost report, but it is a separate authority event.

## Relationship to other Skills

- `signalproof-investigate` helps establish unknown runtime/configuration state.
- `signalproof-verify` proves material measurements and savings claims.
- `signalproof-research` may establish current provider pricing or documented cache/tool semantics when external evidence is required.
- `signalproof-known-errors` prevents recurring failed optimization attempts.
- `signalproof-cut-chase` compresses information for human decisions; Cut Cost measures machine/resource waste.
- `signalproof-learn` may capture a verified reusable efficiency lesson after a change is later implemented and accepted.

Cut Cost does not replace those capabilities and should compose only the minimum applicable set.

## STOP conditions

STOP or mark UNKNOWN when measurement would require unauthorized access; the platform does not expose the metric; a cost claim would depend on guessed provider pricing or cache behavior; secrets would have to be exposed; an optimization would weaken required evidence/security/recovery; current state cannot be distinguished from stale logs; or the user asks V1 to make changes rather than audit.

## Identity

- **Suite:** Signalproof Skills
- **Skill:** `signalproof-cut-cost`
- **Version:** `0.1.0`
- **Maturity:** Active public baseline after governed promotion
- **Parent:** `signalproof` 0.1.1+
- **Domain:** AI operating-cost audit, token/context efficiency, tool/cache/agent waste measurement
- **Created by:** Doc Reo / Signalproof
