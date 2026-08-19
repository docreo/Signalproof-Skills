# `signalproof-this-plan` — Active Operator Command V0.1

**Status:** ACTIVE  
**Version:** 0.1.0  
**Owner:** Doc Reo

## Purpose

`signalproof-this-plan` is the conversational command for stress-testing the current plan, design, decision, or proposed direction before execution.

Canonical route:

`signalproof-this-plan -> signalproof-grill`

Common aliases:

- `grill this plan`
- `Signalproof this plan`

## Required behavior

1. Bind `this` to the current clearly established plan/decision. If the referent is ambiguous, resolve scope before proceeding.
2. Load `signalproof-grill` as the principal Skill.
3. Build a decision tree and ask the currently answerable decision frontier.
4. Resolve discoverable facts through available evidence/tools rather than asking the owner to supply facts the system can establish itself.
5. Keep owner decisions with the owner; recommendations must remain recommendations.
6. Do not silently execute, mutate repositories, publish, or change protected state.
7. Finish only when the decision frontier is empty or a STOP/authority boundary is reached and the human confirms shared understanding.

## Authority boundary

This command hardens a plan. It does not authorize implementation. To turn an accepted result into repository-backed execution, use `build-git this` or another separately authorized action.

## STOP conditions

STOP when the current plan cannot be identified, material evidence is missing and cannot be established, a question depends on an unresolved prerequisite, or the next step would require authority beyond discussion/analysis.
