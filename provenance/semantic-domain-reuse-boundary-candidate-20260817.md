# Skill Candidate — Semantic Domain Reuse Boundary

**Stable ID:** `SP-BUILD-SEMANTIC-DOMAIN-REUSE-20260817`

**Affected skills:**

- `signalproof-plan`
- `signalproof-design`
- `signalproof-build`
- `signalproof-review`

**Lifecycle:** `CANDIDATE`

**Status:** NOT ACTIVE

## Reusable lesson

> Similar field names, enums, UI labels, or persistence shapes do not prove that two workflows share the same domain semantics. Reuse must be justified by meaning, invariants, authority, and lifecycle — not vocabulary alone.

## Source observation

During Signalproof Competition Radar governed Rating / Promotion planning, source inventory showed that the existing signal owner-review domain already contained concepts such as `Disposition`, history, persistence, owner decisions, and correction events.

The new capability-assessment feature also needed a strategic disposition, history, evidence references, owner approval, lifecycle state, rating, promotion, and endorsement state.

A naive implementation could therefore have reused `SignalReviewEvent`, `SignalReviewStore`, `reviews.db`, or related UI merely because several names appeared compatible.

The governed Plan / Design and implementation authorization instead established that the domains are materially different:

- **Signal review/correction** governs a detected competitive signal and its append-only owner review lineage.
- **Capability assessment** governs an evaluated technology/repository/capability, including lifecycle, strategic disposition, evidence-backed rating, hard gates, promotion eligibility, owner approval, and public endorsement state.

The implementation authorization therefore protects the signal review/correction domain and authorizes a separate capability-assessment domain and, if needed, a separate derived sidecar.

## Candidate operating rule

Before reusing an existing domain model/store/workflow because names look similar, verify at least:

1. **Entity identity** — are the records describing the same kind of thing?
2. **Lifecycle** — do the entities move through the same states for the same reasons?
3. **Authority** — do writes require the same human/system permissions?
4. **Invariants** — are the same facts immutable, append-only, correctable, replaceable, or derived?
5. **History semantics** — does event order mean the same thing?
6. **Decision semantics** — does a field such as `Disposition` represent the same decision category?
7. **Hard gates** — do blockers and eligibility rules operate the same way?
8. **Persistence ownership** — should the records share a store, schema, retention policy, and rollback boundary?
9. **UI meaning** — would reuse preserve user understanding rather than overload an existing workflow?
10. **Recovery** — can one domain be removed or restored without corrupting the other?

If these do not align, prefer a separate domain boundary even if this introduces additional types or a separate derived store.

## Evidence from Radar Rating / Promotion authorization

The accepted authorization established:

- protected predecessor: `RADAR-RD2-C1E-B3C`;
- capability domain: separate from Signal Review;
- a new derived sidecar authorized if needed;
- existing Review/History/Correction source heads explicitly protected;
- raw `radar.db`, `signals.db`, and `reviews.db` unchanged;
- implementation limited to new capability-assessment contracts/store/schema/reader/workspace/checks plus narrowly conditional shell/check registration changes;
- automatic GitHub star/unstar and dependency upgrades not authorized.

Accepted authorization artifact hashes:

- authorization SHA-256: `4793FFBC0A8F53F2DDACAF9723AFE5A6A4707DD4630BA31F282660D3C07E589E`
- authorization manifest SHA-256: `AFFB025EF9952315CF077D70D0D3FBCB98413D74575B1F8E9EC390B3CA5A2EBB`
- staged authorization ledger SHA-256: `0D721A77C3022BFE7BDB6574129719AD29227164FFBA3ABE0EF4A23EC86482AA`
- authorization transcript SHA-256: `B496A27C4D91070D08E2F79269846D0DD54973BCC2B7E8485398D08D8D5E1958`

## Evidence from Radar Rating / Promotion Build 1

The boundary was then implemented and exercised in the first bounded Build 1 candidate.

Automated acceptance proved:

- a separate `CapabilityAssessmentContracts` domain compiled successfully;
- `CapabilityDisposition` remained a distinct type from `SignalDisposition`;
- the capability store resolved to a separate `capability-assessments.db` sidecar;
- the capability store did not reuse `reviews.db` or `signal_review_events`;
- an initialized capability sidecar began with zero fabricated assessments;
- UNKNOWN evidence could not be coerced into a star rating;
- failed security/provenance/license hard gates blocked promotion;
- promotion required explicit owner approval;
- FEATURED required a five-star rating;
- rating history used append lineage and preserved prior event identity;
- rating-change reasons remained retrievable;
- GitHub endorsement state remained distinct from rating and promotion;
- the accepted Build 3C review chain remained logically unchanged;
- protected Signal Review / History / Correction source heads remained unchanged;
- live `radar.db`, `signals.db`, and `reviews.db` remained unchanged;
- no live `capability-assessments.db` was created during automated acceptance;
- the Build 1 UI exposed no assessment write, promotion, append, or GitHub-star control.

Accepted Build 1 evidence:

- Build 1 manifest SHA-256: `E5B477DBDCF1FF92619B783013BD565757AB86DCC3807955060334A6F2EAB03A`
- Build 1 phase SHA-256: `FC603D33F65DC3D887E8CFC7388F66BC8D74D8F931502813C673DD90A5466A5E`
- staged Build 1 ledger SHA-256: `70CD8DD00677D012649A7410435264602B40F1653F83383CE31CCEBFBACCA293`
- Build 1 transcript SHA-256: `639CE47BDF5BB8B4E184C04C238CCB8C1842F5219A75325EA0E7228A7F685F72`

This is stronger than design-only evidence because the separated domain compiled and passed runtime semantic tests while the tempting pre-existing domain remained protected.

## Why Candidate

The rule is now supported by one consequential design/authorization/implementation case, but it has not yet been validated across multiple materially different product domains.

Before promotion, test it against at least two additional cases where vocabulary overlap tempts model/store reuse, and verify that the rule prevents semantic coupling without causing unnecessary duplication.

## Anti-patterns

Do not interpret this Candidate as:

- “never reuse models”;
- “every feature needs its own database”;
- “shared enums are always unsafe”;
- “domain separation requires broad architecture rewrites.”

Reuse remains desirable when identity, lifecycle, authority, invariants, and persistence semantics genuinely align.

## Current status

`CANDIDATE / NOT ACTIVE`
