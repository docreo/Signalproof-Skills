# Workbench Core E1 RD1.2

**Status:** PASS / ADAPTER REQUIRED / EVIDENCE-WRITER FAILURE PRESERVED  
**Work stream:** Signalproof Workbench governed Core access  
**Git basis:** `80a21ccb324d96d4970ce9f61a279cb85ffcd16d`  
**Branch:** `candidate/wb-core-rd1`

## Accepted E1 product result

E1 RD1.1 completed the read-only production bridge inspection before its evidence serializer failed.

Observed product/contract evidence established:

- production activation status `PRODUCTION_ACTIVE`;
- protected Core count 39 and all eight protected anchors exact before inspection;
- Core OpenAPI exposes `POST /v1/models/invoke`;
- Core provider/model abstraction contract remains present;
- production Governor host has no `/v1/models/invoke` route;
- registered-client server has no Core route;
- Governor project server has no Core route;
- Governor execution surface has no `models:invoke` route/client and no HTTP client;
- bootstrap contract records `core_scope_later = models:invoke`;
- accepted Workbench source uses the exact Governor named-pipe client;
- Workbench has no direct Core invoke path;
- Workbench has no direct network/Core path;
- E1 disposition resolved to `ADAPTER_REQUIRED / GOVERNOR_TO_CORE`;
- Core bridge status resolved to `NOT_PRESENT_IN_PRODUCTION_HOST`;
- protected Core count 39 and all anchors remained exact after inspection;
- installed Workbench remained unchanged;
- installed Governor accepted manifest remained unchanged.

## Downstream harness failure

After the product inspection and postflight non-mutation checks had passed, `System.Web.Script.Serialization.JavaScriptSerializer.Serialize(...)` failed while writing the final E1 JSON evidence object:

`A circular reference was detected while serializing an object of type 'System.Management.Automation.PSMethod'.`

Classification:

`POWERSHELL HARNESS / EVIDENCE WRITER`.

This failure does not contradict any accepted E1 product or protected-state claim.

## Evidence-sufficiency decision

Do not replay E1. The required product question is already answered by observed runtime output and postflight checks.

Accepted E1 disposition:

`PASS / ADAPTER_REQUIRED / GOVERNOR_TO_CORE`.

The serializer failure is preserved separately as Candidate failure intelligence `KE-PS-JSSERIALIZER-PSMETHOD-001` and does not become Active prevention doctrine through this record.

## Protected state

No production Governor request, Core HTTP request, Core token read, signing-key read, task query, live redirected-log read, production mutation, protected Core mutation, or canonical Build Ledger append occurred during E1.

## Next gate

Build and test the smallest isolated non-production Governor-to-Core adapter candidate using the already-proven Core route contract. Production integration remains a separate mutation/authority gate.
