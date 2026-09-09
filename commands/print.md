# `print` - Active Operator Command V0.3.0

**Status:** ACTIVE candidate for governed merge  
**Version:** 0.3.0  
**Owner:** Doc Reo

## Purpose

`/dsp print` is the single canonical Signalproof document-output command.

It controls the artifact pipeline and house presentation. It does **not** force one author voice for every document.

Core rule:

> **Resolve the document class and author identity, apply the accepted Signalproof paper/report style, build one authoritative formatted DOCX, visually verify it, then upload/import that DOCX through Google Drive native conversion to create the native Google Doc. PDF is produced only when explicitly requested.**

## Canonical authority and supersession

After governed merge, this file on `main`, together with `skills/signalproof-print/SKILL.md`, is the only active public definition of `/dsp print`.

Older Build Ledger records, historical drafts, prior output defaults, and candidate branches remain provenance/history only. They must not be blended with the current command at runtime.

## Accepted forms

```text
/dsp print
/dsp print <type>
/dsp print <target>
/dsp print <type> <target>
dsp print <...>
/dsp-print <...>
```

Types:

```text
docx | word
pdf
google doc | google docs | gdoc | docs
all
```

## Default output contract

With no explicit type, produce:

1. authoritative Signalproof-styled DOCX;
2. native Google Doc created by importing that completed DOCX.

Do **not** automatically create a PDF.

- `/dsp print pdf` -> PDF only;
- `/dsp print all` -> DOCX + PDF + native Google Doc.

## Document class and voice

The print/layout pipeline is the same regardless of author. Voice is resolved separately from presentation.

### Default: Doc Reo publication

Unless the operator states otherwise, assume the document is authored as **Doc Reo**.

Use this class for papers, essays, opinion-informed analysis, thought leadership, academic-style publications, and pieces that intentionally include the operator's outlook or interpretation.

- visible byline: **Doc Reo** by default;
- prose may include Doc Reo's analysis, opinion, interpretation, and outlook when appropriate to the source;
- treatment may be more academic and publication-oriented than a report;
- formal citations to the operator's own published work normalize under the surname **Lawson**;
- use the full name and credentials only when the operator requests them or the publication/submission/legal/credential context requires them.

### Dr. Signalproof report

When the operator explicitly requests a Dr. Signalproof report, or the bounded work is clearly an internal/technical/assessment report authored by the Signalproof system, use **Dr. Signalproof** as the reporting voice.

Dr. Signalproof represents synthesis of the team's relevant findings and should use a concise reporting/assessment voice rather than presenting personal opinion as Doc Reo's view.

### Other author identities

If the operator explicitly names **Signalproof**, **Mareo-Ahmir Lawson, M.Ed., M.A.**, another author, or another byline treatment, honor that identity without changing the print pipeline.

## Signalproof house style

Before creating the DOCX, apply the closest accepted Signalproof paper/report style for the document class unless the operator supplies a specific template or explicitly requests a different style.

Current house characteristics:

- Aptos body typography;
- Aptos Display for title and major headings;
- restrained Signalproof navy/blue hierarchy;
- clean U.S. Letter page geometry with disciplined margins;
- compact professional spacing;
- consistent headers, footers, page numbering, captions, tables, and reference formatting;
- preservation of APA 7 conventions when APA 7 is requested;
- no generic Word-default styling when an accepted Signalproof paper/report style exists;
- no unnecessary presentation-style effects, gradients, or decorative excess.

Style selection order:

1. operator-specified template/style;
2. accepted style already established for the same paper/report series;
3. closest accepted Signalproof paper/report style;
4. current Signalproof security-report typography as technical fallback.

## Authoritative output workflow

1. resolve the current bounded source/target;
2. resolve document class and author identity;
3. apply/reuse the accepted Signalproof house style;
4. create or reuse one authoritative formatted DOCX;
5. validate and visually inspect the DOCX;
6. import/upload that completed DOCX through Google Drive native conversion to create the native Google Doc;
7. produce PDF only when explicitly requested.

Required Google Docs path:

```text
SIGNALPROOF-STYLED DOCX
  -> Google Drive / Google Docs import
  -> NATIVE GOOGLE DOC
```

Forbidden fallback:

```text
DOCX/PDF -> extract plain text -> blank Google Doc -> insert paragraphs
```

If native conversion fails, preserve the verified DOCX and report the Google Doc output as `BLOCKED`. Do not silently create a degraded substitute.

## Target resolution

- no target -> current bounded document/item;
- target only -> default DOCX + native Google Doc workflow for that target;
- type only -> requested type for current bounded item;
- type + target -> requested type for that target;
- `@name` -> exact named-item selector;
- explicit Git/server/local path -> source selector only, not blanket write authority.

If multiple plausible targets remain, request the smallest necessary disambiguation. Never invent a repository, file, server, or similarly named source.

## Output classification

For each requested artifact, report one of:

- `CREATED`
- `RESTYLED / CREATED`
- `REUSED EXACT SOURCE`
- `VERIFIED EQUIVALENT`
- `BLOCKED`

Do not claim Google conversion success without connector confirmation.

## Authority boundary

`print` authorizes ordinary document artifact creation and delivery for the resolved item. It does not itself authorize deployment, public publication, external sharing, repository binary commits, server overwrite, source replacement, or protected-state mutation outside the output task.
