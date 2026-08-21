# Workbench Core E3 RD1.2 - Fresh Production Authorization

**Status:** AUTHORIZED / BUILD-SPAWN-DEBUG TARGET EXECUTION READY  
**Work stream:** Signalproof Workbench governed Core access  
**Git basis:** `adb25389730ebbd8827bc77e052a0f05393ec79e`  
**Branch:** `candidate/wb-core-e3-rd1`

## Owner invocation

`/dsp authorize production Core integration build-debug-spawn`

Context resolves the trailing `build-debug-spawn` wording to continuation of the already-active canonical `build-spawn-debug` workflow for the same production Core integration workstream. No broader command or unrelated production authority is inferred.

## Authorization target

Exact candidate:

`B8A-E3-RD1.2.ps1`

SHA-256:

`63D37A409C03EE0DF331B9B0A4DB020BDF4A6C5FAEB01D905AC68FFB763FC11F`

## Evidence basis

- E2 RD1.2 isolated Governor-to-Core adapter contract: PASS.
- E3 PF RD1: `READY_FOR_ORDERED_PRODUCTION_INTEGRATION`.
- E3 RD1: stop PASS; harness misclassified persisted dead-PID lock; recovery restored baseline.
- E3 RC RD1: `RECOVERED_BASELINE`.
- E3 RD1.1: stop PASS; stale-lock semantics PASS; issue-client PASS; exact `models:invoke` scope PASS; token created without plaintext exposure; ACL hardening applied; verifier then falsely classified Local Service read-only as write-capable.
- RD1.1 recovery restored `clients.json` bytes but full-SDDL restoration hit `SeSecurityPrivilege`.
- E3 RC RD1.1: `SAFE_PARTIAL / ORPHAN_TOKEN_AFTER_ROLLBACK`; Core online on accepted loopback port; protected Core unchanged; client record absent; orphan token present with correct Local Service read/no-write ACL; `clients.json` bytes at client-absent prestate; `clients.json` ACL remains hardened and has no broad write.

## RD1.2 material corrections

- bind the accepted safe-partial evidence;
- preserve the already-hardened `clients.json` ACL rather than recreating the weaker inherited prestate;
- quiesce Core through the accepted operation worker;
- validate dead-PID stale-lock semantics;
- remove the orphan token only after Core is quiesced, without reading token contents;
- reissue exactly `signalproof.llm-workbench` with exactly `models:invoke`;
- harden the new token ACL;
- verify write capability using constituent write/destructive bits rather than aggregate `FullControl`/`Modify` masks;
- restart Core on the accepted loopback port;
- on bounded failure, restore a safe client-absent state while preserving the hardened client-registry ACL, avoiding full-SDDL restoration and `SeSecurityPrivilege` dependence.

## Authorized scope

Allowed:

- exact RD1.2 Core stop / orphan cleanup / client issuance / token ACL / Core restart / verification / bounded safe recovery;
- operational evidence for this exact phase;
- Build Spawn Debug continuation based on the observed result.

Excluded:

- Governor patch/restart in RD1.2;
- direct Workbench-to-Core route;
- model or Hermes execution;
- protected Core program mutation;
- unrelated production changes;
- protected-main mutation;
- Candidate activation;
- canonical Build Ledger append.

## Consumption

This fresh production authorization is consumed when RD1.2 completes, materially fails, or the evidence/scope changes enough to invalidate the owner decision.

A successful RD1.2 returns control to the canonical `build-spawn-debug` coordinator for the next evidence-supported gate. It does not fabricate authorization beyond the bounded production Core integration target.
