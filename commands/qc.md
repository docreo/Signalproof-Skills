# `qc` - Active Operator Command V0.1.0

**Status:** ACTIVE  
**Version:** 0.1.0  
**Owner:** Doc Reo

## Purpose

`qc` is the canonical Human QC command behind `/dsp qc`.

It binds a human usability/behavior check to the exact machine-verified candidate before deployment authority is requested.

Canonical route:

`/dsp qc -> qc -> signalproof-verify (Human-Observed Fact gate)`

## Preconditions

Require:

- exact candidate identity;
- required automated gates at PASS for the defined acceptance claim;
- unresolved blockers disclosed;
- minimum user-visible acceptance behavior defined.

If these are not established, return to Build/Debug/Verify rather than asking the human to test an unfinished candidate.

## Human QC handoff

Return only the minimum useful test:

```text
HUMAN QC
Candidate: <exact identity>
Launch: <exact action>
Test: <minimum user steps>
Expected: <observable result>
Known limitation: <material item or NONE>
Reply: PASS or describe what failed
```

## Result handling

- Human `PASS`, `works`, or equivalent explicit acceptance -> record `HUMAN_QC_PASS` as Human-Observed Fact for the stated candidate/acceptance boundary and route to `DEPLOY_READY`.
- Human `FAIL` or defect report -> preserve exact observation/candidate, route to Debug/Verify, and do not request deployment authority.
- Ambiguous feedback -> ask only the smallest question needed to classify PASS/FAIL.

Human QC does not prove universal compatibility, security, legal compliance, or broader behavior than the test actually covered.

## Cost rule

Do not make the human repeat machine-verifiable tests. Do not rerun still-valid automated gates merely because Human QC starts; rerun only gates invalidated by a later correction.

## Authority boundary

Human QC acceptance is not deployment authority. It proves the stated human-observed acceptance gate only.

## STOP conditions

STOP when candidate identity is unclear, automated acceptance is incomplete, the requested human test would be unsafe/illegal/outside Terms of Service, or the system would have to manufacture a human PASS.
