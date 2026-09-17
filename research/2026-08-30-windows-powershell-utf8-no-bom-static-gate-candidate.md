# Windows PowerShell 5.1 UTF-8-No-BOM Static-Gate Failure — Candidate Learning

**Status:** CANDIDATE  
**Source domain:** Windows PowerShell 5.1 build/governor harnesses  
**Lifecycle:** DISCOVERED -> CANDIDATE; not Active doctrine

## Failure pattern

A protected source file can be byte-correct UTF-8 without BOM while a Windows PowerShell 5.1 harness reads it through legacy/default text decoding. If an acceptance predicate depends on a non-ASCII character, the harness can produce mojibake and falsely report that protected behavior disappeared.

Example class:

- source bytes contain an em dash in an accepted UI/status string;
- UTF-8 decoding preserves the exact string;
- legacy Western decoding can transform the em dash bytes into `â€”`;
- a regex/string predicate using the intended Unicode text then returns false;
- the harness reports a product regression even though the exact source bytes still contain the accepted behavior.

## Candidate principles

### 1. Encoding is part of evidence authority

When a harness inspects governed text, the decoder must be explicit. Default text decoding is not sufficient evidence authority when source encoding is known.

### 2. UTF-8-no-BOM requires explicit handling on Windows PowerShell 5.1

For governed UTF-8 source/manifests, use an explicit UTF-8 reader. Prefer strict decoding that rejects invalid byte sequences rather than silently replacing them.

Example semantic contract:

- read exact bytes;
- decode using UTF-8 explicitly;
- fail closed on invalid UTF-8;
- run acceptance predicates only on that decoded text.

### 3. Fix the reader, not the protected predicate

If the protected behavior is present in exact bytes but the decoded string is wrong, do not weaken or remove the regression gate. Correct the decoding path and retain the original behavioral predicate.

### 4. Separate source text from native process logs

Compiler/tool stdout and stderr are process evidence and can follow different encoding behavior. Do not automatically force every native log through the governed-source UTF-8 contract. Preserve stdout, stderr, and exit status separately.

### 5. Prove both byte presence and decoded meaning when localizing

For a suspected encoding false negative, compare:

- exact source bytes;
- explicit UTF-8 decode;
- the legacy/default decode that produced the failure;
- the acceptance predicate.

That distinguishes a true product regression from a harness decoding defect.

## Regression candidates

- UTF-8-no-BOM source containing an em dash passes the intended protected-string predicate under the harness reader;
- invalid UTF-8 fails closed with a text-source error;
- the same exact source misdecoded through a legacy code page does not become acceptance authority;
- native stdout/stderr capture remains governed by native exit/result semantics rather than the source-text reader.

## Governance note

This is public-safe reusable failure intelligence only. Private artifact hashes, workstation paths, build chronology, and protected candidate identities remain in private evidence.
