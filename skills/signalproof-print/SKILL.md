---
name: signalproof-print
description: Complete-first Signalproof document workflow. Load current /dsp complete and its applicable child completion contracts, create one academically sound APA 7 Signalproof-styled DOCX, validate and visually inspect it, correct defects, upload that exact DOCX to Google Drive, verify delivery, and return the working Drive link. Native Google Docs conversion is attempted when supported without degrading the authoritative DOCX.
---

# Signalproof Print

## Purpose

`signalproof-print` is the specialist behind `/dsp print`.

Its governing rule is:

> **Use Complete-style convergence to finish the bounded document workstream, then create one authoritative APA 7 Signalproof DOCX, verify it visually, upload that exact file to Google Drive, verify the Drive artifact, and return the Drive link.**

## Complete-first dependency

Before document actuation:

1. refetch current public Git state;
2. load `commands/complete.md`;
3. load `commands/build-spawn-debug.md` and only the additional child Skills/commands needed for the current document problem;
4. preserve Known Error/failure-memory checks, protected state, materially changed retry discipline, verification, review, recovery, and truthful PASS requirements;
5. keep working through correctable build/layout/render/upload failures while evidence supports a bounded next correction.

This is not blanket deployment authority. It is completion discipline for the document workstream.

## Default output

Unless explicitly overridden:

```text
SOURCE / CURRENT WORK
  -> academically sound APA 7 content
  -> Signalproof white-paper/report style
  -> authoritative DOCX
  -> validate
  -> render and visually inspect
  -> repair defects
  -> Google Drive upload
  -> verify Drive file
  -> return Google Drive link
```

A local sandbox link alone does not satisfy the default when Google Drive is available.

## APA 7 default

Use APA 7 as the default scholarly standard:

- evidence-backed factual claims;
- correct author-date citations when sources are used;
- complete reference entries;
- no fabricated bibliographic metadata;
- academically appropriate headings and prose;
- proper treatment of tables, figures, captions, and source notes;
- clear distinction among evidence, interpretation, assumptions, and recommendations.

For internal technical reports, keep the report voice/structure while preserving APA 7 sound source handling.

Explicit operator instructions may override the citation system.

## Author identity

Default visible byline: **Doc Reo**.

When citing the operator's own work under APA 7, normalize the author surname as **Lawson** according to the source record.

Use full credentials, another named author, Signalproof, or Dr. Signalproof only when requested or clearly required by the document class.

## Signalproof house style

Default print presentation is white-paper readable:

- white pages;
- dark high-contrast body text;
- Aptos body;
- Aptos Display titles/headings;
- restrained navy/blue hierarchy;
- selective green/amber/blue accents;
- U.S. Letter;
- disciplined margins and compact spacing;
- professional tables, charts, cards, captions, headers, footers, and page numbers;
- no full-page dark dashboard styling unless explicitly requested;
- no generic Word-default look.

## Authoritative artifact

The verified DOCX is authoritative.

Do not create separate independently edited content states for Google Drive, PDF, or other sibling outputs.

## DOCX quality gate

Before Drive upload:

1. validate that the DOCX opens correctly;
2. render the whole document when tooling supports it;
3. visually inspect every page;
4. correct material issues;
5. rerun only invalidated checks.

Check at minimum:

- title/byline;
- headings;
- citations/references;
- tables/figures/captions;
- pagination;
- overflow/clipping;
- contrast/readability;
- headers/footers/page numbers;
- hyperlink integrity;
- filename/title consistency.

## Google Drive delivery

Drive upload is part of default completion.

Required sequence:

```text
VERIFIED DOCX
  -> connected Google Drive
  -> verify exact uploaded file
  -> retrieve working URL
  -> return URL
```

Prefer the connected writable Google Drive Library mount when it provides the supported path for file upload.

A failed native conversion must not end the run while a supported Drive DOCX upload path remains available.

### Native Google Docs conversion

Attempt native conversion when the available Drive action supports DOCX import without degrading the document.

If conversion fails but Drive DOCX upload succeeds:

- return `DRIVE DOCX CREATED / NATIVE CONVERSION BLOCKED`;
- provide the Drive DOCX link;
- keep the DOCX authoritative.

Never reconstruct the document by extracting text and inserting it into a blank Google Doc.

## Failure and retry rule

Apply Known Error and Complete retry discipline:

- do not repeat the same failed upload/conversion unchanged;
- inspect the error;
- use a materially different supported path;
- verify the new result;
- use `BLOCKED` only after supported authorized delivery paths are exhausted or a real prerequisite blocks continuation.

## Explicit variants

```text
/dsp print
  -> DOCX + Google Drive + link

/dsp print docx
  -> DOCX + Google Drive + link

/dsp print pdf
  -> verified authoritative DOCX workflow as needed
  -> PDF
  -> Google Drive + link

/dsp print all
  -> DOCX + PDF
  -> Google Drive delivery
  -> links
```

## Completion criteria

The default run completes only when:

1. Complete-first current contracts are loaded;
2. the source/target is resolved;
3. APA 7 soundness is established unless overridden;
4. Signalproof styling is applied;
5. DOCX validation passes;
6. visual QA passes when supported;
7. defects are corrected;
8. the exact DOCX is uploaded to Google Drive;
9. Drive identity/delivery is verified;
10. the working Drive link is returned.

## Output states

- `CREATED / DRIVE VERIFIED`
- `RESTYLED / CREATED / DRIVE VERIFIED`
- `REUSED EXACT SOURCE / DRIVE VERIFIED`
- `DRIVE DOCX CREATED / NATIVE CONVERSION BLOCKED`
- `PDF CREATED / DRIVE VERIFIED`
- `BLOCKED`
- `STOP - OWNER DECISION REQUIRED`

## Anti-patterns

Reject or repair a run that:

- ignores current `/dsp complete`;
- stops at a local DOCX despite available Drive delivery;
- declares Drive failure after only one unchanged method;
- uses black pages/white text for ordinary printable reports without explicit instruction;
- skips APA 7 source integrity;
- invents citations;
- skips visual QA when supported;
- creates a plain-text Google Doc as a substitute for the formatted DOCX;
- claims upload/conversion success without verification.

## Identity

- **Suite:** Signalproof Skills
- **Skill:** `signalproof-print`
- **Version:** 0.4.0
- **Maturity:** Candidate until governed merge
- **Parent:** `signalproof` 0.1.1+
- **Works with:** `complete`, `signalproof-build-spawn-debug`, `signalproof-known-errors`, `signalproof-document`, `signalproof-verify`, `signalproof-review`, `signalproof-recovery`
- **Domain:** APA 7 document completion, Signalproof styling, DOCX validation, visual QA, Google Drive delivery, verified link return
