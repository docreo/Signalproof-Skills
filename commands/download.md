# `download` - Active Operator Command V0.1.0

**Status:** ACTIVE  
**Version:** 0.1.0  
**Owner:** Doc Reo

## Purpose

`/dsp download` recovers and re-delivers a previously generated artifact when its original download link, attachment card, chat surface, Work surface, or Codex session is no longer usable.

Core rule:

> Recover the exact artifact when possible. Reconstruct only from authoritative evidence. Never call a reconstruction byte-identical without proof.

## Accepted forms

```text
/dsp download
/dsp download <artifact>
dsp download <artifact>
/dsp-download <artifact>
```

Examples:

```text
/dsp download the PDF from the previous chat
/dsp download WORK-CHAT-HANDOFF.md
/dsp download the last Signalproof handoff zip
/dsp download that DOCX to Google Drive
```

## Recovery order

Use the smallest available recovery path in this order:

1. current conversation artifact or attachment;
2. available conversation/file-library artifact;
3. authorized connected storage containing the artifact;
4. governed repository/build evidence containing an exact copy;
5. authoritative reconstruction from sufficient source material and generation instructions;
6. STOP when faithful recovery or reconstruction cannot be supported.

Do not use public web search as a substitute for a private/user artifact.

## Recovery identity

Every successful result must be classified as one of:

- `EXACT RECOVERY` - original artifact bytes recovered;
- `VERIFIED EQUIVALENT` - regenerated output satisfies the governing acceptance criteria but byte identity is not claimed;
- `RECONSTRUCTED` - recreated from authoritative source material and may differ from the original bytes.

When a prior SHA-256 or other governed identity exists and exact identity matters, verify it before claiming `EXACT RECOVERY`.

## Delivery

After recovery:

1. verify the recovered/generated file exists before presenting it;
2. make it available through the current supported file-delivery surface;
3. preserve the original filename when known and appropriate;
4. state the recovery class whenever reconstruction or equivalence matters.

When the user explicitly requests a durable connected destination such as Google Drive, use an available authorized connector to create a durable copy. Do not claim the copy succeeded unless the destination action confirms it.

`/dsp download` does not automatically upload every recovered artifact to external storage.

## Cross-chat behavior

A different chat may execute `/dsp download` for an artifact from a prior chat. The receiving chat should search available file/library surfaces and authorized connected storage using the supplied artifact name, description, workstream, date, file type, or other identifiers.

If several plausible artifacts exist, request the smallest necessary disambiguation instead of guessing.

If the original bytes are unavailable but authoritative source material and a generation contract remain available, reconstruct with the correct recovery classification.

## Handoff integration

For consequential artifacts, `handoff-log` should preserve enough recovery metadata to make future `/dsp download` practical without storing private file bytes in public Git. Useful metadata includes:

- filename and type;
- workstream/purpose;
- authoritative source reference when appropriate;
- version or commit identity;
- SHA-256 when already part of governed evidence;
- reconstruction source/contract when reconstruction is permitted.

## Boundary

`download` is a recovery/delivery command. It does not create deployment, publication, protected-main, Candidate-activation, or canonical Build Ledger authority.

It must preserve the artifact's existing public/private boundary and use only storage/file surfaces available to the current authorized session.

## Failure handling

If delivery fails after successful recovery, reuse the recovered artifact and try another supported delivery surface instead of regenerating it unnecessarily.

Do not repeatedly reconstruct an artifact when exact recovered bytes are already available.

## STOP conditions

STOP and state the missing dependency when:

- the requested artifact cannot be identified;
- multiple candidates exist and selection would be unsafe;
- exact recovery is required but identity cannot be verified;
- reconstruction would require inventing missing content;
- required authoritative source material is unavailable;
- a requested durable destination is unavailable in the current session;
- recovery would violate the artifact's permitted public/private boundary.

## Output

When identity detail is useful, return:

```text
Artifact: <name>
Recovery: EXACT RECOVERY | VERIFIED EQUIVALENT | RECONSTRUCTED
Source: <authoritative reference>
Delivery: <current download or durable destination>
Identity: <hash/version when available and material>
```

Keep routine success concise.
