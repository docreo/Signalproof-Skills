---
name: signalproof-print
description: Single canonical Signalproof document-output workflow. Resolve document class and author identity, apply the accepted Signalproof house paper/report style, build and visually verify one authoritative DOCX, then create a native Google Doc by importing that completed DOCX through Google Drive conversion. PDF is produced only when explicitly requested. Default authoring identity is Doc Reo unless otherwise stated; formal citations to the operator's work normalize under Lawson.
---

# Signalproof Print

## Purpose

`signalproof-print` is the artifact-output specialist behind `/dsp print`.

Its central rule is:

> **Keep one print pipeline. Resolve author/voice separately from layout. Build the authoritative Signalproof-styled DOCX first, visually verify it, then import that finished DOCX into Google Docs. Produce PDF only when explicitly requested.**

"Print" means create/export the durable document artifact set, not send content to a physical printer.

## Canonical Output Contract

Default `/dsp print` output:

1. authoritative Signalproof-styled DOCX;
2. native Google Doc created from that DOCX through Google Drive native conversion.

Do not automatically create a PDF.

Explicit behavior:

```text
/dsp print docx      -> DOCX only
/dsp print docs      -> native Google Doc from authoritative DOCX workflow
/dsp print pdf       -> PDF only, derived from authoritative DOCX when possible
/dsp print all       -> DOCX + PDF + native Google Doc
```

## One Print System, Multiple Author Voices

Formatting/output behavior does not change when the author changes.

### Default author: Doc Reo

Unless the operator explicitly states otherwise, assume the visible author/byline is:

**Doc Reo**

Use this authoring mode for papers, essays, publication-oriented analysis, thought leadership, opinion-informed pieces, academic-style writing, and documents that incorporate the operator's interpretation, outlook, or argument.

Do not automatically expand the visible byline to the operator's full legal/professional name.

### Formal citation identity

For APA 7 and similar author-date citation systems, citations to the operator's own work normalize under the surname:

**Lawson**

Examples:

```text
(Lawson, 2026)
Lawson (2026)
```

APA 7 reference-list author fields do not include professional titles, honorifics, or academic degrees. Use the bibliographic author name required by the source record, but do not append credentials such as M.Ed. or M.A. to the citation author field.

The visible publication byline and the formal citation identity are separate concerns:

- visible byline default: `Doc Reo`;
- formal citation surname: `Lawson`;
- full name/credentials: only when explicitly requested or materially required by submission, credential, legal, or publication context.

### Dr. Signalproof reports

When the operator explicitly requests a Dr. Signalproof report, or the work is clearly an internal technical/assessment/reporting artifact authored by the Signalproof system, use **Dr. Signalproof** as the reporting voice.

Dr. Signalproof represents synthesis of the relevant team's findings. Its prose should emphasize evidence, findings, status, implications, risk, and recommendations rather than presenting personal opinion as Doc Reo's viewpoint.

### Other author identities

Honor explicitly requested bylines such as:

- Signalproof;
- Mareo-Ahmir Lawson;
- Mareo-Ahmir Lawson, M.Ed., M.A.;
- another named author.

Changing the author identity must not change the print/layout pipeline.

## Document-Class Distinction

### Publication / paper

Typical characteristics:

- defaults to Doc Reo unless otherwise stated;
- may include the operator's opinion, analysis, outlook, interpretation, argument, or synthesis;
- more academic/publication-oriented structure where appropriate;
- may use APA 7 or other requested citation conventions;
- should preserve uncertainty and distinguish evidence from interpretation.

### Report

Typical characteristics:

- may use Dr. Signalproof when explicitly requested or clearly system-authored;
- more reporting/assessment-oriented than personal;
- emphasizes observed state, evidence, analysis, implications, risks, and next actions;
- avoids attributing team synthesis to Doc Reo personally unless the source supports that attribution.

These are content/voice distinctions only. Both use the same Signalproof print system.

## Signalproof House Style Gate

Before output, determine the closest accepted Signalproof document class and apply the established style unless the operator supplies a specific template or explicitly requests a different style.

Current preferred characteristics:

- Aptos body typography;
- Aptos Display titles and major headings;
- restrained Signalproof navy/blue hierarchy;
- clean U.S. Letter page geometry with disciplined margins;
- compact professional spacing;
- consistent headers, footers, page numbering, captions, tables, and reference formatting;
- clear section hierarchy;
- preservation of APA 7 conventions when APA 7 is requested;
- no generic Word-default styling when an accepted Signalproof style exists;
- no unnecessary gradients, decorative rules, or presentation-style effects.

Style selection order:

1. operator-specified template/style;
2. accepted style already established for the same paper/report series;
3. closest accepted Signalproof paper/report style;
4. current Signalproof security-report typography as technical fallback.

Fail the style gate rather than silently returning a generic manuscript when an accepted Signalproof style is available.

## Authoritative Document Pipeline

### A. Resolve source and target

Resolve the current bounded item using the smallest authoritative path:

1. explicit current conversation item or selected attachment;
2. exact named current artifact/document;
3. exact filename in accessible conversation/library/authorized connected storage;
4. explicitly identified Git repository + file path;
5. explicitly identified accessible server/local path;
6. current bounded work item when the operator says only `/dsp print` or `/dsp print <type>`.

Never guess a repository, server, path, or similarly named file.

### B. Resolve author and document class

Determine:

- publication/paper vs report;
- visible author/byline;
- citation identity if relevant;
- requested citation system;
- whether the source intentionally contains operator opinion or only team findings.

Default to **Doc Reo** for authoring unless the operator states otherwise.

### C. Build authoritative DOCX

Create or reuse one finished DOCX.

Required checks:

1. document opens/validates;
2. accepted Signalproof styling is present and internally consistent;
3. headings, tables, references, captions, headers/footers, pagination, and figures are not clipped or broken;
4. render to page images and visually inspect the full document when tooling supports it.

The DOCX is authoritative for sibling outputs.

### D. Google Docs

Create the native Google Doc by importing/uploading the finished DOCX through Google Drive native conversion.

Required path:

```text
SIGNALPROOF-STYLED DOCX
     -> Google Drive import/conversion
     -> NATIVE GOOGLE DOC
```

Forbidden fallback:

```text
DOCX/PDF -> extract text -> blank Google Doc -> insert paragraphs
```

If conversion fails:

- preserve the verified DOCX;
- report `GOOGLE DOC BLOCKED` with the actual failure;
- do not fabricate success;
- do not silently create a degraded native Doc;
- do not create a PDF as a substitute unless explicitly requested.

### E. PDF

PDF is opt-in.

When explicitly requested, derive/render it from the completed DOCX when possible so pagination and styling remain aligned with the authoritative source.

## Naming

Use the accepted source title/filename unless the operator requests a different name.

Do not force the full author name into filenames or visible document titles merely because it is available.

## Output Classification

For each requested artifact, report one of:

- `CREATED`
- `RESTYLED / CREATED`
- `REUSED EXACT SOURCE`
- `VERIFIED EQUIVALENT`
- `BLOCKED`

Do not claim Google conversion success without connector confirmation.

## Anti-Patterns

Fail or repair the run when the system:

- resolves `/dsp print` from a historical Build Ledger definition instead of current `main`;
- combines multiple historical print behaviors;
- uses a generic document layout despite an applicable Signalproof style;
- changes print layout merely because author identity changes;
- automatically expands `Doc Reo` to the full name/credentials without cause;
- appends professional titles or academic degrees to APA 7 citation author fields;
- reconstructs Google Docs from plain extracted text;
- automatically produces a PDF when none was requested;
- generates separate content states for DOCX and Google Doc;
- skips visual DOCX QA when supported;
- claims artifact/conversion success without evidence.

## Completion Criteria

A default `/dsp print` run is complete when:

1. the target is safely resolved;
2. document class and author identity are resolved;
3. the accepted Signalproof style is applied;
4. one authoritative DOCX passes validation and visual QA;
5. the finished DOCX is imported through native Google Drive conversion;
6. DOCX and native Google Doc are delivered, or any blocked output is explicitly identified.

PDF completion is required only when PDF or `all` is explicitly requested.

## Identity

- **Suite:** Signalproof Skills
- **Skill:** `signalproof-print`
- **Version:** `0.3.0`
- **Maturity:** Candidate for governed promotion to Active public baseline
- **Parent:** `signalproof` 0.1.1+
- **Works with:** `signalproof-document`, `signalproof-verify`, `signalproof-release`, `signalproof-closeout`
- **Domain:** Signalproof-styled document output, author/voice resolution, DOCX-first Google Docs conversion, optional PDF, citation identity, cross-surface delivery
- **Created by:** Doc Reo / Signalproof
