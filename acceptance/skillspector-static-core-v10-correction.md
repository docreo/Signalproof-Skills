# SkillSpector v2.9.5 Static-Core V10 Correction

**Status:** V9 STATIC-OFFLINE PREFLIGHT HARNESS DEFECT PROVEN — V10 RUNTIME ACCEPTANCE AUTHORIZED  
**Target:** `NVIDIA/SkillSpector` v2.9.5  
**Exact upstream commit:** `27fd9620dbfed1a2f405fd8c519661e51511f06e`  
**Authority:** bounded Static-Core acceptance only; no protected upgrade, semantic-provider use, dev-server/MCP approval, automatic activation, or full upstream-install approval.

## V9 evidence preserved

Exact V9 harness SHA-256:

`3f7a947a0d3d9ceef7096618819d27a8db457b27d6c02a66e1911d89b7e045ce`

Latest unchanged elevated V9 run:

`F:\SP\SkillSpector-Test\run-20260816-061352`

V9 again passed every substantive Static-Core stage except `STATIC-OFFLINE firewall proof`.

Immediately before that run, bounded diagnostics proved:

- PowerShell elevation;
- DNS resolution for `api.osv.dev`;
- direct TCP 443 success;
- direct WinHTTP configuration with no proxy;
- no proxy environment variables;
- HTTPS request to the OSV API returned HTTP 200.

The unchanged V9 then still classified its own before-state socket probe as unreachable.

## Direct Python falsification test

After the V9 PARTIAL, the exact V9 preflight evidence file:

`F:\SP\SkillSpector-Test\run-20260816-061352\e\osv-before-block.log`

contained only:

`Traceback (most recent call last):`

A standalone Python 3.13.5 socket test, using a temporary script rather than command-line quoting, then executed:

- host: `api.osv.dev`
- port: `443`
- timeout: 4 seconds
- Python: `C:\Python313\python.exe`

Observed result:

`CONNECTED ('142.251.214.115', 443)`

and:

`PYTHON_EXIT=0`

The temporary diagnostic file was removed afterward.

## Source inspection

V9 `Test-TcpApiOsv` still used:

`Invoke-Native -FilePath $RuntimePython -Arguments @("-c",$code) ...`

That legacy wrapper captures native stderr through PowerShell `2>&1` while the harness uses fail-fast error semantics. Earlier acceptance work already established that this process boundary can truncate or misclassify legitimate native-process stderr and produce false failures.

The OSV preflight was the remaining instance of that boundary in the offline causality test.

## Correct classification

**V9 STATIC-OFFLINE PREFLIGHT HARNESS DEFECT — DIRECT NETWORK AND DIRECT PYTHON SOCKET REACHABILITY PROVEN**

This is not a SkillSpector scanner failure, OSV outage claim, firewall-rule failure, or justification for weakening the before/after isolation proof.

## V10 correction

V10 changes only the `Test-TcpApiOsv` process boundary plus the harness version/title:

- replace legacy `Invoke-Native` use with `Start-Process`;
- preserve stdout and stderr separately;
- bind the actual native process exit code;
- preserve a combined evidence log.

The V9→V10 local diff was inspected and contains no substantive acceptance-policy changes outside that function.

Unchanged controls include:

- exact NVIDIA wheel identity;
- omission of only `langgraph-cli[inmem]>=0.4.14`;
- all other direct dependencies retained;
- binary-only dependency policy;
- hash-lock / required-hash sync;
- no cache / no automatic Python downloads;
- no-LLM boundary;
- connected OSV test;
- reachable-before / denied-after firewall causality requirement;
- explicit offline OSV fallback evidence;
- firewall rollback verification;
- baseline default-off and explicit opt-in behavior;
- completeness boundary;
- operational failure handling;
- junction boundary and cleanup;
- protected-state verification;
- disposable runtime cleanup.

V10 harness SHA-256:

`246a1499aff7fa6e8b0ae4424bd0a5285d38631e3f10a0b80f52a9c161962296`

V10 bundle SHA-256:

`b576154db6c26b3b8c784ef3bada3b5836d30be0c5f3bfedd4660ae9860cb0d9`

## Success meaning

A complete V10 PASS may support only:

**ADAPT CANDIDATE — STATIC-CORE SIGNALPROOF ADAPTER**

It does not establish full upstream-install acceptance, NVIDIA-supported reduced packaging, semantic mode, dev-server/Studio, MCP, protected upgrade, or automatic activation.

## Reusable lesson

**A native-process boundary must be consistent across both the product under test and the test's own causality probes. A single legacy wrapper in a precondition probe can invalidate an otherwise sound before/after experiment even when independent network and process evidence prove the precondition is actually true.**

## Next authorized step

Run the exact V10 harness from elevated PowerShell and inspect the complete evidence set before final Case 2 disposition.