---
name: signalproof-print
description: Complete-first Signalproof document workflow. Load the current /dsp complete contract and completion children, finish the bounded paper/report with academically sound APA 7 evidence discipline, build and visually verify one authoritative light-style DOCX, upload that exact DOCX automatically to Google Drive, verify its identity, and return the local and Drive links. Native Google Docs conversion and PDF are opt-in.
---

# Signalproof Print

## Purpose

`signalproof-print` is the artifact specialist behind `/dsp print`.

Its central rule is:

> **Use Signalproof Complete behavior to finish the bounded document, then deliver one authoritative academically sound APA 7 DOCX in the accepted Signalproof light print style and automatically upload that exact DOCX to Google Drive.**

"Print" means complete, render, verify, and deliver the durable document artifact. It does not mean physical printing.

## Complete-first composition

At the beginning of every consequential print run, refetch current Git and load:

- `commands/complete.md`;
- `commands/build-spawn-debug.md`;
- `skills/signalproof-build-spawn-debug/SKILL.md`;
- this Skill and `commands/print.md`;
- only the additional current children needed for the bounded document, such as Known Errors, Research, Document, Build, Debug/Full Debug, Investigate, Verify, Review, Security, Recovery, and Learn.

Do not recursively re-enter the shell. Apply Complete's bounded authorization, evidence, retry, recovery, and STOP semantics to the print workstream.

Routine research, document-build, rendering, QA, correction, and Drive-upload steps inside the bounded print envelope should not require repeated owner approval.

## Canonical default output

Default `/dsp print` produces:

1. an authoritative `.docx`;
2. automatic upload of that exact `.docx` to Google Drive;
3. verification that the Drive object is the expected DOCX file;
4. a local/download link and Google Drive/Google Docs link.

Default Drive storage preserves the DOCX MIME type:

`application/vnd.openxmlformats-officedocument.wordprocessingml.document`

The file may open inside the Google Docs editor, but it remains a DOCX.

Native Google Docs conversion is not required unless explicitly requested.

PDF is not created unless explicitly requested.

## Academic standard

Unless the operator specifies otherwise, use APA 7 as the academic/citation framework.

A completed document must:

- ground material factual claims in appropriate evidence;
- distinguish evidence, interpretation, inference, and opinion;
- research unresolved material facts when necessary;
- prefer primary, scholarly, official, or authoritative sources appropriate to the topic;
- use accurate APA 7 in-text citations and references when applicable;
- preserve correct authorship, title, date, DOI/URL, and source identity;
- never invent citations, quotations, page numbers, DOIs, or sources;
- represent internal Git/file/test evidence as internal technical evidence rather than pretending it is external scholarship;
- preserve uncertainty and source limitations.

If an explicit source-bound rewrite requires preserving the supplied content, do not introduce unsupported factual material merely to make it look academic.

## Author identity

Default visible byline: **Doc Reo**.

For formal citations to the operator's published work, use the bibliographic author name required by the source record and normalize author-date references under **Lawson** where appropriate. APA reference fields do not include degrees or honorifics.

Use **Dr. Signalproof** only when explicitly requested or when the bounded artifact is clearly a Signalproof system-authored technical/assessment report.

Honor any other explicit author/byline.

## Signalproof house presentation

Default print styling is light and paper-readable:

- white page background;
- dark body text;
- Aptos body text;
- Aptos Display for title and major headings unless a submission template requires another accepted font;
- restrained Signalproof navy/blue hierarchy;
- limited green/amber accents for status or analytical emphasis;
- U.S. Letter page geometry with disciplined margins;
- compact professional spacing;
- consistent page numbering, headers/footers, tables, figures, captions, and references;
- no white body text on black pages;
- no dark dashboard background for ordinary report/paper output;
- no decorative excess that harms print readability.

Selection order:

1. operator-specified template;
2. accepted same-series Signalproof style;
3. accepted Signalproof light paper/report style;
4. technical/security-report typography fallback.

## Print Complete Envelope

Before creating artifacts, preserve:

```text
PRINT COMPLETE ENVELOPE
Target
Objective
Author/byline
Document class
Evidence basis
Academic standard
Style baseline
Authoritative DOCX filename
Google Drive destination
Automated gates
Human acceptance boundary
Recovery/non-overwrite path
Excluded authority
```

The envelope survives bounded corrections and owner-reported FAIL for the same document.

## Authoritative artifact pipeline

### 1. Resolve and complete content

Resolve the exact target from current conversation, attached/library file, connected source, explicit Git file, or current bounded work item.

Complete missing evidence and writing necessary for the requested document. Do not invent missing facts or silently widen the subject.

### 2. Build DOCX

Create one finished DOCX as the authoritative artifact.

Required checks:

- valid/openable package;
- correct title/byline and document class;
- APA 7 citation/reference consistency;
- accepted Signalproof light style;
- tables/figures/captions intact;
- headers/footers/page numbers intact;
- no clipped or overlapping content.

### 3. Render and visually verify

When tooling supports rendering, render the exact DOCX and inspect all pages.

Repair:

- clipping;
- overflow;
- unreadable contrast;
- broken tables/charts;
- bad page breaks;
- orphaned headings;
- malformed references;
- accidental dark-page styling.

Rerender after material corrections.

### 4. Upload exact DOCX to Google Drive

Upload the exact verified DOCX bytes to Google Drive.

Verify the returned file title/identity and DOCX MIME type. Return the provider link.

Do not stop at a failed native-conversion action when raw DOCX upload is supported.

Do not silently overwrite an existing Drive file.

### 5. Optional outputs

`/dsp print pdf`: create PDF only when explicitly requested.

`/dsp print all`: DOCX + Drive DOCX + PDF.

`/dsp print native google doc`: preserve the DOCX, then explicitly convert/import that exact verified DOCX to a native Google Doc and return both links.

Never use the forbidden degraded path:

```text
DOCX/PDF -> extract plain text -> blank Google Doc -> insert paragraphs
```

## Completion loop

Use the current Complete/Build Spawn Debug discipline:

```text
CURRENT TRUTH
-> KNOWN ERROR / PRIOR FAILURE MEMORY
-> COMPLETE BOUNDED CONTENT
-> BUILD DOCX
-> VERIFY + VISUAL QA
-> FAIL? LOCALIZE + CORRECT + RETEST
-> DRIVE UPLOAD
-> VERIFY DRIVE IDENTITY
-> USER REVIEW READY
-> USER FAIL? RESUME WITH NEW EVIDENCE
-> USER PASS? USER ACCEPTED
```

Same-failure retries require materially new evidence or a materially changed condition. Do not repeat unchanged failed upload/render paths indefinitely.

## Output classifications

Use:

- `CREATED`;
- `RESTYLED / CREATED`;
- `REUSED EXACT SOURCE`;
- `VERIFIED EQUIVALENT`;
- `PRINT COMPLETE / USER REVIEW READY`;
- `PRINT COMPLETE / USER ACCEPTED`;
- `BLOCKED`;
- `STOP / OWNER DECISION REQUIRED`.

Never claim Google Drive success, APA 7 PASS, visual QA PASS, or owner acceptance without supporting evidence.

## Anti-patterns

Repair or stop when the run:

- ignores current `/dsp complete` and completion-child contracts;
- returns an unfinished draft when bounded corrections remain available;
- uses black/dark paper backgrounds for ordinary report output;
- treats APA 7 as decorative rather than evidence/citation discipline;
- invents references;
- creates a generic Word-default document despite an applicable Signalproof style;
- declares completion before visual QA when rendering is available;
- converts to native Google Docs by default;
- stops after native conversion fails without trying supported exact-DOCX Drive upload;
- uploads a different DOCX than the exact verified artifact;
- returns no Drive link after a confirmed upload;
- reconstructs a Google Doc from extracted plain text;
- creates PDF without request;
- silently overwrites a prior Drive file;
- claims user PASS before the owner reports it.

## Completion criteria

Default `/dsp print` is complete enough for owner review when:

1. the bounded target is resolved;
2. required content/evidence work is finished;
3. APA 7 academic requirements pass for the applicable document class;
4. Signalproof light print styling is applied;
5. the authoritative DOCX validates;
6. full-document visual QA passes when supported;
7. that exact DOCX is uploaded to Google Drive;
8. Drive file identity/MIME is verified;
9. local and Drive links are returned.

Owner acceptance remains a separate human-observed final state.

## Identity

- **Suite:** Signalproof Skills
- **Skill:** `signalproof-print`
- **Version:** `0.4.0`
- **Maturity:** Active public baseline
- **Parent:** `signalproof` 0.1.1+
- **Works with:** `complete`, `signalproof-build-spawn-debug`, `signalproof-research`, `signalproof-document`, `signalproof-verify`, `signalproof-review`, `signalproof-learn`
- **Domain:** complete-first APA 7 document completion, Signalproof print styling, DOCX validation, visual QA, Google Drive DOCX delivery
- **Created by:** Doc Reo / Signalproof
