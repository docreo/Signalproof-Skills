# Build 8A D4 Workbench and Persistence Checkpoint

**Status:** WORKBENCH AUTH PASS / PERSISTENCE-RESTART-RECONNECT PASS / PRODUCTION ACTIVATION NOT YET EXECUTED  
**Lifecycle:** synchronized checkpoint; activation-gate orchestration remains CANDIDATE  
**Git basis:** `9ca0efaae4a0c275ae28148917cfefa0e5f40a8f`

## Accepted evidence added since the prior bounded E2E checkpoint

### Actual LLM Workbench wiring through Governor

The isolated Workbench V1 RD3 candidate was derived from the frozen RD2 Workbench with the registered-client authentication handshake added before the existing Governor request.

Accepted properties:

- actual RD3 executable compiled successfully;
- bounded Workbench self-test passed;
- registered-client authentication protocol present;
- client requires an existing signing-key container rather than generating authority ad hoc;
- client signs the Governor challenge;
- Governor `auth_ok` is required before the governed request is sent;
- no direct Core, Ollama/model, Hermes, network, or shell/process bypass path was introduced;
- actual RD3 executable authenticated to the accepted Governor and received `ALLOW`;
- temporary client-side test signing material was removed after the proof;
- frozen RD2 baseline and protected Core remained unchanged;
- no production registration or production activation occurred.

### Persistence / restart / reconnect candidate

A temporary non-production Windows Scheduled Task candidate exercised the selected persistence architecture under `NT AUTHORITY\LOCAL SERVICE`.

Accepted properties:

- current shell was elevated for the temporary task proof;
- accepted Governor artifacts were staged byte-exact from the accepted manifest;
- task principal resolved authoritatively to SID `S-1-5-19`;
- task logon type was `ServiceAccount`;
- exactly one `AtStartup` trigger was configured;
- task restart policy was configured;
- first Local Service start reached Governor READY;
- actual RD3 Workbench authenticated and received `ALLOW`;
- second start/restart reached Governor READY again;
- actual RD3 Workbench reconnected, reauthenticated, and received `ALLOW` again;
- task wrapper executed exactly twice;
- temporary task was unregistered after the proof;
- temporary client signing key was removed;
- temporary staging was removed;
- production product/data roots remained absent;
- production arm was not used;
- protected Core remained unchanged;
- Hermes/model execution was not required for this evidence class.

## Failure lineage and reusable lessons

The following failures were preserved as harness evidence rather than incorrectly regressing already-proven product/security claims:

1. **Parser guard defect:** a PowerShell command invocation used directly as the left operand of `-and` caused a parser failure. Correction: parenthesize command results before Boolean composition.
2. **Privilege prerequisite stop:** the persistence proof correctly stopped in a non-elevated shell. The same exact runner was reused after the execution environment changed to an elevated shell.
3. **Task principal normalization:** Task Scheduler returned `LOCAL SERVICE` rather than one anticipated literal display string. Correction: normalize the returned principal to its SID and compare against authoritative SID `S-1-5-19`; separately require `ServiceAccount` logon type.
4. **Governor registration/public-key separation:** Governor registration metadata must contain public registration material only and record private-key persistence as false even when a temporary client-side key container exists for the test. Client key lifetime and Governor registration metadata are distinct evidence surfaces.
5. **Recovery completeness:** temporary parent-process cleanup must account for owned child processes; residual child cleanup is a recovery-lane issue and does not automatically invalidate already-sufficient E2E/security evidence.

These lessons are candidate failure-prevention knowledge. They do not auto-promote a Skill or command.

## Evidence sufficiency

Do not replay the following evidence classes unless the relevant component/environment changes, contradictory evidence appears, a missing required gate is discovered, or prior evidence is invalidated:

- architecture;
- registered-client authentication matrix;
- D3 Governor integration;
- Hermes governed-worker proof;
- bounded Governor-to-Hermes E2E;
- actual Workbench-to-Governor registered authentication;
- Local Service start/restart/reconnect persistence proof.

## Remaining evidence class

The remaining technical acceptance work before the final activation decision is the consolidated production-like governance lane:

- audit acceptance;
- revocation acceptance;
- rollback/update acceptance;
- resulting activation-gate verdict.

Production activation remains a separately gated actuation step.

## Governance

- This record is public-safe and omits local evidence paths, secrets, private recovery data, and private Build Ledger chronology.
- No canonical Build Ledger sequence is reserved or claimed.
- No candidate is promoted to Active by this checkpoint.
- No production activation is performed by this checkpoint.
