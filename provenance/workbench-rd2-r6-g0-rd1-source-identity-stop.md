# Signalproof Workbench RD2 R6 - G0 RD1 Source Identity STOP

**Date:** 2026-08-21  
**Status:** G0 RD1 STOP / EVIDENCE-SOURCE-IDENTITY LOCALIZATION / PRODUCTION UNCHANGED  
**Work stream:** Signalproof Workbench GUI RD2  
**Failure fingerprint:** `R6-G0-SOURCE-IDENTITY-EXACT-COUNT-001`  
**Attempt count:** 1

## Owner execution evidence

The exact R6-G0 RD1 launcher downloaded the pinned runner and verified:

- expected runner SHA-256 `365941B1A96CF757EA67021E4A81A47B45A217F290310DCB805403530EDC374E`;
- downloaded runner SHA-256 matched exactly;
- exact staged runner parser state PASS;
- normal non-elevated owner execution (`IS ADMIN: False`);
- fresh R6-G0 evidence lane absent;
- R5.1 deterministic-scroll candidate root present;
- production Workbench present;
- production Workbench protected SHA-256 exact.

The run then stopped at:

```text
STOP: exactly one R5.1 C# source matches expected SHA256
```

No later localization, report write, compilation, product execution, production mutation, Governor/Core mutation, ACL mutation, release action, or canonical Build Ledger append occurred.

## Classification

`EVIDENCE / SOURCE-IDENTITY LOCALIZATION`

This is not a product/UI failure. It occurred before R6-G1 source modification or target actuation.

The transferred R5.1 provenance still records the expected GUI source SHA-256:

`B4FF2051B3B8FDD4DEED9C7AF5271B395C38255D9578753A1CF6F18002489B12`

RD1 incorrectly required exactly one matching `.cs` path. That assertion is stronger than source-byte identity requires and does not distinguish zero matches from multiple byte-identical copies.

Earlier Signalproof staging practice already treats multiple byte-identical copies as non-ambiguous when identity is exact, selecting deterministically while preserving all paths as evidence.

## Materially changed next condition

R6-G0 RD2 must:

1. preserve the same protected production identity checks;
2. enumerate and print every `.cs` candidate and SHA-256 under the bounded R5.1 candidate root;
3. treat one-or-more exact SHA matches as byte-identity PASS;
4. preserve all exact matching paths as evidence;
5. select a deterministic exact copy for localization rather than failing solely because duplicates exist;
6. if zero exact matches exist, produce a structural source inventory and stop with the actual candidate hashes rather than guessing;
7. continue only to read-only localization/evidence generation.

## Failure-memory rule

RD1 must not be rerun unchanged. The same failure fingerprint remains attempt 1 across chats and filenames.

## Authority boundary

The owner's existing `/dsp authorize all build-spawn-debug` authority remains valid for the bounded Workbench R6 stream. This record does not authorize production/release, protected-main mutation, canonical Build Ledger append, privilege escalation, security-control weakening, or unrelated work.
