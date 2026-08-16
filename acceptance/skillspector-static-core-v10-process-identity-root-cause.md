# SkillSpector v2.9.5 Static-Core V10 Process-Identity Root Cause

**Status:** V10 FIREWALL FAILURE ROOT CAUSE PROVEN — V11 CORRECTION AUTHORIZED  
**Scope:** Signalproof bounded Static-Core acceptance only  
**Upstream target:** NVIDIA/SkillSpector v2.9.5

## Prior V10 result

Elevated V10 run:

`F:\SP\SkillSpector-Test\run-20260816-070731`

Decisive V10 result:

`[FAIL] STATIC-OFFLINE firewall proof - Disposable Python still reached api.osv.dev:443 after scoped outbound block.`

Firewall rollback succeeded.

## Firewall policy diagnostics

Windows Firewall service was running and all profiles were enabled.

`Get-NetFirewallProfile -PolicyStore ActiveStore` showed:

- `AllowLocalFirewallRules : True` for Domain
- `AllowLocalFirewallRules : True` for Private
- `AllowLocalFirewallRules : True` for Public

No policy registry keys were present under `HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall`.

Therefore the V10 failure was not explained by local-rule merging being disabled.

## Disposable process-identity probe

A temporary Python 3.13 venv was created outside protected Signalproof state and executed through its venv launcher.

Observed launcher path:

`...\venv\Scripts\python.exe`

Observed launcher PID:

`19348`

The Python process itself reported:

- PID `31848`
- PPID `19348`
- `sys.executable` = the venv launcher path
- `base_executable` = `C:\Python313\python.exe`
- `base_prefix` = `C:\Python313`

Windows process inspection of PID `31848` reported:

- `Name : python.exe`
- `ExecutablePath : C:\Python313\python.exe`
- command line still referenced the venv launcher path and disposable probe script

Socket ownership inspection showed the established OSV HTTPS connection was owned by PID `31848`:

- Remote port `443`
- OwningProcess `31848`

At the same time the original Start-Process PID `19348` remained the venv launcher executable.

The disposable probe was removed after observation.

## Root cause

**V10 targeted the venv launcher program path for Windows Firewall enforcement, while the process that actually owned the outbound OSV socket executed from the base interpreter image `C:\Python313\python.exe`.**

Because Windows Firewall `-Program` matching is bound to the effective executable image path, the launcher-scoped rule did not match the actual socket-owning process.

Correct classification:

**V10 VALID FAIL — FIREWALL PROGRAM TARGET DID NOT COVER THE EFFECTIVE BASE-PYTHON EXECUTION IMAGE**

## V11 correction boundary

V11 may make a bounded correction to STATIC-OFFLINE isolation only:

1. derive the effective base Python executable identity from the disposable runtime before firewall mutation;
2. record both venv launcher and effective base executable paths as evidence;
3. create temporary outbound block rules for the effective base interpreter image and any other process image explicitly proven to own the scanner/network execution path;
4. verify the exact rules exist in `ActiveStore` before the denial probe;
5. preserve reachable-before → denied-during → reachable-after causality;
6. preserve visible OSV fallback evidence during STATIC-OFFLINE scan;
7. remove every temporary rule and verify rollback;
8. do not change firewall profile settings, local-rule merge settings, or default outbound policy;
9. do not broaden to permanent machine-wide isolation;
10. leave all non-firewall acceptance controls unchanged.

## Success meaning remains bounded

Even a complete V11 PASS may support only:

**ADAPT CANDIDATE — STATIC-CORE SIGNALPROOF ADAPTER**

It does not establish full upstream-install acceptance, NVIDIA-supported reduced packaging, semantic-provider mode, dev-server/Studio, MCP, protected upgrade, or automatic activation.

## Reusable lesson

**For process-scoped isolation, the executable path used to launch a workload is not necessarily the executable image that owns its network socket. Isolation controls must bind the effective execution identity observed at the enforcement boundary, not merely the user-visible launcher path.**

## Next authorized step

Create and inspect a bounded V11 harness correction implementing effective execution-image firewall targeting without weakening any existing acceptance proof standard.