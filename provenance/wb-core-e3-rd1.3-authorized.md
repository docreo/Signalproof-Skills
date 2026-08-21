# Workbench Core E3 RD1.3 - Fresh Production Authorization

**Status:** AUTHORIZED / BUILD-SPAWN-DEBUG TARGET EXECUTION READY  
**Work stream:** Signalproof Workbench governed Core access  
**Git basis:** `adb25389730ebbd8827bc77e052a0f05393ec79e`  
**Branch:** `candidate/wb-core-e3-rd1`

## Owner invocation

`/dsp authorize production Core integration build-spawn-debug`

The owner explicitly authorizes the pending production Core integration gate and directs continuation under the canonical `build-spawn-debug` workflow.

## Exact authorized candidate

Artifact:

`B8A-E3-RD1.3.ps1`

SHA-256:

`4E235D66B80B4BA791B26190622879C387951998FA480FDD255B1092993C165E`

Local artifact identity was rechecked before authorization binding and matches this SHA-256 exactly.

## Current evidence basis

Latest read-only recovery evidence:

`SAFE_BASELINE / CLIENT_ABSENT / ACL_REHARDEN_REQUIRED`

Observed state:

- protected Core unchanged;
- Core online at `127.0.0.1:43119` with live matching `serve-installed` activity lock;
- Workbench Core client absent;
- Workbench Core token absent;
- `clients.json` bytes match the client-absent rollback backup;
- `clients.json` DACL is inherited/unprotected and broad write is present.

## RD1.3 material correction

RD1.3 addresses the distinct RD1.2 failure fingerprint:

`CORE CLIENT REGISTRY WRITE REPLACES FILE -> FILE-LEVEL HARDENING LOST`

The candidate:

- binds the exact latest safe-baseline recovery evidence;
- stops Core through the accepted operation worker;
- preserves accepted stale dead-PID lock handling;
- issues exactly `signalproof.llm-workbench` with exactly `models:invoke`;
- verifies `issue-client` recreated the inherited/broad-write `clients.json` ACL;
- immediately reapplies the exact hardened `clients.json` DACL after the product rewrite;
- hardens the exact Workbench token for Local Service read/no write;
- uses constituent ACL capability bits rather than aggregate enum masks;
- restarts Core on the accepted loopback port;
- verifies protected Core program bytes remain unchanged;
- on bounded failure, restores client-absent bytes, removes the Workbench token without reading it, and reapplies the hardened `clients.json` DACL after rollback file replacement.

## Authorized scope

Allowed:

- exact RD1.3 stop / client issue / clients.json rehardening / token hardening / Core restart / verification / bounded safe recovery;
- operational evidence for this exact phase;
- continuation under `build-spawn-debug` from the observed result.

Excluded:

- Governor source patch/restart in RD1.3;
- model or Hermes execution;
- direct Workbench-to-Core routing;
- protected Core program mutation;
- parent-directory ACL changes;
- privilege escalation;
- protected-main mutation;
- Candidate activation;
- canonical Build Ledger append;
- unrelated production work.

## Consumption

This fresh production authorization is consumed when RD1.3 completes, materially fails, or its evidence/scope changes enough to invalidate the owner decision.

On PASS, return to `build-spawn-debug` for the next evidence-supported Governor integration gate. On material failure, preserve the new fingerprint and do not replay unchanged.
