# log-build-git-debug — Build 8A Phase C C1 State Log

**Status:** LOGGED / DEBUG COMPLETE / INDEPENDENT REVIEW + SECURITY REQUIRED  
**Date:** 2026-08-19  
**Command:** `log-build-git-debug`  
**Repository:** `docreo/Signalproof-Skills`  
**Candidate branch:** `command-build-git-debug-v0.1`

## Git basis at invocation

- Canonical public `main`: `f3d826651425bad0c8c311d4888bdd96e99e4e88`
- Candidate command branch before this log: `41907682ffed0f661aca734730bdf9f1e1042798`
- PR: #129, Draft / Open / Candidate
- Latest suite-consistency run on the pre-log candidate head: PASS

This log does not claim a canonical private Build Ledger append or reserve a `C###` sequence.

## Work stream

Signalproof Hermes Governor — Build 8A — Phase C — C1 Core PEP candidate.

## Persisted product/candidate state

Current supported state:

> **PHASE C C1 CANDIDATE PASS — CORE PEP IMPLEMENTED; 21 SECURITY REGRESSIONS PASS.**

C1 remains **NOT ACCEPTED** pending independent review/security.

Frozen identities:

- Candidate source SHA-256: `D7FA3544EBF2A9DA3A98E3066C90CCCD4269C68A4CAFEC5C0679070C462DDB52`
- C1 manifest SHA-256: `3568845AE10295C68F08A9E6CB025447C1590C8A67D58E789072CD9F2AD9014C`
- C1 evidence SHA-256: `ED09CB878339A19198ECD14D42C69D68870EEFEA6B2B3BDAC0BBFE14D223E494`
- C1 report SHA-256: `9CF99FF6851894DAD7C58E78DCAE852198811EAB7E1B6172F53A2B3A0D154C83`

Verified result in the accepted recovery tail:

- 21 / 21 preserved security regressions PASS;
- direct model-invoke bypass removed in the isolated candidate;
- protected Core unchanged;
- Gate-7 provenance unchanged;
- mutable RD1 working source unchanged;
- no Hermes execution;
- no model execution.

## Debug/failure state preserved

The C1 stream encountered multiple harness/recovery defects while the underlying candidate progressed. Public-safe failure classes preserved by the current command/acceptance evidence include:

- harness/native exit-code capture false failure;
- patcher execution failure followed by bounded continuation;
- evidence serialization hang after implementation/tests had already passed;
- protected-anchor validation false negative caused by an expected SHA-256 literal truncated to 61 characters;
- corrected exact-final artifact validation with all protected SHA-256 literals machine-checked as 64 hex characters.

The final malformed-hash correction was a **harness/expectation correction**, not a protected Core repair.

## Known-error / recurrence constraints

Before any future Build 8A runner, validator, recovery, or review harness:

- parser-validate the exact final PowerShell artifact when applicable;
- machine-check authority-critical literal shape and length, especially SHA-256;
- do not use wildcard semantics as an exact source-literal assertion;
- capture native stdout/stderr/exit status independently;
- inspect persisted state before rerunning a mutation after an outer wrapper failure;
- do not rerun implementation/tests merely to repair an evidence-writing tail;
- do not treat static/syntax/hash evidence as runtime/security acceptance beyond its scope.

## Changed-condition decision

No further debug correction is currently justified.

The defect is corrected and the candidate is frozen. Another repair runner would be an unnecessary mutation/retry path and would violate the command rule to exit Debug when the next owner is Review/Security.

## Skill Architecture Check

New Candidate skill under the same PR:

`signalproof-log-build-git-debug`

- Current `SKILL.md` exact Git-reported size: **12,015 UTF-8 bytes**
- Budget status: **12,000–14,999 review band**
- Lifecycle: **Candidate / Not Active**
- Atomicity decision: responsibility is cohesive enough for Candidate testing, but **decomposition/conciseness review is required before any material expansion**.
- No promotion to Active is authorized by this log.
- No registry/router Active entry is created by this log.

## design-git result — Next Action Contract

```text
NEXT ACTION CONTRACT
Work stream: Signalproof Hermes Governor / Build 8A / Phase C / C1
Git basis: Signalproof-Skills main f3d826651425bad0c8c311d4888bdd96e99e4e88; C1 artifact identities frozen above
Current state: C1 CANDIDATE PASS / NOT ACCEPTED
Objective: independently review the isolated Core PEP candidate and security boundary before C1 acceptance
Route: signalproof-review -> signalproof-security -> signalproof-verify as required
Action class: REVIEW / SECURITY / VERIFY
Protected state: deployed Core Runtime, Gate-7 provenance, mutable RD1 working source, frozen C1 candidate/manifest/evidence/report
Allowed surface: read-only inspection of frozen candidate source, patch/result evidence, tests, manifest, trust/route contract, and prior C1/C2 evidence
Known-failure constraints: no stale/truncated literals; no wildcard exact-match assertions; no blind mutation rerun; no static/runtime conflation; no evidence-tail implementation rerun
Dependencies/authority: isolated review only; protected Core mutation NOT authorized; Hermes execution NOT authorized; model execution NOT authorized; production activation NOT authorized
Acceptance evidence: independent Review decision plus Security disposition covering signature/trust verification, request/decision binding, caller/application binding, route-specific capability/operation/permission binding, replay/revocation/expiry/epoch enforcement, bypass removal, failure behavior, and evidence-scope fidelity
STOP conditions: any frozen artifact identity mismatch; material protected-state discrepancy; unresolved BLOCKER/MAJOR review finding; security evidence insufficient for the claim; proposed correction requires new mutation authority; Git/evidence basis materially changes
Closeout trigger: C1 may move from Candidate PASS to accepted only after independent review/security/verification supports that decision; otherwise return to bounded Debug/Plan with the finding preserved
```

## build-git-debug phase result

**NO DEBUG EXECUTION PERFORMED.**

Reason: debugging is complete within the current evidence. The designed next action belongs to independent Review/Security, so `log-build-git-debug` correctly exits rather than manufacturing another fix.

## Final command status

**LOGGED -> DEBUG COMPLETE -> REVIEW + SECURITY REQUIRED**

This status does not authorize protected mutation, Hermes/model execution, production activation, skill activation, PR merge, or canonical private Build Ledger append.
