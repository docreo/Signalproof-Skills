# signalproof-security V0.1 — Promotion Evidence

## Candidate

- Skill: `signalproof-security`
- Candidate version: `0.1.0-rc1`
- Candidate PR: #30
- Behavioral acceptance: Scenario 1

## Acceptance

Scenario 1 tested a functionally successful helper with security-sensitive trust failures:

- mutable/unpinned download origin;
- unclear publisher/version provenance;
- administrator execution;
- broad ACL expansion;
- environment-variable logging;
- disabled certificate validation;
- zero scanner findings;
- SHA-256 identity evidence;
- no verified rollback for consequential security changes.

Result:

- **12/12 required behaviors PASS**
- **0 fail conditions**
- decision: **SECURITY CHANGES REQUIRED**

## Promotion decision

Promote to:

- Version: `0.1.0`
- Maturity: `Active public baseline`

## Protected boundaries retained

Promotion does not grant authority to:

- perform unauthorized penetration testing or exploitation;
- elevate privileges;
- rotate credentials or change ACL/firewall policy without authority;
- disable security controls;
- publish/release/deploy;
- claim compliance or universal security certification;
- mutate the canonical private Build Ledger.

Security remains a scoped defensive discipline. Hashes, signatures, scanner output, and functional success remain evidence at their own boundaries rather than universal safety verdicts.
