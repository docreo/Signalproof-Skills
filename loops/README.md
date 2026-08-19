# Signalproof Loop Library

**Status:** RD1 / architecture candidate

## Purpose

The Loop Library defines reusable bounded iteration protocols. A Loop is not a general-purpose Skill and never grants authority by itself.

Core rule:

> **Every loop must know why it exists, how progress is measured, what may change, when to stop, and how to recover.**

## Required Loop fields

Every promoted loop should define:

- loop ID and name;
- purpose;
- inputs/prerequisites;
- protected state;
- permitted action surface;
- measure step;
- act/change step;
- verification step;
- success condition;
- failure condition;
- maximum iterations where appropriate;
- time/cost/resource limit where appropriate;
- permissions and human approval points;
- evidence required per cycle;
- rollback/recovery behavior;
- STOP conditions;
- next route on success/failure/block;
- applicability and explicit non-scope.

## Initial registry

| Loop ID | Working name | Primary consumers | State |
|---|---|---|---|
| SP-LOOP-DEBUG | Debug Correction Loop | Debug, Investigate | DISCOVERED |
| SP-LOOP-BUILD-VERIFY | Build / Test / Verify Loop | Build, Verify | DISCOVERED |
| SP-LOOP-RESEARCH | Research Evidence Loop | Research, Evaluate | DISCOVERED |
| SP-LOOP-INGEST | Governed Ingestion Loop | Research, Knowledge, Radar/Detector | DISCOVERED |
| SP-LOOP-OPTIMIZE | Measure / Change / Re-measure | Build, Design, performance work | DISCOVERED |
| SP-LOOP-RECOVERY | Detect / Contain / Restore / Verify | Recovery | DISCOVERED |
| SP-LOOP-AGENT-ACTION | Request / Govern / Execute / Verify | Governor-controlled agents | DISCOVERED |
| SP-LOOP-LEARN | Observe / Extract / Test / Govern | Learn, Closeout | DISCOVERED |
| SP-LOOP-RETRY | Search-before-retry / revise / stop | Debug, Failure Intelligence | DISCOVERED |

These are registry discoveries, not Active capabilities.

## Governor relationship

```text
ROUTER SELECTS LOOP
        ↓
GOVERNOR EVALUATES
identity / capability / permission / purpose / risk / owner authority
        ↓
AUTHORIZED?
  NO -> STOP / HUMAN
  YES
        ↓
BOUNDED LOOP EXECUTION
        ↓
VERIFY EACH CYCLE
        ↓
SUCCESS / STOP / ESCALATE
        ↓
EVIDENCE + BUILD LEDGER
        ↓
LEARN
```

The Loop Library must never be used to justify unbounded autonomous retries.
