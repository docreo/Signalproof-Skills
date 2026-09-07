# Signalproof Print V0.2 Acceptance

**Candidate:** `signalproof-print` 0.2.0 + `print` command 0.2.0  
**Branch:** `feature/dsp-print`  
**Owner:** Doc Reo  
**Date:** 2026-09-07

## Required behaviors

1. PASS — `/dsp print` with a resolved current document requests the default DOCX + native Google Doc workflow.
2. PASS — `/dsp print docx` requests only a DOCX for the current bounded document/item.
3. PASS — `/dsp print pdf <target>` requests only a PDF for the resolved target.
4. PASS — `/dsp print all <target>` requests DOCX + PDF + native Google Doc.
5. PASS — `/dsp print @<name>` treats `@<name>` as an exact named-item selector and uses the default DOCX + native Google Doc workflow.
6. PASS — explicit Git/server paths identify source items without granting repository/server overwrite authority.
7. PASS — an applicable accepted Signalproof paper style is applied or verified before artifact delivery.
8. PASS — current technical/white-paper fallback uses the approved Signalproof security-report family treatment: Aptos body, Aptos Display title/headings, restrained Signalproof navy/blue hierarchy, professional Letter-size report layout.
9. PASS — one authoritative styled DOCX state is established or reused before Google Docs or PDF sibling output.
10. PASS — DOCX visual/render QA is required when supported by the document-generation tooling before delivery.
11. PASS — Google Docs output requires native Google Drive import/conversion of the finished styled DOCX.
12. PASS — regression guard: `DOCX/PDF -> extract plain text -> create Google Doc -> insert paragraphs` is explicitly forbidden when a formatted DOCX exists.
13. PASS — failed Google conversion blocks only the Google output and preserves the successfully created/reused DOCX.
14. PASS — PDF is not created by default when no PDF was requested.
15. PASS — ambiguous target selection stops for minimum disambiguation rather than guessing.
16. PASS — output classification distinguishes CREATED, RESTYLED / CREATED, REUSED EXACT SOURCE, VERIFIED EQUIVALENT, and BLOCKED.
17. PASS — public/private boundaries, source replacement, publication, deployment, and external sharing are not silently authorized by `print`.

## Failure lessons captured

Two live-use failures are now regression rules:

1. A native Google Doc was recreated by inserting extracted text into a blank Google Doc after direct DOCX conversion failed. The content survived but document design degraded materially. The operator rejected that result.
2. A later white-paper run preserved content but used generic academic manuscript typography instead of the established Signalproof paper treatment. The operator clarified that `/dsp print` must first make the document look like an accepted Signalproof paper, with the recent security report typography approved as a reference.

Regression rules:

> Apply or verify an accepted Signalproof paper style before output. Build and visually verify the authoritative DOCX first. Then create the native Google Doc by importing that DOCX. Do not silently reconstruct the native Doc from extracted text. Do not create a PDF by default unless requested.

## Disposition

**TESTED / ACCEPTANCE PASS** — candidate behavior updated for governed promotion.
