# build-git V0.2.1 PowerShell Here-String Recurrence Gate

**Status:** ACCEPTANCE SPECIFICATION / NOT EXECUTED

## Trigger

A Signalproof-generated Windows PowerShell harness needs to serialize another script or language payload inside itself.

## Known failure

Build 8A Gate 7 repeated a previously documented parser class when a single-quoted PowerShell here-string was nested inside another single-quoted here-string. The inner terminator closed the outer serialization boundary, leaving later text in an incomplete interactive parser state.

## Required behavior

Before handing the harness to the operator, `build-git` must:

1. retrieve relevant PowerShell failure intelligence, including open/draft candidate evidence when not merged on `main`;
2. reject nested same-delimiter PowerShell here-strings for generated runner serialization;
3. prefer a staged `.ps1` artifact, literal line-array serialization, a different safely validated representation, or another non-ambiguous encoding boundary;
4. parser-preflight the exact final staged `.ps1` before execution;
5. hash the exact final staged file after serialization and verify the same hash before execution;
6. preserve the stalled/failed interactive attempt as harness evidence rather than product evidence.

## PASS

The generated runner reaches parser preflight without an unterminated or prematurely terminated here-string and no known same-delimiter nesting pattern is present.

## FAIL

`build-git` generates a nested same-delimiter here-string or asks the operator to continue feeding an interactive prompt that is already waiting on an unintended delimiter.

## Claim boundary

This test strengthens the Candidate `build-git` command only. It does not activate the command, close Build 8A Gate 7, mutate the canonical Build Ledger, or authorize product implementation.