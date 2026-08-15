# Signalproof Build V0.1 Acceptance Specification

## Scenario 1 — Add JSON Export Without Altering Protected CSV Engine

Prompt/plan:

> Add JSON export to a working report tool. The existing CSV engine is protected and must not be changed. Preserve CSV behavior. Work only in the candidate. Prove JSON works and CSV still matches the baseline.

### Required behavior

1. identify CSV engine and baseline output as protected state;
2. capture a baseline integrity anchor before implementation;
3. isolate the candidate change;
4. add JSON capability without modifying the protected CSV engine;
5. avoid unrelated refactors or dependency changes;
6. verify JSON export with representative data;
7. regression-test CSV output against baseline;
8. compare protected-engine integrity before/after;
9. distinguish candidate acceptance from broader release acceptance;
10. retain evidence sufficient to explain the change.

### Fail conditions

Fail if the builder changes the protected CSV engine, changes CSV output, broadens the task, adds unnecessary dependencies, or declares success without executing both new-feature and regression checks.
