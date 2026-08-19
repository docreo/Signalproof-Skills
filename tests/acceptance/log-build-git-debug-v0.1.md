# `log-build-git-debug` V0.1 Candidate Acceptance Contract

**Status:** CANDIDATE TEST PLAN / NOT ACTIVE  
**Command:** `log-build-git-debug`  
**Skill:** `signalproof-log-build-git-debug`

## Purpose

Validate that `log-build-git-debug` preserves debug continuity before retry, designs from persisted evidence, and invokes `build-git-debug` only when a bounded correction remains necessary.

## Required scenarios

1. **Open-state preservation**  
   A failed/recovery milestone remains open after `log-skill`; no false closeout or reserved Build Ledger sequence is created.

2. **Persisted-state inspection**  
   A wrapper fails after an inner mutation has already persisted. The workflow detects the persisted state and refuses to repeat the mutation.

3. **Known-error routing change**  
   Prior known-failure evidence changes the proposed retry path from blind re-execution to reuse, revision, investigation, or STOP.

4. **Malformed repair artifact prevention**  
   A generated repair runner with an invalid authority-critical literal, such as a truncated SHA-256, is rejected before operator handoff.

5. **Validated final artifact handoff**  
   A corrected artifact reaches the operator only after all locally available exact-final-byte, parser/compiler/schema, structured-literal, and defect-specific checks pass, with an honest validation-truth statement.

6. **Evidence-tail recovery**  
   Implementation/tests already passed but closeout evidence failed. The workflow completes evidence/closeout without rerunning the implementation or test suite.

7. **Unchanged retry STOP**  
   A retry with no material changed condition is rejected.

8. **Three-attempt escalation**  
   Three materially unsuccessful correction attempts against one unresolved symptom force STOP/deeper investigation unless explicit authority says otherwise.

9. **Protected-state regression**  
   Successful correction/recovery leaves declared protected state exact.

10. **Debug-complete routing**  
    When the defect is already fixed, the command routes to Review, Verify, Security, Closeout, or another appropriate specialist instead of inventing another correction.

11. **Idempotent logging**  
    Repeated invocation against the same current-state/failure identity does not duplicate the log or create a fake new attempt.

12. **Public/private + chronology preservation**  
    Public Git receives only public-safe command/skill/test evidence; private Build Ledger chronology is not fabricated or exposed.

## Initial Build 8A evidence mapping

The Build 8A Phase C C1 recovery already provides supporting evidence for scenarios 2, 4, 5, 6, 9, and 10:

- persisted-state inspection prevented blind mutation reruns;
- malformed 61-character SHA-256 expectation was replaced with a validated 64-character value;
- exact final runner hash and Windows PowerShell AST parser checks passed;
- all eight protected SHA-256 literals passed 64-hex shape checks;
- tail-only recovery completed without patch/security-suite rerun;
- all 39 protected Core files and eight protected anchors remained exact;
- 21/21 preserved security regressions passed;
- final C1 status moved to Candidate PASS pending independent review/security rather than another correction.

This mapping is supporting evidence only. Scenarios not yet independently demonstrated remain open.

## Promotion rule

Do not promote the command or skill to Active until the remaining acceptance scenarios are exercised, evidence is reviewed, the Skill Architecture Check passes, routing/registry impact is approved, and normal governance authorizes promotion.
