# `cut-cost` - Active Operator Command V0.1.0

**Status:** ACTIVE  
**Version:** 0.1.0  
**Owner:** Doc Reo

## Purpose

`cut-cost` is the canonical Dr. Signalproof command behind `/dsp cut-cost`.

It runs the Active `signalproof-cut-cost` Skill as a read-only AI operating-efficiency audit.

Canonical route:

`/dsp cut-cost -> cut-cost -> signalproof-cut-cost`

Accepted forms include:

```text
/dsp cut-cost
/dsp cut cost
dsp-cut-cost
dsp cut-cost
cut-cost
```

Focused forms include:

```text
/dsp cut-cost all
/dsp cut-cost context
/dsp cut-cost memory
/dsp cut-cost tools
/dsp cut-cost mcp
/dsp cut-cost model
/dsp cut-cost cache
/dsp cut-cost hooks
/dsp cut-cost agents
/dsp cut-cost scheduled
/dsp cut-cost output
/dsp cut-cost signalproof
```

## Required behavior

1. Refetch current public Signalproof command/Skill authority before using repository-backed doctrine.
2. Load the Active `signalproof-cut-cost` Skill and only the minimum supporting capabilities required to establish measurements.
3. Audit only. Do not change files, settings, routes, models, tools, schedules, hooks, agents, caches, Git, or Build Ledger state.
4. Measure rather than estimate.
5. Use `UNKNOWN` when the platform does not expose a required metric or current evidence is insufficient.
6. Provider-specific probes are allowed only when that provider/environment is actually present.
7. Do not assume Claude-specific concepts such as `CLAUDE.md`, slash `/context`, `/usage`, Anthropic proxy variables, or Claude session logs apply to another environment.
8. Where available, measure context/memory, tool/MCP overhead, model/effort/routing, hooks/output volume, agents, scheduled work, cache/usage, and Signalproof-specific repeated work.
9. Preserve governance, verification, security, rollback, provenance, and protected-state evidence even when they cost tokens or compute.
10. Sort findings by measured cost/waste impact, highest first.
11. End with one highest-leverage evidence-supported action.
12. Do not apply that action automatically.

## Default output

```text
FINDING | SEVERITY | EVIDENCE | COST / WASTE | ACTION
```

Then:

`Highest-leverage action: <one measured change>`

If no change is justified:

`Highest-leverage action: No change justified by current evidence.`

## Evidence rule

Evidence must be a number, exact path/config identity, measured percentage/duration, exact provider usage field, exact model/setting, or other runtime-verifiable state.

Do not use an adjective as the only evidence.

Do not convert token or compute waste into dollars unless both measured usage and applicable pricing are verified.

## Authority boundary

`cut-cost` V0.1.0 is read-only discovery and audit. It does not authorize optimization changes, deletion, disabling safeguards, tool/MCP changes, model changes, scheduling changes, proxy/gateway changes, Git mutation, deployment, or canonical Build Ledger append.

A later fix workflow requires a separate explicit authorization event.

## STOP conditions

STOP or return UNKNOWN when the requested metric is unavailable; measurement requires unauthorized access or secret exposure; evidence is stale or cannot be tied to the current environment; a savings claim would require guessing; or an optimization would weaken required proof, security, recovery, or authority boundaries.

## Signalproof principle

> **Cut cost without cutting proof.**
