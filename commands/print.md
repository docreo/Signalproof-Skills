# `print` - Active Operator Command V0.4.0

**Status:** ACTIVE  
**Version:** 0.4.0  
**Owner:** Doc Reo

## Purpose

`/dsp print` is the canonical Signalproof document-completion and delivery command.

It does not merely format text. It begins by loading the current `/dsp complete` contract and its current completion children so the document task is finished with the same bounded, evidence-backed, verify-before-claim discipline used elsewhere in Signalproof.

Canonical route:

```text
/dsp print
-> load current /dsp complete contract
-> load current complete child coordinator(s), beginning with build-spawn-debug
-> establish PRINT COMPLETE ENVELOPE
-> research / document / build / debug / verify / review as applicable
-> create academically sound APA 7 Signalproof-styled DOCX
-> render and visually inspect the exact DOCX
-> upload the exact .docx file to Google Drive
-> verify the Drive file identity and return its Google Drive / Google Docs link
-> await owner acceptance or resume correction on FAIL
```

Core rule:

> **Complete the bounded document first. The default deliverable is one authoritative academically sound APA 7 DOCX in the accepted Signalproof print style, automatically uploaded to Google Drive as the same DOCX file. Return the local DOCX link and the verified Google Drive/Google Docs link. Do not substitute a plain-text Google Doc, and do not convert to native Google Docs unless the operator explicitly asks for native conversion.**

## Canonical authority and supersession

After governed merge, this file on `main`, together with `skills/signalproof-print/SKILL.md`, is the only active public definition of `/dsp print`.

Historical Build Ledger records, prior print defaults, old native-conversion behavior, and candidate branches are provenance only and must not override current `main`.

## Complete-first requirement

Before consequential print work:

1. refetch current Git;
2. load `commands/complete.md`;
3. load the current completion child coordinator `commands/build-spawn-debug.md` and `skills/signalproof-build-spawn-debug/SKILL.md`;
4. load only the additional current child Skills actually needed for the document, such as Known Errors, Research, Document, Build, Debug/Full Debug, Investigate, Verify, Review, Security, Recovery, and Learn;
5. preserve their evidence, retry, protected-state, recovery, and STOP rules;
6. do not make the user babysit routine intermediate document-build or upload corrections.

This is a composition rule, not recursive shell invocation. `print` remains the resolved operator command while using `complete` as its completion behavior.

## Print Complete Envelope

Before actuation establish:

```text
PRINT COMPLETE ENVELOPE
Target: <exact current paper/report/document>
Objective: <finished user-visible document outcome>
Author/byline: <resolved identity>
Document class: <paper/publication | technical/report | other>
Evidence basis: <current files/Git/web/connected sources>
Academic standard: APA 7 unless explicitly overridden
Signalproof style: accepted light print style
Authoritative artifact: <exact .docx filename>
Google Drive destination: <folder or My Drive root>
Automated gates: content/evidence + DOCX validation + visual QA + Drive identity
Human gate: owner acceptance of delivered document
Recovery: preserve prior source and verified DOCX; no silent overwrite
Excluded authority: publication/release/deploy/source replacement unless separately authorized
Status: WORKING | USER TEST READY | USER ACCEPTED | BLOCKED | STOP
```

## Default output contract

With no explicit type, `/dsp print` MUST produce:

1. one authoritative `.docx` file;
2. that exact `.docx` uploaded automatically to Google Drive;
3. a verified Google Drive/Google Docs link to the uploaded DOCX;
4. the local/downloadable DOCX link when available.

The Drive object remains a Word DOCX:

```text
application/vnd.openxmlformats-officedocument.wordprocessingml.document
```

It may open in the Google Docs editing interface, but it is still the authoritative DOCX file.

**Default `/dsp print` does not require native Google Docs conversion.**

PDF is opt-in only.

## Academic and APA 7 standard

Unless the operator explicitly requests another standard, the finished document must be academically sound and APA 7 aligned.

Required behavior:

- distinguish sourced fact, inference, interpretation, and operator opinion;
- research unresolved material claims rather than inventing support;
- prefer primary, scholarly, official, or otherwise authoritative sources appropriate to the subject;
- use APA 7 in-text citations and reference formatting for externally sourced claims when applicable;
- preserve accurate titles, authors, dates, URLs/DOIs, and source identity;
- never fabricate a citation, DOI, page number, quotation, source, or access result;
- use tables, figures, notes, and headings consistently;
- preserve uncertainty and source limitations;
- when the document is based on internal technical evidence, identify the exact internal artifact, Git state, test evidence, or connected source rather than pretending it is a published scholarly source.

APA 7 is the academic/citation framework. The accepted Signalproof house style remains the presentation layer.

## Signalproof print style

Default presentation is **light, readable, and print-safe**.

Required characteristics:

- white page background;
- dark body text;
- Aptos body typography and Aptos Display major headings unless a stricter submission template requires another accepted font;
- restrained Signalproof navy/blue hierarchy;
- limited green/amber status accents where useful;
- clean U.S. Letter geometry with disciplined margins;
- compact professional spacing;
- readable charts, tables, captions, headers, footers, and page numbers;
- no white body text on black pages;
- no dashboard-dark-mode background for ordinary paper/report output;
- no unnecessary gradients or presentation-style decoration;
- use the established same-series template first when one exists.

Style selection order:

1. operator-specified template/style;
2. accepted style already established for the same document series;
3. accepted Signalproof light paper/report style;
4. current Signalproof technical/security-report typography as fallback.

## Author and voice

The output pipeline does not change with author identity.

Default visible author is **Doc Reo** unless the operator states otherwise.

For formal APA citations to the operator's own work, normalize under **Lawson** as required by the bibliographic source record. Do not put degrees or honorifics into APA reference-author fields.

Use **Dr. Signalproof** only when explicitly requested or when the bounded work is clearly an internal system-authored technical/assessment report.

Honor any other explicitly requested byline.

## Authoritative DOCX workflow

The DOCX is the single source artifact for delivery.

Required sequence:

1. resolve exact source/target;
2. complete missing research/evidence necessary for the bounded document;
3. write/edit the academically sound final content;
4. apply Signalproof light print style;
5. create the exact DOCX;
6. validate that the DOCX opens and is structurally sound;
7. render the DOCX to page images when tooling supports it;
8. visually inspect every page for clipping, overflow, unreadable contrast, broken tables/figures, bad pagination, orphaned headings, and reference defects;
9. correct defects and rerender until the exact artifact passes;
10. upload that exact verified DOCX to Google Drive;
11. verify the Drive result by exact title/file identity and DOCX MIME type;
12. return both links.

A locally valid DOCX with no completed Drive upload is not default `/dsp print` completion.

## Google Drive delivery

Required default path:

```text
AUTHORITATIVE SIGNALPROOF DOCX
        -> exact DOCX upload
        -> GOOGLE DRIVE
        -> verify DOCX identity/MIME
        -> return Google Drive/Google Docs link
```

Do not stop merely because a native Google Docs import action fails if exact DOCX upload to Google Drive is available.

Do not claim Drive success without connector confirmation.

Do not upload a different regenerated file after visual QA; upload the exact verified DOCX.

Do not overwrite an existing Drive file silently. Use a new file or explicit authorized replacement semantics.

### Native Google Docs conversion

Native conversion is **not** the default.

Only when the operator explicitly requests `native Google Doc`, `convert to Google Docs`, or equivalent:

1. preserve the authoritative DOCX;
2. upload/convert from that exact verified DOCX;
3. verify that the converted object is a native Google document;
4. return both the DOCX Drive link and native Google Doc link.

Never reconstruct the document by extracting plain text into a blank Google Doc.

## Accepted forms

```text
/dsp print
/dsp print <target>
/dsp print docx
/dsp print pdf
/dsp print all
/dsp print native google doc
/dsp print <type> <target>
dsp print <...>
/dsp-print <...>
```

Behavior:

- `/dsp print` -> DOCX + automatic Google Drive DOCX upload;
- `/dsp print docx` -> same default DOCX + Drive workflow;
- `/dsp print pdf` -> PDF only when explicitly requested; upload only if the request includes Drive/delivery intent;
- `/dsp print all` -> DOCX + Drive DOCX + PDF;
- `/dsp print native google doc` -> DOCX + Drive DOCX + explicit native Google Docs conversion.

## Completion and feedback loop

Use the Complete-style final loop:

- artifact/academic/visual/Drive gates FAIL -> correct and retry while a materially changed next attempt exists;
- all machine-verifiable gates PASS -> return `PRINT COMPLETE / USER REVIEW READY` with exact links;
- owner reports FAIL -> preserve the exact artifact and observation, resume the same bounded print workstream;
- owner reports PASS/works/accepted -> `PRINT COMPLETE / USER ACCEPTED`.

Do not manufacture user acceptance.

## Output report

Return compactly:

```text
PRINT RESULT
Status: <...>
DOCX: <local/download link>
Google Drive DOCX: <verified link>
Native Google Doc: <link | NOT REQUESTED | BLOCKED>
PDF: <link | NOT REQUESTED>
Academic standard: APA 7 <PASS | scoped exception>
Visual QA: <PASS | BLOCKED>
Drive verification: <PASS | BLOCKED>
```

## STOP conditions

STOP only when the target cannot be bounded, required evidence cannot be established honestly, legal/licensing/privacy restrictions block the requested content, the DOCX cannot be validated with available tooling, Google Drive access is unavailable after bounded retries, exact file identity cannot be verified, continuing would overwrite protected state outside authority, or continuing would fabricate academic support, artifact PASS, Drive success, or human acceptance.

## Authority boundary

`print` authorizes ordinary bounded document research/completion, artifact creation, validation, and Google Drive delivery for the resolved target. It does not authorize public publication, software deployment, protected-main bypass, canonical Build Ledger append, unrelated repository mutation, credential acquisition, or replacement of protected source files unless separately authorized.
