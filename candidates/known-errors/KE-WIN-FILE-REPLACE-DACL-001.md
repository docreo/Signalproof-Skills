# KE-WIN-FILE-REPLACE-DACL-001

**Status:** CANDIDATE  
**Class:** Windows file replacement / DACL persistence / production evidence  
**Discovered:** Workbench Core E3 RD1.2

## Failure fingerprint

A file is hardened with an inheritance-protected DACL. A product command later rewrites or replaces that file. The new file no longer carries the hardened DACL and instead inherits ACL state from its parent path. A verifier then fails because the file-level protection did not survive the write.

Observed in E3 RD1.2:

- prestate `clients.json` ACL inheritance protected PASS;
- prestate broad write absent PASS;
- Core stop PASS;
- orphan token cleanup PASS;
- `issue-client` PASS with exact `models:invoke` scope;
- immediately after `issue-client`, verifier failed `clients.json ACL inheritance remains protected`.

The subsequent rollback restored client-absent bytes, but its file copy likewise did not re-establish the hardened DACL.

## Prevention candidate

- Do not assume a file-level DACL survives a product operation that rewrites/replaces the file.
- After any command that can atomically replace or recreate a protected private-data file, re-evaluate the resulting file ACL before trusting prior hardening evidence.
- If the product write contract necessarily replaces the file, harden the parent directory or reapply the exact file DACL after the write, according to the least-privilege product contract.
- Recovery that copies/replaces file bytes must separately restore or reapply the intended DACL; byte rollback and ACL rollback are different gates.
- Preserve monotonic security hardening where safe; do not restore a weaker inherited ACL merely for exact historical rollback.

## Governance

Candidate only. No Active-rule promotion, no production authority, no protected-main mutation, and no canonical Build Ledger append.
