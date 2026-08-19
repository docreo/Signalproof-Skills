# `signalproof-this-build` - Active Operator Command V0.1

**Status:** ACTIVE  
**Version:** 0.1.0  
**Owner:** Doc Reo

## Purpose

`signalproof-this-build` executes the approved plan for the specific work currently under discussion.

> **Revalidate this, build this, capture durable decisions, verify this, leave proof.**

It is the canonical command form of conversational requests such as `grill-with-docs this architecture` when the work is moving from an approved plan into governed implementation.

## Preconditions

Before consequential execution:

1. an approved plan or equivalent owner-authorized execution contract exists;
2. objective, protected state, scope, acceptance, recovery, and STOP conditions are sufficiently bounded;
3. current repository/evidence state can be revalidated;
4. required authority for the next gate exists.

If not, return to `signalproof-this-plan`, `signalproof-plan`, or Investigation instead of improvising.

## Required composition

Principal routes:

- `signalproof-grill-with-docs` for unresolved material implementation decisions and durable glossary/ADR capture;
- `signalproof-design` for design/architecture fidelity;
- `signalproof-build` for bounded implementation.

Add Verify, Review, Debug, Security, Recovery, Document, Learn, Handoff, or Closeout only as required.

## Sequence

1. Recheck current Git/evidence and detect drift from the planning basis.
2. Consume the approved plan: objective, protected state, allowed/out-of-scope surfaces, acceptance, recovery, and checkpoints.
3. Run Known Failure Preflight.
4. Isolate the candidate and preserve rollback/non-mutation state.
5. Use `signalproof-grill-with-docs` only when a real unresolved material implementation decision reaches the frontier.
6. Preserve design and interface fidelity.
7. Build the smallest authorized surface.
8. Verify incrementally after each material boundary change.
9. Apply security/review/provenance checks where material.
10. Recheck Git before consequential write, merge, publication, or promotion.
11. Preserve changed-file inventory, tests, logs, hashes/evidence, failures, unverified gates, recovery state, and durable decisions.
12. Route meaningful completed phase boundaries to Closeout as applicable.

## Grill-with-docs rule

Use it when a decision is materially difficult to reverse, security/authority relevant, a genuine tradeoff, surprising without context, or defining canonical terminology/interface behavior.

Capture glossary changes only when terminology is actually resolved. Capture an ADR only when the decision is durable and merits an ADR. Ordinary implementation detail belongs in code/tests/build evidence.

Document capture does not grant repository file-write authority. Writes remain subject to the active execution contract and repository rules.

## THIS BUILD RESULT

```text
THIS BUILD RESULT
Work stream: <identity>
Git basis: <repo/ref/head>
Plan basis: <approved contract>
Status: CANDIDATE PASS / ACCEPTED / PARTIAL-UNVERIFIED / BLOCKED / REVERTED / STOP
Changed: <material changes>
Protected: <confirmed untouched state>
Durable decisions: <glossary/ADR or none>
Dependencies/environment: <explicit changes>
Verification: <tests/gates run>
Proof: <artifacts/logs/hashes/diffs>
Unverified: <remaining gates>
Recovery: <rollback/candidate state>
Known failures: <matched/mitigated/new evidence>
Open findings: <bounded>
Closeout status: <not due / staged / closed>
Next authority: <only if required>
```

## Authority boundary

This command does not grant release, canonical Build Ledger append, credential disclosure, privilege, destructive action, production publication, or scope expansion authority.

## STOP conditions

STOP when current Git/evidence invalidates the approved plan; protected state must change outside authority; scope expands beyond the plan; a known failure would be repeated unchanged; untrusted content could become executable behavior outside a governed boundary; secrets would cross an unapproved boundary; a partial actuation cannot be contained/recovered; acceptance cannot be tested but would be falsely claimed; a Candidate would be silently promoted; or canonical ledger/release/production authority is inferred from this command.
