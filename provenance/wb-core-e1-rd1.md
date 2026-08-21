# Workbench Core E1 RD1

**Status:** PREFLIGHT / STATIC PASS / WINDOWS RUNTIME INSPECTION PENDING  
**Work stream:** Signalproof Workbench governed Core access  
**Git basis:** `80a21ccb324d96d4970ce9f61a279cb85ffcd16d`  
**Branch:** `candidate/wb-core-rd1`

## Objective

Establish the exact remaining production integration gap between the already-proven Workbench -> Governor control path and the protected Signalproof Core Runtime, without creating a direct Workbench -> Core bypass and without mutating production.

Durable target path:

```text
Workbench -> Signalproof Governor -> Signalproof Core Runtime -> approved capability
```

## Accepted evidence consumed

Prior accepted evidence establishes:

- production Workbench -> Governor registered-client authentication PASS;
- Governor decision `ALLOW` for the current Workbench governed request;
- production Governor runtime identity Local Service;
- Build 8A D1/D1-R2 isolated proof traversed actual Core authentication, `POST /v1/models/invoke`, `models:invoke`, and `GovernorDecisionEnforcer` PEP through a non-executing `WOULD_EXECUTE` sentinel;
- protected Core remained unchanged;
- current protected Core exposes `/v1/models/invoke` POST and keeps provider/model names abstracted from applications.

Prior Governor review also established that the accepted production Governor host intentionally contained no direct `/v1/models/invoke` path or HTTP client, while its bootstrap contract reserved `models:invoke` as a later Core scope. This makes a missing Governor-to-Core adapter the leading hypothesis, but E1 runtime inspection must confirm the exact installed production state before implementation.

## Spawn / Full Debug lanes

No true independent agents are available. `build-git spawn and debug all` is being executed as logical Builder, Design, and Governor lanes under the main Signalproof Orchestrator.

- **Builder:** inspect installed Workbench/Governor/Core surfaces and localize the missing bridge. Do not rewrite protected Core.
- **Design:** preserve `Workbench -> Governor -> Core`; do not add direct Core access to Workbench.
- **Governor:** preserve production activation, runtime identity, signing state, ACL/task configuration, protected Core, and evidence boundaries. Do not infer secrets, production deployment, protected-main, or canonical Build Ledger authority.

## E1 artifact

Artifact: `B8A-E1-CORE-RD1.ps1`

SHA-256:

`D2959A239471E843329D582FE77B78C2AF65010C39B099A0B62BF1295715AFA2`

Mode:

`READ-ONLY PRODUCTION BRIDGE INSPECTION`

The runner:

- requires the normal non-elevated Workbench user;
- verifies installed Workbench and accepted Governor manifest identities;
- verifies activation is `PRODUCTION_ACTIVE`;
- verifies Local Service runtime evidence and signing-key presence without reading signing-key contents;
- verifies the protected 39-file Core baseline and eight anchors;
- parses the Core OpenAPI contract and checks `/v1/models/invoke` POST;
- verifies selected installed Governor source artifacts against the accepted 56-entry production manifest;
- inspects whether a production Governor-to-Core route/client surface is actually present;
- optionally inspects the accepted Workbench source if that source is locally available;
- performs no Governor pipe request, Core HTTP request, Core-token read, signing-key read, process start, Scheduled Task query, live redirected-log read, production mutation, protected Core mutation, or canonical Build Ledger append.

Possible dispositions:

- `EXISTING_BRIDGE_FOUND / VERIFY_ONLY`
- `ADAPTER_REQUIRED / GOVERNOR_TO_CORE`
- STOP on contradictory contract/state evidence.

## Static validation

- ASCII controlled;
- current machine-checkable Signalproof PowerShell known-error preflight: PASS / no findings;
- no ACL mutation commands;
- no task query;
- no process launch from inside the E1 inspection runner;
- no Core HTTP invocation;
- no live production stdout/stderr access;
- no destructive file operation.

The Linux authoring environment does not provide Windows PowerShell, so exact-final Windows PowerShell parser validation and target runtime inspection remain owner-machine gates.

## Authority

Current `/dsp build-git spawn and debug all` authority covers this bounded read-only investigation and subsequent isolated non-production candidate work that does not cross excluded authority classes.

It does not authorize:

- production Governor/Core modification or deployment;
- Core client/token issuance in production;
- credential or secret disclosure;
- privilege/security-control changes;
- protected Core mutation;
- protected-main mutation;
- Candidate activation;
- canonical Build Ledger append.

## Next gate

Stage the exact E1 runner in `F:\Downloads\Quarantine\Evidence`, verify SHA-256, parser-preflight the exact final staged file in Windows PowerShell, and execute it once as the normal non-Administrator Workbench user.

If E1 confirms `ADAPTER_REQUIRED / GOVERNOR_TO_CORE`, build the smallest isolated non-production Governor-to-Core adapter candidate next. Do not modify production until that candidate passes review/security/runtime gates and a separate production integration authority is established.
