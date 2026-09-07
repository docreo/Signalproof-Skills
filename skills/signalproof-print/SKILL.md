---
name: signalproof-print
description: Produce Signalproof-styled durable document outputs from a resolved source item. By default apply the closest accepted Signalproof paper style, create and verify one authoritative DOCX, then create a native Google Doc by importing that finished DOCX. Produce PDF only when explicitly requested. Supports type-only, named-item, filename, Git path, and server/local path targets while preserving source identity, privacy, formatting, and overwrite boundaries.
---

# Signalproof Print

## Purpose

`signalproof-print` is the artifact-output specialist behind `/dsp print`.

Its central rule is:

> **Style the document as an accepted Signalproof paper first. Build one authoritative formatted DOCX, visually verify it, and create the native Google Doc by importing that finished DOCX. Do not reconstruct the Google Doc from extracted/plain text. PDF is optional unless explicitly requested.**

"Print" means create/export the requested document artifact(s), not send content to a physical printer.

## Default Output Contract

When the operator invokes:

```text
/dsp print
/dsp print <target>
```

and does not specify a type, produce:

1. `DOCX` — authoritative Signalproof-styled formatted document artifact;
2. `Google Doc` — native Google Docs file created by importing/uploading the completed DOCX through Google Drive conversion.

Do **not** automatically create a PDF on the default no-type route.

When the operator explicitly requests `pdf`, produce a PDF from the finished DOCX when possible. When the operator requests `all`, produce DOCX + PDF + native Google Doc.

## Accepted Forms

```text
/dsp print
/dsp print <type>
/dsp print <target>
/dsp print <type> <target>
```

Supported type aliases:

```text
docx | word
pdf
google doc | google docs | gdoc | docs
all | set | 3
```

Examples:

```text
/dsp print
/dsp print docx
/dsp print pdf this
/dsp print @Signalproof - The Metaverse Is Evolving
/dsp print docs Signalproof-The-Metaverse-Is-Evolving.docx
/dsp print all /srv/signalproof/reports/readiness.md
```

A type-only request applies to the current bounded document/item. A target-only request uses the default DOCX + native Google Doc workflow.

## Target Resolution

Resolve the requested item using the smallest authoritative path:

1. explicit current conversation item or selected attachment;
2. exact named current artifact/document;
3. exact filename in available conversation/library/authorized connected storage;
4. explicitly identified Git repository + file path;
5. explicitly identified accessible server/local filesystem path;
6. current bounded work item when the operator says only `/dsp print` or `/dsp print <type>`.

`@<name>` is a human-facing exact-item selector. Treat the remainder as the target name, not as a new command.

If multiple plausible targets remain, stop and request the smallest disambiguation. Never guess a repository, server, path, or similarly named file.

## Signalproof Paper Style Gate

Before output, determine the closest accepted Signalproof document class and apply its established styling unless the operator supplied a specific template or explicitly asked for a different style.

For current Signalproof white papers, academic-style papers, technical reports, and security papers, the preferred house treatment is restrained and professional rather than decorative.

Approved current reference characteristics include:

- `Aptos` body typography;
- `Aptos Display` title and major-heading typography;
- restrained Signalproof navy/blue heading hierarchy;
- clean U.S. Letter page geometry with disciplined margins;
- compact professional spacing suitable for white papers and technical reports;
- consistent headers, footers, page numbering, captions, tables, and reference formatting;
- clear section hierarchy without generic Word-default styling;
- preservation of APA 7 citation/reference conventions when APA 7 is requested;
- no unnecessary visual effects, gradients, decorative rules, or presentation-style page design.

The current Signalproof Workbench security verification report typography is an approved style reference for this paper family. Existing accepted Signalproof paper styles may also be reused when they better match the document class.

### Style selection rule

Use this order:

1. operator-specified template/style;
2. accepted style already established for the same document series;
3. closest accepted Signalproof paper/white-paper/report style;
4. security-report typography as the technical-paper fallback.

Do not silently return an unstyled or generic academic manuscript when a Signalproof paper style is available.

## Authoritative Document Pipeline

### A. Establish the source

Identify the source item, its current version/state, and whether it is already a formatted DOCX.

- If an accepted DOCX already exists and no content/style change is requested, reuse it as the authoritative print source.
- If the source content exists but its presentation does not satisfy the Signalproof style gate, restyle it into a new authoritative DOCX before upload.
- If the source is Markdown, Google Doc, structured text, or another editable format, create the formatted DOCX first using the applicable document-generation capability.
- If the source is a PDF only, do not claim a DOCX reconstruction is byte-identical. Reconstruct only when authoritative content/layout evidence is sufficient.

### B. DOCX

Create or reuse the finished DOCX.

Required completion checks:

1. document opens/validates;
2. Signalproof paper styling is present and internally consistent;
3. tables, headings, references, headers/footers, pagination, and figures are not clipped or broken;
4. render the DOCX to page images and visually inspect the full document before delivery when document tooling supports it.

The DOCX is the authoritative styled artifact for downstream sibling outputs.

### C. Google Docs

Create the native Google Doc by importing/uploading the **finished DOCX** through Google Drive's native conversion path.

Required behavior:

```text
SIGNALPROOF-STYLED DOCX
     -> Google Drive import/conversion
     -> NATIVE GOOGLE DOC
```

Forbidden fallback:

```text
DOCX/PDF -> extract plain text -> create empty Google Doc -> insert paragraphs
```

That fallback loses typography, tables, spacing, page structure, figures, headers/footers, citations, and other design information. Do not use it as an automatic substitute.

If import/conversion fails:

- keep the successfully produced/verified DOCX;
- report `GOOGLE DOC BLOCKED` with the actual failure;
- do not fabricate success;
- do not silently create a degraded native Doc;
- do not create a PDF merely as a substitute unless the operator requested one.

### D. PDF, only when requested

When PDF is requested, render/export it from the finished DOCX whenever possible so pagination and formatting share the same authoritative source. Verify the file exists before delivery.

## Naming

Use the source item's accepted title/filename unless the operator supplies a new name.

Default sibling names should remain recognizably aligned, for example:

```text
Signalproof - The Metaverse Is Evolving.docx
Signalproof - The Metaverse Is Evolving   [native Google Doc]
Signalproof - The Metaverse Is Evolving.pdf   [only when requested]
```

Do not rename the authoritative source or overwrite an existing external document unless the operator explicitly requests replacement and the destination supports safe exact-target update.

## Git and Server Paths

A Git path or server/local path identifies the **source item**, not blanket authority over the repository/server.

- Read only the requested source and the minimum dependencies required to render it.
- Do not commit generated binary outputs to Git unless explicitly requested.
- Do not overwrite server files unless explicitly requested.
- Preserve repository/private-data boundaries.
- When source freshness matters, read the exact current file before rendering.

## Relationship to Other Skills

- Use `signalproof-document` when content must be authored, corrected, or evidence-bounded before output.
- Use document artifact capabilities for DOCX generation, styling, rendering, and validation.
- Use authorized Google Drive tooling for native DOCX import/conversion.
- Use PDF artifact capability only when PDF is explicitly requested.
- Use `signalproof-verify` when artifact identity, version, style application, or successful conversion is material and uncertain.
- Use `signalproof-release` only when the operator is actually publishing/distributing beyond ordinary document delivery.
- Use `signalproof-closeout` for meaningful milestone evidence and learning continuity.

## Output Classification

For each requested output, report one of:

- `CREATED`
- `RESTYLED / CREATED`
- `REUSED EXACT SOURCE`
- `VERIFIED EQUIVALENT`
- `BLOCKED`

Do not call a recreated artifact exact without evidence.

## Anti-Patterns

Fail the run when the system:

- outputs a generic or unstyled document despite an applicable accepted Signalproof paper style;
- manually rebuilds a Google Doc from extracted text despite having a formatted DOCX;
- creates a visually degraded Google Doc and presents it as the formatted equivalent;
- skips DOCX render/visual QA when the available document-generation workflow requires it;
- guesses which similarly named artifact the user meant;
- invents a Git or server path;
- overwrites a source file without explicit authority;
- generates separate content versions for DOCX and Google Doc instead of deriving both from one authoritative document state;
- creates a PDF by default when no PDF was requested;
- claims Google upload/import succeeded without connector confirmation;
- claims PDF/DOCX identity without verifying the generated artifact exists.

## STOP Conditions

Stop only the blocked output, while preserving successful sibling outputs, when:

- the target cannot be resolved safely;
- the authoritative source is unavailable;
- required document generation/conversion tooling is unavailable;
- Google Docs import/conversion fails;
- the destination is inaccessible or unauthorized;
- producing the artifact would expose protected/private content outside its permitted boundary;
- faithful reconstruction would require inventing missing content or layout.

## Completion Criteria

A default `/dsp print` run is complete when:

1. the requested target is resolved;
2. one authoritative content state is established;
3. the applicable Signalproof paper style is applied or verified;
4. the DOCX passes document validation and visual QA;
5. the finished DOCX is imported through native Google Drive conversion;
6. both the DOCX and native Google Doc are delivered or the blocked output is explicitly reported.

PDF completion is additionally required only when PDF or `all` was explicitly requested.

## Identity

- **Suite:** Signalproof Skills
- **Skill:** `signalproof-print`
- **Version:** `0.2.0`
- **Maturity:** Active candidate update pending governed promotion
- **Parent:** `signalproof` 0.1.1+
- **Works with:** `signalproof-document`, `signalproof-verify`, `signalproof-release`, `signalproof-closeout`
- **Domain:** Signalproof-styled DOCX/Google Docs artifact output, optional PDF, source resolution, format-preserving native Google Docs import, cross-surface document delivery
- **Created by:** Doc Reo / Signalproof
