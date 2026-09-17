# Preflight Must Verify Behavior Contract, Not Documentation Labels — Candidate Learning

**Status:** CANDIDATE  
**Lifecycle:** DISCOVERED -> CANDIDATE; not Active doctrine

## Failure pattern

A consequential build harness can produce a false STOP when a preflight checks for the literal presence of a documentation token, known-error ID, comment, marker string, or label inside the target script instead of checking the actual mitigation behavior.

Observed generalized pattern:

- the target script retained the required native-process mitigation behavior;
- the wrapper preflight searched the target text for a literal known-error label;
- the label was absent even though the behavior remained present;
- the wrapper stopped before target actuation;
- the resulting failure belonged to the HARNESS / PREFLIGHT layer, not the product or target builder.

## Candidate principles

1. **Behavior is authority; labels are evidence only.** A comment, known-error ID, or marker may aid review, but it must not be the sole gate for a runtime prevention contract when the behavior can be checked directly.

2. **Prefer executable probes for runtime-sensitive prevention.** For native stderr handling, run a bounded process that writes stderr and exits zero. PASS requires separate stderr preservation and exit code 0 remaining success.

3. **Centralize repeated native-process handling.** Route ordinary native invocations through one tested capture helper when practical. Direct duplicate invocation blocks increase regression risk.

4. **Static source checks should inspect semantic structure.** If static validation is needed, assert the presence of the required handling operations or helper usage rather than a prose token.

5. **Classify pre-actuation false stops as HARNESS.** Do not report product failure when the target executable/build never ran.

6. **Do not repeat an unchanged false-stop preflight.** Preserve the failure fingerprint and require a materially changed gate before retrying.

## Regression candidates

- wrapper must not require a literal known-error ID in target source;
- native stderr probe writes stderr, exits zero, and remains PASS;
- target builder native invocations route through the tested capture helper except documented bounded exceptions;
- parser/static wrapper failure remains distinct from target/product failure;
- final artifact is reparsed and rehashed after the last modification.

## Governance note

This is reusable public-safe learning only. Private artifact hashes, local paths, chronology, and protected implementation evidence remain outside the public candidate.
