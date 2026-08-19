---
name: signalproof-failure-intelligence
description: Prevent repeated Signalproof build, test, harness, runtime, packaging, security, provenance, licensing, legal, recovery, and governance failures by searching prior evidence before retry, normalizing recurring failure classes, binding proven mitigations to their actual conditions, and feeding verified prevention rules back into future work without turning one-off mistakes into universal doctrine.
---

# Signalproof Failure Intelligence

## Status

**CANDIDATE / NOT ACTIVE**

## Purpose

`signalproof-failure-intelligence` is the recurrence-prevention specialist for the Signalproof Skill Suite.

Its central rule is:

> **Search before retry. If Signalproof already paid to learn the lesson, do not pay for the same failure again without materially new evidence.**

This skill does not replace Debug, Investigate, Learn, Security, Review, Recovery, or Closeout. It connects their evidence so recurring failures become searchable prevention intelligence rather than scattered historical notes.

## Why this exists

Long-running AI-assisted development can waste substantial time, tokens, runtime, and human attention by repeating a failure whose cause and correction were already established in another product or milestone.

The recurring pattern may be technical, operational, or governance-related. Examples include:

- shell/parser and evidence-harness defects;
- process exit-code versus stderr misclassification;
- schema/property assumptions;
- path, quoting, encoding, line-ending, and byte-identity mistakes;
- dependency/runtime mismatch;
- protected-baseline mutation;
- partial-actuation cleanup mistakes;
- duplicate or stale-ledger operations;
- packaging/provenance mismatch;
- security or privilege boundary mistakes;
- licensing, redistribution, contractual, attribution, or legal-boundary mistakes;
- false success signals and incomplete acceptance gates.

The goal is not to eliminate experimentation. The goal is to stop **uninformed repetition**.

## Failure-Intelligence Contract

1. **Search before consequential retry.** Before repeating a failed or failure-prone operation, search current Signalproof Git/Build Ledger failure intelligence using the tool, environment, symptom, action, and affected boundary.
2. **Match conditions, not keywords alone.** A prior failure applies only when the relevant runtime/tool/version/authority/evidence conditions are materially similar.
3. **Separate symptom from cause.** A parser error, non-zero wrapper state, missing artifact, blank UI, or denied write may be a symptom. Preserve the proven cause separately.
4. **Prefer proven correction paths.** When an applicable mitigation already passed acceptance, begin from that correction pattern instead of recreating the failed approach.
5. **Do not overgeneralize.** One failure may justify a candidate record or warning; repeated or independently tested evidence is required for stronger suite-wide doctrine.
6. **Preserve negative evidence.** Do not delete or rewrite failed attempts merely because a correction later passed.
7. **Bind prevention to scope.** Record where the mitigation is known to work and where it remains UNKNOWN.
8. **Respect security, licensing, and legal constraints.** A technically effective workaround is not an approved mitigation if it violates authority, license, redistribution, contractual, privacy, security, or legal boundaries.
9. **Record supersession.** If a later tool/version/platform removes or changes a failure class, mark the earlier record superseded or retired rather than deleting history.
10. **Update after meaningful new evidence.** Closeout/Learn should update recurrence count, scope, mitigation confidence, new counter-evidence, and affected skills when material.
11. **Do not create retry loops.** A high-confidence known failure with unchanged preconditions should cause REUSE / REVISE / STOP, not blind re-execution.
12. **Do not let the registry become authority.** Failure intelligence informs routing and prevention; it does not grant installation, privilege, security-change, release, legal, skill-activation, or canonical Build Ledger authority.

## Mandatory Known-Failure Preflight

For consequential Build, Debug, Verify, Readiness, Recovery, Security, Release, or evidence-harness work, inspect known failure intelligence before execution when any of these apply:

- the operation previously failed in the current work stream;
- the same tool/runtime/shell has known Signalproof failures;
- the operation is expensive, destructive, privilege-sensitive, or evidence-sensitive;
- a wrapper/harness is being reused or generated;
- source bytes/hashes/line endings matter;
- a package/runtime/environment transition is involved;
- a retry is being proposed after a failure;
- the user explicitly asks whether Signalproof has seen the problem before.

A trivial first-time low-consequence edit does not require a full registry sweep.

## Failure Fingerprint

Each reusable failure record should preserve, where applicable:

- `failure_id` — stable Signalproof identifier;
- short name;
- class/domain;
- first seen / last seen;
- recurrence count or evidence count;
- affected product(s);
- tool/runtime/platform/version;
- triggering action;
- observable symptom;
- supported root cause;
- evidence class and references;
- protected-state impact;
- partial mutation/actuation state;
- proven mitigation/correction;
- mitigation acceptance evidence;
- conditions where mitigation applies;
- conditions where applicability is UNKNOWN;
- unsafe/ineffective retry pattern;
- required preflight/check;
- security/privacy/licensing/legal constraints;
- affected Signalproof skills/commands;
- status: `OBSERVED`, `CONFIRMED`, `RECURRING`, `MITIGATION_TESTED`, `PREVENTION_CANDIDATE`, `SUPERSEDED`, or `RETIRED`;
- superseded-by relationship when relevant.

Stable failure IDs must not depend on Build Ledger C-numbers. Canonical chronology and failure identity are different concerns.

## Match Decision

A preflight returns one of:

- **NO KNOWN MATCH** — proceed under normal governed controls.
- **POSSIBLE MATCH** — inspect source evidence before choosing a path.
- **KNOWN FAILURE / MITIGATION AVAILABLE** — use the proven mitigation unless current evidence justifies a different method.
- **KNOWN FAILURE / CONDITIONS CHANGED** — retest deliberately and record the changed condition.
- **KNOWN FAILURE / NO APPROVED MITIGATION** — Investigate/Plan before retry.
- **PROHIBITED / STOP** — repeating the action would violate protected state, authority, security, licensing, legal, evidence-integrity, or explicit governance constraints.

## Relationship to Other Skills

### Build

Before expensive or failure-prone implementation/harness execution, query failure intelligence. Build remains responsible for implementation and protected-state preservation.

### Debug / Investigate

Use prior fingerprints to shorten hypothesis search, but do not force a prior diagnosis onto new evidence.

### Verify / Review

Check whether the implementation reintroduced a known failure pattern or falsely claims a mitigation without testing it.

### Security

Treat recurring privilege, secret, dependency, network, sandbox/container, permission, or authority failures as first-class failure intelligence. Security findings retain their own severity and authority semantics.

### Recovery

Preserve known rollback/cleanup failure patterns so recovery does not repeat unsafe cleanup or restore the wrong state.

### Learn

Learn decides what can generalize. Failure Intelligence maintains the searchable recurrence/prevention representation of the accepted learning.

### Closeout

Every meaningful closeout asks whether a new failure class was discovered, an existing class recurred, a mitigation was validated, or a prior failure record should be superseded.

### Handoff

Material known-failure constraints for the next action must cross the chat boundary when omission could cause immediate repetition.

## PowerShell Is One Domain, Not the Whole Skill

PowerShell evidence motivated this candidate but does not define its scope.

Initial proven examples include:

### FI-PS-PARSER-HERESTRING-001

**Class:** parser / wrapper generation  
**Evidence:** Opportunity Detector Integration Candidate 1 R2 preserved a resume-wrapper failure caused by a malformed PowerShell here-string terminator and explicitly verified wrapper parsing before execution afterward.

Prevention candidate:

> Parse/validate generated or downloaded PowerShell before consequential execution when wrapper syntax changed or the source is not already accepted.

### FI-PS-NATIVE-STDERR-FAILFAST-001

**Class:** native-process evidence harness  
**Evidence:** SkillSpector V6/V7 and V8/V9 established that PowerShell 5.1 fail-fast behavior combined with `2>&1` can convert legitimate native stderr progress/notices into a false harness failure even when the native process succeeds.

Proven correction pattern:

> Capture stdout/stderr separately, bind acceptance to the real native exit code and persisted artifacts, and retain both streams as evidence.

This pattern also recurred in Media Studio recovery/fail-closed evidence when informational native stderr surfaced as `NativeCommandError` before result evaluation.

### FI-PS-HETEROGENEOUS-PROPERTY-001

**Class:** report/schema parser  
**Evidence:** SkillSpector V11 passed firewall/no-LLM proof and then failed because the harness dereferenced `.message` on issue objects that did not all expose that property.

Prevention candidate:

> Acceptance parsers must validate property/schema presence before dereferencing heterogeneous objects and should fail descriptively rather than collapsing unrelated completed evidence.

## Initial Cross-Tool Failure Classes

### FI-GIT-TEXT-NORMALIZATION-001

**Class:** Git packaging / byte identity  
**Evidence basis:** Media Studio C2A found that Git text normalization could rewrite PowerShell/VB line endings while manifests were byte-sensitive.

Prevention candidate:

> When evidence or protected-state checks are byte-sensitive, verify Git attributes/archive/checkout behavior and compare packaged bytes to accepted hashes.

### FI-PY-BYTECODE-RESIDUE-001

**Class:** runtime hygiene / source immutability  
**Evidence basis:** Signalproof-Kokoro RD2-C1 produced transient `__pycache__` / `.pyc` files during readiness testing and then performed bounded cleanup and post-cleanup manifest verification.

Prevention candidate:

> When Python is executed from an evidence/protected source tree whose byte inventory matters, use no-bytecode controls where appropriate and verify residue explicitly.

### FI-READINESS-SERIALIZATION-001

**Class:** machine-readable acceptance contract  
**Evidence basis:** Signalproof-Kokoro RD2 initial readiness was internally HEALTHY but the CLI JSON omitted the computed `ready` field, so the outer gate correctly refused acceptance.

Prevention candidate:

> Internal healthy state is insufficient when the consumer/acceptance contract requires explicit machine-readable readiness fields.

### FI-PATH-NORMALIZATION-WINDOWS-001

**Class:** path comparison / manifest verification  
**Evidence basis:** Signalproof-Kokoro RD2-C1 identified false unmanifested-file findings when manifest `/` paths and Windows filesystem `\` paths were compared without normalization.

Prevention candidate:

> Normalize path representation before evidence comparison while preserving the original path identity in evidence.

### FI-PROTECTED-BASELINE-MUTATION-001

**Class:** protected-state conflict  
**Evidence basis:** Media Studio C2 initially attempted to modify a protected application file; the inherited protection test rejected the change and the work was narrowed to an additive compatibility proof rather than weakening the protection gate.

Prevention candidate:

> A protection gate blocking the planned change is evidence to narrow/replan or seek new authority, not permission to weaken the gate.

### FI-LEDGER-STALE-SEQUENCE-001

**Class:** governance / chronology  
**Evidence basis:** Signalproof `log-skill` now distinguishes projected Build Ledger numbers from canonical chronology.

Prevention candidate:

> Never reserve or reuse a projected C-number after the canonical head moves. Re-verify the head and regenerate the append plan.

## Licensing / Legal Boundary

Failure Intelligence may record recurring licensing/legal mistakes, for example:

- assuming a dependency license permits redistribution without checking the applicable version;
- copying upstream code when only behavioral adaptation was authorized;
- removing required notices/attribution;
- treating access to a repository or artifact as permission to redistribute it;
- using a technically convenient dataset/model whose terms do not support the intended use;
- publishing private evidence, customer data, secrets, or protected implementation details;
- representing third-party software findings in a misleading or defamatory way rather than describing the tested configuration/evidence neutrally.

These records must cite the actual license/contract/evidence before becoming a prevention rule. Failure Intelligence is not legal advice and must not invent permissions or prohibitions.

## Public / Private Registry Boundary

Public failure intelligence may publish generalizable technical/governance patterns and public evidence references.

Private Build Ledger failure intelligence may retain:

- local paths;
- exact private hashes;
- unreleased versions/builds;
- internal security findings;
- private evidence packets;
- customer/private operational details;
- sensitive recovery or authority information.

The public registry must not become a leakage channel for private failure evidence.

## Update / Dedup Rule

Do not create a new failure ID merely because the same class appears in another product.

When a recurrence matches an existing fingerprint:

1. increment/record recurrence evidence;
2. add the new affected context;
3. confirm whether the same mitigation worked;
4. record counter-evidence or changed conditions;
5. strengthen or narrow the prevention rule accordingly.

Create a new ID only when the cause, mitigation, or operational boundary is materially different.

## Acceptance Requirements Before Active Promotion

This candidate should not become Active until it is tested on multiple real Signalproof failures from materially different domains.

Minimum acceptance:

1. correctly matches at least one recurring PowerShell/native-process failure;
2. correctly matches at least one non-PowerShell failure;
3. avoids a real unnecessary retry or selects the proven correction earlier;
4. does not incorrectly block a changed-condition retest;
5. deduplicates recurrence under a stable failure ID;
6. preserves public/private evidence boundaries;
7. preserves licensing/legal/security authority rather than treating a technical workaround as permission;
8. integrates with Build/Debug/Verify/Review/Closeout/Learn without replacing them;
9. demonstrates a Build Ledger/private registry update without fabricating canonical chronology;
10. proves that suite-wide inheritance can require a known-failure preflight without forcing expensive searches on every trivial edit.

## STOP Conditions

STOP when:

- a known high-confidence failure is being repeated with unchanged preconditions and no new evidence;
- a workaround would weaken a protected gate merely to get PASS;
- a mitigation would cross security/licensing/legal/authority boundaries;
- a prior failure is being cited without verifying that the relevant conditions match;
- private failure evidence would be published;
- a one-off failure is being promoted directly into Active doctrine;
- registry history would be rewritten instead of superseded;
- Build Ledger chronology would be fabricated to make the failure record look canonical.

## Identity

- **Suite:** Signalproof Skills
- **Skill:** `signalproof-failure-intelligence`
- **Version:** `0.1.0-candidate`
- **Maturity:** Candidate / Not Active
- **Parent:** `signalproof` 0.1.1+
- **Works with:** `signalproof-build`, `signalproof-debug`, `signalproof-investigate`, `signalproof-verify`, `signalproof-review`, `signalproof-security`, `signalproof-recovery`, `signalproof-release`, `signalproof-learn`, `signalproof-closeout`, `signalproof-handoff`, `signalproof-router`
- **Domain:** known-failure retrieval, recurrence prevention, failure fingerprinting, mitigation reuse, negative learning, cross-build quality and governance intelligence
- **Created by:** Doc Reo / Signalproof
