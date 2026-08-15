# signalproof-router 0.1.5 — Security Routing Acceptance

## Scenarios

1. A new helper requests admin rights, broad ACLs, and disables TLS validation -> `signalproof-security`.
2. “Did the secret actually get removed?” -> `signalproof-verify`, not Security alone.
3. A general change-quality review with no material security boundary -> `signalproof-review`, not Security.
4. A failed security hardening change should return to the verified prior state -> `signalproof-recovery`, with Security as context rather than replacement.
5. A material security finding requires remediation -> `signalproof-security -> signalproof-plan/build/debug -> signalproof-verify`, then Closeout at a meaningful milestone.

## Required behaviors

- Security selected for material trust/privilege/secret/execution/network/control questions.
- Verify retained for proof of specific security claims.
- Review retained for general work-quality/change-integrity questions.
- Recovery retained for restoration objectives.
- Security does not grant penetration-testing, privilege, destructive-remediation, credential, or release authority.
- Security is not forced on every dependency/scanner/safety mention.
- Planned skills remain unroutable.
- STOP conditions remain non-bypassable.
- Meaningful resolved security milestones route to Closeout.
- Smallest sufficient route remains preferred.

## Result

**PASS — 10/10 required behaviors; 0 fail conditions.**
