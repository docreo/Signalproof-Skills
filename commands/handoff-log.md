# `handoff-log` — Active Operator Command V0.2

**Status:** OWNER-APPROVED / PENDING MERGE TO MAIN  
**Version:** 0.2.0  
**Supersedes:** V0.1 after merge  
**Owner approval:** Doc Reo

## Purpose

`handoff-log` is a Signalproof operator command shorthand that combines a normal governed handoff with `log-skill` synchronization so continuity, pending closeout obligations, reusable learning, public/private evidence state, and the exact continuation procedure survive the chat boundary.

It is not a separate specialist skill and does not itself create canonical Build Ledger authority.

Core rule:

> **Transfer the work, transfer the governance state, and transfer enough exact continuation detail for the next chat to resume without reconstructing the prior chat from memory.**

## Required behavior

1. Run the normal Signalproof handoff discipline: preserve objective, phase, protected state, rollback/recovery, material failures, evidence classes, repository state, Build Ledger boundaries, prohibited actions, exact next action, and receiving-chat boot instructions.
2. Run the `log-skill` synchronization path for material milestone/learning state created or updated in the chat.
3. Produce or refresh an actual handoff Markdown artifact (`.md`) unless the operator explicitly requests another durable format.
4. The handoff artifact must reflect the **latest known state at the moment of handoff**, including material updates from the final exchange. Do not hand off an earlier snapshot after newer evidence exists.
5. Preserve pending `close-when-complete` obligations in the handoff.
6. Deduplicate before creating new public/private records.
7. Keep public-safe records separate from private/internal continuity evidence.
8. Do not reserve a canonical C-number.
9. Do not treat a projected/preview sequence as live chronology.
10. Do not auto-activate candidate outputs.
11. If the underlying milestone is actually complete and the operator explicitly requests closure, use the appropriate `log-skill close` form; otherwise handoff does not imply closeout.
12. The receiving chat must refetch volatile repository/ledger state before consequential writes.

## Handoff artifact contract

A `handoff-log` is incomplete until the durable handoff artifact is current enough for a fresh chat to pick up where the current chat stopped.

At minimum, include the following when applicable:

### 1. Identity and objective

- project/application/workstream name;
- build, RD, gate, case, milestone, or phase identity;
- current objective;
- current status: open, blocked, testing, ready, staged, closed, etc.

### 2. Current authority state

State separately what is:

- proven/accepted;
- authorized;
- not yet proven;
- explicitly not authorized;
- pending owner decision.

Never collapse evidence into authority. A passing test does not automatically authorize implementation, release, deployment, activation, closeout, or protected-state mutation.

### 3. Protected state and rollback/recovery

When consequential:

- protected paths or stable identifiers needed by the receiving chat;
- exact hashes or equivalent stable identities when required for safe continuation;
- immutable/protected boundaries;
- rollback or recovery references;
- partial workspaces that must be preserved;
- files/workspaces that must not be reset, cleaned, deleted, overwritten, or reorganized.

### 4. Accepted evidence chronology

Record the material sequence of attempts and outcomes, including:

- successful checkpoints;
- failed checkpoints;
- harness/parser/path/schema/evidence-control failures;
- product/runtime failures when actually evidenced;
- recovery attempts;
- parent evidence identities;
- decisive hashes/IDs needed to bind the next checkpoint.

Do not erase failed attempts simply because a later recovery succeeds.

### 5. Current technical conclusion

State what has actually been learned, not merely what was attempted.

Examples:

- source identity proven but build authority unresolved;
- mismatch isolated to one resource;
- parser defect rather than product defect;
- exact historical source recovered;
- runtime test passed but release authority not granted.

### 6. Exact continuation / build instructions

For active development, investigation, build, recovery, or test work, include a clearly labeled section such as:

**BUILD / CONTINUATION INSTRUCTIONS FOR NEXT CHAT**

It must state, in order:

1. the first action the receiving chat should take;
2. what evidence or files it must inspect first;
3. what existing workspace/state must be preserved;
4. the smallest next authorized build/test/investigation step;
5. the exact inputs or identities that step must bind when consequential;
6. what must not be changed or guessed;
7. what outputs/evidence should be captured;
8. acceptance criteria;
9. failure classification rules;
10. what action follows each material result branch;
11. whether additional owner authorization is required before the next consequential boundary.

If the next action is **investigate before build**, say that explicitly. Do not label speculative implementation as the next build instruction.

### 7. STOP conditions

Include task-specific STOP conditions whenever an unsafe or misleading continuation is plausible.

Examples:

- source/build authority unresolved;
- protected state differs from expected identity;
- prior output collision is unclassified;
- workspace thought to be fresh is not fresh;
- a recovery would require deleting evidence;
- canonical chronology would have to be guessed;
- a build script/source structure has not actually been inspected;
- continuation would expand beyond owner authorization.

### 8. Repository / Git state

When Git is involved, include:

- repository;
- authoritative/default branch state as last verified;
- working branch;
- PR number/status;
- candidate vs Active distinction;
- pending review/merge obligations;
- whether the receiving chat must refetch before writing.

Do not describe an unmerged candidate as canonical doctrine.

### 9. Build Ledger / logging state

When applicable, include:

- last verified canonical head only if actually verified;
- whether the current record is canonical or STAGED / NONCANONICAL;
- whether a C-number exists or is explicitly not reserved;
- closeout state;
- pending `close-when-complete` obligations;
- explicit prohibition against hand-editing chronology when the live head is unresolved.

### 10. Receiving-chat boot instruction

End with a concise boot instruction that tells the new chat exactly what to continue, what is already proven, what remains unresolved, and what not to do.

The boot instruction is a convenience layer, not a substitute for the full handoff artifact.

## Freshness rule

Before delivering the handoff artifact:

1. compare it against the latest user message and latest material tool/evidence result;
2. update any status, hashes, branch/PR state, authorization, failure classification, or next action that changed;
3. remove stale next-step instructions that have already been completed or disproven;
4. ensure the first action in the handoff is the actual next action now;
5. ensure the handoff does not instruct the receiving chat to repeat a known failed assumption.

If the handoff artifact was created earlier in the conversation and the state changed afterward, refresh the artifact rather than merely describing the change in chat prose.

## Relationship to `handoff`, `log-skill`, `log-build-git`, and `closeout`

- `handoff` preserves conversation continuity.
- `log-skill` preserves/synchronizes milestone and reusable-learning state.
- `handoff-log` performs both together and produces the durable continuation artifact.
- `log-build-git` may coordinate logging, an already-authorized bounded build/checkpoint, and public-safe Git synchronization.
- `closeout` is still separate unless completion is actually established and closure is requested/required.

Typical patterns:

`open work -> handoff-log -> fresh chat -> continue from exact next action`

`completed milestone -> log-skill close -> handoff-log -> fresh chat`

`open milestone with latch -> log-skill close-when-complete -> handoff-log -> fresh chat`

`authorized bounded build -> log-build-git -> evidence -> handoff-log -> fresh chat`

## Idempotency

Repeated `handoff-log` should refresh or verify existing handoff/log records rather than duplicate stable identities.

- Prefer updating/superseding the current handoff artifact when the workstream is the same.
- Preserve supersession history when materially new evidence changes governance state.
- Do not repeat already-completed actions as the next instruction.
- Do not lose failed-attempt history when refreshing the artifact.

## Public/private boundary

Public Git may contain public-safe handoff/governance documentation or candidate learning. Private evidence may contain exact local paths, hashes, internal recovery state, and staged ledger continuity needed for reconstruction.

Never publish credentials, customer/private data, private ledger internals, local recovery details, protected release/recovery identities, or other restricted evidence without explicit authority.

The private `.md` handoff may contain the exact continuity details necessary for safe resumption when those details are not approved for public Git.

## Update rule

Active does not mean frozen. Changes to `handoff-log` must be versioned, reviewed, tested proportionately, owner-approved, and preserve prior history through supersession rather than silent rewrite.

## STOP conditions

STOP when:

- the handoff cannot state the exact next authorized action;
- the handoff artifact is known to be stale relative to the current conversation;
- protected state is ambiguous;
- an active build/recovery handoff lacks enough information for the receiving chat to identify the next checkpoint safely;
- the proposed next step repeats a failed assumption already disproven by evidence;
- public/private boundaries would be violated;
- chronology is being fabricated;
- duplicate stable records would be created;
- a canonical C-number would need to be guessed or reserved;
- the command would silently turn a handoff into unauthorized canonical closeout;
- the receiving chat would need to infer consequential authority that the handoff failed to state explicitly.
