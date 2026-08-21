# `build-spawn-debug` - Active Operator Command V0.1.0

**Status:** ACTIVE  
**Version:** 0.1.0  
**Owner:** Doc Reo

## Purpose

`build-spawn-debug` is the canonical Dr. Signalproof command behind `/dsp build-spawn-debug`.

It coordinates the Active `signalproof-build-spawn-debug` Skill so Signalproof can keep building, challenging, debugging, and verifying a bounded UI/product problem until the automated acceptance envelope passes or a real STOP condition is reached.

Canonical route:

`/dsp build-spawn-debug -> build-spawn-debug -> signalproof-build-spawn-debug`

Accepted forms include:

```text
/dsp build-spawn-debug
/dsp build spawn debug
dsp-build-spawn-debug
dsp build-spawn-debug
build-spawn-debug
```

## Intended operator experience

The human should not have to approve every intermediate build/debug iteration.

Within one bounded authorized envelope, the command may continue through Build, `build-git spawn`, Debug/Full Debug, Verify, Review, Security, Recovery, and Learn routing as applicable.

It stops for the human when:

1. automated gates pass and real UI observation remains -> `AUTOMATED PASS / USER UI TEST READY`;
2. a material owner decision or excluded authority is required;
3. a real STOP condition is reached.

After the human UI test:

- FAIL -> preserve the exact candidate and observation, then resume the same debug workstream with new evidence;
- PASS -> report `USER UI PASS / OWNER AUTHORIZATION READY` and wait for the next explicit authorization gate.

## Required behavior

1. Refetch current Git and load the Active `signalproof-build-spawn-debug` Skill.
2. Establish the exact Build Spawn Debug Envelope before consequential mutation.
3. Run Known Error/failure-memory preflight before repeat-prone work.
4. Use the existing `build-git spawn` role-separation contract for nontrivial work.
5. Use current Build and Debug/Full Debug contracts rather than duplicating their implementation logic.
6. Run all machine-verifiable gates required by the bounded acceptance claim.
7. On failure, localize the failure layer and require a materially changed condition before same-fingerprint retry.
8. Carry same-failure attempt counts across chats and filenames. Cosmetic changes do not reset the budget.
9. Continue through new materially distinct failure classes while evidence supports a next correction.
10. Reuse still-valid evidence instead of rerunning expensive gates unnecessarily; rerun invalidated gates when relevant state changes.
11. Route resolved novel lessons through `signalproof-learn`; never silently self-modify or auto-promote doctrine.
12. Present the exact candidate and minimum UI test only after automated PASS.
13. Never claim human UI PASS before the human reports it.
14. Never convert human UI PASS into release/production/canonical-ledger authority.

## Learning and efficiency rule

The command gets more efficient by consuming governed failure intelligence, proven mitigations, preserved attempt history, regression tests, and valid prior evidence.

It does not get more efficient by deleting safeguards, increasing blind retry limits, or rewriting its own Active contract from one successful case.

## Automated-to-human gate

Return:

```text
USER UI TEST
Candidate: <exact version/build/artifact>
Launch: <exact action>
Test: <minimum human steps>
Expected: <observable result>
If PASS: <exact reply/next authorization gate>
If FAIL: <what evidence to report>
```

The human tests only the user-visible acceptance that automation cannot establish honestly.

## Authority boundary

Invocation provides bounded owner direction for normal owner-authorizable build/debug/test actions inside the exact current envelope. It does not authorize production/release, protected-main bypass, canonical Build Ledger append, Candidate activation, new credentials/access, privilege escalation, security-control weakening, unrelated workstreams, or future operations after this envelope.

## STOP conditions

STOP or escalate when the envelope/current Git/protected state is unresolved; a known-bad path would repeat unchanged; same-failure retry limit is reached; the defect cannot be localized enough for bounded correction; material redesign is required without re-plan; recovery is not credible; a required excluded authority is needed; machine verification needed for the claim is unavailable; or continuing would fabricate evidence, human acceptance, release status, or authority.

## Signalproof principle

> **Keep working while evidence supports a next correction. Hand the human a testable candidate, not an unfinished debug session.**
