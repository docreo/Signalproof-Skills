# `print` - Active Operator Command V0.1.0

**Status:** ACTIVE after governed promotion  
**Version:** 0.1.0  
**Owner:** Doc Reo

## Purpose

`/dsp print` routes document-output requests to `signalproof-print`.

Core rule:

> **No type means DOCX + PDF + Google Doc. Google Docs output is made by importing the finished DOCX, not by rebuilding the document from extracted text.**

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
/dsp print docx @Signalproof - The Metaverse Is Evolving
/dsp print repo/path/to/file.md
/dsp print pdf /srv/project/report.md
```

## Resolution

- no target -> current bounded document/item;
- type only -> that type for the current item;
- target only -> default three-document set for that target;
- type + target -> only that requested type;
- `@name` -> exact named-item selector;
- explicit Git/server path -> source selector only, not blanket write authority.

If the target is ambiguous, stop for the smallest disambiguation.

## Default three-document set

1. DOCX;
2. PDF derived/rendered from the completed DOCX when possible;
3. native Google Doc created through Google Drive import/conversion of the completed DOCX.

If Google conversion fails, report that output blocked. Do **not** fall back to creating an empty Google Doc and injecting extracted paragraphs.

## Authority boundary

`print` authorizes ordinary artifact creation/delivery for the resolved item. It does not grant deployment, public publication, repository binary commits, server overwrite, external sharing, source replacement, or protected-state authority unless separately explicit.

## Output

Return the requested artifact links/references and concise status per output. Preserve successful DOCX/PDF results even if Google conversion is blocked.
