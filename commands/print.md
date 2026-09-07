# `print` - Active Operator Command V0.2.0

**Status:** ACTIVE after governed promotion  
**Version:** 0.2.0  
**Owner:** Doc Reo

## Purpose

`/dsp print` routes document-output requests to `signalproof-print`.

Core rule:

> **Make the resolved document look like a Signalproof paper, or reuse the closest accepted Signalproof paper style already established for that document class. Build one authoritative formatted DOCX, verify it, then upload/import that DOCX into Google Docs for the native Google Doc. PDF is only produced when explicitly requested.**

## Accepted forms

```text
/dsp print
/dsp print <type>
/dsp print <target>
/dsp print <type> <target>
dsp print <...>
/dsp-print <...>
```

Types: `docx`, `pdf`, `google doc`/`gdoc`/`docs`, or `all`.

Examples:

```text
/dsp print
/dsp print docx
/dsp print pdf this
/dsp print @Signalproof - The Metaverse Is Evolving
/dsp print docs @Signalproof - The Metaverse Is Evolving
/dsp print all repo/path/to/file.md
```

## Resolution

- no target -> current bounded document/item;
- no type -> default DOCX + native Google Doc workflow;
- type only -> that type for the current item;
- target only -> default DOCX + native Google Doc workflow for that target;
- type + target -> only that requested type;
- `all` -> DOCX + PDF + native Google Doc;
- `@name` -> exact named-item selector;
- explicit Git/server path -> source selector only, not blanket write authority.

If the target is ambiguous, stop for the smallest disambiguation.

## Signalproof paper style

Before creating the DOCX, apply the closest accepted Signalproof document style for the requested paper class unless the operator supplied a specific template or explicitly requested a different style.

For current Signalproof white papers, technical reports, academic-style papers, and security papers, prefer the established restrained technical-paper treatment, including:

- Aptos for readable body text;
- Aptos Display for title and major headings;
- restrained Signalproof navy/blue hierarchy;
- clean Letter-size page design with disciplined margins;
- consistent headers, footers, page numbers, tables, captions, and reference formatting;
- preservation of APA 7 in-text citations/references when APA 7 is requested;
- no generic unstyled Word-default output when an accepted Signalproof paper style is available.

The recent Signalproof security-report typography is an approved style reference for this family of papers.

## Default output workflow

1. resolve the authoritative content;
2. apply/reuse the accepted Signalproof paper style;
3. create and verify the authoritative formatted DOCX;
4. import/upload that completed DOCX through Google Drive native conversion to create the native Google Doc.

Required Google Docs path:

```text
SIGNALPROOF-STYLED DOCX
  -> Google Drive / Google Docs import
  -> NATIVE GOOGLE DOC
```

Do **not** rebuild the Google Doc by extracting text and inserting paragraphs into a blank native document.

If Google conversion fails, preserve the verified DOCX and report the Google Doc output blocked. PDF is not an automatic fallback.

## PDF behavior

PDF is optional, not part of the ordinary no-type `/dsp print` default.

- `/dsp print pdf` -> PDF only;
- `/dsp print all` -> DOCX + PDF + native Google Doc;
- when PDF is requested, derive/render it from the completed DOCX when possible so the document family shares one authoritative styled source.

## Authority boundary

`print` authorizes ordinary document artifact creation/delivery for the resolved item. It does not grant deployment, public publication, repository binary commits, server overwrite, external sharing, source replacement, or protected-state authority unless separately explicit.

## Output

Return the requested artifact links/references and concise status per output. For the default no-type route, return the DOCX and native Google Doc. Do not claim native Google Docs conversion unless the connector confirms it.
