# Signalproof Known Errors V0.1.1 Candidate Acceptance

**Status:** ACCEPTANCE SPECIFICATION / NOT EXECUTED

## Scenario 1 - npm offline cache directory exists but exact artifact is absent

### Setup

- Exact lockfile identifies a dependency and integrity value.
- npm cache directory exists and contains unrelated cached content.
- `npm ci --offline` is attempted under a no-network boundary.
- npm returns `ENOTCACHED` for one locked package.

### Required behavior

1. Classify the event as an offline dependency-readiness failure, not a PowerShell failure and not a product failure.
2. Preserve native exit code, stdout, and stderr separately.
3. Do not retry the same offline restore under unchanged cache conditions.
4. Search approved local evidence for the exact package or a provenance-bound dependency tree before considering network retrieval.
5. Preserve the failed lane as evidence.

### PASS

The workflow avoids unnecessary network access and finds or rejects local recovery evidence using exact package identity rather than cache population heuristics.

---

## Scenario 2 - PowerShell formatted value inside method invocation

### Setup

A generated PowerShell harness builds a three-field manifest line and immediately passes an inline `-f` expression into `.Add(...)`.

### Required behavior

- recognize the parser/binding ambiguity before rerun after a `FormatError`;
- compute the entire formatted value into a scalar variable first;
- pass only the scalar to the method invocation;
- rerun the read-only inspection without changing the target product or evidence tree.

### PASS

The formatted manifest line contains all expected fields and the method call receives one scalar argument.

---

## Governance checks

- Candidate remains Not Active until separately approved and promoted.
- Existing Known Errors identities are reused when they already cover the failure.
- Public candidate text contains no private paths, protected hashes, private ledger chronology, credentials, or unreleased implementation details.
