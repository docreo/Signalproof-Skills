# Signalproof Hermes Governor Build 8A - Error Lineage

**Status:** PUBLIC-SAFE EVIDENCE RECORD  
**Window:** approximately the six hours preceding 2026-08-19 22:15 America/Los_Angeles  
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

**Known-error relationship:** provenance/source-authority separation and repeated-failed-path prevention.

### B8A-D3-R3-C1 - Heterogeneous response property assumption

**Class:** PowerShell result parsing / heterogeneous object schema  
**Disposition:** FAILED LANE PRESERVED; corrected in fresh lane

The lane completed provenance recovery, protected-state verification, frozen-baseline copy verification, static checks, and reached bounded live integration. The good pipe client connected. The client harness then dereferenced a `decision` property on a normal response variant that did not expose that property and terminated under StrictMode.

**Important classification:** this was not evidence that registered-client authentication failed. The failure occurred in the PowerShell response-consumption layer.

**Active known-error match:** `KE-HETEROGENEOUS-PROPERTY-001`.

**Prevention:** classify message variants and test property presence before dereferencing optional fields. Preserve the semantic distinction between challenge, authentication result, and final Governor decision.

### B8A-D3-R3-C2 - StrictMode collection Count assumption

**Class:** PowerShell result parsing / null-scalar collection shape  
**Disposition:** FAILED LANE PRESERVED; fresh correction required

After the property-presence correction, the next lane exposed another shape assumption: a value that can legitimately be `$null` or scalar under successful operation was accessed through direct `.Count` while `Set-StrictMode` was active. A successful no-error parser result can therefore be turned into a false harness failure because `$null.Count` is not a safe cardinality check in this context.

The exact recurring pattern includes parser-error collections and other values whose cardinality may be zero, one, or many depending on PowerShell pipeline behavior.

**Important classification:** this remains a harness/control-plane test defect. It is not product or authentication failure evidence by itself.

**Known-error relationship:** `KE-HETEROGENEOUS-PROPERTY-001`, `KE-REPEATED-FAILED-PATH-001`, and PowerShell exact-final harness prevention.

**Prevention:** normalize every potentially null/scalar collection before cardinality checks, for example `@($value).Count`. Do not patch only the first observed `.Count`; inspect the full consequential runner for equivalent shape-sensitive gates before retest.

**Next correction requirement:** preserve R3-C2 unchanged; create a fresh lane; normalize all consequential `.Count` gates; parser-preflight exact final bytes on Windows; rerun the bounded matrix only after the condition materially changes.

## Workflow / operator-command defect observed in the same window

### Repeated authorization-loop behavior

**Class:** orchestration / operator workflow  
**Disposition:** CORRECTED IN CURRENT DSP AUTHORIZATION HANDLER

Repeated authorization prompts occurred even after bounded non-production continuation had already been granted.

**Prevention:** authorization remains exact and scoped, but once a valid envelope exists for the current action, ordinary in-scope continuation consumes that authority. Stop only when the work materially changes scope or crosses an excluded boundary.

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
11. Continue automatically inside a valid bounded authorization envelope; do not manufacture new authority or repetitive owner gates.
12. When a shape bug is discovered, scan the entire consequential runner for equivalent property/cardinality assumptions before retest.

## Current status at this record

- D2 client-authentication architecture remains accepted.
- Process-opening/executable-path authorization family remains retired.
- D3 integration has reached live bounded testing but remains blocked by localized PowerShell harness-shape defects.
- R3, R3-C1, and R3-C2 remain preserved failed lanes.
- The next technical action is a fresh count-safe response lane that normalizes null/scalar collections before cardinality checks and reruns exact-final Windows parser validation.
- No production Governor activation is claimed.
- No canonical private Build Ledger append is claimed by this public record.

## Public/private boundary

This file intentionally omits local filesystem locations, private evidence hashes, protected Core hashes, private Build Ledger sequence/head information, credentials, private keys, and other private implementation evidence. Those remain governed by their private evidence/ledger contracts.
