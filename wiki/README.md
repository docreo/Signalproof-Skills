# Doc Reo / Signalproof Wiki Source

This directory contains the version-controlled source for the public **Doc Reo / Signalproof Wiki**.

The public Wiki is the maintained public knowledge projection of Signalproof. It accumulates safe, reviewable knowledge while preserving the distinction between evidence, compiled knowledge, authority, and operational state.

## Pages

- [`Home.md`](Home.md)
- [`Doc-Reo.md`](Doc-Reo.md)
- [`Signalproof.md`](Signalproof.md)
- [`Signalproof-Knowledge-Plane.md`](Signalproof-Knowledge-Plane.md)
- [`Command-Radar-Readiness-Workbench.md`](Command-Radar-Readiness-Workbench.md)
- [`Public-Private-Knowledge-Boundary.md`](Public-Private-Knowledge-Boundary.md)
- [`Human-AI-Maturity.md`](Human-AI-Maturity.md)
- [`Signalproof-Operating-Model.md`](Signalproof-Operating-Model.md)
- [`Products-and-Research.md`](Products-and-Research.md)
- [`Governance-and-Evidence.md`](Governance-and-Evidence.md)
- [`Glossary.md`](Glossary.md)
- [`_Sidebar.md`](_Sidebar.md)
- [`_Footer.md`](_Footer.md)

## Knowledge architecture

```text
RAW EVIDENCE
    ↓
INGEST / NORMALIZE
    ↓
COMPILED KNOWLEDGE
    ↓
DECISIONS / POLICY
    ↓
OPERATIONAL STATE
    ↓
AUTHORIZED USE
```

The Wiki primarily contains the compiled public knowledge and explanatory layer.

## Public/private rule

Public Wiki material is public by default when it is intentionally safe and useful to publish.

Private, customer-specific, security-sensitive, proprietary, credential-bearing, incident-sensitive, or restricted operational material remains in the private canonical repository that owns it. The public Wiki may explain the role of those systems without copying restricted contents.

## Authority boundary

These pages do not supersede canonical repository state, active skill files, registries, governance documentation, acceptance evidence, provenance records, Build Ledger records, Assurance Ledger records, runtime state, or released product documentation.

A Wiki statement can explain an authoritative decision; it does not create that authority by itself.

## Source location

Canonical public Wiki source is maintained at:

`docreo/Signalproof-Skills/wiki/`

The repository copy should remain reviewable and version controlled even if the content is mirrored into a GitHub Wiki UI, documentation site, Obsidian vault, or another publication surface.

## Contribution rule

Material changes should follow normal repository governance through a non-main branch and pull request. Public Wiki changes must respect the same privacy, security, evidence, and source-of-truth boundaries applied elsewhere in Signalproof Skills.

Knowledge produced during research, development, support, or AI-assisted work should be considered for writeback when it is durable, useful, appropriately evidenced, and cleared for the public boundary.