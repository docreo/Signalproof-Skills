# Signalproof Print V0.1 Acceptance

**Candidate:** `signalproof-print` 0.1.0 + `print` command 0.1.0  
**Branch:** `feature/dsp-print`  
**Owner:** Doc Reo  
**Date:** 2026-09-02

## Required behaviors

1. PASS — `/dsp print` with a resolved current document requests the default set: DOCX, PDF, Google Doc.
2. PASS — `/dsp print docx` requests only a DOCX for the current bounded document/item.
3. PASS — `/dsp print pdf <target>` requests only a PDF for the resolved target.
4. PASS — `/dsp print @<name>` treats `@<name>` as an exact named-item selector and uses the default three-output set.
5. PASS — explicit Git/server paths identify source items without granting repository/server overwrite authority.
6. PASS — one authoritative DOCX state is established or reused before sibling PDF/Google outputs when applicable.
7. PASS — Google Docs output requires native Google Drive import/conversion of the finished DOCX.
8. PASS — regression guard: `DOCX/PDF -> extract plain text -> create Google Doc -> insert paragraphs` is explicitly forbidden when a formatted DOCX exists.
9. PASS — failed Google conversion blocks only the Google output and preserves successfully created/reused DOCX/PDF siblings.
10. PASS — ambiguous target selection stops for minimum disambiguation rather than guessing.
11. PASS — output classification distinguishes CREATED, REUSED EXACT SOURCE, VERIFIED EQUIVALENT, and BLOCKED.
12. PASS — public/private boundaries, source replacement, publication, deployment, and external sharing are not silently authorized by `print`.

## Skill budget

Candidate `skills/signalproof-print/SKILL.md` is approximately 8.5 KB UTF-8, below the 15,000-byte Active Skill limit.

## Failure learned from live use

A native Google Doc was previously recreated by inserting extracted text into a blank Google Doc after direct DOCX conversion failed. The content survived, but document design/formatting degraded materially. The operator explicitly rejected that result.

Regression rule:

> For Google Docs output, upload/import the completed DOCX. If native conversion cannot be completed, report the Google Doc output blocked. Do not silently reconstruct a text-only native Doc.

## Disposition

**TESTED / ACCEPTANCE PASS** — eligible for governed promotion to Active public baseline.
