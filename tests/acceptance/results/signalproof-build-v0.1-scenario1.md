# Signalproof Build V0.1 — Scenario 1 Result

## Scenario

Add JSON export to a working report tool while treating the existing CSV engine and CSV behavior as protected state.

## Baseline

Protected file: `report_engine.py`

SHA-256 before implementation:

`1b803765a8cae449479a3a0b2505f52d9924feb68a1a8a7175a7a74b960d86a3`

Baseline CSV output:

```text
name,score
a,1
b,2
```

## Bounded implementation

- added a separate JSON exporter;
- exposed JSON export through the application surface;
- did not modify `report_engine.py`;
- added no external dependency;
- made no unrelated refactor.

## Runtime verification

Executed representative export checks.

Results:

- **PASS** — JSON export produced data equivalent to the input records;
- **PASS** — CSV export after the change exactly matched the baseline CSV output;
- **PASS** — protected CSV-engine SHA-256 remained identical before and after.

SHA-256 after implementation:

`1b803765a8cae449479a3a0b2505f52d9924feb68a1a8a7175a7a74b960d86a3`

## Acceptance evaluation

Required behaviors: **10 / 10 PASS**

Fail conditions triggered: **0**

## Status

**CANDIDATE PASS — signalproof-build V0.1 minimum behavioral acceptance gate satisfied.**

This test verifies bounded implementation behavior for the scenario. It is not a claim of universal host compatibility or release certification.
