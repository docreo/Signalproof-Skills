# Signalproof Hermes Governor Build 8A - Error Lineage

**Status:** PUBLIC-SAFE EVIDENCE RECORD  
**Window:** approximately the six hours preceding 2026-08-19 22:04 America/Los_Angeles  
**Workstream:** Signalproof Hermes Governor Build 8A  
**Git basis:** `2b6e644800e9ea80b48990c0d9d1ea38755f2f6c`  
**Purpose:** preserve repeatable failure lineage and prevention lessons without publishing private machine paths, protected hashes, private Build Ledger chronology, credentials, or unreleased protected-state details.

## Summary

Build 8A converged on a least-privilege Governor client-authentication design based on:

`Pipe ACL + registered-client cryptographic challenge-response`

The prior process-opening / executable-path trust family is retired for the accepted authorization design. The current build then exposed additional harness and result-parsing defects while integrating the accepted authentication mechanism into a fresh non-production bootstrap candidate.

This record preserves failures as evidence. A PASS on a later lane does not erase prior failed lanes.

## Failure lineage

### B8A-R2 - Blocking buffered line IPC

**Class:** IPC / harness-runtime interaction  
**Disposition:** RETIRED / DO NOT REPEAT UNCHANGED

A blocking buffered `ReadLine()` style IPC path was unsuitable for the bounded proof lane and could stall progress/observation.

**Prevention:** use a bounded request/response framing approach with explicit readiness, completion, timeout, and cleanup semantics.

---

### B8A-R3 - WMI executable path / owner query under Local Service

**Class:** Windows runtime identity / diagnostic dependency  
**Disposition:** RETIRED / DO NOT REPEAT UNCHANGED

The design attempted to derive authorization-relevant executable/process identity through WMI while the Governor candidate ran as Local Service. That route was not a reliable least-privilege trust root.

**Prevention:** do not make WMI process metadata an authorization prerequisite for the accepted Build 8A trust model.

---

### B8A-R4 - FileSystemAccessRule harness construction defect

**Class:** PowerShell/.NET harness construction  
**Disposition:** PRESERVED FAILURE / DO NOT REPEAT UNCHANGED

A proof harness failed while constructing the intended filesystem/ACL object. This was a harness failure, not proof that the underlying Governor security model was invalid.

**Prevention:** independently validate .NET constructor/overload use in a micro-fixture before embedding it into a consequential proof runner. Keep harness/parser failure separate from product evidence.

---

### B8A-R5 - OpenProcess access denied under Local Service

**Class:** Windows process-security boundary  
**Observed result:** `OpenProcess(PROCESS_QUERY_LIMITED_INFORMATION)` returned access denied  
**Disposition:** RETIRED FROM AUTHORIZATION DESIGN

Attempting to bind client trust to process-opening from the least-privilege Governor runtime crossed a Windows access boundary.

**Prevention:** do not increase privilege or add debug privilege merely to recover this trust path. The accepted design replaces it with application-level registered-key challenge authentication.

---

### B8A-R6 / R6-C2 - Pipe identity evidence succeeded, process-opening route still failed

**Class:** Windows named-pipe identity / process authorization  
**Disposition:** RETIRED FROM AUTHORIZATION DESIGN

The proof could establish pipe-related client metadata and impersonated client identity, but the process-opening/impersonation authorization family still failed and did not provide the desired least-privilege trust root.

**Prevention:** PID, session, executable path, and similar process metadata may be retained as diagnostics, but they are not the accepted root of trust for Build 8A client authorization.

---

### B8A-R7-C2 - Architectural recovery / accepted proof

**Class:** security architecture recovery  
**Disposition:** ACCEPTED D2 OUTCOME

The successful recovery proved registered-client cryptographic challenge-response over the bounded named-pipe boundary while retaining Local Service and avoiding process opening, executable-path/hash authorization, client impersonation, debug privilege, production activation, and model execution.

**Accepted trust root:** registered application identity + registered public key + fresh single-use nonce + signature verification + capability/policy enforcement.

This is included here because it explains why the R5/R6 family must not be retried as though it were still the target architecture.

---

### B8A-D3-R3 - Provenance path assumption

**Class:** harness / provenance locator  
**Disposition:** FAILED LANE PRESERVED; corrected in fresh lane

The first fresh bootstrap integration runner treated one transferred staged-closeout filename/location as if the path itself were authoritative. The receiving environment did not expose the artifact at that assumed location, so the runner stopped before candidate mutation.

**Product actuation:** none before STOP.  
**Protected-state regression:** none observed.

**Prevention:** when evidence authority is cryptographic identity and transfer state rather than a guaranteed local path, resolve across approved evidence roots by exact identity where appropriate; if task-relevant private evidence is unavailable and not required for safe continuation, record `UNAVAILABLE` rather than fabricate a path or content.

**Known-error relationship:** aligns with source/provenance authority separation and repeated-failed-path prevention.

---

### B8A-D3-R3-C1 - Heterogeneous result-object property assumption

**Class:** PowerShell result parsing / heterogeneous object schema  
**Disposition:** CURRENT LOCALIZED DEFECT / REQUIRES FRESH CORRECTION LANE

The corrected provenance lane completed preflight, protected-state verification, frozen-baseline copy verification, exact-final static checks, Node syntax checks, and started the bounded live integration. The good pipe client connected. The runner then attempted to read a `decision` property from an object variant that did not expose that property and terminated under strict property access.

**Important classification:** this is not evidence that registered-client cryptographic authentication failed. The failure occurred in the PowerShell result-consumption layer after the integration server was ready and the good client connected.

**Active known-error match:** `KE-HETEROGENEOUS-PROPERTY-001`.

**Prevention:** before dereferencing optional or variant result properties, explicitly test property/schema presence, classify the message variant, preserve the raw result, and fail descriptively only when a required semantic result cannot be established.

**Next correction requirement:** preserve the failed R3-C1 lane unchanged; inspect the exact live response shape; correct result parsing in a fresh isolated lane; rerun the same positive and negative acceptance matrix only after the parser condition materially changes.

---

## Workflow / operator-command defect observed during the same window

### Repeated authorization-loop behavior

**Class:** orchestration / operator workflow  
**Disposition:** CORRECTED IN CURRENT DSP AUTHORIZATION HANDLER

During Build 8A continuation, repeated requests for owner authorization caused unnecessary loops even after the owner had already granted bounded authority for ordinary non-production design/build/test/debug/verify/review/recovery work.

**Prevention:** authorization is exact and bounded, but once a valid envelope exists for the current action, ordinary in-scope continuation must consume that authority rather than repeatedly asking for the same approval. Stop only when the action materially changes scope or crosses an excluded boundary.

Current DSP/authorization doctrine on `main` includes the generic bounded authorization handler and preserves excluded production, privilege, credential, security-control, destructive, release/publication, Candidate-activation, and canonical-ledger boundaries.

## Cross-cutting prevention rules reinforced

1. Preserve every failed runner/lane; do not overwrite failure evidence.
2. Parser-preflight the exact final PowerShell artifact before execution.
3. Hash-bind the exact staged artifact when byte identity matters.
4. Distinguish harness/parser/staging failure from product/runtime/security failure.
5. Check heterogeneous object properties before dereference.
6. Do not repeat known-bad process-opening/WMI/client-impersonation authorization routes under unchanged conditions.
7. Treat cryptographic artifact identity and source authority separately from incidental filesystem location.
8. Keep static/syntax success separate from live runtime/security acceptance.
9. Preserve protected state and rollback before every correction lane.
10. Continue automatically inside a valid bounded authorization envelope; do not manufacture new authority or create repetitive owner gates.

## Current status at this record

- D2 client-authentication architecture remains accepted.
- Process-opening/executable-path authorization family remains retired.
- The fresh bootstrap integration reached live bounded integration but stopped on a localized heterogeneous-result parsing defect.
- No production Governor activation is claimed.
- No canonical private Build Ledger append is claimed by this public record.
- The next technical action is a fresh correction lane that inspects and safely parses the actual live response variant before repeating the integration acceptance matrix.

## Public/private boundary

This file intentionally omits local filesystem locations, private evidence hashes, protected Core hashes, private Build Ledger sequence/head information, credentials, keys, and other private implementation evidence. Those remain governed by their private evidence/ledger contracts.
