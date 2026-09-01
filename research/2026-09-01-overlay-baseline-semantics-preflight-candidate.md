# Overlay Baseline Semantics + Preflight-Before-Mutation — Candidate Learning

**Status:** CANDIDATE  
**Source domain:** governed overlays / candidate assembly / protected baseline handling  
**Lifecycle:** DISCOVERED -> CANDIDATE; not Active doctrine

## Failure pattern

An overlay manifest can correctly hash its source files yet still misclassify an inherited destination as a new file. A strict assembler then stops when the destination already exists. This is a harness/provenance failure, not a product failure, when the target product overlay was never applied or executed.

A second risk appears when overlay entries are copied one-by-one while validation is interleaved with mutation: a later baseline mismatch can leave a partially applied isolated candidate tree.

## Candidate principles

### 1. Add-vs-replace is baseline evidence

For every overlay path, determine semantics from the exact accepted baseline, not author intent or source-tree proximity.

- destination absent in exact baseline -> new/add entry;
- destination present -> replacement entry bound to exact baseline hash.

### 2. Bind inherited replacements to exact baseline identity

A replacement entry should carry the exact accepted baseline SHA-256 and require that identity before overwriting the candidate copy. Do not set a null base hash for an inherited file merely because the overlay owns a new version of it.

### 3. Preflight the whole overlay plan before any copy

Use two passes:

1. validate all manifest fields, source hashes/sizes, path containment, destination existence semantics, and replacement baseline hashes;
2. only after every entry passes, perform copies and verify destination bytes.

This prevents a later manifest mistake from leaving a partially applied candidate tree.

### 4. Preserve the protected baseline

Apply overlays to an isolated copy of the accepted baseline. Never weaken the baseline identity check to make a candidate assemble.

### 5. Classify pre-actuation overlay failure correctly

If the assembler stops on overlay semantics before the changed product is built or executed, classify the event as HARNESS / EVIDENCE / SOURCE-AUTHORITY as appropriate, not PRODUCT runtime failure.

### 6. Check all entries at once after the first classification defect

When one inherited path is falsely marked new, compare the entire overlay manifest against the exact baseline before retrying. Do not fix only the first filename and wait for the next inherited file to fail.

## Regression candidates

- manifest identifies every exact-baseline-existing path as replacement and binds its baseline hash;
- every exact-baseline-absent path is classified as new;
- one incorrect add/replace classification prevents all overlay mutation;
- source hash or size drift prevents all overlay mutation;
- replacement baseline hash drift prevents all overlay mutation;
- after full preflight PASS, copied destination bytes match overlay manifest hashes;
- protected baseline bytes remain untouched.

## Governance note

This is reusable public-safe engineering learning. Private artifact hashes, workstation paths, screenshots, and Build Ledger chronology remain private evidence. Candidate status does not authorize automatic activation.
