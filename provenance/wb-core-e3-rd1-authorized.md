# Workbench Core E3 RD1 - Authorized Production Core-Side Integration

**Status:** AUTHORIZED / CORE-SIDE ACTUATION READY  
**Work stream:** Signalproof Workbench governed Core access  
**Git basis:** `adb25389730ebbd8827bc77e052a0f05393ec79e`  
**Branch:** `candidate/wb-core-e3-rd1`

## Authorization envelope

Owner invocation: `/dsp authorize`.

Resolved pending gate: `production Core integration`.

This no-target authorization binds to the single clearly pending ordered E3 production-integration gate established by the accepted E3 preflight. It does not create a new or broader scope.

Allowed current actuation:

- quiesce the protected Core runtime through its accepted operation worker;
- issue exactly `signalproof.llm-workbench` with `models:invoke` only;
- create the deterministic local token without printing or reading plaintext token contents;
- harden `clients.json`;
- grant Local Service read, not write, on the exact Workbench Core token file;
- restart Core on its accepted loopback port;
- verify protected Core program bytes remain unchanged;
- preserve rollback to the pre-client private-data state if the phase fails.

Excluded:

- production Governor patch/restart in this exact RD1 phase;
- model execution;
- Hermes execution;
- direct Workbench-to-Core access;
- protected Core program mutation;
- protected-main mutation;
- Candidate activation;
- canonical Build Ledger append;
- unrelated production work.

The overall production Core-integration authorization remains bounded to this work stream. RD1 is the Core-side actuation phase; a successful RD1 leaves the Governor patch/restart as the next bounded phase under the same integration target unless the evidence or scope materially changes.

## Accepted prerequisites

E2 RD1.2: isolated Governor-to-Core adapter contract PASS.

E3 PF RD1: `READY_FOR_ORDERED_PRODUCTION_INTEGRATION`.

Observed preflight state:

- protected Core count 39 / anchors exact;
- Core online on `127.0.0.1:43119`;
- activity lock `serve-installed`;
- Workbench Core client absent;
- deterministic Workbench Core token absent;
- `clients.json` broad inherited write requires hardening;
- Local Service exact-token read must be established;
- Governor is still production-active and still has no Core route.

## RD1 artifact

Artifact: `B8A-E3-RD1.ps1`

SHA-256:

`29A6CE1AFA86727752590913454151B5910B5B171E18E56CABFB1C0CA3D7E3FA`

Design properties:

- normal non-elevated owner execution only;
- uses accepted `Invoke-Signalproof-Core-Operation.ps1` interface: `RequestPath`, `ResultPath`, `CancelPath`;
- uses Core-native `issue-client` command with exact client ID and exact `models:invoke` scope;
- native stdout/stderr/exit status are captured separately;
- plaintext token contents are never read;
- pre-client `clients.json` bytes and ACL SDDL are preserved for rollback;
- newly issued token is deleted and `clients.json` exact prestate is restored if post-issuance failure requires rollback;
- Core restart recovery is attempted on failure after quiescence;
- protected Core program anchors are verified before and after;
- no Governor source is changed in RD1;
- no `/v1/models/invoke` request is made;
- no model/Hermes execution occurs;
- no canonical Build Ledger append occurs.

## Next gate

Stage the exact RD1 artifact in `F:\Downloads\Quarantine\Evidence`, verify its SHA-256, parser-preflight the exact staged file, then execute it once from the normal non-Administrator owner PowerShell.

On PASS, continue to the Governor patch + Local Service restart phase. On material failure, preserve the partial-state/recovery evidence and do not replay unchanged.
