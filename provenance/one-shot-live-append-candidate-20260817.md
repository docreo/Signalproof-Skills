# Skill Candidate — One-Shot Governed Live Append

**Stable ID:** `SP-BUILD-ONE-SHOT-LIVE-APPEND-20260817`

**Affected skill:** `signalproof-build`

**Lifecycle:** `CANDIDATE`

**Status:** NOT ACTIVE

## Source observation

A governed Signalproof Competition Radar correction flow required the first controlled write to a live append-only owner-decision sidecar after automated, visual, and authority gates had already passed.

The owner-facing workflow used two distinct confirmation boundaries:

1. an external controlled-launch arming gate before the application process received live-write authority;
2. an in-application exact-target confirmation immediately before the append control became enabled.

The application then disabled the commit path as soon as the append attempt began and displayed an explicit no-retry instruction for uncertain outcomes.

## Reusable lesson

> A consequential append-only live write should become a one-shot authority transition before persistence outcome is known, with explicit target confirmation and a no-blind-retry recovery rule.

## Candidate operating rule

For bounded live writes where duplicate actuation would be materially harmful:

1. verify the accepted build/source baseline before enabling live authority;
2. verify the exact logical target immediately before actuation;
3. freeze recoverable prestate before the first live attempt;
4. require an external arming decision when the normal application launch intentionally lacks write authority;
5. require an independent in-application confirmation showing the exact target and proposed change;
6. make the commit control one-shot before persistence result is known;
7. if the outcome is uncertain, do not retry automatically or manually;
8. inspect persisted state read-only before deciding whether recovery or another attempt is authorized;
9. preserve both logical event evidence and physical storage evidence where practical;
10. keep unrelated mutation paths such as scanning, reclassification, ordinary review writes, or theme work outside the acceptance lane.

## Runtime visual evidence

Competition Radar RD2 C1-E Build 3C visibly demonstrated:

- controlled owner-acceptance gate enabled only for the bounded acceptance process;
- exact classification run, signal, sequence, event target, original state, original disposition, proposed disposition, notes, and `Corrected` state shown before commit;
- explicit append-only warning that the historical target would not be edited or deleted;
- owner confirmation checkbox required before the append button became enabled;
- append button enabled only after preview plus explicit confirmation;
- `APPEND SUCCEEDED` shown after one click;
- commit button disabled after the append attempt;
- new event sequence displayed as `2`;
- new event reported `previous_event_id` equal to the original event;
- new event reported `correction_of_event_id` equal to the semantic historical target;
- review state displayed as `Corrected`;
- owner disposition displayed as `Investigate`;
- correction notes displayed as `Let's Investigate and Watch`;
- UI instructed the owner not to submit another correction from that page.

Observed new event ID:

`F8BAFC528678BA782662D337AF082E29EC7A38EF4F1C541E4166A5379B3BEDB1`

## Independent persisted-state evidence

A separate read-only post-process verifier was run after Radar was closed.

It independently proved:

- history count = `2` exactly;
- original event ID remained `DD949ADD39495F1F2274A5CB745DE2C1FA96E2FA8B607BBE294F3A94A08DF996`;
- original sequence remained `1`;
- original `previous_event_id` remained absent;
- original review state remained `Reviewed`;
- original owner disposition remained `Investigate`;
- original `correction_of_event_id` remained absent;
- new event ID = `F8BAFC528678BA782662D337AF082E29EC7A38EF4F1C541E4166A5379B3BEDB1`;
- new event sequence = `2`;
- new `previous_event_id` = original event ID;
- new `correction_of_event_id` = original semantic target event ID;
- new review state = `Corrected`;
- new owner disposition = `Investigate`;
- new notes = `Let's Investigate and Watch`;
- new actor role = `Owner`;
- current owner state resolves to the correction event;
- classifier disposition remains `Investigate`;
- raw `radar.db` remained unchanged;
- `signals.db` remained unchanged.

Current accepted `reviews.db` SHA-256 after the append:

`4057B3D0BECD93B1B42C9CF3C663B703DCE47B4EA87F4F4713E1214EECBBF672`

Independent post-live verification evidence SHA-256:

`C8026B9FCE05366F0762532C54C8B8FCE898C29CB33717DB12468BA165CE7A8C`

## Evidence boundary

Evidence class now supporting this Candidate:

- Human-Observed / Owner Acceptance
- Runtime Visual Evidence
- Automated Build Evidence
- Independent Read-Only Persisted-State Evidence

The one live case now has both in-application and post-process persisted-state proof. Formal milestone closeout remains a separate governance gate and is not inferred from this evidence.

## Why Candidate, not Tested or Active

The pattern has worked in one meaningful live-write case with independent persisted-state verification, but broader reuse is still required before it should become public Active doctrine.

Remaining minimum evidence before promotion:

1. a second materially different one-shot live-write workflow applies the pattern successfully;
2. an uncertainty/failure exercise demonstrates that retry remains blocked until state inspection;
3. recovery remains available without automatic destructive restore;
4. fresh-session recovery applies the pattern without depending on chat memory;
5. if promoted into `signalproof-build`, the change passes the skill suite acceptance/governance path.

## Non-regression constraints

This pattern must not:

- turn every write into a cumbersome multi-step ceremony regardless of risk;
- grant live authority to normal launches that are intentionally read-only;
- substitute UI success text for persisted-state verification;
- permit a second attempt simply because the first response is ambiguous;
- automatically restore or delete live storage artifacts after uncertain persistence;
- conflate semantic target identity with append-order predecessor identity;
- bypass the governed store/transaction path;
- expand into unrelated product mutation.

## Relationship to existing doctrine

This Candidate extends existing `signalproof-build` principles for protected state, partial actuation, exact acceptance status, and recoverable ownership. It may ultimately become a bounded addition to `signalproof-build` rather than a new specialist skill.

## Current status

`CANDIDATE / NOT ACTIVE`
