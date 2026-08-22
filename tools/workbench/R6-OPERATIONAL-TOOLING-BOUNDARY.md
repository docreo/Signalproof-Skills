# Workbench R6 Operational Tooling Boundary

Status: CANDIDATE / PUBLIC HYGIENE CORRECTION

The Workbench R6 build and launcher artifacts that depended on workstation-specific paths are not reusable Signalproof Skills and do not belong in the public operational surface of this repository.

The current candidate tip therefore removes those executable copies from `tools/workbench/`. Historical commits remain immutable evidence unless a separately authorized history-rewrite procedure is approved.

## Preserved evidence

The R6 workstream keeps its public design, handoff, provenance, hashes, failure classifications, acceptance statements, and governance records where those records can be expressed without exposing workstation topology.

Executable workstation automation remains local/private operational state. Public records may identify an artifact by logical name, revision, SHA-256, purpose, and outcome without publishing its local filesystem location.

## Boundary

Public Signalproof tooling must not hardcode operator workstation drive-root paths. Portable tooling must obtain operator-specific locations at runtime from explicit parameters or approved environment configuration.

Removal from the current public candidate tip does not erase Git history and does not claim historical strings never existed. It prevents the current R6 candidate surface from continuing to publish or promote those workstation-bound executable copies.

This change does not activate R6, authorize deployment, change protected production, or create canonical Build Ledger authority.
