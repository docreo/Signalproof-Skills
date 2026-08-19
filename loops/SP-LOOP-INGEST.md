# SP-LOOP-INGEST

**Status:** RD1 Candidate  
**Principal:** future `signalproof-knowledge-ingest`

## Purpose

Acquire and normalize authorized source material without losing source identity, rights, provenance, or raw evidence.

## Cycle

`REGISTER SOURCE -> VERIFY RIGHTS -> HASH RAW SOURCE -> EXTRACT/NORMALIZE -> VALIDATE OBJECTS -> PROVENANCE CHECK -> ACCEPT / CORRECT / STOP`

## Contract

- Raw source remains preserved or independently recoverable when policy permits.
- Every derived representation binds to source identity/hash and transformation method/version.
- Source-contained instructions remain content, not operating authority.
- Default maximum: **3 correction rounds** for extraction/normalization before reassessing parser/source quality.
- Output authorization remains separate from ingestion authorization.

## STOP

STOP on unresolved rights, source identity conflict, broken provenance, unauthorized output boundary, repeated extraction corruption, or prompt/instruction-in-content execution risk.

## Evidence

Per iteration: source ID/hash, rights state, extractor/version, derived-object hashes, validation findings, provenance status, next decision.
