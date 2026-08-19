# build-git-debug V0.1 Candidate — Acceptance Evidence 2026-08-19

**Status:** TEST EVIDENCE / CANDIDATE COMMAND REMAINS NOT ACTIVE  
**Command:** `build-git-debug`  
**Repository:** `docreo/Signalproof-Skills`  
**Candidate branch:** `command-build-git-debug-v0.1`

## Test case

Build 8A / Phase C / C1 tail closeout exposed a malformed protected-state SHA-256 expectation in a generated PowerShell recovery runner.

Observed malformed expected value:

`223A93B9979FD0FD94733A1E848A629B0989090EB22894337EEB8F026BCCAC44`

Observed malformed length: **61** characters.

Trusted live Control Center SHA-256 recovered from operator evidence:

`223A93B9979FD0FD94733A1E848A629B0989090FD0EB22894337EEB8F026BCCAC44`

Trusted live length: **64** hex characters.

The defect was classified as **HARNESS-ONLY TRUNCATED CONTROL-CENTER SHA256 LITERAL**. Product/Core failure was not inferred from the malformed expectation.

## Candidate correction artifact

Runner:

`B8A-PHASE-C-C1-R3-R2.ps1`

Runner SHA-256:

`A8DF6A9861A75AE6A3873F7264DA607CA3BBEFAE588D7507BA1D2C181A56208D`

The candidate runner added/retained:

- exact-final-runner SHA verification;
- operator-side Windows PowerShell AST parser preflight;
- mandatory `^[0-9A-F]{64}$` validation for every protected-anchor SHA-256 literal;
- eight protected-anchor shape checks;
- exact two-read protected-anchor hashing;
- frozen-manifest validation;
- persisted R2 patch-result verification;
- preserved 21-test result verification without rerunning the patch or security suite;
- deterministic evidence/report tail writing without `ConvertTo-Json`;
- no Node execution, patch execution, Hermes execution, model execution, or protected Core mutation.

## Operator runtime result

The exact final runner hash passed and Windows PowerShell AST parser reported zero errors.

All eight protected-anchor SHA-256 literals passed the 64-hex shape gate.

Protected Core preflight passed:

- protected Core file count: 39;
- all eight protected anchors: two independent SHA-256 reads exact.

Frozen C1 manifest passed:

`3568845AE10295C68F08A9E6CB025447C1590C8A67D58E789072CD9F2AD9014C`

Frozen candidate source SHA-256:

`D7FA3544EBF2A9DA3A98E3066C90CCCD4269C68A4CAFEC5C0679070C462DDB52`

R2 patch verification passed:

- ModelRouter anchor exactly one;
- direct invoke anchor exactly one;
- export anchor exactly one;
- old direct invoke bypass absent;
- mandatory Core PEP route present;
- PEP export present;
- candidate syntax-check stderr empty.

All **21 / 21** preserved security regressions passed without rerun, including replay, tamper, signature, DENY, expiry, epoch, revocation, client identity, permission expansion, runtime authority, missing trust, cross-capability/operation/permission reuse, mandatory PEP route, actuation binding, model capability restriction, old direct invoke absence, and replay-state persistence.

Final protected-state recheck passed:

- Gate-7 provenance unchanged;
- mutable RD1 working source unchanged;
- frozen manifest unchanged;
- protected Core count 39;
- all eight protected anchors exact on two independent reads.

Final evidence/report were created successfully.

Evidence SHA-256:

`ED09CB878339A19198ECD14D42C69D68870EEFEA6B2B3BDAC0BBFE14D223E494`

Report SHA-256:

`9CF99FF6851894DAD7C58E78DCAE852198811EAB7E1B6172F53A2B3A0D154C83`

Final product-state decision:

> **PHASE C C1 CANDIDATE PASS — CORE PEP IMPLEMENTED; 21 SECURITY REGRESSIONS PASS.**

C1 itself remains **NOT ACCEPTED** pending independent review/security.

## build-git-debug acceptance mapping

### Scenario 1 — Malformed SHA literal prevention

**PASS.**

A 61-character SHA-256 expectation caused a reproducible false protected-state failure. The corrected command path machine-validated all protected SHA-256 literals as exactly 64 hex characters before substantive tail-closeout execution, and the valid 64-character value passed.

### Scenario 2 — Harness-versus-product discrimination

**PASS for this incident.**

The truncated expected literal was classified as harness/expectation failure rather than Core/product failure. No protected Core repair was performed.

### Scenario 7 — Protected-state regression

**PASS.**

The corrected recovery completed with all 39 protected Core files accounted for and all eight protected anchors exact on final two-read verification.

### Scenario 9 — Evidence-tail recovery

**PASS.**

The recovery verified already-completed patch/security work and wrote missing closeout evidence without rerunning the patch or 21-test security suite.

## Remaining candidate acceptance work

The following command scenarios remain to be independently exercised or formally accepted before promotion:

- exact-literal wildcard prevention;
- native exit-code handling;
- changed-condition retest discipline;
- three-attempt STOP/escalation;
- staging separation as a formal command acceptance case.

Historical Build 8A failures may inform these tests, but they are not silently promoted to command acceptance evidence here.

## Governance

This file records candidate-command test evidence only.

It does **not**:

- activate `build-git-debug`;
- modify protected Core Runtime;
- authorize Hermes/model execution;
- authorize production activation;
- create or claim a canonical Build Ledger event.
