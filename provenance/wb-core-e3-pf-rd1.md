# Workbench Core E3 Production Integration Preflight RD1

**Status:** AUTHORIZED / PREFLIGHT BUILT / WINDOWS RUNTIME PENDING  
**Authorization target:** production Core integration  
**Git basis:** `adb25389730ebbd8827bc77e052a0f05393ec79e`  
**Branch:** `candidate/wb-core-e3-rd1`

## Objective

Consume the explicit owner authorization only for the bounded Signalproof Workbench production Core integration workstream.

Durable target architecture:

`Workbench -> Governor -> Governor-to-Core adapter -> Signalproof Core Runtime /v1/models/invoke`

The Workbench must not receive the Core credential and must not gain a direct Core HTTP path.

## Accepted prerequisite evidence

- E1 production inspection resolved `ADAPTER_REQUIRED / GOVERNOR_TO_CORE`.
- E2 RD1.2 isolated Governor-to-Core adapter contract passed on the target Windows environment.
- E2 proved positive loopback HTTP 200 / `WOULD_EXECUTE`, six fail-closed negatives, zero negative Core HTTP calls, no plaintext Core token returned, no model/Hermes execution, no production mutation, and protected Core unchanged.
- Current production Governor remains `PRODUCTION_ACTIVE`, Local Service runtime, registered-client authentication boundary intact.

## New prerequisite discovered before mutation

Core `issue-client --client ID --scopes A,B` uses the Core private-data store and therefore participates in the same exclusive Core store activity-lock regime as `serve-installed`.

The live Core writes `runtime/service-state.json` with loopback host/port and holds `runtime/core-activity.lock.json` while `serve-installed` owns the private data store.

Therefore a safe production integration must first observe the current live state and exact client/token/ACL conditions before deciding whether Core must be quiesced for client issuance.

## E3 PF artifact

Artifact: `B8A-E3-PF-RD1.ps1`

SHA-256:

`3408EBD734EC1E83FE68BD25E57E57E8DCEF7BEB0CC692069E92B8C84E422A83`

Mode:

`AUTHORIZED PRODUCTION INTEGRATION PREFLIGHT / READ ONLY`

The preflight:

- requires the normal non-elevated owner context;
- binds exact E2 RD1.2 evidence;
- verifies protected Core count 39 and eight anchors;
- verifies accepted production Governor manifest and key installed bootstrap artifacts;
- verifies activation remains `PRODUCTION_ACTIVE` and Governor runtime identity remains Local Service;
- verifies the production registered-client server still returns the raw Governor decision and contains no Core route;
- reads Core `runtime/service-state.json` and activity-lock metadata only;
- verifies loopback host, valid port, live PID, exact Core executable/data-root identity;
- inspects `config/clients.json` for an existing `signalproof.llm-workbench` record without reading any token content;
- checks deterministic token-file presence only;
- inspects ACLs for broad write on `clients.json` and Local Service read readiness on the exact Workbench token file when it already exists;
- computes the ordered production integration plan from observed state;
- performs no process stop/start, no Core client issuance, no secret-content read, no ACL mutation, no Governor patch, no production request, no protected Core mutation, and no canonical Build Ledger append.

Possible outcomes include:

- reuse existing exact active `models:invoke` client;
- quiesce Core and issue the exact client under the authorized production integration boundary;
- harden `clients.json` if broad write is observed;
- grant Local Service read only on the exact Workbench Core token file if required;
- STOP on inconsistent registry/token/scope state.

## Known-failure continuity

Current Active PowerShell failure registry was reloaded from current main before artifact generation.

Prior E1/E2 harness failures remain preserved. This preflight avoids the previously observed `ProcessStartInfo.ArgumentList`, ambiguous dictionary membership, and JavaScriptSerializer object-shape paths.

## Authority

The owner explicitly authorized `production Core integration`.

This authorization is bound to the ordered integration required to connect the production Governor to protected Core for the already-approved Workbench capability while preserving least privilege and rollback.

The authorization does not grant canonical Build Ledger append, protected-main bypass, unrelated product work, Candidate Skill activation, or unrestricted credential disclosure.

## Next gate

Run exact E3 PF RD1 as the normal non-Administrator owner. If PASS, generate the exact ordered production integration runner from the observed state rather than guessing process/ACL/client conditions.
