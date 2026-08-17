# Signalproof Opportunity Detector V1 RD1 — Live Source C1 Acceptance

**Status:** OWNER-ACCEPTED LIVE SOURCE BASELINE / PUBLIC-SAFE EVIDENCE

## Milestone

Signalproof Opportunity Detector V1 RD1 Live Source Candidate 1 R2.

## Accepted capability

The owner-accepted Detector shell now supports the first governed live public opportunity source through Grants.gov `search2`.

Accepted behavior includes:

- user-initiated live Grants.gov search;
- no API key or credential requirement;
- HTTPS-only official endpoint policy;
- redirect following denied;
- bounded response handling;
- sanitized persistent evidence with SHA-256 identity;
- raw transport response hashed without raw transport persistence;
- live discoveries remain `NEEDS REVIEW` and `LIVE_SOURCE_DISCOVERED_UNASSESSED`;
- fit fields remain unscored until a later governed assessment phase;
- discovery-stage recommendation remains conservative `WATCH / REVIEW`;
- no automated owner decision;
- Opportunity Detector remains implementation-independent from Competition Radar.

## Verification evidence

The live verification established:

- Grants.gov adapter live state: PASS;
- source connection state: READY;
- query: `artificial intelligence`;
- total matching opportunities reported by source: `206`;
- live records captured in the bounded verification page: `10`;
- sanitized evidence integrity: PASS;
- all captured live records remained explicitly unassessed;
- owner decisions invented: NO;
- post-live wrapper defect corrected without repeating the successful live request;
- full solution build after correction: PASS with 0 warnings / 0 errors;
- original deterministic Detector regression: PASS;
- Detector integration regression: PASS;
- Grants.gov parser/security regression: PASS;
- protected Core / Decision Engine / original Check / branding unchanged;
- Radar implementation dependency: ABSENT.

Accepted R2 candidate manifest SHA-256:

`FF07AB8BA118EF9AB85AA09680E6D907C93C9D4DF4260AAB70CB35618B5B4065`

## Owner acceptance

Owner runtime/visual acceptance:

> `perfect workking`

Evidence class: **Human-Observed Fact + Acceptance Authority**.

## Known limitation / future gate

The current UI requests at most 25 search records per query page. A source may report a larger total hit count.

Therefore:

- a single loaded page must not be represented as the complete search result set when `hitCount > loadedRecordCount`;
- future Detector work should add explicit page/next-group navigation or bounded multi-page retrieval;
- completeness claims require proving that every intended source page was retrieved or that the user intentionally stopped early.

This limitation does not invalidate the accepted first-live-source milestone; it limits search-set completeness.

## Learning disposition

**CANDIDATE / TESTED PATTERN / NOT ACTIVE DOCTRINE**

Supported public-safe lessons:

1. Live discovery should enter the product as source-backed but unassessed state rather than receiving fabricated fit/eligibility conclusions.
2. Successful network actuation and wrapper/evidence-harness completion are separate gates; a post-actuation wrapper defect must not automatically trigger a repeated live request.
3. API page size and total source hit count are separate facts. A paged source requires explicit pagination evidence before claiming a complete search set.

No new Active skill is created by this record.

## Next product phase

The shortest operational path is selected-opportunity detail retrieval, requirement extraction, capability matching, evidence-backed fit analysis, and owner project activation. Pagination remains a required near-term enhancement but does not block beginning selected-opportunity work.