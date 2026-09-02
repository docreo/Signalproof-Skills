# Signalproof Print V0.1 Promotion Record

**Date:** 2026-09-02  
**Owner:** Doc Reo  
**Candidate branch:** `feature/dsp-print`

## Trigger

During creation of the white paper `Signalproof - The Metaverse Is Evolving`, the DOCX and PDF preserved the intended document design. A later fallback created a native Google Doc by extracting/inserting text into a blank document after direct DOCX import failed. The text was preserved, but formatting degraded materially and the operator rejected the result.

## Learned rule

For Signalproof document output, maintain one authoritative formatted document state.

Default `/dsp print` output:

1. DOCX;
2. PDF derived/rendered from the completed DOCX when possible;
3. native Google Doc created by **uploading/importing the completed DOCX into Google Docs**.

Do not recreate the Google Doc from extracted text when a formatted DOCX exists. A failed native conversion is a blocked Google output, not permission to substitute a degraded reconstruction.

## Command grammar added

- `/dsp print`
- `/dsp print <type>`
- `/dsp print <target>`
- `/dsp print <type> <target>`
- `@<name>` exact-item selector
- Git/server/local source path selector

Type-only requests apply to the current bounded item. Target-only requests default to the three-document set.

## Evidence

- Candidate skill: `skills/signalproof-print/SKILL.md`
- Candidate command: `commands/print.md`
- Registry update: `commands/COMMAND-REGISTRY.md`
- Skill registry update: `SKILL-REGISTRY.md`
- Acceptance: `acceptance/signalproof-print-v0.1-acceptance.md`
- Acceptance result: 12/12 PASS

## Promotion target

`signalproof-print` 0.1.0 and `print` command 0.1.0 as Active public baseline after governed merge.
