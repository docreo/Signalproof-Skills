# PowerShell Harness Reliability Candidate

**Status:** CANDIDATE  
**Lifecycle:** DISCOVERED -> CANDIDATE  
**Scope:** Signalproof-generated Windows PowerShell / PowerShell test, recovery, acceptance, provenance, and build runners  
**Authority:** Public-safe governance learning only. This record does not activate new doctrine, modify Build Ledger chronology, authorize product mutation, or close any milestone.

## Purpose

Repeated Signalproof investigations have shown that a test harness can fail independently of the product under test. These failures must be prevented where practical and classified correctly when they occur.

Core rule:

> **A harness defect is not product evidence. Validate the runner, preserve failed evidence, localize the failed layer, and do not upgrade a harness failure into a product failure.**

This candidate consolidates previously recorded Git evidence with additional Build 8A PowerShell failures observed during Signalproof Hermes Governor source/build provenance investigation.

## Prior governed Git evidence

### 1. Malformed here-string / parser failure

Signalproof Opportunity Detector V1 RD1 Integration Candidate 1 initially preserved a PowerShell wrapper failure caused by a malformed here-string terminator. The accepted recovery verified wrapper parsing before execution.

Reusable rule:

- generated PowerShell runners must pass parser preflight before execution;
- parser failure is PRE-EXECUTION HARNESS FAILURE unless separate evidence proves product actuation occurred.

Reference:

`acceptance/opportunity-detector-v1-rd1-integration-candidate1-r2.md`

### 2. Native stderr falsely treated as execution failure

SkillSpector Static-Core V6/V8 demonstrated a recurring Windows PowerShell 5.1 boundary defect: native tools legitimately wrote progress or informational text to stderr while `$ErrorActionPreference = "Stop"` and a legacy `2>&1` wrapper converted that stderr into a PowerShell exception even when the native process succeeded.

Accepted correction pattern:

- use `Start-Process` for consequential native child processes where stream behavior matters;
- capture stdout and stderr separately;
- bind acceptance to native exit code plus expected persisted artifacts;
- do not treat stderr presence alone as failure.

References:

- `acceptance/skillspector-static-core-v7-correction.md`
- `acceptance/skillspector-static-core-v9-correction.md`

### 3. Heterogeneous report schema dereference failure

SkillSpector V11 proved its firewall/no-LLM boundary, then the acceptance parser crashed because it assumed every issue object exposed a `.message` property.

Reusable rule:

- validate property/key presence before dereference;
- heterogeneous parser inputs require schema-aware accessors;
- parser assumptions are part of the acceptance contract;
- parser collapse after an earlier verified gate does not erase that earlier gate.

Reference:

`acceptance/skillspector-static-core-v11-firewall-pass-parser-fail.md`

## Build 8A failures added by this candidate

The Hermes Governor Build 8A Gate 7 investigation exposed additional recurring harness classes. Exact private paths/hashes remain in private evidence; this public-safe record captures only reusable patterns.

### 4. Function invocation used directly as a multiline hashtable index

Observed pattern:

```powershell
$Map[
    SafeText $Property.Name
] = $Value
```

Windows PowerShell parser rejected this with `MissingArrayIndexExpression` / `UnexpectedToken`.

Required pattern:

```powershell
$Key = SafeText ([string]$Property.Name)
$Map[$Key] = $Value
```

Prevention:

- never place a function invocation as an ungrouped multiline index expression;
- compute the scalar key first;
- parser-preflight the final generated file.

### 5. Interactive `if` / `else` split across separate submissions

An interactive launch sequence submitted `if { ... }` and then `else { ... }` as separate PowerShell inputs. PowerShell completed the `if` statement before the later `else`, causing `else` to be interpreted as a command.

Required pattern:

- deliver launch wrappers as one complete statement, preferably `& { ... }`;
- parser/hash/execute gates must live inside that single block;
- do not instruct users to submit an `else` continuation after the `if` has already executed.

### 6. Recovery output naming drift broke parent continuity

A recovery runner wrote accepted evidence under original output filenames while its child runner expected recovery-suffixed filenames. The child stopped correctly at parent continuity.

Required pattern:

- before emitting a child runner, bind its parent paths to the actual files written by the accepted parent;
- verify parent path + SHA together;
- recovery labels do not imply filenames changed unless the recovery runner actually writes changed filenames;
- parent-continuity STOP is a harness lineage defect, not product failure.

### 7. Raw delimiter counting produced a misleading static warning

A simple raw `[` / `]` count was unsuitable for PowerShell source containing regular-expression character classes and strings.

Required pattern:

- PowerShell parser preflight is authoritative for syntax;
- raw delimiter counts are only heuristic diagnostics;
- do not claim syntax validity or invalidity solely from raw character counts.

### 8. `ConvertFrom-Json` compatibility failure on npm lockfile shape

Windows PowerShell 5.1 `ConvertFrom-Json` failed on an npm `package-lock.json` structure containing object-property shapes unsuitable for conversion to `PSCustomObject` (notably modern lockfiles may contain an empty-string root package key).

Required pattern:

- do not assume `ConvertFrom-Json` can represent every externally produced JSON object under Windows PowerShell 5.1;
- when arbitrary JSON property names are expected, use a dictionary-capable parser or another validated representation;
- keep normal `ConvertFrom-Json` for schemas known to be PowerShell-safe;
- compatibility-parser failure is not evidence that the JSON artifact itself is invalid.

### 9. Generic dictionary accessor mismatch

After switching to a dictionary-capable JSON parser, the harness called `.Contains($Key)` on a generic `Dictionary[string,object]`, causing an overload failure.

Required pattern:

- generic `IDictionary[string,object]` -> use `.ContainsKey($Key)`;
- non-generic `System.Collections.IDictionary` -> `.Contains($Key)` is acceptable;
- access helpers must explicitly distinguish the two interfaces before lookup.

### 10. Console output accidentally re-entered as commands

Human-visible transcript lines such as `PASS: ...`, `SHA256: ...`, and `=== ... ===` were pasted back into an interactive PowerShell prompt and produced command-not-found noise.

Required pattern:

- distinguish commands from expected output visually and structurally;
- provide one copyable command block only for execution;
- never mix expected output lines into the executable block;
- post-run command-not-found errors from pasted output must not be confused with runner execution evidence.

## Proposed mandatory preflight for generated PowerShell runners

Before a Signalproof-generated `.ps1` runner is handed to the operator, the generating workflow should, where the environment supports it, apply the following checks:

1. **Final-file parser check** using `System.Management.Automation.Language.Parser.ParseFile` against the exact generated file.
2. **Exact SHA-256** calculated after final serialization; no edits after hash publication.
3. **Encoding control** appropriate to the target shell; avoid unexpected Unicode punctuation in evidence/control text when ASCII is an explicit requirement.
4. **Single-block launch wrapper** for interactive use: hash -> parser -> execute in one `& { ... }` statement.
5. **No multiline function-call index expressions.** Compute index keys first.
6. **No ungrouped function calls inside boolean expressions** where PowerShell parsing/precedence is ambiguous; compute values first when needed.
7. **Parent lineage check** against the actual parent filenames and SHA values produced, not inferred naming conventions.
8. **External JSON compatibility check**: identify whether arbitrary/empty property names can occur before choosing `ConvertFrom-Json` under Windows PowerShell 5.1.
9. **Dictionary-interface check** before key lookup (`ContainsKey` vs `Contains`).
10. **Schema/property-presence checks** before dereference of heterogeneous report objects.
11. **Native process boundary check**: do not use merged stderr as success/failure authority; bind real exit status and expected outputs.
12. **Failed-attempt preservation**: recovery runners preserve prior runner identity and confirm whether prior evidence/report outputs were or were not produced.
13. **No product conclusion from harness STOP** unless separate evidence proves product actuation and failure.
14. **Static heuristics are subordinate to parser/runtime evidence.** Raw bracket counts, regex scans, and similar checks can warn but cannot replace PowerShell parsing.

## Candidate acceptance criteria

This record should not become Active doctrine merely because it documents repeated failures.

Promote only after the proposed preflight is applied to at least two materially different future PowerShell runner families and demonstrates that it either:

- prevents previously observed harness defects before operator execution; or
- produces precise fail-closed diagnostics without misclassifying product state.

At least one validation should involve an external JSON/report schema and at least one should involve a native child process or interactive launch wrapper.

## Relationship to existing Signalproof skills

This candidate strengthens existing disciplines rather than creating product authority:

- `signalproof-investigate`: localize harness vs product failure and test the cheapest discriminating hypothesis.
- `signalproof-build`: validate generated execution artifacts, preserve failures, and avoid hidden environment/process semantics.
- `signalproof-verify`: bind claims to the exact evidence class and never upgrade a parser/static gate into runtime/product proof.
- `signalproof-debug`: use bounded corrections once the failed harness layer is identified.
- `signalproof-learn`: govern repeated harness lessons through the normal candidate lifecycle.

## Governance state

**Current:** CANDIDATE / NOT ACTIVE DOCTRINE.

No canonical Build Ledger event number is reserved or claimed by this file. Private Build 8A hashes, local paths, and detailed recovery lineage remain private evidence and must not be published through this record.
