# SkillSpector v2.9.5 Static-Core V11 Firewall Proof / Offline Parser Failure

**Status:** V11 FIREWALL ISOLATION PROVEN / OFFLINE-FALLBACK REPORT PARSER DEFECT  
**Target:** `NVIDIA/SkillSpector` v2.9.5  
**Run:** `F:\SP\SkillSpector-Test\run-20260816-100328`  
**Harness SHA-256:** `c71b932381354a6615f7e399b9b931de0cb1e2a91eddc5ce55a310441cf2d279`

## Proven V11 results

The elevated V11 run passed the corrected process-identity and firewall causality boundary:

- `STATIC-OFFLINE firewall rule identity`: PASS
- launcher target: `F:\SP\SkillSpector-Test\run-20260816-100328\rt\Scripts\python.exe`
- effective base target: `C:\Python313\python.exe`
- `STATIC-OFFLINE firewall proof`: PASS
- `STATIC-OFFLINE no-LLM proof`: PASS

The run therefore established that Python could reach `api.osv.dev:443` before the temporary scoped block and could not reach it after verified launcher/effective-image outbound block rules were active.

## Failure after firewall proof

Immediately after the offline no-LLM assertion, the harness terminated with:

`The property 'message' cannot be found on this object. Verify that the property exists.`

The fail-closed sequence then correctly marked offline and all downstream required stages NOT_RUN, preserved protected state, and cleaned up the disposable runtime.

## Harness source boundary

V11 fallback inspection uses:

`Test-ContainsMessage $offlineReport "OSV\.dev unreachable"`

and `Test-ContainsMessage` currently evaluates:

`$Report.issues | Where-Object { [string]$_.message -match $Pattern }`

Under strict/fail-fast PowerShell semantics, an issue object without a `message` property can terminate that parser instead of returning a negative match.

## Current classification

**V11 FIREWALL ISOLATION PROVEN / OFFLINE-FALLBACK REPORT PARSER DEFECT**

This is not evidence that the offline firewall isolation failed. It is also not yet evidence that the OSV fallback itself is absent. The exact `deps-offline.json` report schema/content must be inspected before a parser correction is authorized.

## Next authorized step

Inspect the exact V11 `deps-offline.json` evidence without rerunning SkillSpector:

1. enumerate top-level report properties;
2. enumerate property names on every `issues` entry;
3. preserve entries that do not expose `message`;
4. search the complete serialized report for `OSV`, `unreachable`, `fallback`, `incomplete`, and related warning text;
5. identify the actual field/path containing the offline fallback evidence, if present.

No V12 is authorized until that evidence is inspected.

## Reusable lesson

**A report parser used as an acceptance gate must tolerate heterogeneous issue objects and validate field presence before dereference. Schema assumptions are part of the acceptance contract and must fail descriptively rather than collapsing the entire evidence sequence.**