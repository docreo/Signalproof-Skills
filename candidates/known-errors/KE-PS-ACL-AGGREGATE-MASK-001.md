# KE-PS-ACL-AGGREGATE-MASK-001

**Status:** CANDIDATE  
**Class:** PowerShell / .NET FileSystemRights / ACL evidence  
**Discovered:** Workbench Core E3 RD1.1

## Failure fingerprint

A verifier computes a write-capability mask by OR-ing aggregate `FileSystemRights` values including `FullControl`, then tests an ACE with:

`($Rights -band $WriteMask) -ne 0`

A Local Service ACE intentionally granted only `Read` is then falsely classified as write-capable because `FullControl` includes read bits as well as write/destructive bits.

Observed E3 sequence:

- token ACL inheritance protected PASS;
- broad write absent PASS;
- Local Service read PASS;
- verifier then failed `Local Service cannot write exact Core token`.

The ACL setter had granted Local Service `Read` only. The failure was in the verifier's aggregate-mask semantics.

## Prevention candidate

- Do not include aggregate `FullControl`, `Modify`, or similar composite enums in a generic bit-intersection mask when the question is whether a narrower capability is present.
- For write/destructive capability, test the actual constituent bits individually, such as `WriteData`, `AppendData`, `WriteExtendedAttributes`, `WriteAttributes`, `Delete`, `ChangePermissions`, and `TakeOwnership`.
- For read capability, test the actual read constituent bits separately.
- Keep ACL setter semantics and ACL verifier semantics independent so an evidence bug does not silently rewrite the intended ACL.
- If production mutation already occurred before verifier failure, inspect persisted state before rollback/retry.

## E3 rollback lesson

The same run attempted to restore a captured full SDDL and hit:

`The process does not possess the 'SeSecurityPrivilege' privilege which is required for this operation.`

Therefore a non-elevated recovery path must not assume arbitrary full-SDDL restoration is available. Determine which portions of rollback completed before issuing further mutation.

## Governance

Candidate only. It does not change Active PowerShell prevention data, authorize another production attempt, or append the canonical Build Ledger. Promotion requires normal Learn/Known Errors governance and regression coverage.
