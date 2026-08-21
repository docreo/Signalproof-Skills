# Workbench Core E3 RD1.3 - Candidate Correction

**Status:** AUTOMATED CANDIDATE READY / FRESH PRODUCTION AUTHORIZATION REQUIRED  
**Work stream:** Signalproof Workbench governed Core access  
**Git basis:** `adb25389730ebbd8827bc77e052a0f05393ec79e`  
**Branch:** `candidate/wb-core-e3-rd1`

## Latest observed state

E3 Recovery Check RD1.2 returned:

`SAFE_BASELINE / CLIENT_ABSENT / ACL_REHARDEN_REQUIRED`

Observed facts:

- protected Core unchanged;
- Core online at `127.0.0.1:43119` with a live matching `serve-installed` activity lock;
- Workbench Core client absent;
- Workbench Core token absent;
- `clients.json` bytes match the RD1.2 client-absent rollback backup;
- `clients.json` ACL inheritance is not protected;
- broad inherited write is present again.

## Localized RD1.2 failure

The product-native `issue-client` operation rewrites or replaces `clients.json`. The replacement does not preserve the previously hardened file-level DACL. The rollback content copy likewise restores bytes but not the hardened DACL.

Failure layer: `HARNESS / SECURITY-EVIDENCE / FILE-REPLACEMENT ACL PERSISTENCE`.

Failure fingerprint: `CORE CLIENT REGISTRY WRITE REPLACES FILE -> FILE-LEVEL HARDENING LOST`.

Attempt count for this fingerprint: 1.

## RD1.3 material correction

Artifact: `B8A-E3-RD1.3.ps1`

SHA-256:

`4E235D66B80B4BA791B26190622879C387951998FA480FDD255B1092993C165E`

RD1.3 materially changes the failing condition by:

- binding the exact `SAFE_BASELINE / CLIENT_ABSENT / ACL_REHARDEN_REQUIRED` recovery evidence;
- requiring client and token absence before actuation;
- acknowledging the inherited/broad-write `clients.json` ACL as the current safe-recovery baseline requiring hardening;
- stopping Core through the accepted operation worker;
- preserving dead-PID stale-lock semantics from the prior accepted correction;
- issuing exactly `signalproof.llm-workbench` with exactly `models:invoke`;
- explicitly verifying that `issue-client` replacement recreated the inherited/broad-write ACL;
- immediately reapplying the exact least-privilege `clients.json` DACL after that product write;
- hardening the exact Workbench token file for Local Service read/no write;
- using constituent ACL capability bits rather than aggregate rights masks;
- restarting Core on the accepted loopback port;
- verifying the protected 39-file Core program remains byte-identical;
- on failure after client issuance, restoring exact client-absent bytes, deleting the Workbench token without reading it, and then reapplying the hardened `clients.json` DACL after the rollback file replacement.

## Scope boundary

RD1.3 candidate preparation performs no production mutation.

Execution requires fresh owner authorization for the bounded production Core integration gate.

Excluded without separate authority/evidence:

- Governor source patch/restart;
- model or Hermes execution;
- direct Workbench-to-Core routing;
- protected Core program mutation;
- parent-directory ACL changes;
- privilege escalation;
- protected-main mutation;
- Candidate activation;
- canonical Build Ledger append;
- unrelated production work.

## Next gate

Fresh owner authorization for `production Core integration`, then stage/verify/parser-check/execute the exact hash-bound RD1.3 artifact once. On material failure, preserve the new fingerprint and do not replay unchanged. On PASS, return to `build-spawn-debug` for the next evidence-supported Governor integration gate.
