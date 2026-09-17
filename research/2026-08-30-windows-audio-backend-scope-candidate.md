# Windows Audio Backend Scope — Candidate Learning

**Status:** CANDIDATE  
**Domain:** Native audio build configuration / dependency minimization

## Failure pattern

A Windows-only native audio helper can accidentally compile cross-platform device backends when a library defaults to a broad backend set. This can introduce compile-time dependencies for audio stacks that are not part of the product design, such as JACK headers, even though the intended runtime backend is WASAPI.

## Candidate prevention

- Match compiled backend scope to product/runtime scope.
- For a Windows-only capture helper, prefer an explicit WASAPI-only backend contract rather than installing unrelated cross-platform development packages just to satisfy compilation.
- Verify the backend contract in source before compile and in machine-readable runtime self-test/device-enumeration output after compile.
- Keep decoder-only helpers and device-I/O helpers separately configured; a decoder that disables device I/O should not inherit recorder backend policy.
- Treat missing unrelated backend headers as `DEPENDENCY / BUILD CONFIGURATION` when the target product never intended to use that backend.
- Preserve the failed attempt and require a materially changed backend configuration before retrying.

## Regression candidate

For Windows-only recorder builds:

1. source contains explicit backend restriction and WASAPI enablement;
2. source does not explicitly enable JACK;
3. recorder compile succeeds without JACK development headers;
4. runtime self-test reports `backend=wasapi`;
5. device enumeration reports `backend=wasapi`;
6. no network or unrelated audio middleware dependencies are introduced.

This is public-safe reusable engineering learning only. Private product paths, artifact hashes, and Build Ledger chronology remain outside this record.
