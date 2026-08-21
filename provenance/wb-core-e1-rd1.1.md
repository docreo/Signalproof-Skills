# Workbench Core E1 RD1.1

**Status:** HARNESS CORRECTION / STATIC PASS / WINDOWS RUNTIME RETEST PENDING  
**Work stream:** Signalproof Workbench governed Core access  
**Git basis:** `80a21ccb324d96d4970ce9f61a279cb85ffcd16d`  
**Branch:** `candidate/wb-core-rd1`

## Carried-forward failure

E1 RD1 executed once as the normal non-elevated Workbench user. It verified the installed Workbench identity and accepted Governor manifest, then stopped after parsing activation metadata with:

`Cannot find an overload for "Contains" and the argument count: "1".`

Exit code: `2`.

Classification: `POWERSHELL HARNESS / DICTIONARY MEMBERSHIP`, not Core, Governor, activation, or product failure. No Core HTTP request, Governor pipe request, production mutation, protected Core mutation, or canonical Build Ledger append occurred.

The failure matches the Active PowerShell prevention rule requiring generic `ContainsKey` and non-generic `IDictionary.Contains` semantics to be distinguished.

## Builder lane

Localized the defect to the RD1 `Test-MapKey` helper. RD1 checked `IDictionary` first and invoked `$Map.Contains($Key)` through ambiguous PowerShell method resolution.

Correction:

1. prefer an actual `ContainsKey` method when present;
2. only otherwise cast explicitly to `[System.Collections.IDictionary]`;
3. invoke `Contains` on the explicitly typed dictionary;
4. use a new evidence lane so the failed RD1 evidence remains preserved.

No other product logic is intentionally changed.

## Design lane

No architecture change. Durable path remains:

`Workbench -> Governor -> Core -> approved capability`.

The harness failure does not justify direct Workbench-to-Core access, Core rewrite, or production bridge mutation.

## Governor lane

Protected state remains unchanged. This retry is allowed only because the exact failing harness condition materially changed. RD1 is preserved as failed evidence and is not overwritten.

## RD1.1 artifact

Artifact: `B8A-E1-CORE-RD1.1.ps1`

SHA-256:

`C9A9339DB98922481796D6BD9CC713EC426B3588B14DF8E30ED36270145E6968`

New evidence lane:

`B8A-E1-CORE-EV-RD1.1`

Static checks:

- ambiguous `return [bool]$Map.Contains($Key)` removed;
- explicit `[System.Collections.IDictionary]` cast present for fallback membership;
- `ContainsKey` checked first;
- no leading interactive `& {` wrapper;
- no `$Host` assignment;
- controlled output remains ASCII;
- production mutation surface unchanged: none.

Exact Windows PowerShell parser validation and runtime retest remain pending on the owner machine.

## Next gate

Stage RD1.1, verify the exact SHA-256, parser-preflight the exact staged file, then execute once as the same normal non-Administrator Workbench user.

If RD1.1 reaches a product/contract disposition, use that result. If it fails again, preserve the new failure and do not retry until the new failure class is localized and the condition materially changes.
