# Signalproof Media Studio — Kokoro Short-Form Acceptance / Long-Form Recovery Learning Record

**Status:** LOGGED / NONCANONICAL / PUBLIC-SAFE / LONG-FORM OPEN  
**Original short-form observation:** 2026-08-23  
**Long-form revocation evidence:** 2026-08-24  
**Latest synchronized state:** 2026-09-08  
**Command family:** `/dsp log-skill` / `handoff-log`  
**Work unit:** Signalproof Media Studio V5 RD2 C2D-C2R1 — governed Signalproof-Kokoro integration

## Evidence correction

The original R14 human UI observation proved only a short-form narration sample. Later owner testing established that production long-form Kokoro remained broken/insufficient and that the visible narration workflow still presented a 50,000-word planning ceiling.

Therefore the prior broad `HUMAN-ACCEPTED` conclusion is revoked for production long-form use.

R14 may still be cited for the narrower facts it actually proved:

- Media Studio could route ordinary short narration through `Signalproof-Kokoro NORMAL`.
- `US Female - Bella` / `af_bella` was governed and usable on that short path.
- the earlier Bella-not-governed failure was corrected;
- arbitrary prose was no longer incorrectly forced through `CONTROLLED` mode;
- the exact governed `Signalproof` pronunciation remained a separate CONTROLLED-mode concern.

R14 did **not** establish audiobook/book-length completion, resume, final-source coverage, or removal of an arbitrary application word ceiling.

## Root acceptance gap

The governed consumer milestone was built around the `generate_first` compatibility contract while the streaming/long-form `generate_all` path was explicitly outside that candidate's scope. Short UI testing therefore exercised a path that was not representative of production manuscript narration.

The later audit identified additional production-long-form constraints that short acceptance did not exercise:

- a visible 50,000-word planning target in the narration UI;
- one synchronous `/api/generate` request for the full narration;
- a governed consumer subprocess timeout suitable for short calls but not a book-length job;
- lack of durable chunk manifest/resume/final-stitch acceptance evidence.

## Recovery sequence and failure classification

### R15 — source-availability harness failure

R15 introduced the long-form design but stopped before product actuation because it assumed the runtime evidence tree also contained native VB build source. That assumption was false.

**Classification:** HARNESS / SOURCE-AVAILABILITY.  
**Learning:** runtime evidence and canonical build source are different authority classes. A recovery runner must not infer that a deployed evidence tree is a source checkout.

### R16 — native stderr boundary exposed

R16 corrected source authority by staging exact native source from a pinned Media Studio Git commit. It reached Git fetch, where normal native progress written to stderr exposed the Windows PowerShell 5.1 native-stderr hazard under a global terminating error preference.

**Classification:** HARNESS / `PS-NATIVE-STDERR-001` candidate.  
**Learning:** for native tools such as Git, capture stdout, stderr, and exit status separately; classify success from the native exit/result contract rather than stderr presence.

### R17 — exact-final parser failure

R17 attempted to isolate Git native stderr but introduced one extra closing parenthesis in the new failure-detail expression. The exact-final Windows PowerShell parser preflight rejected the runner before product/runtime actuation.

**Classification:** PRE-EXECUTION HARNESS / `PS-PARSER-FINAL-001`.  
**Learning:** the exact-final parser gate is evidence-producing protection, not noise. A parser failure before actuation must never be counted as Kokoro/product failure.

### R18 — current recovery candidate

R18 removes the R17 delimiter defect, keeps the Git stderr isolation, and preserves the same long-form Kokoro product gates. Package-time checks passed, but no Windows R18 machine execution or human long-form acceptance is claimed by this record.

**Current state:** `R18 READY / LONG-FORM OPEN / NOT HUMAN-ACCEPTED`.

## Long-form architecture being tested

The current recovery design is intentionally different from a single whole-manuscript provider call:

`source -> deterministic chunk plan -> governed Kokoro NORMAL worker -> per-chunk WAV/hash/manifest evidence -> verified resume -> final 24 kHz WAV stitch -> end-of-source human playback check`

The intended machine gates include:

- a source larger than the former 50,000-word planning target;
- real forced multi-chunk Bella generation;
- a repeated identical request that reuses completed chunks rather than regenerating them;
- provider/config immutability and no-bytecode checks;
- final UI launch only after automated gates pass.

A full 50,000-word acoustic render is not required merely to prove the planner; actual human acceptance must nevertheless use a genuinely multi-segment source and confirm narration reaches the source end.

## Reusable learning

### 1. Short-form TTS PASS must not be promoted to long-form acceptance

For narration products, acceptance must exercise the actual production topology. A paragraph-sized sample proves routing and basic acoustics; it does not prove manuscript completeness.

### 2. Long-form acceptance requires source-completeness evidence

A production gate should prove at least:

`source identity -> deterministic chunk plan -> every chunk completed or verified-resumed -> final stitched output -> end-of-source human playback check`

### 3. CONTROLLED and NORMAL remain separate

- `CONTROLLED`: exact governed pronunciation / explicit approved phoneme evidence.
- `NORMAL`: arbitrary production narration.

Do not weaken CONTROLLED rules to make prose work, and do not force all narration into CONTROLLED.

### 4. Product-visible voice governance must match provider governance

If the UI offers `af_bella`, the runtime provider configuration must govern the same verified local voice asset. Fail closed on mismatch.

### 5. Runtime evidence is not source authority

Do not expect deployed/runtime evidence trees to contain canonical build source. Resolve source from a separately verified authority and bind its identity before rebuilding.

### 6. Native stderr is evidence, not failure authority

On Windows PowerShell 5.1, informational native stderr can surface as an error record. Preserve stdout/stderr as evidence and use the process exit/result contract plus required artifacts as the success authority.

### 7. Exact-final parser preflight must remain mandatory

Generated or modified PowerShell must be parser-checked after final serialization and before execution. Bind hash identity only after that final artifact is fixed.

### 8. Harness failures remain separate from product failures

Parser, source, path, staging, wrapper, and native-process-boundary failures must not be counted as product runtime failures when target actuation did not occur.

## PowerShell prevention data implicated

Current reusable prevention IDs for this recovery include:

- `PS-PARSER-FINAL-001`
- `PS-NATIVE-STDERR-001`
- `PS-HARNESS-EVIDENCE-001`
- `PS-COUNT-SHAPE-001`
- `PS-OPTIONAL-PROPERTY-001`
- `PS-RESERVED-VARIABLE-001`
- `PS-PATH-CANONICAL-001`
- `PS-HERESTRING-NESTED-001`

The receiving workflow must reload the current PowerShell failure registry before generating or retrying another runner. A new chat or renamed runner does not reset same-failure history.

## Lifecycle governance

Reusable learning remains:

`DISCOVERED -> CANDIDATE`

No `SKILL.md` is created or activated by this synchronization. No canonical Build Ledger event number is reserved or claimed.

## Closure boundary

Kokoro short-form R14 lane: **NARROW PASS / HISTORICAL EVIDENCE**.  
Kokoro production long-form lane: **OPEN / R18 READY FOR WINDOWS EXECUTION**.  
Granite/AI Writing lane: **OPEN / SEPARATE**.  
Overall Media Studio program: **NOT CLOSED BY THIS RECORD**.

A later long-form candidate must earn machine and human acceptance; it must not inherit R14 production acceptance by implication.
