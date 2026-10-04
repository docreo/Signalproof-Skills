# Signalproof Governor Runtime-Boundary Learning Candidate

**Status:** CANDIDATE / NOT ACTIVE  
**Date:** 2026-08-18  
**Lifecycle:** DISCOVERED -> CANDIDATE  
**Scope:** reusable governance and security lessons for future Signalproof Governor design and governed agent/runtime acceptance

## Why this candidate exists

Signalproof Hermes Case 3 established a practical distinction between **framework capability** and **effective session authority**. A separate external research conversation then proposed stronger repository isolation, Docker-based containment, signed commits, and a dedicated "AI governor" layer.

The useful signal is preserved here, but the claims are narrowed to what evidence actually supports. This candidate does **not** promote Docker, commit signing, shell aliases, or a future Signalproof Governor into Active doctrine by themselves.

Existing public Hermes evidence:

- [Hermes Agent protected local inventory](../acceptance/hermes-agent-protected-local-inventory-v0.2.md)
- [Hermes Agent source authority map](../research/v0.2-cases/hermes-agent-source-review.md)
- [Hermes Agent 0.20.0 Case 3 bounded-worker acceptance](../acceptance/signalproof-hermes-agent-v0.20.0-case3-bounded-worker.md)

## Candidate architectural distinction

Signalproof should preserve a clear separation between:

1. **Operating discipline / policy** — what should be allowed, reviewed, verified, or stopped.
2. **Runtime enforcement** — what authority is technically available to an agent or process in the current session.
3. **Evidence / continuity** — what actually happened, what state resulted, and what can be independently verified later.

Candidate future mapping:

```text
Human Intent / Authority
        ↓
Signalproof Skills
policy + operating discipline
        ↓
Signalproof Governor
runtime authority / permission enforcement
        ↓
Agent / Harness / Model
        ↓
Bounded Tools / Apps / Data
        ↓
Runtime Verification
        ↓
Build Ledger / Evidence
        ↓
Human Promotion / Release Authority
```

**Candidate principle:** an agent may execute delegated work, but it must not decide what authority it has.

This extends the tested Hermes Case 3 lesson without claiming that a Signalproof Governor implementation already exists or has passed acceptance.

---

# Reusable candidate lessons

## G1. Policy is not enforcement

A prompt, skill, README, shell convention, or agent instruction can define expected behavior but does not by itself make prohibited operating-system authority unavailable.

A future Governor must distinguish:

- capability implemented by the framework;
- capability registered globally;
- capability exposed to the current session;
- capability actually authorized;
- action actually executed;
- resulting post-action authority/state.

**Status:** TESTED BASIS FROM HERMES + GOVERNOR DESIGN CANDIDATE / NOT ACTIVE.

## G2. Containerization can reduce blast radius, but "Docker" is not a sufficient proof of containment

Docker documentation states that bind mounts are writable by default and can modify host files. A bind mount may be declared `readonly` / `ro` to prevent writes through that mount.

Docker also documents that mounting the Docker daemon socket into a container can give that container full access to create and manipulate the host Docker daemon. Privileged modes and added host-facing capabilities materially widen authority. Docker provides Rootless mode specifically to reduce daemon/runtime privilege exposure.

Official references:

- https://docs.docker.com/engine/storage/bind-mounts/
- https://docs.docker.com/reference/cli/docker/container/run/
- https://docs.docker.com/engine/security/rootless/
- https://docs.docker.com/security/faqs/containers/

Therefore a future Signalproof container acceptance must evaluate the **exact runtime configuration**, not merely the fact that a container exists.

**Candidate baseline for agent workspaces:**

- expose only the specific authorized working repository as read/write;
- expose cross-repository references as read-only only when genuinely required;
- avoid exposing the entire parent workspace by convenience;
- do not expose the Docker daemon socket to the agent workload unless separately justified and accepted;
- prohibit `--privileged`, host PID namespace, arbitrary `--cap-add`, or equivalent authority by default;
- prefer reduced-privilege/rootless options where technically feasible and verified on the actual platform;
- verify effective mounts, filesystem authority, process authority, and post-turn state during acceptance;
- treat Docker Desktop/Windows behavior as an implementation-specific acceptance target rather than assuming Linux behavior maps perfectly to it.

**Status:** EXTERNAL PRIMARY-SOURCE RESEARCH + DESIGN CANDIDATE / NOT ACTIVE.

## G3. Read-only cross-repository access is useful only when the effective boundary is verified

A `ro` bind mount is a meaningful control for that mount, but the acceptance question is broader:

- Is the intended mount actually read-only?
- Are there other writable mounts reaching the same data?
- Is the Docker socket exposed?
- Can the process reach the target through another host integration?
- Are symlinks, alternate workspaces, credentials, or external tools widening authority?

A future acceptance test should attempt representative prohibited writes and verify host state afterward.

**Status:** CANDIDATE / NOT ACTIVE.

## G4. Shell aliases and command wrappers are convenience controls, not standalone security boundaries

An alias that blocks one spelling of a destructive command can reduce mistakes, but an agent with general execution authority may be able to use another shell, interpreter, binary, API, script, or filesystem mechanism.

Therefore aliases/wrappers may be defense in depth, observability, or workflow controls, but Signalproof must not count them as the sole enforcement boundary for prohibited host mutation.

**Status:** NEGATIVE LEARNING CANDIDATE / NOT ACTIVE.

## G5. Signed commits strengthen provenance; they do not make a repository or ledger impossible to tamper with

GitHub documents signed commits as a way to verify the origin of a commit or tag, and protected branches/rulesets can require verified signatures.

Official references:

- https://docs.github.com/en/authentication/managing-commit-signature-verification/about-commit-signature-verification
- https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-protected-branches/about-protected-branches

Signalproof should separate:

- **authorship/provenance evidence** from commit signatures;
- **repository mutation controls** from branch protection/rulesets and account permissions;
- **event chronology/integrity** from Build Ledger hash chaining and canonical serialization;
- **key/account custody** from the fact that a signature validates.

A valid signature proves something important about the signed object and recognized signing identity. It does not prove that the signer was uncompromised, that every authorized change was appropriate, or that every historical system state is otherwise immutable.

**Status:** EXTERNAL PRIMARY-SOURCE RESEARCH + NEGATIVE LEARNING CANDIDATE / NOT ACTIVE.

## G6. A future Signalproof Governor should govern authority before actuation, not merely inspect output afterward

Candidate control flow:

```text
Identity
  ↓
Requested Capability
  ↓
Session Authority
  ↓
Permission / Scope
  ↓
Human Approval when required
  ↓
Actuation
  ↓
Post-Actuation Observation
  ↓
Evidence
  ↓
Human Promotion / Release decision
```

A scanner, policy engine, or output filter may remain useful, but it does not replace the need to determine what the agent can actually do before execution.

**Status:** GOVERNOR ARCHITECTURE CANDIDATE / NOT ACTIVE.

---

# Required tests before any promotion

A future Governor/container-boundary implementation should not be promoted from this research note without evidence covering at least:

1. An agent authorized for repository A cannot write repository B through normal paths, absolute paths, traversal attempts, alternate shells/interpreters, or obvious symlink paths.
2. Intended read-only mounts are observed as read-only and representative prohibited mutations fail without altering host state.
3. The Docker daemon socket is absent unless the test explicitly concerns Docker authority.
4. Privileged/host namespace/capability expansion is absent unless separately authorized.
5. Writable host paths are explicitly inventoried and match the declared authority envelope.
6. Container exit does not silently leave unauthorized persistent state outside approved paths.
7. Effective post-turn authority is inspected, not inferred from successful model output.
8. Any commit-signing requirement is tested separately from branch/ruleset authorization and Build Ledger integrity.
9. Recovery/rollback remains available and verified.
10. Platform-specific behavior, especially Docker Desktop on Windows, is tested on the exact target configuration.

---

# Claims explicitly rejected from this intake

The following statements are **not learned** and must not be repeated as Signalproof facts without separate evidence:

- "Signalproof is in the top 1% or top 2% of global AI initiatives."
- "Docker makes an AI agent safe."
- "A shell alias prevents an agent from executing destructive actions."
- "Signed commits make it mathematically impossible for an AI agent to forge or alter system history."
- "Signalproof Skills by themselves block prompt injection, malware, or unauthorized OS actuation."
- "A future Signalproof Governor is already implemented or production-ready."

These are either unsupported rankings, absolute-security claims, or category errors between policy, enforcement, provenance, and proof.

---

# Lifecycle decision

**KEEP AS CANDIDATE. DO NOT ACTIVATE.**

This record is suitable as input to future:

- Signalproof Governor product requirements;
- agent workspace/container acceptance tests;
- `signalproof-security` learning review;
- `signalproof-readiness` authority-boundary tests;
- `signalproof-verify` runtime-state verification patterns;
- Build Ledger and release-governance hardening.

Any skill, router, security policy, Docker baseline, or Governor implementation change requires a separate tested promotion cycle.
