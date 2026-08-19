# Signalproof Loop Library

**Status:** RD1 Candidate

## Purpose

The Loop Library defines reusable bounded iteration protocols. A Loop is not a general-purpose Skill and never grants authority by itself.

> **Every loop must know why it exists, how progress is measured, what may change, when to stop, and how to recover.**

Machine-readable index: [`LOOP-REGISTRY.yaml`](LOOP-REGISTRY.yaml).

## Required Loop contract

Every promoted loop defines purpose, prerequisites, protected state, permitted action surface, measure/act/verify cycle, success/failure conditions, iteration/time/cost limits where appropriate, permissions/approval, evidence per cycle, rollback/recovery, STOP conditions, next route, applicability, and explicit non-scope.

## RD1 Loop Candidates

| Loop | Purpose | Principal |
|---|---|---|
| [`SP-LOOP-DEBUG`](SP-LOOP-DEBUG.md) | Evidence-producing defect correction | Debug |
| [`SP-LOOP-BUILD-VERIFY`](SP-LOOP-BUILD-VERIFY.md) | Incremental implementation and proof | Build |
| [`SP-LOOP-RESEARCH`](SP-LOOP-RESEARCH.md) | Evidence-gap-driven research | Research |
| [`SP-LOOP-INGEST`](SP-LOOP-INGEST.md) | Governed source acquisition/normalization | Knowledge Ingest / Research |
| [`SP-LOOP-RECOVERY`](SP-LOOP-RECOVERY.md) | Bounded restoration | Recovery |
| [`SP-LOOP-AGENT-ACTION`](SP-LOOP-AGENT-ACTION.md) | Governor-gated side-effect action | Router + Governor |
| [`SP-LOOP-LEARN`](SP-LOOP-LEARN.md) | Evidence-to-reusable-capability governance | Learn |
| [`SP-LOOP-OPTIMIZE`](SP-LOOP-OPTIMIZE.md) | Measure/change/re-measure optimization | Evaluate + execution Skill |
| [`SP-LOOP-RETRY`](SP-LOOP-RETRY.md) | Search-before-retry and bounded recurrence | Known Errors / Failure Intelligence |

These are **Candidate loop protocols**. Adding a loop file does not make it execution authority or activate a Candidate Skill.

## Governor relationship

```text
ROUTER SELECTS CAPABILITY / LOOP
        -> GOVERNOR EVALUATES
           identity / capability / provenance / context /
           permission / purpose / risk / owner authority
        -> AUTHORIZED?
             NO -> STOP / HUMAN
             YES -> BOUNDED LOOP
        -> VERIFY EACH CYCLE
        -> SUCCESS / STOP / ESCALATE
        -> EVIDENCE
        -> BUILD LEDGER when applicable
        -> LEARN
```

For side-effecting agent activity, `SP-LOOP-AGENT-ACTION` requires the Signalproof Governor or an equivalent approved authority gate.

## Anti-loop rule

The Loop Library must never justify unbounded autonomous retry. An iteration that does not add materially new evidence, changed conditions, a tested mitigation, or measurable progress counts toward STOP rather than resetting the loop.
