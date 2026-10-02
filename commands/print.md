# `print` - Active Operator Command V0.4.0

**Status:** ACTIVE  
**Version:** 0.4.0  
**Owner:** Doc Reo

## Purpose

`/dsp print` is the canonical Signalproof document-completion and delivery command.

It does not begin as a simple export action. It begins by loading the current `/dsp complete` contract and the child completion route needed for the bounded document workstream so the document is finished, checked, corrected, verified, and delivered rather than merely generated.

Canonical route:

```text
/dsp print
  -> refetch current Git
  -> load /dsp complete
  -> load complete child route as applicable
     -> build-spawn-debug
     -> known-errors
     -> build / debug / verify / review / security / recovery / learn
  -> complete the bounded document workstream
  -> build authoritative APA 7 Signalproof DOCX
  -> validate + render + visually inspect
  -> repair until machine-verifiable document gates PASS or STOP
  -> upload authoritative DOCX to Google Drive
  -> create/open the Google Drive document surface for that DOCX
  -> verify Drive delivery
  -> return the Google Drive link
```

Core rule:

> **Complete the document first. Create one academically sound APA 7 DOCX in the accepted Signalproof house style. Visually verify the finished DOCX. Then upload that exact DOCX to Google Drive and return the working Google Drive link. Do not stop at a local sandbox file when Drive delivery is available.**

## Required preflight: Complete-first

Before consequential document work, `print` MUST:

1. refetch current `main` command/Skill state from Git;
2. load `commands/complete.md`;
3. load `commands/build-spawn-debug.md` and other current child commands/Skills only as needed for the bounded document workstream;
4. establish the exact source, document objective, protected state, acceptance claim, and delivery target;
5. run Known Error/failure-memory preflight for repeat-prone document/output failures;
6. reuse valid evidence rather than rebuilding unaffected work;
7. continue correcting document-generation, formatting, rendering, validation, or Drive-delivery failures while a materially supported next correction exists.

`print` inherits Complete's evidence discipline, protected-state rules, retry discipline, recovery expectations, and prohibition against fabricated PASS. It does not inherit unrelated production deployment authority.

## Default document contract

Unless the operator explicitly overrides a point below, `/dsp print` means:

1. create a professionally written, academically sound document;
2. use APA 7 conventions for structure, citations, references, tables, figures, captions, and source handling where applicable;
3. apply the established Signalproof paper/report house style;
4. create one authoritative `.docx` file;
5. validate the DOCX and render it for visual inspection;
6. correct clipping, broken tables, unreadable contrast, bad pagination, malformed references, missing captions, or other visible defects;
7. upload that exact verified DOCX to Google Drive;
8. verify the Drive file exists and is accessible;
9. return the Google Drive link as the primary delivery link.

The authoritative artifact remains the verified DOCX. Google Drive delivery is part of default completion, not an optional afterthought.

## Accepted forms

```text
/dsp print
/dsp print <target>
/dsp print docx <target>
/dsp print pdf <target>
/dsp print all <target>
dsp print <...>
/dsp-print <...>
```

## Output behavior

Default:

```text
/dsp print
  -> authoritative APA 7 Signalproof DOCX
  -> Google Drive upload of that DOCX
  -> verified Google Drive link
```

Explicit variants:

```text
/dsp print docx
  -> DOCX + Google Drive upload + Drive link

/dsp print pdf
  -> authoritative DOCX workflow first when needed for fidelity
  -> PDF derived from verified DOCX
  -> upload requested PDF to Google Drive
  -> Drive link

/dsp print all
  -> verified DOCX
  -> PDF derived from DOCX
  -> upload requested artifacts to Google Drive
  -> Drive links
```

Do not silently omit Drive delivery unless the operator explicitly says not to upload.

## APA 7 baseline

APA 7 is the default scholarly standard for `/dsp print`.

Apply it intelligently rather than mechanically. At minimum:

- evidence-backed factual claims;
- correct in-text author-date citations where sources are used;
- complete references for cited external sources;
- APA-consistent reference formatting;
- academically appropriate section hierarchy;
- clear distinction between evidence, interpretation, assumptions, and recommendations;
- tables and figures labeled and captioned consistently;
- source notes for adapted/reproduced tables or figures when required;
- no invented citations, dates, authors, DOIs, URLs, or publication metadata.

When a document is a technical/internal report rather than a scholarly paper, preserve the Signalproof report structure while keeping source use and references APA 7 sound.

If the operator explicitly requests another citation system or no academic citation apparatus, honor that request.

## Author identity

Default visible byline: **Doc Reo**.

Formal citations to the operator's own work normalize under **Lawson** when APA 7 requires an author surname.

Use another named author or full credentials only when explicitly requested or materially required by the context.

For a clearly system-authored internal technical/assessment report, **Dr. Signalproof** may be used when explicitly requested or clearly established by the bounded source.

## Signalproof house style

The default is a readable white-paper/report presentation, not a dark screen dashboard.

Preferred characteristics:

- white page background;
- dark body text with strong print contrast;
- Aptos body typography;
- Aptos Display for title and major headings;
- restrained Signalproof navy/blue hierarchy;
- selective green/amber/blue status accents;
- U.S. Letter geometry with disciplined margins;
- compact professional spacing;
- readable tables, charts, callouts, and bordered cards;
- consistent headers, footers, page numbering, captions, and references;
- no white-on-black full-page treatment unless explicitly requested;
- no generic Word-default styling when an accepted Signalproof style exists;
- no unnecessary gradients or presentation-style decoration.

Style selection order:

1. explicit operator template/style;
2. accepted style for the same paper/report series;
3. current Signalproof white-paper/report style;
4. current Signalproof technical/security report fallback.

## Authoritative DOCX workflow

The DOCX is the single authoritative content/layout state.

Required sequence:

1. resolve source and document objective;
2. research unresolved facts when needed;
3. write or revise the complete document;
4. apply APA 7 and Signalproof house style;
5. build DOCX;
6. validate document structure;
7. render pages to images/PDF preview when tooling supports it;
8. visually inspect the complete document;
9. correct material defects;
10. repeat only invalidated checks after corrections;
11. declare machine-verifiable document gates PASS only when supported.

Required checks include, where applicable:

- title/byline correctness;
- section order and heading consistency;
- citation/reference integrity;
- table/figure numbering and captions;
- page breaks and orphan/widow problems;
- clipped or overflowing content;
- unreadable contrast;
- malformed bullets/numbering;
- headers/footers/page numbers;
- broken hyperlinks;
- missing source notes;
- filename/title consistency.

## Google Drive delivery is mandatory by default

After DOCX PASS:

1. upload the exact verified DOCX to the connected Google Drive;
2. prefer the writable `/Google Drive` destination exposed by the connected file surface when available;
3. verify the uploaded Drive file identity;
4. retrieve its actual Drive/Docs URL;
5. return that URL to the operator.

Required path:

```text
VERIFIED SIGNALPROOF APA7 DOCX
  -> GOOGLE DRIVE UPLOAD
  -> VERIFY DRIVE FILE
  -> RETURN WORKING DRIVE LINK
```

A local `sandbox:/...` link may be included as a secondary convenience, but it does not satisfy default `/dsp print` completion when Google Drive upload is available.

### Native Google Docs conversion

If the available Drive interface can natively convert/import the verified DOCX to a native Google Doc without degrading the authoritative content, perform that conversion and return the native Google Doc URL.

If native conversion is unavailable or fails but raw DOCX upload to Google Drive succeeds:

- keep the verified DOCX as authoritative;
- report `DRIVE DOCX CREATED / NATIVE CONVERSION BLOCKED`;
- return the working Drive DOCX link;
- do not replace the document with a plain-text reconstruction.

Forbidden fallback:

```text
DOCX/PDF
  -> extract plain text
  -> create blank Google Doc
  -> reinsert paragraphs
```

That destroys the authoritative formatting state and is not an acceptable substitute.

## Failure handling

A failed first upload or conversion attempt is not completion.

Under the Complete-first contract:

- inspect the actual failure;
- check known-error/failure memory;
- use a materially different supported delivery path when available;
- for example, if native import rejects a local path but the writable Google Drive Library mount accepts the verified file, use the supported Drive upload path and verify the resulting link;
- do not repeat unchanged failing calls;
- do not declare `BLOCKED` while a supported authorized Drive-delivery path remains available.

Use `BLOCKED` only when all applicable authorized delivery paths have been exhausted or an actual prerequisite/authority limitation prevents completion.

## Completion criteria

Default `/dsp print` is complete only when:

1. current Git contracts were refetched;
2. Complete-first requirements were applied;
3. the target/source was resolved;
4. the document is academically sound under APA 7 unless explicitly overridden;
5. Signalproof styling is applied;
6. the authoritative DOCX validates;
7. the entire document has been visually checked when tooling supports it;
8. material defects are corrected;
9. the exact verified DOCX is uploaded to Google Drive;
10. Drive delivery is verified;
11. a working Google Drive link is returned to the operator.

A local file alone is not default completion.

## Output classification

Report the strongest supported state:

- `CREATED / DRIVE VERIFIED`
- `RESTYLED / CREATED / DRIVE VERIFIED`
- `REUSED EXACT SOURCE / DRIVE VERIFIED`
- `DRIVE DOCX CREATED / NATIVE CONVERSION BLOCKED`
- `PDF CREATED / DRIVE VERIFIED`
- `BLOCKED`
- `STOP - OWNER DECISION REQUIRED`

Never claim Drive success without verification.

## Authority boundary

`print` authorizes bounded document completion, artifact creation, ordinary Google Drive delivery, and verification for the resolved item. It does not authorize public publication, external sharing beyond the connected user's Drive permissions, unrelated repository mutation, production deployment, credential acquisition, protected-main bypass, or canonical private Build Ledger append.

## Signalproof principle

> **Finish the document. Verify the document. Put the verified DOCX in Google Drive. Give the operator the link.**
