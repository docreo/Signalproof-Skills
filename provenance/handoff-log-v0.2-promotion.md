# `handoff-log` V0.2 — Continuity Package Promotion Record

**Status:** OWNER-APPROVED / PENDING MERGE TO MAIN  
**Version:** 0.2.0  
**Owner:** Doc Reo  
**Approval date:** 2026-08-19

## Promotion decision

Promote `handoff-log` from a conversation-summary handoff discipline into a durable continuity-package contract that requires a fresh chat to be able to resume consequential work without reconstructing the prior conversation from memory.

## New required behavior

V0.2 requires the command to produce or refresh a durable Markdown handoff artifact by default and to ensure that artifact reflects the latest material state at the moment of handoff.

For active build, recovery, investigation, or test work, the handoff must include explicit **BUILD / CONTINUATION INSTRUCTIONS FOR NEXT CHAT**, covering:

- exact first action;
- evidence/files to inspect first;
- protected/partial workspace state to preserve;
- smallest next authorized step;
- consequential input identities;
- known failed assumptions that must not be repeated;
- evidence outputs to capture;
- acceptance criteria;
- result-specific next branches;
- STOP conditions;
- authorization boundaries.

## Acceptance conditions

The V0.2 contract is acceptable only if it preserves all V0.1 governance boundaries while adding continuity completeness:

- no fabricated canonical chronology;
- no automatic milestone closeout;
- no authority inferred from evidence alone;
- failed attempts remain preserved evidence;
- public/private evidence boundaries remain intact;
- unmerged Git candidates remain noncanonical;
- stale handoff artifacts are refreshed when material state changes;
- a handoff may not instruct the receiving chat to repeat an already disproven assumption;
- active build/recovery work must include enough exact continuation detail to resume safely.

## Triggering lesson

The change was owner-requested after a Build 8A Gate 7 handoff contained the correct technical facts but required a follow-up clarification because the durable `.md` did not make the current build-continuation procedure prominent and complete enough for immediate resumption.

The governance lesson is generic: **a handoff is not complete merely because the history is accurate; it must also encode the exact present-tense continuation contract.**

## Supersession

After merge to canonical `main`, V0.2 supersedes V0.1. V0.1 remains historical provenance and must not be erased.
