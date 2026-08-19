# Signalproof Operator Command Expansion RD1

**Status:** PUBLIC-SAFE GOVERNANCE RECORD  
**Date:** 2026-08-19  
**Owner direction:** Doc Reo explicitly requested these conversational forms be made durable Signalproof commands and corrected the canonical teaching command identity to `signalproof-teach`.

## Scope

This milestone adds four operator commands:

- `signalproof-this-plan` -> `signalproof-grill`
- `signalproof-this-build` -> `signalproof-grill-with-docs`
- `signalproof-teach` -> Active `signalproof-teach` Skill
- `build-git this` -> governed Git-backed next-action execution for the current bounded subject

A new `commands/COMMAND-REGISTRY.md` records Active and Candidate command identities separately.

## Governance / log-skill record

This public record satisfies the public-safe `log-skill` synchronization aspect for the command milestone. It does not claim a canonical private Build Ledger append, C-number, chain head, or private chronology event.

### Architecture check

These commands are operator shorthands, not new specialist Skills. They route to existing Active Signalproof capabilities and must not duplicate their full doctrine. Command files are intentionally compact and are acceptance-tested for authority boundaries.

### Protected behavior

- owner decisions remain with the owner;
- planning/grilling does not silently authorize implementation;
- documentation capture does not grant file-write authority;
- teaching follows Signalproof evidence/authority/HAMM principles;
- `build-git this` refetches Git state and preserves protected-state/STOP boundaries;
- candidate commands remain explicitly non-Active;
- no public Git record fabricates private Build Ledger chronology.

## Testing

`tests/consistency/test_operator_commands.py` verifies command registry presence, canonical `signalproof-teach` identity, authority boundaries, and compact command file sizes.

## Recovery

Recovery is ordinary Git history/revert of this milestone. Existing Active Skills remain the underlying capability authority and are not replaced by these command aliases.
