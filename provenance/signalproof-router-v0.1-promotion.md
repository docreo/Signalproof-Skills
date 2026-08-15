# Signalproof Router V0.1 Promotion Record

## Status

Promoted from `0.1.0-rc1` to `0.1.0 / Active public baseline`.

## Acceptance Basis

Scenario 1 routing matrix passed with **10/10 required behaviors and 0 fail conditions**.

Verified behaviors included:

- routing by objective and evidence state rather than keyword matching;
- active-only skill selection;
- planned `signalproof-security` not treated as active;
- diagnose-only boundaries preserved;
- capability selection kept separate from authority;
- single-skill routes used when sufficient;
- multi-stage sequences used only when state transitions required them;
- root `signalproof` used for governance/general fallback;
- explicit handoff conditions for sequences;
- STOP and authority boundaries not bypassed.

## Candidate PR

PR #11 — `Add signalproof-router V0.1 specialist skill`

## Promotion Scope

Metadata, registry status, and durable promotion evidence only. Router operating rules were not changed during promotion.
