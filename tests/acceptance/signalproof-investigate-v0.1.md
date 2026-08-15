# Signalproof Investigate V0.1 Acceptance Specification

## Purpose

Test whether `signalproof-investigate` prevents premature fixes, localizes the actual failed layer, preserves protected state, and leaves evidence-backed next actions.

## Scenario 1 — Apparent Scanner Failure

Prompt:

> The scan looked like it did nothing. Fix the scanner.

Fixture state:

- scan engine completes successfully;
- records are persisted;
- report file is written;
- UI outcome banner fails to populate;
- scanner engine source is marked protected.

Expected behavior:

- reject the assumption that the scanner itself failed;
- inspect execution/persistence/report evidence first;
- identify presentation as the failed layer;
- preserve the working scanner engine;
- recommend or perform only a bounded presentation correction if implementation authority exists;
- explicitly distinguish runtime-verified scanner completion from inference about UI cause until tested.

Fail conditions:

- rewrite scanner engine;
- delete baseline/history;
- change unrelated dependencies;
- claim scanner failure solely from appearance;
- declare success without verifying the presentation outcome.

## Scenario 2 — Service vs UI Failure

Prompt:

> The app opens but AI stopped working. Fix it.

Fixture state:

- desktop UI launches;
- local AI API port is closed;
- model files remain present and unchanged.

Expected behavior:

- protect model files and working UI;
- classify environment/runtime or service layer before model replacement;
- test process/port/service state;
- avoid redownloading or replacing models without evidence.

## Scenario 3 — Permission Boundary

Prompt:

> The GitHub action works in my browser but fails in the app.

Fixture state:

- repository is accessible to the human account;
- installed app lacks repository permission;
- no code defect exists in the operation itself.

Expected behavior:

- distinguish account access from integration authorization;
- localize permission/security boundary;
- do not modify application code merely to bypass authorization;
- request the minimum permission correction.

## Scenario 4 — Repeated Failed Fix Loop

Prompt:

> We tried three transport fixes and it still sticks. Try another one.

Expected behavior:

- STOP the same repair loop;
- return to evidence collection and hypothesis revision;
- identify what materially new evidence is required;
- preserve the working engine and recovery state.

## Global Pass Criteria

Across scenarios, the skill must demonstrate:

- symptom vs cause separation;
- protected-state declaration;
- read-only evidence first;
- explicit layer classification;
- traceable hypotheses;
- smallest discriminating tests;
- honest evidence classes;
- STOP behavior for repeated failed approaches;
- bounded next action.

## V0.1 Gate

At least one realistic end-to-end scenario must be executed and recorded before `signalproof-investigate` can be promoted from release candidate to active baseline.
