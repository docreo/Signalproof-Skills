# `build-git` V0.2.1 Known-Failure Preflight Acceptance

**Status:** ACCEPTANCE SPECIFICATION / NOT EXECUTED  
**Candidate:** `build-git` 0.2.1-candidate

## Purpose

Prove that `build-git` Known Failure Preflight retrieves relevant newer failure evidence from open/draft Signalproof candidate PRs when that evidence has not yet landed on `main`, and that it applies the supported mitigation before generating another failure-prone PowerShell harness.

## Scenario 1 - Open/draft candidate contains the applicable failure

### Setup

- current `Signalproof-Skills/main` does not contain the complete PowerShell harness reliability candidate;
- an open/draft Signalproof PR contains relevant prior Build 8A failure evidence;
- the next action will generate or modify a Windows PowerShell harness;
- the proposed harness shape contains a pattern already documented in that candidate evidence.

### Required behavior

1. Refetch current `main`.
2. Search merged failure intelligence and acceptance evidence.
3. Search relevant open/draft Signalproof PRs/candidate records because the failure class may be newer than `main`.
4. Retrieve and inspect the applicable candidate evidence before authoring the harness.
5. Preserve Candidate / Not Active status and use the material only as historical failure/prevention evidence.
6. Apply the supported mitigation before generating the harness.
7. Parser-preflight and hash-bind the exact final staged `.ps1` before execution.

### PASS

A previously documented failure is avoided before operator execution, and no Candidate command/skill is silently promoted.

### FAIL

- `build-git` checks only `main` and misses an applicable open/draft candidate;
- the harness repeats the known failure before candidate evidence is retrieved;
- candidate evidence is treated as Active authority merely because it was used for prevention.

---

## Scenario 2 - Interactive PowerShell `if` / `else` recurrence prevention

### Setup

An operator-facing sequence would otherwise submit an `if { ... }` block and a later `else { ... }` as separate interactive PowerShell submissions.

### Required behavior

- recognize the documented interactive split failure before authoring;
- emit one complete statement, preferably one `& { ... }` block;
- keep hash, parser, and execute gates within the complete launch statement where practical;
- do not ask the operator to submit a detached `else` continuation.

### PASS

No `else is not recognized` recurrence reaches the operator.

---

## Scenario 3 - Windows PowerShell 5.1 npm lockfile JSON compatibility

### Setup

The harness must inspect an npm `package-lock.json` whose object property names may include empty/arbitrary keys.

### Required behavior

- do not assume Windows PowerShell 5.1 `ConvertFrom-Json` can materialize the lockfile safely;
- choose a validated dictionary-capable parser or another representation appropriate to the exact schema;
- distinguish generic dictionary `.ContainsKey()` from non-generic `IDictionary` `.Contains()`;
- classify compatibility-parser failure as harness/parser failure, not invalid lockfile evidence.

### PASS

Locked dependency identities are read without reproducing the known `ConvertFrom-Json` compatibility failure or dictionary accessor mismatch.

---

## Scenario 4 - Native child process evidence

### Setup

The generated PowerShell harness invokes a native tool that may legitimately write progress/notices to stderr.

### Required behavior

- preserve stdout and stderr separately;
- bind success/failure to the actual native exit code plus expected artifacts;
- do not use stderr presence alone as failure authority.

### PASS

A successful native process cannot be falsely rejected merely because informational stderr was emitted.

---

## Scenario 5 - Candidate evidence unavailable

### Setup

Search of `main`, relevant open/draft PRs, and available work-stream evidence finds no applicable supported failure pattern.

### Required behavior

Return `NO KNOWN MATCH` or `POSSIBLE MATCH` according to evidence and proceed proportionately. Do not fabricate a known failure merely because PowerShell is involved.

## Promotion relevance

This acceptance case supports the `build-git` promotion requirement that Known Failure Preflight must avoid a real recurrence and must retrieve relevant open/draft candidate evidence when newer failure intelligence is not yet merged on `main`.
