# Mandatory Signalproof Framework Pre-Build/Design Hook - Staged Log

**Status:** STAGED / NONCANONICAL / NOT ACTIVE UNTIL GOVERNED MERGE  
**Date:** 2026-09-19  
**Owner:** Doc Reo  
**Scope:** pre-build/design governance inheritance across `design-git -> build-git -> complete`

## Learning captured

The first mandate for Signalproof build/design work is:

> **Do not violate the Signalproof Framework.**

Unless Doc Reo explicitly says otherwise, build/design work must begin with a Git-backed governance preflight that establishes the current Signalproof Framework, brand/brand-pack state, rules, commands, Known Failure intelligence, applicable law, Terms of Service/platform policy, licenses/third-party notices, security/access controls, protected state, and authority boundary.

Conversation memory, prior-chat assumptions, or inherited command structure are not sufficient substitutes for a current Git-backed preflight when Git can establish the governing state.

## Inheritance

The requirement is intentionally explicit at every relevant operator layer:

1. `design-git` owns the mandatory pre-build/design Framework hook.
2. `build-git` inherits the gate from `design-git`, but may not assume it passed; a missing/stale/contradictory result routes back through `design-git`.
3. `/dsp complete` inherits the requirement through its build path and must carry the Framework hook state in the Complete Authorization Envelope.
4. `log-skill` preserves the learning, inheritance path, enforcement test, override scope, and rollback/supersession path.

## Override boundary

Doc Reo may explicitly override the hook for a specific task. Such an override must be bounded and does not waive applicable law, Terms of Service/platform policy, licenses, security/access controls, or other non-waivable constraints.

## Enforcement

Regression coverage is added to `tests/consistency/test_operator_command_registry.py` to require the Framework hook and inheritance language across the affected command contracts.

## Files staged

- `commands/design-git.md`
- `commands/build-git.md`
- `commands/complete.md`
- `commands/log-skill.md`
- `commands/COMMAND-REGISTRY.md`
- `tests/consistency/test_operator_command_registry.py`

## Lifecycle

This record does not reserve a canonical Build Ledger event number and does not claim private-ledger append. The change remains staged/candidate until the normal protected-main governance path completes.
