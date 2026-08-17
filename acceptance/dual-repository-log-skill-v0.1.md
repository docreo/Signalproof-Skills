# Dual-Repository `log-skill` Acceptance Contract v0.1

**Candidate scope:** public `log-skill` extension plus private Build Ledger peer behavior.

## Objective

Prove that one `log-skill` invocation can close a meaningful Signalproof milestone across private and public Git without leaking private evidence, fabricating canonical ledger chronology, duplicating skill intelligence, or weakening authority boundaries.

## Required Test Scenarios

Demonstrate at least two materially different completed milestones, preferably from different Signalproof products or disciplines.

Examples:

- runtime/security acceptance milestone;
- application build/design milestone;
- recovery/debug milestone;
- release/documentation milestone.

## Acceptance Matrix

| Requirement | Verification | Pass Condition |
|---|---|---|
| Public head verification | Inspect current `Signalproof-Skills/main` before mutation | Exact current ref recorded |
| Private head verification | Inspect current `Signalproof-Build-Ledger/main` before mutation | Exact current ref recorded |
| Private complete record | Inspect private branch/PR | Material internal state, protected state, failures, evidence refs, next gate preserved |
| Canonical ledger safety | Inspect private classification | No invented canonical seq/hash; unverified chronology remains staged/noncanonical |
| Private skill reuse | Search private skills/intelligence before creating new Candidate | Existing intelligence extended when sufficient |
| Public existing-intelligence check | Search Active/Candidate public skills | No avoidable duplicate specialist skill |
| Public/private separation | Compare private/public changes | Sensitive/internal evidence absent from public diff |
| Public generalization | Review public change | Only durable generalized lesson/contract included |
| Skill lifecycle | Inspect status | New learning remains Candidate until tested/approved |
| Authority preservation | Review both contracts | No auto-merge, auto-release, destructive, security-control, or direct-main authority created |
| Failure preservation | Review milestone record | Known failures/uncertainty remain visible |
| Next-phase precision | Inspect command result | Exact next authorized action returned |
| Context reduction | Compare later session bootstrap | Material prior state can be loaded selectively from Git instead of repeated prompt duplication |

## Failure Conditions

Fail acceptance if any test:

- publishes private implementation evidence in the public repo without explicit public classification;
- treats staged/noncanonical ledger material as canonical;
- invents sequence/hash/projection state;
- creates a duplicate skill when an existing public or private mechanism suffices;
- auto-promotes a Candidate;
- merges automatically merely because `log-skill` was invoked;
- loses a material failure, blocked gate, rollback target, or protected-state declaration;
- requires preloading the full public/private skill corpus into the conversation.

## Promotion Gate

Only after materially different successful scenarios and explicit owner approval may the command extension advance beyond Candidate.

## Current Status

**CANDIDATE / NOT ACTIVE**
