# Signalproof Plan Consumption Revalidation Candidate

**Status:** CANDIDATE / NOT ACTIVE

## Purpose

Preserve a reusable governance lesson from a completed Signalproof governed-worker integration milestone without promoting it automatically into Active doctrine.

## Candidate lesson

A governed plan or approved-action artifact should not be trusted solely because it was valid when created.

Where the action can change protected state, eligibility should be enforced at two separate boundaries:

1. **Plan creation boundary** - only currently eligible actions may enter the plan.
2. **Plan consumption boundary** - the consumer should reconstruct current eligible actions from the authoritative matching inventory or state source and reject any selected identifier that is not in that reconstructed set.

This second check protects against stale, altered, or manually injected plan identifiers.

## Candidate acceptance pattern

A future Signalproof implementation using this pattern should demonstrate, at minimum:

- the source inventory or authoritative state is identified and integrity-checked;
- the creation path excludes ineligible actions independently of UI selection state;
- the consumption path does not trust the plan's selected identifiers as authority;
- eligible identifiers are reconstructed from the authoritative matching source;
- an intentionally injected ineligible identifier is rejected before actuation;
- rejection occurs without mutating the protected target;
- the test distinguishes static/source evidence from actual runtime or actuation evidence;
- failures in the test harness remain distinct from product failures.

## Authority rule

A plan is a request or recorded selection, not a grant of authority.

The consumer remains responsible for verifying that the requested action is currently eligible and authorized before actuation.

## Relationship to existing Signalproof governance

This candidate supplements existing human-authority, fail-closed, protected-state, verification, and closeout rules. It does not replace them.

It also does not create a new specialist skill merely for convenience. If the pattern is promoted later, it should be integrated into the most appropriate existing planning, execution, verification, or security governance surface after testing across materially different products.

## Scope limits

This candidate does not claim that all plan formats, applications, or runtimes use the same eligibility fields or inventory model.

It does not authorize:

- plan execution;
- protected-state mutation;
- production activation;
- permission expansion;
- direct-main writes;
- automatic skill promotion;
- automatic PR merge.

## Promotion gate

Before any Active promotion, test the pattern on materially different Signalproof workflows, including at least one case where eligibility changes between plan creation and consumption or where a plan is intentionally tampered with.

Lifecycle remains:

`DISCOVERED -> CANDIDATE -> TESTED -> APPROVED -> ACTIVE`

Current state:

**CANDIDATE / NOT ACTIVE**
