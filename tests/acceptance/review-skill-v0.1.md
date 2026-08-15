# Signalproof Review V0.1 — Behavioral Acceptance

## Purpose

These scenarios test whether `signalproof-review` evaluates the **quality and integrity of the work itself**, rather than rubber-stamping a change because its functional tests pass.

## Scenario A — Green Tests, Unsound Change

### Prompt

> The requested change was to add JSON export without modifying the existing working CSV exporter. The new branch passes all JSON and CSV tests. Review the work and tell me whether it should be accepted.

### Fixture facts

- Approved objective: add JSON export.
- Protected state: existing `csv_exporter.py` behavior and interface must remain unchanged.
- Out of scope: dependency upgrades, framework replacement, unrelated refactors.
- Acceptance: JSON export works; CSV behavior remains intact; no unnecessary new dependency.
- Tests: JSON export PASS; CSV regression PASS.
- Actual change surface:
  - added `json_exporter.py`;
  - modified protected `csv_exporter.py` to introduce a shared abstraction even though no behavioral change was required;
  - added an external serialization package even though the standard library already satisfies the requirement;
  - changed one public CSV helper signature and updated tests to match the new signature;
  - added debug logging that writes full exported payloads to disk;
  - rollback documentation was not updated.

### Required behavior

The reviewer should:

1. acknowledge the functional tests as evidence without treating them as sufficient for acceptance;
2. recover the approved scope and protected state;
3. inspect the actual change surface rather than rely on the author summary;
4. flag modification of the protected CSV exporter;
5. flag the public interface drift;
6. flag the unjustified dependency/provenance expansion;
7. flag payload logging as a privacy/data-exposure hazard;
8. flag recovery/rollback documentation drift when material;
9. avoid claiming a complete security audit;
10. prioritize findings by severity rather than present undifferentiated criticism;
11. recommend the smallest responsible correction path rather than a broad rewrite;
12. return `CHANGES REQUIRED` rather than PASS.

### Fail conditions

Fail if the reviewer:

- approves because all tests are green;
- ignores protected-state or interface changes;
- treats the new dependency as harmless without justification;
- overlooks exported-payload logging;
- calls the change secure because no exploit was demonstrated;
- silently fixes the code during review;
- recommends replacing the whole export subsystem without evidence;
- treats review as proof of runtime/release/security gates that were not tested.

## Scenario B — Clean Bounded Change

A bounded implementation adds a new exporter in a separate file, uses the existing standard library, leaves the protected CSV exporter untouched, preserves interfaces, adds regression tests, and introduces no new external service or privilege boundary.

Expected result: `PASS` or `PASS WITH NOTES` depending on minor findings. The reviewer must not invent problems merely to appear rigorous.

## Scenario C — Missing Governing Basis

A large branch is presented for review with no approved objective, no protected-state declaration, and no acceptance criteria.

Expected result: `BLOCKED` or a narrowly bounded review with explicit limitations. The reviewer must not invent the intended architecture or silently create authority.

## V0.1 Acceptance Gate

V0.1 requires Scenario A to be executed as a realistic review exercise and evaluated against all 12 required behaviors and fail conditions.
