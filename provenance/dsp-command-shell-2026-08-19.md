# DSP Command Shell RD1 - Public-Safe Provenance

**Date:** 2026-08-19  
**Work stream:** Signalproof Library / Operator Commands  
**State:** branch candidate pending repository gates

## Owner decision

The Signalproof human-facing command namespace is `DSP`, meaning **Dr. Signalproof mode**.

Preferred root:

```text
/dsp
```

Transport-safe fallback:

```text
dsp
```

The shell accepts space/hyphen and slash/no-slash variants, including forms such as `/dsp build git`, `dsp build-git`, `dsp-this-plan`, and `/dsp-this-build`, but every accepted form must resolve to one stable canonical Signalproof command before routing or execution.

## Design decision

Do not rename or duplicate the existing canonical operator-command identities. Add a thin human-facing resolver layer instead.

This preserves command provenance, versioning, tests, authority boundaries, and existing Router relationships while reducing command-entry friction.

## Authority boundary

DSP is a resolver/mode interface. It does not grant implementation, destructive action, credential use, privilege elevation, security change, publication, release, Candidate activation, or canonical private Build Ledger authority.

## Collision boundary

Signalproof does not assume ownership of a host application's global slash-command namespace. When `/dsp` is intercepted or unavailable, `dsp` is the required non-slash fallback.

## Log-skill note

This file is the public-safe `log-skill` synchronization record for this command-shell milestone. It does not claim a canonical private Build Ledger append, C-number, private ledger head, or closeout before repository acceptance gates pass.
