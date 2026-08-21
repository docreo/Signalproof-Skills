# KE-PS-ACL-FULL-SDDL-RECOVERY-001

**Status:** CANDIDATE  
**Class:** PowerShell / Windows ACL recovery / privilege boundary  
**Discovered:** Workbench Core E3 RD1.1

## Failure fingerprint

A normal non-elevated PowerShell recovery path captures a file's full SDDL, later calls `SetSecurityDescriptorSddlForm(...)`, and then `Set-Acl`. Windows rejects the restore with:

`The process does not possess the 'SeSecurityPrivilege' privilege which is required for this operation.`

The restore path attempted to reproduce security descriptor portions that require privilege not available to the normal owner session.

## Risk

A recovery routine can correctly restore file bytes and still fail while restoring the full security descriptor, leaving a safe partial state that is neither the original ACL nor necessarily unsafe. Treating the whole rollback as all-or-nothing hides the actual persisted state.

## Prevention candidate

- Do not assume a normal non-elevated process can restore arbitrary full SDDL.
- Separate content rollback from DACL/owner/SACL rollback and verify each independently.
- Do not request privilege escalation merely to recreate a less-safe prior ACL when the current ACL is a verified monotonic hardening compatible with the product contract.
- Prefer an explicit safe recovery baseline over exact rollback when exact security-descriptor restoration would require excluded privilege.
- After a partial recovery failure, inspect bytes, DACL facts, token/client presence, service state, and protected state before another mutation.

## E3 evidence

E3 RD1.1 had already issued a scoped client and hardened both client registry and token ACLs. A verifier bug triggered rollback. `clients.json` bytes were copied back to the client-absent prestate, then the full-SDDL restore failed for lack of `SeSecurityPrivilege`.

Read-only E3 Recovery Check RD1.1 proved:

- protected Core unchanged;
- `clients.json` bytes exactly at the client-absent prestate;
- `clients.json` ACL remained hardened, inheritance-protected, and free of broad write;
- client record absent;
- orphan token present, non-empty, and correctly hardened for Local Service read/no write;
- Core online on the accepted loopback port with matching live activity lock.

Disposition: `SAFE_PARTIAL / ORPHAN_TOKEN_AFTER_ROLLBACK`.

## Governance

Candidate only. No automatic promotion, no production authority, and no canonical Build Ledger append.
