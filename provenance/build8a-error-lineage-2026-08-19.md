# Signalproof Hermes Governor Build 8A - Error Lineage

**Status:** PUBLIC-SAFE EVIDENCE RECORD / R3-C5 RECOVERED PASS  
**Window:** Build 8A recovery work through 2026-08-19 22:48 America/Los_Angeles  
**Workstream:** Signalproof Hermes Governor Build 8A  
**Git basis:** `2b6e644800e9ea80b48990c0d9d1ea38755f2f6c`  
**Purpose:** preserve repeatable failure lineage and prevention lessons without publishing private machine paths, protected hashes, private Build Ledger chronology, credentials, or unreleased protected-state details.

## Accepted architecture anchor

Build 8A converged on the least-privilege client-authentication design:

`Pipe ACL + registered-client cryptographic challenge-response`

The prior process-opening / executable-path trust family is retired. Later bootstrap failures are preserved as harness/integration evidence and do not reopen the accepted D2 architecture unless new security evidence actually contradicts it.

## Failure lineage

### B8A-R2 - Blocking buffered line IPC

**Class:** IPC / harness-runtime interaction  
**Disposition:** RETIRED / DO NOT REPEAT UNCHANGED

A blocking buffered `ReadLine()` style IPC path could stall bounded proof execution and observation.

**Prevention:** use bounded request/response framing with explicit readiness, timeout, completion, and cleanup semantics.

### B8A-R3 - WMI executable path / owner query under Local Service

**Class:** Windows runtime identity / diagnostic dependency  
**Disposition:** RETIRED / DO NOT REPEAT UNCHANGED

WMI process metadata was not a reliable least-privilege authorization root from the Local Service Governor runtime.

**Prevention:** process metadata may be diagnostic, but it is not an authorization prerequisite in the accepted Build 8A trust model.

### B8A-R4 - FileSystemAccessRule harness construction defect

**Class:** PowerShell/.NET harness construction  
**Disposition:** PRESERVED FAILURE

The proof harness failed while constructing an ACL-related .NET object. This was a harness failure, not evidence that the Governor security model failed.

**Prevention:** validate constructor/overload behavior in a micro-fixture before embedding it in a consequential runner. Keep harness failure separate from product evidence.

### B8A-R5 - OpenProcess access denied under Local Service

**Class:** Windows process-security boundary  
**Disposition:** RETIRED FROM AUTHORIZATION DESIGN

`OpenProcess(PROCESS_QUERY_LIMITED_INFORMATION)` was denied under the least-privilege runtime.

**Prevention:** do not increase privilege or add debug privilege to recover this trust path. Use the accepted application-level registered-key challenge design.

### B8A-R6 / R6-C2 - Pipe/client identity evidence did not rescue process-opening authorization

**Class:** Windows named-pipe identity / process authorization  
**Disposition:** RETIRED FROM AUTHORIZATION DESIGN

Pipe-related client evidence could be established, but process-opening/client-impersonation remained unsuitable as the trust root.

**Prevention:** PID, session, executable path, and similar process metadata remain diagnostic only unless a later governed design explicitly changes that rule.

### B8A-R7-C2 - Architectural recovery / accepted proof

**Class:** security architecture recovery  
**Disposition:** ACCEPTED D2 OUTCOME

Registered-client cryptographic challenge-response was proven over the bounded named-pipe boundary while retaining Local Service and avoiding process opening, executable-path/hash authorization, client impersonation, debug privilege, production activation, and model execution.

**Accepted trust root:** registered application identity + registered public key + fresh single-use nonce + signature verification + capability/policy enforcement.

### B8A-D3-R3 - Provenance path assumption

**Class:** harness / provenance locator  
**Disposition:** FAILED LANE PRESERVED; corrected in fresh lane

A fresh integration runner treated one transferred staged-closeout location as if the filesystem path itself were authoritative. The receiving environment did not expose the artifact at that assumed location, so the runner stopped before candidate mutation.

**Prevention:** when evidence authority is cryptographic identity rather than a guaranteed local path, resolve through approved evidence roots by exact identity where appropriate. If non-required private evidence is unavailable, record `UNAVAILABLE` instead of fabricating a path or content.

### B8A-D3-R3-C1 - Heterogeneous response property assumption

**Class:** PowerShell result parsing / heterogeneous object schema  
**Disposition:** FAILED LANE PRESERVED

The lane reached bounded live integration and the good pipe client connected. The harness then dereferenced a `decision` property on a response variant that did not expose that property and terminated under StrictMode.

**Active known-error match:** `KE-HETEROGENEOUS-PROPERTY-001`.

**Prevention:** classify message variants and test property presence before dereferencing optional fields.

### B8A-D3-R3-C2 - StrictMode collection Count assumption

**Class:** PowerShell result parsing / null-scalar collection shape  
**Disposition:** FAILED LANE PRESERVED

A value that can legitimately be `$null` or scalar under successful operation was accessed through direct `.Count` while `Set-StrictMode` was active.

**Prevention:** normalize potentially null/scalar collections before cardinality checks, e.g. `@($value).Count`, and scan the entire consequential runner for equivalent shape-sensitive gates before retest.

### B8A-D3-R3-C3 - Self-referential source-scan assertion

**Class:** static harness validation  
**Disposition:** FAILED LANE PRESERVED

A static guard searched source text for a forbidden literal that was itself embedded in the guard, causing the validator to match its own test definition.

**Prevention:** construct search needles independently or use structural parsing. Do not make a source guard self-match by construction.

### B8A-D3-R3-C4 - Negative-test reason-shape assumption

**Class:** result contract / heterogeneous collection shape  
**Disposition:** FAILED LANE PRESERVED

The product correctly returned a deny response with `reason_codes`, but the harness collapsed the array-shaped contract into a fragile scalar comparison and reported failure.

**Prevention:** preserve array-shaped reason contracts and assert membership rather than scalar equality.

### B8A-D3-R3-C5 - Final server-exit false negative

**Class:** harness finalization / evidence-class conflation  
**Disposition:** RECOVERED; PRODUCT/SECURITY PASS

R3-C5 completed the full authentication matrix successfully. The bounded server emitted a clean `COMPLETE` record with one successful context, six authentication failures, bridge code zero, and empty stderr. A later harness exit-readout assertion nevertheless reported failure.

**Recovery:** independent evidence review established that the security/product claim was already proven before the harness false negative. Recovery verification confirmed the accepted matrix, clean server completion, unchanged Governor parent project, unchanged protected Core under its accepted contract, absent production roots, and no return to retired process-identity authorization routes.

**Prevention:** acceptance evidence and harness evidence are separate classes. A later harness/finalizer defect must not automatically regress a product/security claim already established by sufficient independent evidence.

### R3-C5 recovery verifier - broad private-key regex false positive

**Class:** verifier semantics / broad text matching  
**Disposition:** RECOVERED VERIFIER DEFECT

The verifier rejected the explicit metadata field `private_key_persisted=false` because a broad regex matched the field name. Structural inspection showed that only public-key material was persisted and the private-key persistence flag was false.

**Prevention:** inspect schema/field semantics structurally. Do not infer secret persistence from a keyword appearing inside a negative metadata field.

## Workflow / operator-command defect observed in the same window

### Repeated authorization-loop behavior

**Class:** orchestration / operator workflow  
**Disposition:** CORRECTED IN CURRENT DSP AUTHORIZATION HANDLER

Repeated authorization prompts occurred even after bounded non-production continuation had already been granted.

**Prevention:** authorization remains exact and scoped, but once a valid envelope exists for the current action, ordinary in-scope continuation consumes that authority.

## Cross-cutting prevention rules reinforced

1. Preserve every failed runner/lane; do not overwrite failure evidence.
2. Parser-preflight the exact final PowerShell artifact before execution.
3. Hash-bind the exact staged artifact when byte identity matters.
4. Distinguish harness/parser/staging failure from product/runtime/security failure.
5. Check heterogeneous object properties before dereference.
6. Normalize null/scalar pipeline results before `.Count` or indexing under StrictMode.
7. Do not repeat known-bad process-opening/WMI/client-impersonation authorization routes under unchanged conditions.
8. Treat cryptographic artifact identity and source authority separately from incidental filesystem location.
9. Keep static/syntax success separate from live runtime/security acceptance.
10. Preserve protected state and rollback before every correction lane.
11. Continue automatically inside a valid bounded authorization envelope; do not manufacture repetitive owner gates.
12. When a shape bug is discovered, scan the full consequential runner for equivalent assumptions before retest.
13. Prefer structural/schema-aware checks over broad regex or substring checks when security semantics depend on field meaning.
14. Once sufficient independent acceptance evidence exists, classify later harness/finalizer failures independently rather than automatically replaying the product test.
15. Convert high-frequency machine-checkable known-error rules into executable preflight/lint contracts; prose-only logging is not enough recurrence prevention.

## Final status

- D2 client-authentication architecture remains accepted.
- Process-opening/executable-path authorization family remains retired.
- R3-C5 is a **RECOVERED CANDIDATE PASS**.
- Complete positive/negative authentication matrix passed.
- Server completion evidence is clean.
- Review, Security, Permissions, and Verify passed with the recovered-harness note.
- Owner final debug gate was accepted by `/dsp log-skill` continuation.
- No production Governor activation is claimed.
- No canonical private Build Ledger append is claimed by this public record.
- New generalized lessons remain Candidate learning until separately governed; no automatic Known Error or Skill activation is claimed.

## Public/private boundary

This file intentionally omits local filesystem locations, private evidence hashes, protected Core hashes, private Build Ledger sequence/head information, credentials, private keys, and other private implementation evidence. Those remain governed by their private evidence/ledger contracts.
