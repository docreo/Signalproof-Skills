---
name: signalproof-router
description: Select the smallest appropriate active Signalproof skill, specialist, or bounded sequence from current evidence and compact capability metadata without silently expanding authority or loading unnecessary context.
---

# Signalproof Router

## Purpose

`signalproof-router` is the compact dispatch kernel for the Signalproof Library.

> **Route by objective, evidence state, risk, and authority; load only the capability needed for the current job.**

The Router must get smaller as the library grows. Detailed specialist doctrine belongs in the specialist Skill, not in Router.

## Inheritance

This skill inherits the active root `signalproof` contract. Routing never creates write, destructive, privilege, security-change, release, publication, branding, skill-activation, or canonical Build Ledger authority.

## Current Routing Set

- `signalproof` - root governing contract/fallback;
- `signalproof-known-errors` - repeatable-error preflight;
- `signalproof-research` - current external evidence;
- `signalproof-evaluate` - evidence-to-disposition decision;
- `signalproof-investigate` - unknown state/root-cause localization;
- `signalproof-plan` - bounded execution contract;
- `signalproof-design` - product information/state architecture;
- `signalproof-ui-polish` - interface detail, readability, spacing, wrapping, motion, responsive finish;
- `signalproof-accessibility` - accessible interaction and presentation requirements;
- `signalproof-readiness` - target prerequisite/capability assessment;
- `signalproof-build` - bounded implementation;
- `signalproof-debug` - evidence-led defect correction;
- `signalproof-verify` - prove a specific claim;
- `signalproof-review` - assess scope/change integrity;
- `signalproof-recovery` - coordinate recovery work;
- `signalproof-rollback` - select and verify rollback identity;
- `signalproof-restore` - execute bounded restoration;
- `signalproof-cleanup` - clean up owned partial-operation resources safely;
- `signalproof-recovery-continuity` - preserve recovery state, journals, remaining rollback paths, and unresolved ownership;
- `signalproof-security` - coordinate cross-cutting defensive security review;
- `signalproof-secrets` - credential/secret exposure and handling;
- `signalproof-permissions` - identity, privilege, authorization, and least privilege;
- `signalproof-supply-chain` - dependency/source/license/integrity trust;
- `signalproof-network` - network/data-flow exposure and transport controls;
- `signalproof-execution-security` - untrusted-input and code-execution boundaries;
- `signalproof-release` - exact-artifact promotion/distribution;
- `signalproof-document` - durable evidence-bound documentation;
- `signalproof-learn` - governed reusable learning extraction;
- `signalproof-handoff` - conversation-boundary continuity;
- `signalproof-closeout` - meaningful milestone closeout.

Only skills marked Active in the canonical `SKILL-REGISTRY.md` are routable on `main`. Branch/PR state is candidate state even when it proposes future Active entries.

## Compact Routing Contract

1. Read the actual objective; do not route from a keyword alone.
2. Establish whether the request is read-only, decision/design, actuation, or continuity work.
3. Use the compact capability registry as routing metadata when available; metadata informs selection but is not authority.
4. Select one principal skill whenever possible.
5. Add at most two narrow specialists/loops by default; exceed this only when the task materially crosses independent boundaries.
6. Before consequential or materially failure-prone work, route through `signalproof-known-errors`.
7. If factual state is unresolved, prefer Investigate/Verify before Build, Document, Learn, Release, or authoritative claims.
8. If a domain specialist exactly fits, prefer it over loading its broader coordinator.
9. Use a coordinator when the request spans several specialists or requires cross-domain synthesis.
10. Do not route every request through every governance skill; the root contract already carries universal doctrine.
11. Preserve explicit STOP conditions and human authority.
12. Close meaningful milestones before opening the next major phase; Handoff remains separate from Closeout.

## Routing Classes

### Read-only truth finding

- Research: external evidence/source quality/freshness.
- Investigate: unknown runtime/system state or competing causes.
- Verify: proof of a specific material claim.
- Known Errors: prior supported failure/mitigation match.

### Decision and design

- Evaluate: disposition from established evidence.
- Plan: scope, sequencing, authority, acceptance, recovery.
- Design: product information/state architecture.
- UI Polish: micro-layout/readability/responsive/interaction finish.
- Accessibility: keyboard, assistive technology, contrast, scalable/alternative interaction.
- Readiness: exact target prerequisites/capabilities.

### Actuation

- Build: bounded implementation.
- Debug: bounded defect correction.
- Recovery: recovery coordinator for multi-part restoration work.
- Rollback: choose/verify known-good target.
- Restore: perform bounded replacement/restoration.
- Cleanup: remove/contain resources created by failed or partial operations.

### Defensive security

Use the narrowest matching specialist:

- Secrets: tokens, credentials, storage, logs, redaction, rotation implications.
- Permissions: identity, privilege, ACL, OAuth scopes, authorization.
- Supply Chain: dependencies, publishers, versions, licenses, hashes/signatures, install/update trust.
- Network: endpoints, ports, telemetry, outbound/inbound flows, transport validation.
- Execution Security: shell/dynamic-code/plugin/archive/deserialization/untrusted-input execution boundaries.
- Security coordinator: several of the above materially interact or a cross-cutting security disposition is required.

### Continuity and durable state

- Release: exact candidate to exact distribution boundary.
- Document: durable representation of established state.
- Learn: reusable lesson extraction/governance.
- Recovery Continuity: preserve restore journals, uncertain resource ownership, remaining rollback options.
- Handoff: preserve active work across conversation/session boundary.
- Closeout: preserve a meaningful milestone and authorize transition.

## Loop Selection

The Signalproof Loop Library may supply reusable bounded iteration protocols. A Loop never grants authority.

Common mappings:

- Debug -> `SP-LOOP-DEBUG`;
- Build/Verify -> `SP-LOOP-BUILD-VERIFY`;
- Research -> `SP-LOOP-RESEARCH`;
- ingestion/normalization -> `SP-LOOP-INGEST`;
- recovery -> `SP-LOOP-RECOVERY`;
- agent side effects -> `SP-LOOP-AGENT-ACTION`;
- reusable learning -> `SP-LOOP-LEARN`;
- optimization -> `SP-LOOP-OPTIMIZE`;
- consequential retry -> `SP-LOOP-RETRY`.

The Governor decides whether a selected loop may run under the proposed permissions, risk, cost, and protected-state boundary.

## Default Context Budget

Preferred runtime context:

```text
ROOT CONTRACT
+ COMPACT CAPABILITY METADATA
+ 1 PRINCIPAL SKILL
+ 0-2 SPECIALISTS / LOOPS
+ TASK EVIDENCE
```

Avoid loading entire capability families merely because the request mentions a broad category.

## Sequencing Examples

- `known-errors -> investigate -> debug -> verify`
- `research -> evaluate`
- `plan -> design -> build -> verify/review`
- `design -> ui-polish/accessibility -> build`
- `security -> narrow specialist(s) -> verify`
- `rollback -> restore -> verify`
- `cleanup -> recovery-continuity -> verify`
- `release -> document -> closeout`
- `closeout -> learn` when reusable learning is material
- `handoff -> fresh session -> continue` when the milestone itself remains open

These are patterns, not mandatory conveyor belts.

## STOP Conditions

STOP when:

- current repository/system state cannot be established for consequential work;
- a known high-confidence failure would be repeated under unchanged conditions;
- a route would silently expand privilege, security, release, publication, or ledger authority;
- non-Active candidate capability would be treated as canonical Active capability;
- unresolved truth is being sent directly to implementation or authoritative documentation;
- the route would load broad families when a narrow specialist is sufficient and context cost is material;
- a selected loop lacks bounded success/failure/STOP conditions;
- protected state or rollback would be weakened outside authority.

## Completion Criteria

Routing is complete when the minimum justified capability set is selected, known-error preflight is applied where required, authority remains separate from capability, unnecessary context is excluded, any loop is bounded, and the next STOP/handoff/closeout condition is explicit.

## Identity

- **Suite:** Signalproof Skills
- **Skill:** `signalproof-router`
- **Version:** `0.2.0`
- **Maturity:** Active public baseline
- **Parent:** `signalproof` 0.1.1+
- **Domain:** Registry-driven capability routing, minimal context selection, bounded sequencing
- **Created by:** Doc Reo / Signalproof
