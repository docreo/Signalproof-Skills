# Signalproof `log-skill` Operator Command — Candidate

**Status:** CANDIDATE / NOT ACTIVE

## Purpose

Define the owner shorthand `log-skill` as one explicit governed operator instruction that combines milestone logging with reusable-skill learning governance and GitHub preservation.

## Owner command

When Doc Reo says:

```text
log-skill
```

interpret it as:

> **Ledger the current meaningful milestone, extract and govern reusable learning, and preserve the resulting staged ledger/skill evidence in the Signalproof-Skills GitHub workflow.**

## Required route

`log-skill` routes through the existing Active disciplines rather than creating a duplicate specialist:

```text
signalproof-closeout
  -> Build Ledger path
  -> signalproof-learn
  -> smallest justified skill/test/policy/documentation candidate
  -> GitHub governed branch/PR
```

Use `signalproof-document`, `signalproof-verify`, `signalproof-review`, `signalproof-security`, or other Active skills when the evidence state requires them.

## Command contract

On `log-skill`:

1. Identify the exact current milestone and evidence boundary.
2. Preserve accepted/protected state, failures, uncertainty, rollback/recovery, and open gates.
3. Determine whether the canonical private Build Ledger can be verified live.
4. If live ledger identity/head/chain/projection cannot be verified, create a clearly labeled `STAGED / NONCANONICAL / PENDING CHAIN-SAFE INGESTION` ledger delta. Never invent sequence numbers or canonical hashes.
5. Extract reusable learning using `signalproof-learn`.
6. Check existing Active skills before creating new doctrine.
7. Choose the smallest justified durable output: documentation, regression test, checklist/gate, policy candidate, skill update candidate, router candidate, or new skill candidate only when existing boundaries are insufficient.
8. Preserve negative learning and failed attempts; later success must not erase them.
9. Place public-safe learning/governance evidence on a dedicated GitHub branch and open a pull request.
10. Do not silently promote a Candidate to Active merely because the owner said `log-skill`.
11. Do not merge to protected `main` unless the applicable Signalproof governance/acceptance path and owner authority are satisfied.
12. State the exact next development gate after logging/learning is preserved.

## Authority boundary

`log-skill` grants authority to **record and stage governed learning**, not to:

- fabricate a canonical Build Ledger append;
- bypass the protected-branch/PR workflow;
- activate a skill without the required lifecycle;
- rewrite unrelated Active skills;
- merge a candidate automatically;
- erase failed evidence;
- grant runtime, release, security, destructive, credential, or deployment authority.

## Lifecycle

Reusable learning created by `log-skill` follows:

```text
DISCOVERED -> CANDIDATE -> TESTED -> APPROVED -> ACTIVE -> DEPRECATED / RETIRED
```

A `log-skill` invocation may create or advance a Candidate, but does not automatically satisfy TESTED, APPROVED, or ACTIVE.

## Build Ledger handling

When canonical ledger state is unavailable:

```text
STAGED / NONCANONICAL / PENDING CHAIN-SAFE INGESTION
```

The staged record must preserve enough stable identity and evidence for later deduplicated ingestion after the real private ledger is verified.

## Completion result

A successful `log-skill` invocation should report:

- milestone logged/staged;
- ledger status;
- reusable lesson disposition;
- candidate files/skill changes created;
- GitHub branch/PR state;
- what was intentionally not promoted;
- exact next gate.

## Candidate acceptance tests

1. **Unverified ledger head:** command stages a noncanonical delta and does not invent canonical sequence/hash.
2. **Existing skill already covers lesson:** command strengthens the smallest existing mechanism instead of creating a duplicate specialist.
3. **Single-case lesson:** command may create a Candidate but does not call it Active.
4. **Material failed attempts:** command preserves failures alongside the accepted state.
5. **Private evidence:** command publishes only public-safe abstractions to GitHub.
6. **Open product phase:** command may log the completed sub-milestone while leaving future runtime/release gates explicitly unauthorized.

## Current evidence source

First applied to Signalproof V0.2 Case 3 Hermes Agent after:

- protected Hermes local inventory was previously recorded;
- disposable source staging and runtime isolation were completed;
- Stage 2C dependency substrate reached reconciled Candidate PASS;
- Stage 2D-1 execution-authority surface mapping completed with governance PASS;
- Hermes itself remained uninstalled from the disposable venv and unlaunched;
- Stage 2D-2 containment wrapper remained the next gate.

This candidate does not itself assert final Hermes acceptance.
