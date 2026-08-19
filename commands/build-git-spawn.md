# `build-git spawn` - Active Operator Command V0.1

**Status:** ACTIVE  
**Version:** 0.1.0  
**Owner:** Doc Reo

## Purpose

`build-git spawn` is the multi-role extension of `build-git` for consequential repository-backed work where independent implementation, design, and governance challenge materially improve the result.

The main LLM/session remains the **Signalproof Orchestrator**.

Subordinate roles are:

1. **Builder lane** - bounded implementation, correction, test execution, recovery, and implementation evidence.
2. **Design lane** - architecture, product/state fidelity, UX/design constraints, and design acceptance.
3. **Governor lane** - authority, protected state, security/provenance, scope, evidence strength, STOP conditions, and challenge.

No subordinate lane may self-authorize consequential action.

## Preconditions

Before delegation:

1. run normal `build-git` Git preflight;
2. run Known Failure Preflight and provide relevant recurrence constraints to every lane;
3. establish the objective, Next Action Contract, protected state, authority, recovery/non-mutation boundary, and acceptance evidence;
4. confirm that role separation adds material value compared with a single bounded action.

Do not spawn multiple roles for a simple query, narrow read-only inspection, or trivial edit merely because the command exists.

## Execution model

### True multi-agent environment

When the environment genuinely supports independent agents/subagents, delegate bounded scopes and keep their evidence distinct. The Orchestrator reconciles conflicts and makes no claim that a lane ran unless it actually did.

### No independent spawning available

Run the same protocol as explicitly separated logical lanes in the main session:

```text
BUILDER ANALYSIS
DESIGN ANALYSIS
GOVERNOR ANALYSIS
ORCHESTRATOR RECONCILIATION
```

State accurately that these are logical lanes, not independently executed agents.

## Lane contracts

Each lane receives only the context necessary for its role plus shared objective, Git basis, protected state, known-failure constraints, and authority boundaries.

Each returns:

- findings;
- evidence and evidence class;
- proposed action or objection;
- affected/protected surfaces;
- acceptance implications;
- STOP/blocker findings;
- uncertainty.

The Orchestrator resolves disagreement by evidence and owner authority, not majority vote.

## Governor boundary

The Governor lane may challenge or STOP a proposed action but does not itself manufacture owner permission, release authority, credentials, privilege, security exceptions, or canonical Build Ledger authority.

## Git and write discipline

All writes remain subject to repository rules, current Git recheck, branch/PR protection, scope control, and the underlying Active skills. A spawned Builder is not permission to write directly to protected `main`.

## Completion

Complete when all required lanes have returned, the Orchestrator has reconciled material conflicts, the routed action has been executed or stopped honestly, verification evidence is preserved, and no lane's proposal is misrepresented as independent proof or authority.

## STOP conditions

STOP when the environment cannot support the claimed delegation model; role scopes overlap so badly that evidence ownership is unclear; current Git/protected state is unresolved; a lane attempts to self-authorize; known-failure constraints were not supplied before repeat-prone work; material lane disagreement cannot be resolved from evidence; or the workflow would falsely claim independent agent execution.
