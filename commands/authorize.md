# `authorize` - Active Authorization Handler V0.1

**Status:** ACTIVE  
**Version:** 0.1.0  
**Owner:** Doc Reo

## Purpose

`authorize` is the generic Signalproof authorization handler for a clearly bounded pending owner gate or explicitly bounded target command.

It provides one authorization surface instead of creating a separate authorization command for every operator command.

Canonical DSP forms include:

```text
/dsp authorize
/dsp authorized
/dsp authorize build-git
/dsp authorized build-git
/dsp-authorize-build-git
dsp authorized this-build
authorized build-git
```

The handler resolves the target to exactly one current canonical Signalproof command before continuation.

## Core rule

> Authorization is exact, scoped, consumable, and evidence-bound. Authorize only the action that is actually identified. Never convert owner approval into blanket future authority.

## No-target behavior

When invoked as only `authorize` or `authorized`:

1. inspect the current bounded workstream for a specific pending owner authorization gate;
2. if exactly one gate is clearly established, bind the handler to that gate;
3. if multiple plausible gates exist, STOP and present the smallest disambiguation;
4. if no pending gate exists, STOP rather than inventing authority.

## Target-command behavior

When a target follows the handler:

```text
authorize <target command> [arguments]
```

1. preserve the target text and arguments;
2. resolve DSP aliases/spacing/hyphens to one canonical operator command;
3. confirm the current work context makes the requested action sufficiently bounded;
4. identify the exact authorization gate associated with the target;
5. create the Authorization Envelope;
6. recheck objective prerequisites and protected-state constraints;
7. route the resolved command only within that envelope.

Examples:

```text
/dsp authorize build-git
  -> authorize target: build-git
  -> resolved command: build-git

/dsp authorized this-build
  -> authorize target: signalproof-this-build
  -> resolved command: signalproof-this-build

/dsp authorized log-build-git
  -> compatibility route: /authorized-log-build-git
```

## Authorization Envelope

Before target continuation, preserve:

- authorization subject;
- exact target command and arguments;
- exact requested action/scope;
- authority source: explicit owner invocation or the clearly established pending gate;
- current workstream identity;
- prerequisites still required;
- protected state outside the authorization;
- allowed and excluded surfaces;
- expiration/consumption boundary;
- status: `AUTHORIZED`, `AUTHORIZED-PENDING-PRECONDITION`, or `STOP / AMBIGUOUS`.

The envelope is part of the target command's evidence context. It is not a reusable credential.

## Existing specialized compatibility command

`/authorized-log-build-git` remains a valid specialized compatibility command.

The generic handler treats these as equivalent when the same bounded gate is intended:

```text
/authorized-log-build-git
/dsp authorized log-build-git
authorized log-build-git
```

The specialized command keeps its current ordered continuation through `log-skill -> design-git -> build-git`.

## Prerequisites remain binding

Authorization does not convert an unready action into a ready one.

If the owner authorizes a command whose technical, security, legal/licensing, protected-state, provenance, release, credential, privilege, or canonical-ledger prerequisites remain incomplete, preserve `AUTHORIZED-PENDING-PRECONDITION` and route only to the prerequisite-establishing step allowed by the target command.

Do not interpret `authorize build-git` as authorization for unrelated release, deployment, production mutation, privilege escalation, secret use, security-control change, Candidate activation, or canonical Build Ledger append.

## Command resolution boundary

The handler may target only a resolvable current Signalproof operator command or a uniquely identified pending gate.

It must not:

- infer a nonexistent command;
- recursively authorize `authorize` itself;
- silently broaden a convenience alias into a more consequential command;
- treat a Skill, Loop, registry entry, or documentation page as executable authority merely because it exists;
- bypass the target command's own STOP conditions.

## Consumption and change

Authorization is consumed, superseded, or invalidated when the exact authorized action completes, materially fails, is replaced, the workstream changes materially, the target command changes materially, or the evidence basis changes enough that the original owner decision no longer applies.

A later action must not reuse a stale envelope simply because its command name looks similar.

## Interaction with known-errors

If `known-errors` mode is active, authorization does not permit a materially unchanged known-bad retry. The known-error guard remains binding unless the evidence establishes a materially changed condition or a separately justified controlled confirmation retest.

## Reporting

When the handler is used, report the resolution concisely:

```text
AUTHORIZATION HANDLER
target: <canonical command>
scope: <bounded authorized action>
status: AUTHORIZED | AUTHORIZED-PENDING-PRECONDITION | STOP / AMBIGUOUS
consumption: <when authority expires/is consumed>
```

## Authority boundary

The handler records and routes owner authority; it does not manufacture it. It cannot waive objective prerequisites, protected-state rules, security controls, legal/licensing constraints, release gates, canonical Build Ledger requirements, or another command's explicit STOP conditions.

## STOP conditions

STOP when the target is ambiguous or unresolved; no bounded gate exists; authorization scope is broader than the established work; the target would recurse into `authorize`; prerequisites prevent actuation; conditions changed materially after authorization; the requested action crosses an excluded protected/security/legal/licensing surface; or the invocation would be treated as blanket future authority.
