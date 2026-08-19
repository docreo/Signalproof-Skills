---
name: signalproof-known-errors
description: Active public-safe catalog of repeatable Signalproof error fingerprints and known prevention or mitigation patterns. Force-check before consequential build, debug, test, verify, recovery, packaging, or release work so previously learned failures are not repeated across tools, runtimes, platforms, or products.
---

# Signalproof Known Errors

## Status

**ACTIVE**

## Purpose

`signalproof-known-errors` is the public Signalproof repeatable-error catalog.

It contains generalized error fingerprints and their supported prevention or mitigation patterns only. It intentionally excludes private Build Ledger chronology, private paths, protected hashes, unreleased implementation details, customer data, secrets, private security evidence, and other private provenance.

Core rule:

> **Before consequential work, force-check whether the intended path matches a known repeatable error. If Signalproof already learned the failure, do not repeat it under unchanged conditions.**

## Mandatory preflight contract

For consequential Build, Debug, Test, Verify, Recovery, Packaging, Readiness, Security, or Release work:

1. read this skill before the failure-prone action;
2. compare the intended tool/runtime/platform/action/symptom/boundary against the catalog;
3. classify the result as `NO KNOWN MATCH`, `POSSIBLE MATCH`, `KNOWN ERROR / MITIGATION AVAILABLE`, `KNOWN ERROR / CONDITIONS CHANGED`, or `STOP`;
4. apply the documented prevention/mitigation when conditions materially match;
5. do not diagnose from keywords alone;
6. when conditions changed, permit a deliberate retest and record what changed;
7. when a high-confidence error matches unchanged conditions, do not repeat the known-bad path.

This preflight is for efficiency and recurrence prevention. It does not grant authority to build, release, elevate privilege, change security controls, publish, alter licensing/legal boundaries, or mutate canonical ledger state.

---

## KE-PS-PARSER-GENERATED-SCRIPT-001

**Domain:** PowerShell parser / generated script

**Error:** Generated or modified PowerShell fails before target execution because the final script contains invalid syntax, malformed here-string boundaries, parser-sensitive expressions, or incomplete interactive statement submission.

**Prevention:** Parser-validate the exact final `.ps1` before consequential execution. Submit interactive control flow as one complete statement/block. Hash the final serialized script after validation when byte identity matters.

**Do not repeat:** Execute a newly generated consequential PowerShell harness without validating the exact file that will run.

---

## KE-PS-NATIVE-STDERR-001

**Domain:** Windows PowerShell 5.1 / native processes

**Error:** A native tool succeeds or emits informational diagnostics, but PowerShell treats merged stderr as a terminating error and the harness reports a false failure.

**Prevention:** Capture stdout and stderr separately. Use the native process exit/result contract and required output artifacts as the success authority.

**Do not repeat:** Treat stderr presence by itself as proof that a native tool failed.

---

## KE-HETEROGENEOUS-PROPERTY-001

**Domain:** JSON/report/object parsing

**Error:** Code assumes every object in a heterogeneous result set exposes the same optional property and fails when one variant does not.

**Prevention:** Check schema/property presence before dereference. Preserve unknown variants and fail descriptively when required evidence is unavailable.

---

## KE-PS-RESERVED-VARIABLE-001

**Domain:** PowerShell variables

**Error:** Generated script assigns to or collides with a PowerShell automatic or read-only variable such as `$Host`.

**Prevention:** Use domain-specific variable names and check generated names against PowerShell automatic/read-only variables before execution.

---

## KE-TEXT-BYTE-NORMALIZATION-001

**Domain:** Git / packaging / evidence integrity

**Error:** Text remains semantically equivalent but its bytes change through Git, archive, serialization, or line-ending normalization while hashes or manifests require exact identity.

**Prevention:** Verify line-ending and archive behavior. Hash the final bytes actually being accepted or distributed. Use byte-preserving handling for protected evidence.

---

## KE-PY-BYTECODE-RESIDUE-001

**Domain:** Python runtime / packaging hygiene

**Error:** Python execution creates `__pycache__` or `.pyc` files inside a source, evidence, or distribution tree whose byte inventory is expected to remain clean.

**Prevention:** Use no-bytecode controls when immutability matters, exclude cache artifacts from packages, inspect residue, and reverify the manifest after execution or cleanup.

---

## KE-WINDOWS-PATH-NORMALIZATION-001

**Domain:** Windows filesystem / manifests

**Error:** Equivalent filesystem paths compare as different because slash direction, casing, canonicalization, or relative-path derivation differs.

**Prevention:** Normalize paths for comparison while retaining original path evidence. Derive relative paths using filesystem semantics rather than raw string-length assumptions.

---

## KE-WINDOWS-PATH-LENGTH-001

**Domain:** Windows packaging / extraction

**Error:** Deep package roots and nested evidence filenames exceed practical Windows copy/extraction path limits.

**Prevention:** Use short staging roots and bounded archive member names. Calculate the longest packaged relative path before handoff or distribution.

---

## KE-READINESS-SERIALIZATION-001

**Domain:** readiness / API contracts

**Error:** A component is internally healthy, but the external consumer cannot prove readiness because required machine-readable fields are missing.

**Prevention:** Expose explicit readiness fields such as readiness state and capability identity. Regression-test both healthy and blocked serialization.

---

## KE-PROTECTED-BASELINE-CONFLICT-001

**Domain:** governed development

**Error:** A proposed change requires modifying a file or tree protected by the accepted baseline or rollback contract.

**Prevention:** Narrow the change, isolate it, create an additive candidate, replan, or obtain explicit new authority. Do not weaken the protection test merely to obtain PASS.

---

## KE-ROLLBACK-PARTIAL-VERIFY-001

**Domain:** rollback / recovery integrity

**Error:** Recovery verifies only one executable or a subset of files but restores a larger rollback tree.

**Prevention:** Verify the complete rollback tree by path, size, and cryptographic hash before restoration.

---

## KE-VERSION-METADATA-DRIFT-001

**Domain:** packaging / installation / release identity

**Error:** Source version, package label, runtime version, installer metadata, or installed display version does not match the actual candidate revision.

**Prevention:** Use a governed version source and assert version identity across package, runtime, and installed metadata before promotion.

---

## KE-MANIFEST-EXCLUSION-OVERBROAD-001

**Domain:** manifest generation

**Error:** A broad filename exclusion removes nested checksum or evidence files that should have been included.

**Prevention:** Exclude only the exact self-referential manifest path. Test nested files with the same filename and verify coverage after clean extraction.

---

## KE-EVIDENCE-PATH-REUSE-001

**Domain:** provenance / artifact addressing

**Error:** A historical evidence path is reused for changing content, so earlier hashes no longer identify retrievable historical bytes.

**Prevention:** Use immutable, versioned, or content-addressed evidence paths. Do not overwrite byte-bound historical evidence targets.

---

## KE-STATIC-RUNTIME-CONFLATION-001

**Domain:** testing / acceptance

**Error:** Syntax, hash, package, or static verification is treated as proof of runtime, platform, user, security, release, or production acceptance.

**Prevention:** Keep evidence classes separate and require the exact gate for the claim being made. Preserve `UNKNOWN` or `PENDING` when the corresponding test has not occurred.

---

## KE-PRIVILEGE-DIAGNOSTIC-UNKNOWN-001

**Domain:** Windows diagnostics / privilege

**Error:** A diagnostic fails because required privilege or provider access is unavailable, and the failure is misclassified as the underlying system state.

**Prevention:** Classify probe failure separately from target state. Preserve `UNKNOWN` and use a separately authorized compatible read-only method when necessary.

---

## KE-HIDDEN-DEPENDENCY-FALLBACK-001

**Domain:** runtime / dependency resolution / offline operation

**Error:** Default runtime behavior searches PATH, selects another environment, waits for hidden input, or silently crosses a network/model-download boundary when an expected local dependency is absent.

**Prevention:** Pin explicit executable, environment, config, model, and asset locations. Prove local dependencies and enforce offline/no-download behavior where required.

---

## KE-WINDOW-ACTIVATION-IDENTITY-001

**Domain:** Windows UI/process activation

**Error:** Window activation or process selection matches the wrong surface because title/process identity is ambiguous, or required maintenance UI is hidden.

**Prevention:** Use unique application/window identity, explicit visibility rules, readiness handshakes, and visible diagnostics for child processes.

---

## KE-GIT-BUNDLE-REF-ASSUMPTION-001

**Domain:** Git bundle validation

**Error:** Validation assumes a conventional `HEAD` pseudo-ref exists instead of checking the refs actually present in the bundle.

**Prevention:** Enumerate bundle refs and validate the exact expected commits/ref relationships.

---

## KE-EDITABLE-INSTALL-SOURCE-001

**Domain:** Python packaging / source provenance

**Error:** A distribution name is assumed to imply a same-name source directory under site-packages, causing editable installs to be falsely classified as missing.

**Prevention:** Resolve source through the import spec, `.pth`, editable finder, `direct_url.json`, or equivalent runtime provenance.

---

## KE-UNICODE-CONSOLE-DISPLAY-001

**Domain:** console encoding / evidence display

**Error:** Console rendering fails for Unicode or phonetic evidence and is mistaken for underlying data or runtime failure.

**Prevention:** Preserve exact UTF-8 or escaped machine-readable evidence independently of console display and classify presentation failure separately.

---

## KE-REGISTRY-NOT-RUNTIME-AUTHORITY-001

**Domain:** capability registries / runtime governance

**Error:** Existence of a registry or capability record is treated as proof that the active runtime discovers, routes, authorizes, or enforces it.

**Prevention:** Separately prove the active consumer, discovery path, effective runtime authority, and enforcement behavior.

---

## KE-SOURCE-AUTHORITY-CONFLATION-001

**Domain:** provenance / source authority

**Error:** Recovery snapshots, deployed binaries, hashes, archives, historical references, or filesystem proximity are mistaken for authoritative editable source or build authority.

**Prevention:** Keep recovery lineage, deployment evidence, source lineage, build authority, runtime authority, and production authority distinct.

---

## KE-BROAD-FALLBACK-PRECEDENCE-001

**Domain:** deterministic classification / rules

**Error:** A broad fallback or composite rule runs before a more specific rule and incorrectly captures evidence that should receive the specific classification.

**Prevention:** Evaluate specific rules first, use semantically precise predicates, and retain regression fixtures for class boundaries.

---

## KE-LEDGER-STALE-SEQUENCE-001

**Domain:** append-only chronology

**Error:** A projected sequence identifier is later treated as reserved or current after unrelated work advances the canonical chronology.

**Prevention:** Never reserve projected sequence numbers. Reverify the actual current head immediately before an authorized append and regenerate the append plan when it changes.

---

## KE-REPEATED-FAILED-PATH-001

**Domain:** engineering efficiency

**Error:** The substantially same failed approach is repeated under unchanged conditions without materially new evidence, method, environment, or authority.

**Prevention:** Stop the path, preserve the failure, select a materially different method, or deliberately retest only after identifying what changed.

---

## KE-TRUST-CALCULATED-NOT-ENFORCED-001

**Domain:** security / trust enforcement

**Error:** A system calculates signature or trust state but the mutation/apply path does not actually require a valid trusted result.

**Prevention:** The enforcement point must independently require the exact trust predicate before consequential mutation.

---

## Use boundary

This catalog provides known-error recognition and prevention only.

It does not grant build, release, privilege, security-change, publication, legal, licensing, production, or canonical-ledger authority.

A technically effective mitigation must still comply with the governing security, licensing, legal, provenance, privacy, protected-state, and owner-authorization boundaries.

## Identity

- **Suite:** Signalproof Skills
- **Skill:** `signalproof-known-errors`
- **Version:** `0.1.0`
- **Maturity:** Active public baseline
- **Domain:** repeatable error fingerprints and prevention patterns
- **Created by:** Doc Reo / Signalproof
