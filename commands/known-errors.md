# `known-errors` - Active Operator Command V0.1

**Status:** ACTIVE  
**Version:** 0.1.0  
**Owner:** Doc Reo

## Purpose

`known-errors` enables continuous known-error recurrence checking for the current Signalproof session or bounded workstream.

Its goal is to prevent Signalproof from spending tokens, runtime, and operator time rediscovering or repeating a failure that is already known.

Canonical DSP forms include:

```text
/dsp known-errors
dsp known-errors
/dsp-known-errors
dsp-known-errors
```

## Core rule

> Search before retry. Search again when the failure evidence materially changes. If Signalproof already paid to learn the lesson, do not pay for the same failure again under unchanged conditions.

## Continuous mode

When invoked, treat known-error checking as a standing requirement for the current bounded workstream until the workstream ends, the mode is explicitly disabled, or a higher-authority contract supersedes it.

Before each consequential build, debug, retry, recovery, packaging, verification, or release step that could repeat a prior failure:

1. inspect the exact current failure, tool, runtime, platform, action, boundary, and persisted state;
2. search the Active `signalproof-known-errors` catalog;
3. search task-relevant merged/current Git evidence and applicable failure records when available;
4. compare conditions, not keywords alone;
5. classify the result as `NO KNOWN MATCH`, `POSSIBLE MATCH`, `KNOWN ERROR / MITIGATION AVAILABLE`, `KNOWN ERROR / CONDITIONS CHANGED`, or `STOP`;
6. if a known error matches unchanged conditions, block the redundant path and route to the documented mitigation, a materially different method, Investigation, or STOP;
7. if conditions materially changed, record what changed before a deliberate retest;
8. after a new failure is verified as reusable/repeatable, preserve it through `log-skill` and route it through normal Skill lifecycle governance before changing the Active known-errors catalog.

## Discovery-to-catalog rule

A newly observed failure is not automatically a known error.

Promote a new pattern only when evidence establishes a reusable fingerprint, the prevention/mitigation is bounded enough to be useful, and public/private provenance boundaries are preserved.

Do not place private paths, credentials, protected hashes, customer data, unreleased implementation details, or private Build Ledger chronology into the public catalog.

## Anti-loop behavior

Continuous mode must detect substantially equivalent attempts across formatting changes, wrapper changes, renamed files, or superficial prompt variations.

A repeat is justified only when at least one material condition changed, for example:

- code or artifact bytes changed in a relevant way;
- runtime/environment/dependency changed;
- authority or prerequisite changed;
- a new discriminating hypothesis is being tested;
- the mitigation itself requires a controlled confirmation retest.

If none changed, do not spend another build/debug loop on the same path.

## Integration

This command routes primarily to the Active `signalproof-known-errors` Skill and may invoke `signalproof-investigate`, `signalproof-debug`, `signalproof-verify`, `signalproof-learn`, or `log-skill` when the evidence requires them.

It complements, rather than replaces, Known Failure Preflight already required by `build-git`, `build-git-debug`, and related commands.

## Reporting

When continuous mode prevents a redundant attempt, record a concise reason:

```text
KNOWN-ERROR GUARD
match: <known-error id or evidence identity>
conditions: unchanged | materially changed
blocked_path: <attempt not repeated>
next_route: <mitigation / investigate / stop / controlled retest>
```

Do not flood the user with repetitive notifications when the same guard remains unchanged. Surface a new alert when the match, condition, mitigation, or required owner decision materially changes.

## Authority boundary

`known-errors` is an efficiency and recurrence-prevention command. It does not grant build, write, destructive, credential, privilege, security-change, release, publication, Candidate-activation, production, or canonical Build Ledger authority.

## STOP conditions

STOP a repeated path when a high-confidence known error matches unchanged conditions; when evidence required to distinguish a recurrence is unavailable; when the only proposed retry is superficial variation; when applying the mitigation would cross an unapproved authority/security/protected-state boundary; or when a new error would be promoted without sufficient evidence and lifecycle governance.
