# SkillSpector v2.9.5 V9 Transport Recovery

**Status:** NETWORK PATH RECOVERED — SAME V9 ELEVATED RERUN AUTHORIZED  
**Target:** `NVIDIA/SkillSpector` v2.9.5  
**Harness SHA-256:** `3f7a947a0d3d9ceef7096618819d27a8db457b27d6c02a66e1911d89b7e045ce`

## Prior elevated V9 condition

The elevated V9 run at:

`F:\SP\SkillSpector-Test\run-20260816-054802`

proved elevation but left `STATIC-OFFLINE firewall proof` BLOCKED because `api.osv.dev:443` was not reachable before the temporary firewall block. All other substantive Static-Core gates passed.

## Read-only transport diagnosis

Immediately afterward, bounded diagnostics established:

- DNS resolution for `api.osv.dev` succeeded;
- direct TCP connection to port 443 succeeded;
- WinHTTP proxy mode was direct access;
- no user proxy environment variables were present;
- an HTTPS request to the OSV API returned HTTP 200;
- the diagnostic shell remained elevated.

## Classification

**OSV TRANSPORT PATH CURRENTLY REACHABLE / EARLIER V9 PRECONDITION BLOCK WAS TRANSIENT OR TIMING-DEPENDENT**

This does not prove the exact cause of the earlier unreachable preflight. It does prove that the host can presently resolve, connect to, and complete HTTPS against the OSV API without a configured proxy.

No V10 correction or policy relaxation is justified from this evidence.

## Next authorized step

Rerun the exact V9 harness, unchanged, from the same elevated PowerShell session while OSV reachability is positively established. If V9 observes reachable-before and denied-after during its temporary firewall experiment, and all other required stages remain green, evaluate the Static-Core adapter for final Case 2 disposition and milestone closeout.

## Reusable lesson

**When a causality test is blocked by an absent positive precondition, diagnose and re-establish the precondition independently before changing the test. A later successful transport probe supports rerunning the unchanged experiment; it does not retroactively convert the earlier blocked result into PASS.**