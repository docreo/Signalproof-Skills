# Signalproof Workbench RD2 R6 — G0 RD2 Zero-C# STOP

**Date:** 2026-08-21  
**Status:** G0 RD2 STOP / SOURCE-PACKAGING-EXTRACTION STATE / PRODUCT UNCHANGED  
**Workstream:** Signalproof Workbench GUI RD2 R6  
**Failure fingerprint:** `R6-G0-SOURCE-PAYLOAD-ABSENT-002`  
**Attempt count for this fingerprint:** 1

## Owner execution evidence

The owner executed the exact R6-G0 RD2 launcher. The launcher reported:

- expected runner SHA-256 `5A3941F2E1C57570E4E2589645F646F18027DCF29656E7F314BCFDC52487A821`;
- downloaded SHA-256 exact;
- staged runner hash exact;
- exact-final PowerShell parser state PASS.

The RD2 runner then reported:

- normal non-elevated owner PASS;
- fresh RD2 evidence lane absent PASS;
- R5.1 deterministic-scroll candidate directory exists PASS;
- production Workbench exists PASS;
- production Workbench protected identity exact PASS;
- `STOP: one or more C# candidates exist` at the first source inventory assertion.

Because that assertion is `Files.Count -gt 0`, the observed STOP establishes that the surviving R5.1 candidate directory currently contains zero recursively discoverable `.cs` files.

## Classification

`EVIDENCE / SOURCE-PACKAGING / EXTRACTION STATE`

This is not a Workbench runtime/product/UI failure. The target GUI was not compiled, launched, replaced, or mutated by RD2.

RD1's duplicate-source hypothesis is ruled out for the currently observed candidate directory. The directory exists, but the expected loose source payload is absent.

## Provenance-bound recovery basis

Existing R5.1/H1 provenance records the unchanged exact GUI source SHA-256:

`B4FF2051B3B8FDD4DEED9C7AF5271B395C38255D9578753A1CF6F18002489B12`

Known exact R5.1 lineage identities:

- original R5.1 builder: `AA3462EA46586585E30FF06B285CEA057E4FB97237AEA63C81FBC447F7E6DCE7`;
- original R5.1 ZIP: `FF4FD88016DF1798FB9BD0EDA26E70EF446FD3BE60A23CC82B94BE6A498AA558`;
- H1 builder: `D462707C7323E8D714109532F445734ED581115B773E6515232EE28E7A0236FA`;
- H1 ZIP: `A89CBBC62E3C0061160D25F9A2E2322B3A8B03804210A030F10CD8EABCE3D74F`.

Prior Workbench builder evidence also establishes the build-family pattern of embedding exact GUI source bytes as Base64 inside PowerShell builders. Therefore a materially different next attempt can recover source bytes from an exact provenance-bound builder/package and accept them only if the recovered bytes hash to the exact R5.1 source identity.

## Materially changed next condition

R6-G0 RD3 must not search the empty candidate directory for loose source as its primary authority. It must:

1. locate exact preserved R5.1/H1 builders or packages by SHA-256 in bounded download/evidence roots;
2. inspect exact packages for exact `.cs` bytes and/or exact builders for embedded Base64 source;
3. accept source only when recovered bytes hash to `B4FF...`;
4. write recovered source only into a fresh evidence lane;
5. verify the R5.1 structural/governance contract;
6. capture localization contexts needed for R6-G1;
7. leave production/Governor/Core/ACL/provider state untouched.

## Failure memory

Do not rerun RD1 or RD2 unchanged. New filenames or wrappers do not reset either prior failure.
