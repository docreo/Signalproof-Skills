---
name: signalproof-print
description: Produce durable document outputs from a resolved source item. By default create a DOCX, PDF, and native Google Doc derived by importing the finished DOCX so formatting is preserved as closely as Google conversion allows. Supports type-only, named-item, filename, Git path, and server/local path targets while preserving source identity, privacy, and overwrite boundaries.
---

# Signalproof Print

## Purpose

`signalproof-print` is the artifact-output specialist behind `/dsp print`.

Its central rule is:

> **Build one authoritative DOCX first; derive the PDF and Google Doc from that document. Never rebuild the Google Doc from extracted/plain text when a formatted DOCX exists.**

"Print" means create/export the requested document artifact(s), not send content to a physical printer.

## Default Output Contract

When the operator invokes:

```text
/dsp print
/dsp print <target>
```

and does not specify a type, produce the three-document set when supported:

1. `DOCX` — authoritative formatted document artifact;
2. `PDF` — rendered/exported from the completed DOCX or an equivalently verified document source;
3. `Google Doc` — native Google Docs file created by importing/uploading the completed DOCX through Google Drive conversion.

The Google Doc is **not** recreated paragraph-by-paragraph from extracted text. If native DOCX import/conversion is unavailable, report the Google Doc output as blocked rather than silently producing a degraded text-only reconstruction.

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
/dsp print docx @Signalproof - The Metaverse Is Evolving
/dsp print docs Signalproof-The-Metaverse-Is-Evolving.docx
/dsp print path/to/report.md
/dsp print pdf repo/path/to/report.md
/dsp print all /srv/signalproof/reports/readiness.md
```

A type-only request applies to the current bounded document/item. A target-only request uses the default three-document set.

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

## Authoritative Document Pipeline

### A. Establish the source

Identify the source item, its current version/state, and whether it is already a formatted DOCX.

- If an accepted DOCX already exists and no content change is requested, reuse it as the authoritative print source.
- If the source is Markdown, Google Doc, structured text, or another editable format, create the formatted DOCX first using the applicable document-generation capability.
- If the source is a PDF only, do not claim a DOCX reconstruction is byte-identical. Reconstruct only when authoritative content/layout evidence is sufficient.

### B. DOCX

Create or reuse the finished DOCX and verify that it exists and opens/validates through the available document tooling.

### C. PDF

Render/export the PDF from the finished DOCX whenever possible so pagination and formatting share the same source. Verify the file exists before delivery.

### D. Google Docs

Create the native Google Doc by importing/uploading the **finished DOCX** through Google Drive's native conversion path.

Required behavior:

```text
FORMATTED DOCX
     -> Google Drive import/conversion
     -> NATIVE GOOGLE DOC
```

Forbidden fallback:

```text
DOCX/PDF -> extract plain text -> create empty Google Doc -> insert paragraphs
```

That fallback loses typography, tables, spacing, page structure, figures, headers/footers, and other design information. Do not use it as an automatic substitute.

If import/conversion fails:

- keep any successfully produced DOCX/PDF outputs;
- report `GOOGLE DOC BLOCKED` with the actual failure;
- do not fabricate success;
- do not silently create a degraded native Doc.

## Naming

Use the source item's accepted title/filename unless the operator supplies a new name.

Default sibling names should remain recognizably aligned, for example:

```text
Signalproof - The Metaverse Is Evolving.docx
Signalproof - The Metaverse Is Evolving.pdf
Signalproof - The Metaverse Is Evolving   [native Google Doc]
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
- Use document/PDF artifact capabilities for actual DOCX/PDF generation and validation.
- Use authorized Google Drive tooling for native DOCX import/conversion.
- Use `signalproof-verify` when artifact identity, version, or successful conversion is material and uncertain.
- Use `signalproof-release` only when the operator is actually publishing/distributing beyond ordinary document delivery.
- Use `signalproof-closeout` for meaningful milestone evidence and learning continuity.

## Output Classification

For each requested output, report one of:

- `CREATED`
- `REUSED EXACT SOURCE`
- `VERIFIED EQUIVALENT`
- `BLOCKED`

Do not call a recreated artifact exact without evidence.

## Anti-Patterns

Fail the run when the system:

- manually rebuilds a Google Doc from extracted text despite having a formatted DOCX;
- creates a visually degraded Google Doc and presents it as the formatted equivalent;
- guesses which similarly named artifact the user meant;
- invents a Git or server path;
- overwrites a source file without explicit authority;
- generates three different content versions instead of deriving outputs from one authoritative document state;
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

A `/dsp print` run is complete when the requested target is resolved, one authoritative content state is established, every requested artifact is created/reused or explicitly classified as blocked, files/destination objects are verified, and the response provides the usable artifact links or destination references without overstating equivalence.

## Identity

- **Suite:** Signalproof Skills
- **Skill:** `signalproof-print`
- **Version:** `0.1.0`
- **Maturity:** Active public baseline after governed promotion
- **Parent:** `signalproof` 0.1.1+
- **Works with:** `signalproof-document`, `signalproof-verify`, `signalproof-release`, `signalproof-closeout`
- **Domain:** DOCX/PDF/Google Docs artifact output, source resolution, format-preserving Google Docs import, cross-surface document delivery
- **Created by:** Doc Reo / Signalproof
