# Cross-Runtime Aggregate Hash Preflight — Candidate Learning

**Status:** CANDIDATE  
**Source domain:** PowerShell/Python build harnesses, deterministic evidence validation  
**Lifecycle:** DISCOVERED -> CANDIDATE; not Active doctrine

## Failure pattern

A build wrapper precomputes a hash over a sorted textual representation of structured evidence in one runtime, then re-creates that representation in another runtime and compares the aggregate digest. The underlying structured evidence may be identical while the aggregate hash differs because ordering, collation, string canonicalization, encoding, or serialization semantics are not guaranteed to be identical across runtimes.

When this happens before the target builder actuates, it is a HARNESS/EVIDENCE false stop, not a product failure.

## Candidate principles

### 1. Do not make cross-runtime canonicalization implicit

If Python generates an acceptance digest that PowerShell must reproduce, define every canonicalization rule explicitly: path normalization, sort comparator, case behavior, null representation, delimiters, line endings, and encoding. Otherwise the aggregate digest is not portable evidence authority.

### 2. Prefer direct keyed verification for small governed maps

For bounded manifests, verify each expected key/value pair directly:

- exact expected key set;
- no unknown keys;
- no duplicates;
- no missing keys;
- exact normalized value per key.

This avoids unnecessary dependence on aggregate ordering and serialization.

### 3. Hash artifacts, not ad-hoc reconstructed presentations

Cryptographic hashes are strongest when bound to exact artifact bytes. If the evidence of interest is a semantic mapping rather than a byte artifact, validate the mapping semantically unless a formal canonical serialization is part of the contract.

### 4. Preserve the exact builder when the wrapper alone failed

If a wrapper false-stops before builder actuation and the builder/product bytes are unchanged, preserve the builder identity and make the materially changed retry in the wrapper/preflight layer. Do not create product churn to fix evidence plumbing.

### 5. Localize before retry

Record whether the target builder executed. A failure before target actuation carries different evidence and retry identity from a build, runtime, or UI failure.

## Regression candidates

- direct keyed map verification passes regardless of enumeration order;
- unknown, duplicate, missing, or value-drifted entries fail closed;
- exact builder payload hash remains unchanged across wrapper-only correction;
- wrapper failure evidence explicitly records that builder actuation did not occur;
- aggregate cross-runtime reconstruction is not used as sole acceptance authority unless a formal canonical serialization is defined and tested in both runtimes.

## Governance note

This is reusable public-safe engineering learning. Private artifact hashes, workstation paths, user logs, and Build Ledger chronology remain private evidence. Candidate status does not authorize automatic activation.
