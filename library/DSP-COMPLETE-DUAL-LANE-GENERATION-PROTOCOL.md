# DSP Complete Dual-Lane Generation Protocol — Candidate V0.1

**Status:** CANDIDATE  
**Owner:** Doc Reo  
**Applies to:** `/dsp complete` when two Complete workstreams are active on the same product/model and one is Builder-led while the other is Designer-led.

## Purpose

Keep Design and Build moving recursively without allowing Design to mutate the Builder's active candidate or allowing an unfinished future design to displace the current build.

The central rule is:

> **The current Build generation has priority until it is locked. Design may work ahead only on a duplicate of the last locked model. A future Design generation may transfer to Builder only after both that Design generation and the current Build generation are locked.**

This protocol is intentionally modular so the canonical `complete` command can remain a small coordinator rather than carrying the full dual-lane workflow in one command payload.

## Generation model

Use paired generations:

```text
DESIGN RD1 LOCKED
      |
      v
BUILD RD1 ACTIVE  <---------------- CURRENT PRIORITY
      |
      +---- after a stable locked RD1 model exists ----+
      |                                               |
      |                                               v
      |                                      DUPLICATE RD1 MODEL
      |                                               |
      |                                               v
      |                                       DESIGN RD2 ACTIVE
      |                                               |
      |                                       DESIGN RD2 LOCKED
      |                                               |
      +---------------- BUILD RD1 LOCKED -------------+
                                                      |
                                                      v
                                             BUILD RD2 MAY START
```

The same pattern recurses:

```text
Design RDn locked -> Build RDn active
                     |
                     +-> duplicate locked RDn -> Design RD(n+1) active

Build RDn locked + Design RD(n+1) locked
                     |
                     v
                 Build RD(n+1)
```

## Role priority

When two Complete envelopes target the same product/model:

1. `BUILD ACTIVE` outranks `DESIGN AHEAD` for mutation priority.
2. Builder owns the current implementation candidate and current acceptance loop.
3. Designer may review the current Build only against the already locked design contract.
4. Designer may not redesign the Builder's active candidate in place.
5. Designer may create the next design only from a duplicate of the last locked model/snapshot.
6. Builder does not consume that next design until the current Build generation is locked.
7. A locked future Design waits in `READY FOR NEXT BUILD` state if the Builder is still finishing the current generation.
8. Builder may reject a future Design handoff only with evidence that it conflicts with protected state, accepted behavior, architecture, or current owner direction. That rejection returns the future design to Design; it does not rewrite the current locked Build.

## Lock meanings

### Design lock

`DESIGN RDn LOCKED` means:

- design objective is bounded;
- layout/IA/state semantics/interaction intent are explicit enough for Builder;
- protected model/baseline is identified;
- acceptance intent is defined;
- Designer stops mutating that generation except through a new revision/generation.

Design lock is not runtime acceptance.

### Build lock

`BUILD RDn LOCKED` means:

- Builder completed applicable automated gates;
- required human UI acceptance for that generation passed when applicable;
- exact candidate/model identity is recorded;
- protected state/recovery is preserved;
- the generation is stable enough to be the source snapshot for the next Design duplicate.

Build lock is not production/release authority unless separately authorized.

## Duplicate rule

The Designer's next-generation workspace must be created from a duplicate/copy/reference of a locked model, never from the mutable Builder working candidate.

Required properties:

```text
source_generation: RDn
source_lock: exact commit/hash/artifact/snapshot
new_design_generation: RD(n+1)
mutation_isolated_from_active_build: true
```

The duplicate may redesign layout, information architecture, controls, or interaction of the locked model while the locked model itself remains unchanged.

## Chained Complete execution

The canonical `/dsp complete` coordinator should execute the dual-lane case as small chained stages rather than one monolithic prompt/run.

### Stage 1 — `complete-role-sync`

Resolve:

- product/workstream identity;
- active Build generation;
- latest locked Build generation;
- active Design generation;
- latest locked Design generation;
- exact source snapshot for Design-ahead;
- branch/workspace separation;
- which generation currently owns mutation priority.

Return a compact role state only.

### Stage 2 — `complete-active-build`

If a Build generation is active:

- Builder leads;
- continue build/debug/test/UI loop under the existing Complete envelope;
- Designer input is review-only against the locked design for that generation;
- no new Design-ahead changes enter this Build.

### Stage 3 — `complete-design-ahead`

When a locked source snapshot exists and the next Design generation is not yet locked:

- duplicate the locked model into an isolated Design workspace;
- Designer may redesign/update only that duplicate;
- no mutation of active Build candidate;
- Design may finish early and wait.

### Stage 4 — `complete-lock-handoff`

When either role reaches lock:

- record exact generation identity;
- preserve evidence;
- if Build locked but next Design is not locked, Builder waits only if there is no other authorized current-build work; Design continues;
- if Design locked but current Build is not locked, Design enters `READY FOR NEXT BUILD` and waits;
- only when both conditions are satisfied may the next Build generation start.

### Stage 5 — `complete-next-build`

Start `BUILD RD(n+1)` only when:

```text
BUILD RDn == LOCKED
AND
DESIGN RD(n+1) == LOCKED
```

The locked Design RD(n+1) packet becomes the Builder's new bounded design authority.

Then recurse to Stage 1.

## Branch/workspace rule

Prefer separate branches/workspaces for active Build and Design-ahead.

Example:

```text
candidate/<product>-rd1-build
candidate/<product>-rd2-design
```

or equivalent isolated artifact directories.

Do not use one shared mutable branch for simultaneous Designer and Builder Complete streams when either role can write to it.

## Current-generation priority rule

If timing conflicts occur:

```text
CURRENT ACTIVE BUILD > FUTURE DESIGN AHEAD
```

This means:

- do not pause or rewrite the current Build merely because a newer Design is available;
- do not merge the newer Design into the current Build;
- do not relabel the current Build as the newer generation;
- finish and lock the current Build first;
- then promote the already-locked future Design into the next Build.

## Evidence/change rule

The Designer may propose a correction to the current generation only when new evidence proves the locked design itself is invalid or unusable. In that case:

1. classify the issue as a material design defect;
2. preserve the current Build candidate and failure evidence;
3. explicitly reopen/revise the current Design generation or create a correction revision;
4. do not silently inject the change into Builder scope.

Routine polish/debug findings remain Builder-owned when they can be corrected without changing the locked design intent.

## Compact state record

Each chained stage should be able to pass a small state block:

```text
DSP COMPLETE DUAL-LANE STATE
Product: <name>
Current priority: BUILD | DESIGN
Build generation: RDn
Build state: ACTIVE | LOCKED | BLOCKED
Build authority snapshot: <commit/hash/artifact>
Design generation: RDm
Design state: ACTIVE | LOCKED | READY FOR NEXT BUILD | NONE
Design source snapshot: <locked RD source>
Design authority packet: <commit/path/hash or NONE>
Next transition: <stage>
```

This state block is the preferred cross-chat/cross-command handoff payload instead of replaying the full protocol every time.

## STOP conditions

STOP only when:

- the active Build and Design streams cannot be mapped to generations safely;
- the Designer's source duplicate is not tied to a locked model;
- a role would need to mutate the other role's active workspace;
- the current Build requires a material redesign that invalidates its locked design contract;
- protected state/recovery cannot be maintained;
- an excluded Complete authority class is required.

## Signalproof principle

> **Build the current truth. Design the next truth on a copy. Never let tomorrow's design rewrite today's active build.**
