# Signalproof Opportunity Detector V1 RD1 — Detail C2 R1 Acceptance

**Status:** OWNER-ACCEPTED SELECTED-DETAIL / REQUIREMENT-EXTRACTION BASELINE

## Milestone

Signalproof Opportunity Detector V1 RD1 Detail C2 R1.

## Accepted capability

Opportunity Detector now supports a selected live Grants.gov opportunity moving from search discovery into full source detail and deterministic requirement-candidate extraction.

Accepted behavior includes:

- user-initiated selected-opportunity detail retrieval from Grants.gov `fetchOpportunity`;
- official source detail shown in Review;
- applicant type, agency/contact, posting date, due-date fields when provided, award floor/ceiling, cost-sharing state, funding instrument, ALN data, attachment metadata count, and synopsis presentation;
- raw transport response SHA-256 identity without raw response persistence;
- sanitized persistent detail evidence with SHA-256 identity;
- deterministic requirement candidates with source-field provenance;
- requirement candidates remain `RULE_EXTRACTED_NEEDS_HUMAN_REVIEW`;
- eligibility remains `NEEDS REVIEW` until Signalproof-specific assessment;
- fit remains `NOT ASSESSED`;
- system disposition remains conservative `WATCH / REVIEW`;
- no automated owner decision;
- no application/submission action;
- no attachment download;
- accepted Grants.gov search behavior preserved;
- Opportunity Detector remains implementation-independent from Competition Radar.

## Verification evidence

R1 automated verification established:

- full solution build: PASS, 0 warnings / 0 errors;
- selected-detail parser regression: PASS;
- requirement extraction regression: PASS;
- Security candidate classification: PASS;
- Data candidate classification: PASS;
- Personnel candidate classification: PASS;
- Budget candidate classification: PASS;
- Schedule candidate classification: PASS;
- original deterministic Detector regression: PASS;
- Detector integration regression: PASS;
- accepted Grants.gov search regression: PASS;
- accepted Live Source C1 rollback: preserved;
- protected Core / Decision Engine / original Check / branding: unchanged;
- accepted live-search implementation: unchanged;
- Radar implementation dependency: absent;
- direct network implementation remains confined to the governed Grants.gov search and selected-detail adapters.

R1 candidate manifest SHA-256:

`A2387AD37D85702A806D0253CC0986A06F752140B1F17B8A42C3469DD472B878`

## Owner runtime / visual acceptance

The owner launched the Detail C2 candidate, selected live Grants.gov opportunities, loaded full detail, and observed the Review workspace operating correctly.

Owner statement:

> `ok did not see on the first one but it all works`

The supplied runtime screenshots show:

- `FULL DETAIL: CAPTURED / REQUIREMENTS NEED REVIEW`;
- live official Grants.gov source locator;
- source evidence and SHA-256 identity;
- eligibility preserved as `NEEDS REVIEW`;
- fit preserved as `NOT ASSESSED`;
- system recommendation preserved as `WATCH / REVIEW`;
- owner decision preserved as `NO OWNER DECISION`;
- full Grants.gov detail fields rendered;
- source synopsis rendered;
- detail normalized/raw/sanitized evidence hashes displayed;
- deterministic requirement-candidate table populated.

Evidence class: **Human-Observed Fact + Acceptance Authority**.

## Failure preserved

Initial Detail C2 failed the new requirement-classification regression because generic applicant/eligibility matching executed before domain-specific classification. The sentence `Applicants must document cybersecurity controls.` was therefore consumed as Eligibility before Security classification.

R1 changed only `RequirementExtractionService.cs`, moving generic eligibility/applicant fallback after domain-specific classifiers. The exact failing regression then passed, followed by all protected regressions.

## Reusable learning

Learning classification:

**CANDIDATE / TESTED PATTERN / NOT ACTIVE DOCTRINE**

Supported lessons:

1. Deterministic extraction should preserve source evidence and remain human-review state until a later governed assessment step confirms meaning and applicability.
2. In ordered rule classifiers, domain-specific signals should generally be evaluated before broad/generic fallback terms when the fallback could consume higher-specificity evidence.
3. Full source retrieval, requirement extraction, eligibility determination, fit scoring, recommendation, and owner disposition are separate evidence/authority gates and should not be silently collapsed.

No new Active skill is created by this record.

## Known limitations / open gates

- search pagination beyond the current 25-record page remains deferred;
- attachment bodies are not downloaded or parsed;
- extracted candidates are not yet capability-matched;
- Signalproof-specific eligibility is not yet determined;
- fit scoring remains unimplemented for live detail;
- owner decision persistence/project activation remains unimplemented;
- production datastore, release/signing, and broader security readiness remain separate future gates.

## Next product phase

Authorized next operational phase: connect human-reviewed requirement candidates to governed Signalproof capability evidence, identify EXISTING / PARTIAL / GAP / PARTNER CANDIDATE / UNKNOWN states, and only then begin evidence-backed fit/recommendation work.