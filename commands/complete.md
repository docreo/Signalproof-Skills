# `complete` - Active Operator Command V0.1.1

**Status:** ACTIVE  
**Version:** 0.1.1  
**Owner:** Doc Reo

## Purpose

`complete` is the canonical Dr. Signalproof command behind `/dsp complete`.

It is the fast owner directive for: authorize every owner-authorizable action inside the current bounded workstream, run the existing `build-spawn-debug` convergence workflow, keep correcting while evidence supports a materially changed next attempt, and continue through the human UI feedback loop until the user reports the result works and is properly usable or a genuine STOP condition is reached.

Canonical route:

`/dsp complete -> complete -> bounded authorize-all envelope -> build-spawn-debug`

Accepted forms include:

```text
/dsp complete
dsp complete
/dsp-complete
dsp-complete
complete
```

## Operator meaning

When the current workstream is already sufficiently bounded, `/dsp complete` means:

> Authorize all owner-authorizable Build Spawn Debug actions required to finish this current bounded workstream. Do not return routine intermediate implementation/debug approval gates to the user. Keep working while evidence supports a valid next correction. Present the exact candidate for human UI testing only when automated acceptance passes. If the user reports FAIL, resume the same workstream with that observation as evidence. Finish only when the user reports the result works and is properly usable, or when a real excluded authority/blocker/STOP condition requires the user.

This is shorthand for bounded completion authority, not unlimited authority.

## Mandatory Signalproof Framework pre-build/design hook

Unless Doc Reo explicitly says otherwise, this gate runs **before any Signalproof building or designing begins**.

Owner hook text, preserved verbatim:

> "you have been consistently violating your first order which is do not violate the signalproof  Framework, and csince the law, TOSs, and Licenses are the other four it makes me believe that you will start breaking them as welll if you do not keep your first mandate.  I need you to read all of git and make sure you know our brand, our rules, our commands, and our laws before you build anything else for us. This is part of your first mandate to not violate the Signalproof Framework.  "

Operational meaning:

- First mandate: **do not violate the Signalproof Framework**.
- Before build/design actuation, reconcile the current Signalproof Git source of truth for the workstream and the governing Signalproof repositories needed to establish brand, rules, commands, Known Errors, authority, security, legal/TOS/license constraints, and current command inheritance.
- Verify the approved brand/brand-pack state, applicable Signalproof rules and command contracts, applicable law, Terms of Service/platform policy, licenses/third-party notices, security/access-control rules, protected-state rules, and current Known Failure intelligence.
- Do not proceed from memory, stale chat context, guessed doctrine, or an assumed inherited rule when current Git can establish it.
- Record a compact preflight result bound to repo/ref/head/workstream. A missing, stale, contradictory, or unverified mandatory source is a STOP/design condition, not permission to improvise.
- The owner may explicitly override this hook for a specific task; the override must be scoped and may not waive law, TOS/platform policy, licenses, security/access controls, or other non-waivable constraints.

Required state before build/design actuation:

`FRAMEWORK HOOK -> GIT RECONCILED -> BRAND/RULES/COMMANDS VERIFIED -> LAW/TOS/LICENSES VERIFIED -> SECURITY/KNOWN-ERRORS VERIFIED -> AUTHORITY/PROTECTED STATE VERIFIED -> PASS`

### Complete inheritance rule

`/dsp complete` does not bypass this hook. Any design/build path inside Complete must carry a current `design-git` Framework Hook result into `build-git` before actuation. `complete` inherits the requirement through the build path, but the Complete Authorization Envelope must make the hook state explicit so inheritance can never be silently assumed.

## Required behavior

1. Run or consume the current **Mandatory Signalproof Framework pre-build/design hook** for any design/build work inside this completion envelope. UNKNOWN/FAIL blocks build/design actuation.
2. Refetch current Git and current public command contracts before consequential action.
3. Resolve the current workstream, exact objective, protected state, acceptance target, and recovery path.
4. If the workstream is not sufficiently bounded, STOP with the smallest missing scope decision. Do not invent a target simply because the word `complete` was used.
5. Create one `COMPLETE AUTHORIZATION ENVELOPE` bound to the current workstream.
6. Treat the invocation as explicit owner authorization for all normal owner-authorizable build, spawn, investigate, debug, test, verify, review, security-check, recovery, and learning actions required by the current `build-spawn-debug` envelope.
7. Preserve all objective prerequisites, known-error guards, retry limits, protected-state rules, exact-final-artifact checks, and recovery requirements.
8. Do not stop for routine intermediate owner approvals that are already inside the Complete Authorization Envelope.
9. Run the current canonical `build-spawn-debug` command rather than reimplementing its internals.
10. Continue across materially distinct failure classes while evidence supports another bounded correction.
11. Same-failure retry limits remain binding. A new attempt against the same failure requires materially new evidence, a newly localized cause, a materially changed implementation/environment condition, a proven mitigation, or an owner decision that resolves the blocked branch.
12. When all machine-verifiable gates pass, present `USER UI TEST READY` with the exact candidate, launch action, minimum test steps, expected behavior, and the specific user-visible acceptance claim.
13. Human UI FAIL is not a terminal stop. Preserve the exact observation and candidate identity, then resume the same Build Spawn Debug workstream automatically under the still-valid Complete Authorization Envelope when the failure remains inside scope.
14. Human UI PASS means the stated user-visible acceptance gate is satisfied. Record `COMPLETE / USER ACCEPTED` for the bounded workstream and stop unless a separately excluded release/deployment/canonical-ledger gate remains explicitly requested.
15. Do not claim user acceptance before the user actually reports that the result works and is properly usable. Complete cannot manufacture user PASS.

## Complete Authorization Envelope

Before actuation preserve:

```text
COMPLETE AUTHORIZATION ENVELOPE
Workstream: <exact current bounded workstream>
Objective: <user-visible outcome>
Git basis: <repo/ref/head>
Framework hook state: <PASS identity | STOP reason | OWNER-OVERRIDE scope>
Protected state: <must remain true>
Acceptance target: <machine gates + human UI gate>
Allowed authority: all owner-authorizable actions required by current build-spawn-debug envelope
Known failures / retry memory: <ids/fingerprints/attempt counts>
Recovery: <rollback/non-mutation path>
Excluded authority: <explicit classes below>
Consumption: user ACCEPTED, material workstream change, envelope invalidation, or STOP
Status: AUTHORIZED | AUTHORIZED-PENDING-PRECONDITION | STOP / AMBIGUOUS
```

The envelope survives ordinary corrections and human UI FAIL feedback inside the same workstream. It is not reusable for another product, repository, objective, release, or future workstream.

## Human interaction contract

The intended operator experience is minimal interruption.

Do not return:

- routine compile/build/test permission questions;
- routine bounded debug authorization questions;
- repeated approval requests after each materially supported correction;
- another `authorize all` request for work already inside the same valid Complete Authorization Envelope.

Return to the human only for:

1. `USER UI TEST READY` after automated PASS;
2. a genuinely unresolved product/UX choice that cannot be inferred safely;
3. an excluded authority class;
4. a true STOP/blocker that cannot be resolved inside the envelope.

After `USER UI TEST READY`:

- user reports FAIL -> resume work automatically inside the same bounded workstream;
- user reports PASS / works / usable -> `COMPLETE / USER ACCEPTED`.

## Relationship to authorization

`complete` incorporates the intent of a bounded `/dsp authorize all build-spawn-debug` for the current workstream.

The phrase `all` means all owner-authorizable actions necessary inside this exact completion envelope. It does not mean all possible actions, all repositories, all future operations, or all authority classes.

Do not recursively call `authorize` and then ask the owner to authorize the same work again. The `complete` invocation itself is the explicit owner authority source for the bounded completion envelope.

## Relationship to Build Spawn Debug

`complete` is a thin coordinator over the Active `build-spawn-debug` command.

All Build Spawn Debug safeguards remain binding, including:

- current-Git reconciliation;
- known-error and failure-memory preflight;
- Builder/Design/Governor separation when applicable;
- exact machine-verifiable acceptance gates;
- materially changed-condition retry discipline;
- preserved attempt counts across chats/files;
- governed learning rather than uncontrolled self-modification;
- exact human UI evidence before user PASS.

## Authority exclusions

`/dsp complete` does not authorize:

- production deployment or public release unless that release is separately and explicitly part of an already authorized current envelope;
- bypass of protected-main/PR controls;
- canonical private Build Ledger append;
- Candidate Skill activation outside governance;
- use or acquisition of credentials/secrets not already authorized;
- privilege escalation or administrative security-control changes;
- weakening/disabling security, verification, provenance, rollback, tests, or evidence requirements;
- unrelated repositories, products, objectives, or future workstreams;
- actions blocked by legal/licensing requirements;
- fabrication of machine PASS, human UI PASS, release state, or authority.

## STOP conditions

STOP only when continuing would require an excluded authority class; the current workstream/objective/protected state cannot be established; same-failure retry limits are exhausted without a materially changed condition; a material redesign decision genuinely requires the owner; recovery is no longer credible; required machine verification cannot be performed honestly; legal/licensing/security prerequisites block continuation; the workstream changes materially enough to invalidate the envelope; or continuing would manufacture evidence, acceptance, authority, or completion.

A routine failed build, test, or UI observation is not by itself a STOP condition when a bounded evidence-supported correction remains available.

## Completion states

Use the strongest supported state:

- `COMPLETE / WORKING`
- `COMPLETE / DEBUGGING`
- `COMPLETE / AUTHORIZED-PENDING-PRECONDITION`
- `COMPLETE / USER UI TEST READY`
- `COMPLETE / USER UI FAIL - RESUMED`
- `COMPLETE / USER ACCEPTED`
- `COMPLETE / BLOCKED`
- `COMPLETE / STOP - OWNER DECISION REQUIRED`

## Signalproof principle

> **Finish the bounded job. Do not make the human babysit the build. Do not fake the last mile.**
