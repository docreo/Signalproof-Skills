# Signalproof Skills Security Policy

## Purpose

Signalproof Skills is a public, governed repository. Security reports should be handled in a way that protects users, preserves evidence, avoids unnecessary public disclosure, and keeps human authorization meaningful.

## Reporting a vulnerability

Please do **not** open a public GitHub issue for a suspected security vulnerability.

When GitHub Private Vulnerability Reporting is available for this repository, use that channel to report the issue privately. If private reporting is temporarily unavailable, contact the repository owner through an established private Signalproof communication channel rather than publishing exploit details.

A useful report should include, when available:

- the affected file, component, workflow, version, commit, or release;
- the observed behavior;
- reproduction steps that do not require unauthorized access;
- the security impact you believe may exist;
- relevant logs, screenshots, hashes, or other evidence;
- whether the finding is confirmed, suspected, or inferred;
- any known workaround or mitigation.

Do not include credentials, tokens, private keys, customer data, private account data, unnecessary personal information, or unrelated private infrastructure details in a report.

## Authorization boundary

The existence of this security policy does **not** authorize access to systems, accounts, networks, services, devices, repositories, or data beyond what the reporter is otherwise authorized to access.

Do not perform destructive testing, persistence, credential access, social engineering, denial-of-service activity, data exfiltration, or testing against third-party systems without explicit authorization.

Reports should be based on lawful, bounded investigation of material the reporter is authorized to inspect.

## Signalproof handling model

Security findings are handled according to the same evidence and control principles used throughout Signalproof:

1. **Contain** sensitive details and avoid unnecessary public disclosure.
2. **Investigate** what state is actually true.
3. **Separate evidence from inference.**
4. **Verify** the specific security claim.
5. **Correct** the smallest responsible surface.
6. **Review** the change for scope and regression risk.
7. **Preserve recovery** and rollback where practical.
8. **Document** accepted results without overstating evidence.
9. **Close out** material incidents or remediation milestones with durable evidence where appropriate.

A report is not considered a confirmed vulnerability merely because it has been submitted. Findings are validated before they are represented as established security defects.

## Supported scope

Security reporting applies to material published in this repository and to public Signalproof Skills artifacts that can be tied to a specific repository version, commit, tag, release, or accepted artifact.

Experimental branches, proposals, research notes, concepts, and unreleased material may be reviewed, but their presence does not by itself establish that they are supported production releases.

## Public disclosure

Please allow reasonable time for investigation, verification, remediation, and coordinated disclosure before publishing vulnerability details.

Signalproof may use GitHub Security Advisories or another private remediation workflow when appropriate.

## Secrets

If you discover a credential, token, key, or other secret in repository history or current content:

- do not reuse or test it;
- report it privately;
- identify the file, commit, or location where it was found;
- avoid copying the secret into additional systems or public messages.

Secret revocation and rotation are treated separately from source-code removal because deleting a secret from a repository does not make the exposed credential safe again.

## Evidence classes

Security work should preserve the Signalproof distinction between:

- Artifact-Backed Fact
- Runtime-Verified Fact
- Human-Observed Fact
- Design Authority
- Inference
- Proposal

A finding should not be silently promoted to a stronger evidence class than the available evidence supports.

## Good-faith reporting

Good-faith reports that respect the authorization and disclosure boundaries above are welcome. The goal is to improve the safety and integrity of the Signalproof public ecosystem without encouraging unsafe testing or unnecessary exposure.
