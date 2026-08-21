# KE-PS-JSSERIALIZER-PSMETHOD-001

**Status:** CANDIDATE  
**Class:** PowerShell / System.Web JavaScriptSerializer / adapted PowerShell objects  
**Discovered:** Workbench Core E1 RD1.1 evidence finalization

## Failure fingerprint

A Windows PowerShell harness successfully completes the target inspection and then calls `System.Web.Script.Serialization.JavaScriptSerializer.Serialize(...)` on a nested PowerShell evidence object. Serialization fails with a circular-reference error involving `System.Management.Automation.PSMethod`.

Observed error:

`A circular reference was detected while serializing an object of type 'System.Management.Automation.PSMethod'.`

## Risk

A downstream evidence writer can falsely make a completed read-only product inspection appear to have failed. Replaying the product inspection would add cost and risk without improving the already-established product claim.

## Prevention candidate

- Do not assume `JavaScriptSerializer` can safely serialize arbitrary PowerShell-adapted objects, ordered dictionaries, or objects carrying adapted members.
- Before serialization, project evidence into plain scalar/array/map data or use a controlled JSON writer for Signalproof-owned evidence schemas.
- For controlled PowerShell evidence objects, `ConvertTo-Json` may be appropriate only after shape normalization and with explicit depth; this does not override separate Windows PowerShell 5.1 external-JSON parsing constraints.
- If serialization fails after all target product checks and postflight non-mutation have already passed, classify the failure as evidence-writer/harness evidence and apply evidence-sufficiency termination rather than replaying the target operation.
- Preserve the failed evidence lane and use a new revision for any evidence-writer correction.

## Build 8A E1 evidence pattern

E1 RD1.1 established before serialization:

- production activation `PRODUCTION_ACTIVE`;
- protected Core exact, count 39 and anchors exact;
- Core OpenAPI exposes `POST /v1/models/invoke`;
- production Governor has no Core route, `models:invoke` execution surface, or HTTP client;
- Workbench uses the Governor named pipe and has no direct Core/network path;
- disposition `ADAPTER_REQUIRED / GOVERNOR_TO_CORE`;
- postflight protected Core exact;
- installed Workbench unchanged;
- installed Governor manifest unchanged.

Only the final JSON evidence serialization failed.

## Governance

Candidate failure intelligence only. It does not modify Active PowerShell prevention data, authorize retries, alter product state, or append the canonical Build Ledger. Promotion requires normal Known Errors/Learn governance and regression coverage.
