# SkillSpector v2.9.5 Static-Core V9 Elevated Offline Precondition

**Status:** PARTIAL — elevation proven; STATIC-OFFLINE before/after denial proof blocked because OSV endpoint was already unreachable before the temporary firewall block  
**Target:** `NVIDIA/SkillSpector` v2.9.5  
**Exact upstream commit:** `27fd9620dbfed1a2f405fd8c519661e51511f06e`

## Executed harness

V9 harness SHA-256:

`3f7a947a0d3d9ceef7096618819d27a8db457b27d6c02a66e1911d89b7e045ce`

Observed elevated run:

`F:\SP\SkillSpector-Test\run-20260816-054802`

Elevation was independently verified immediately before execution:

`Elevated = True`

## Result

All substantive Static-Core stages again passed, including exact wheel identity, binary-only/hash-locked dependency installation, intentional metadata divergence visibility, excluded server-chain absence, imports, clean/risky no-LLM scans, STATIC-CONNECTED scan, baseline default/opt-in behavior, completeness, operational failure handling, junction rejection/cleanup, protected local state, and cleanup.

The remaining stage reported:

`[BLOCKED] STATIC-OFFLINE firewall proof - api.osv.dev:443 was not reachable before the temporary block, so a before/after denial proof cannot be established.`

## Correct classification

**ELEVATION PROVEN / STATIC-OFFLINE BEFORE-AFTER FIREWALL EXPERIMENT PRECONDITION UNMET**

This is not evidence of a SkillSpector failure and not evidence that the temporary firewall rule failed. The harness intentionally requires a positive reachable-before observation before it can claim that its temporary outbound block caused the denied-after state.

The observed result also does not establish that OSV.dev itself was unavailable. It establishes only that this Windows host/process could not reach `api.osv.dev:443` through the harness preflight at that moment.

## Next diagnostic boundary

Before changing V9 or relaxing the offline gate, distinguish among:

- DNS resolution;
- direct TCP 443 reachability;
- HTTPS/API reachability;
- system/user proxy routing differences;
- local firewall or endpoint filtering;
- transient network/service conditions.

The official OSV documentation identifies `https://api.osv.dev/v1/query` as the production API endpoint, so the endpoint identity itself remains valid.

## Reusable lesson

**A before/after isolation experiment can prove causation only when the before-state is positively established. If the dependency is already unreachable, preserve the result as a precondition block and diagnose the transport path separately rather than upgrading ambient unreachability into proof that the isolation control worked.**

## Next authorized step

Run bounded read-only network diagnostics for `api.osv.dev` from the elevated Windows environment. Do not create V10 or alter the acceptance policy until the direct-versus-proxied transport path is understood.