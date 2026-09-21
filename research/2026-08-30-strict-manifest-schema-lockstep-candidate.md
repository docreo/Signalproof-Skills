# Strict Manifest Producer/Consumer Lockstep — Candidate Learning

**Status:** CANDIDATE  
**Source domain:** governed runtime capability registration  
**Lifecycle:** DISCOVERED -> CANDIDATE; not Active doctrine

## Problem pattern

A strict runtime consumer can truthfully fail a capability closed even when the underlying executable is healthy if the producer and consumer manifest schemas drift apart.

Observed class:

- producer emits an additional provenance field;
- consumer uses strict JSON decoding with unknown-field rejection;
- consumer struct omits the new field;
- manifest is rejected as invalid;
- runtime capability is reported unavailable even though the executable itself compiled and self-tested successfully.

## Candidate principles

### 1. Strict decoding should remain strict

Do not remove unknown-field rejection merely to make a manifest parse. Strict decoding is useful governance because it prevents silent schema drift.

### 2. Producer and consumer schemas move in lockstep

Every producer-side manifest field addition, rename, deletion, or semantic change requires a matching consumer schema update in the same bounded change.

### 3. Provenance fields are enforcement inputs

Fields such as source commit/blob identity should be validated by the runtime consumer, not merely serialized by the producer. A registry should fail closed on provenance drift.

### 4. Add round-trip consumer regression tests

For strict machine-readable contracts, tests should cover at least:

- a complete valid producer-shaped manifest becomes installed/available;
- a missing or drifted governed identity becomes unavailable;
- unknown or trailing data fails closed when strictness is intentional.

### 5. Capability-gate failures should surface reasons

When runtime capability acceptance fails, preserve the capability state and machine-provided reason. Reporting only `capability unavailable` hides the actual registry failure layer and increases debug cost.

### 6. Keep build, runtime, and registry evidence separate

A compiled executable and passing self-test do not prove registry availability. Runtime registry consumption is a separate gate and must be tested as such.

## Regression candidates

- exact valid manifest -> runtime installed + capability available;
- provenance blob drift -> runtime unavailable;
- producer field absent from strict consumer -> test failure before handoff;
- trailing JSON -> unavailable;
- live acceptance logs include capability ID, state, and reason.

## Governance note

This is reusable public-safe engineering learning. Private paths, exact candidate hashes, chronology, and protected rollback identities remain private evidence and are not part of this candidate.
