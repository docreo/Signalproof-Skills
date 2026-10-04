# Hermes Agent — Signalproof Governance Notice

**Public status:** Signalproof-governed integration / bounded-worker acceptance  
**Upstream project:** NousResearch/hermes-agent  
**Local runtime acceptance:** Hermes Agent 0.20.0  
**Additional source review:** Hermes Agent 0.20.2  
**Signalproof review period:** August 16–18, 2026

## Why this notice exists

Signalproof uses and studies capable third-party AI tooling, but integration is not treated as automatic authorization.

Hermes Agent is a capable agent framework. Our review did **not** conclude that Hermes is malicious, defective, or unsuitable for its intended users. The question we tested was narrower:

> What authority should Hermes receive inside a Signalproof-controlled system, under which conditions, and with what evidence?

That distinction matters because an agent framework can expose terminal, code-execution, memory, scheduling, plugin, MCP, delegation, update, credential, and skill-management surfaces. Those are useful capabilities, but they are also authority surfaces that should be deliberately governed when the operator wants a human-controlled environment.

## What Signalproof found

Our source review and protected-local inventory identified several areas that deserved explicit governance rather than assumption:

- Hermes exposes materially broader authority than a passive library or scanner.
- Host-local terminal execution is not itself an isolation boundary.
- `execute_code` can exercise process and filesystem authority outside terminal-string command detection, so it requires its own boundary.
- The reviewed approval logic retains a historical fail-open path for some ordinary dangerous-command requests in bare noninteractive, non-gateway contexts after the hardline deny floor. No destructive command was executed during Signalproof testing.
- Cron, MCP, plugins, delegation, memory persistence, skill mutation, self-update, lazy dependency installation, and credential passthrough each create separate authority or data boundaries.
- A capability existing in the framework or registry is not the same as that capability being granted to a particular session.

These findings are reasons to configure and govern the integration, not reasons to disparage Hermes.

## How our Hermes configuration was Signalproofed

For the accepted Case 3 configuration, Signalproof treated Hermes as a **replaceable bounded worker**, not as the owner of system authority.

The accepted test demonstrated a controlled real-model turn while the effective session remained at zero authority for the protected tool surfaces being tested. The accepted configuration excluded:

- terminal and host-local command authority;
- `execute_code` authority;
- autonomous memory writes;
- autonomous skill mutation or promotion;
- cron/self-scheduling authority;
- MCP authority;
- project/plugin tool authority;
- delegation/subagent authority;
- self-update authority;
- canonical truth authority;
- Build Ledger authority;
- permission authority;
- release authority.

Signalproof retains those governance decisions outside Hermes.

The governing rule is:

> **Hermes may execute delegated work, but it must not decide what authority it has.**

## What “Signalproofed” means here

“Signalproofed” does **not** mean that Signalproof certifies Hermes generally, guarantees its security, or claims every Hermes deployment should use our configuration.

For this integration it means we:

1. identified the exact upstream/local versions under review;
2. mapped authority-relevant source surfaces;
3. preserved the protected local baseline rather than casually modifying it;
4. separated source findings from runtime evidence;
5. tested a disposable bounded configuration;
6. verified the effective post-turn authority state, not only whether the model produced an answer;
7. preserved exclusions where fail-closed behavior had not been proven;
8. kept Signalproof skill promotion, permissions, canonical state, release, rollback, and Build Ledger authority outside the agent;
9. recorded evidence and limitations for later review.

This is the pattern we mean by a **Signalproof-governed Hermes configuration**.

## When authority can expand

Authority is not expanded because a feature is convenient or because the framework supports it.

Any future proposal to enable terminal execution, `execute_code`, autonomous memory, writable skill management, cron, MCP, plugins, delegation, self-update, broader credential passthrough, or similar authority requires a new bounded review and acceptance cycle for that exact configuration.

A future Hermes version may also change the relevant behavior, so this notice should not be read as a permanent judgment about later releases.

## Evidence

Public Signalproof records:

- [Hermes Agent V0.20.0 — Case 3 Bounded-Worker Acceptance](../../acceptance/signalproof-hermes-agent-v0.20.0-case3-bounded-worker.md)
- [Hermes Agent Protected Local Inventory — V0.2 Case 3](../../acceptance/hermes-agent-protected-local-inventory-v0.2.md)
- [Hermes Agent Source Authority Map](../../research/v0.2-cases/hermes-agent-source-review.md)

The detailed public acceptance record preserves the exact accepted authority exclusions and test evidence. Private machine paths and private Build Ledger internals are intentionally not published here.

## Respect for upstream

Hermes is an upstream project maintained independently of Signalproof. This notice documents **our integration decision and our operating boundary**. It is not an accusation about the intentions, competence, or security posture of the Hermes maintainers, and it should not be presented as one.

Signalproof's position is simple: powerful agent frameworks deserve proportionate governance when they are connected to systems where human authority, evidence integrity, rollback, release, and canonical state matter.
