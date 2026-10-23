# Finishing and delivery

## Audio modes

| Mode | Allowed behavior |
|---|---|
| Locked finished mix | Preserve source samples/gain in the working timeline. Add SFX only if authorized. Do not normalize the base. |
| Locked voice | Preserve approved voice; add only authorized music, wrappers, and effects. |
| Editable stems | Perform approved cleanup, leveling, ducking, and mix changes; retain originals and processing notes. |

If additions cause clipping, reduce additions first. If the protected base alone exceeds a requested target, disclose the conflict and ask for the needed processing decision. Do not silently trade preservation for loudness compliance.

Verify preservation using aligned PCM at identical sample rate/channels in the lossless working timeline. With added effects, compare the known base stem or subtract precisely placed effects; report residual and method. Lossy delivery encoding changes decoded samples: assess final audio separately for duration, lag, intelligibility, loudness, and peak. Never promise bit identity for AAC or infer waveform identity from correlation alone.

Place stems on the picture program clock. Align effects by audible onset or measured peak as appropriate, rather than file start. Keep instrumental-only openings when required. Use no unauthorized voice cloning.

Set loudness/true-peak targets in the brief. About -14 LUFS and at most -1 dBTP may be defaults for newly mixed web videos; they are not universal specifications. Measure the final encoded audio, including codec overshoot. An oversampled limiter may help editable mixes; never apply it to a locked base merely to meet a default.

## Render and QC

1. Record versions, rational fps, dimensions, duration, color handling, assets, and resource budget. Benchmark a short representative segment before estimating long renders.
2. Inspect at least two still-QC passes for new layouts; examine details at full size and thumbnails at viewing size. Use an available image viewer and report unavailable inspection.
3. Use resumable chunks where supported. Record frame ranges, exit codes, logs, identities, and actual PIDs. Use the host's job runner; detached shell tools are optional environment-specific routes. Never kill by broad process-name pattern.
4. Gate assembly on decoded counts and range coverage, not file presence or success markers. Account for transitions and duplicate/missing boundary frames.
5. For CFR, compute expected frames from the approved frame plan and rational fps; derive runtime from frame count/fps. Do not mix rounded seconds and frame timing. For VFR, inspect timestamps/cadence or explicitly choose CFR conversion.
6. Verify compatible stream parameters before stream-copy concatenation. Mux to intended duration; do not let a short subtitle/auxiliary stream truncate the ending. With ffmpeg, avoid indiscriminate `-shortest` with captions; use an explicit duration/frame plan.
7. Check the exact final file: streams, counts, durations, seams, orientation, color, caption offsets, opening, payoff, stamp, ending. Extract the cue contact sheet from that file.
8. Measure A/V sync at beginning, middle, end, and important impacts. Report lag, uncertainty, and job tolerance (for example, within one delivery frame). Correct offset and accumulated drift separately; do not assert universal 0 ms sync.
9. Check spellings, captions, black/frozen runs, clipping, and unexpected scenes. Treat holds/fades as intentional only where the EDL specifies them. Listen to representative final spans where possible; state limitations.

## Delivery and acceptance

Deliver requested masters, an appropriate preview, captions, cue sheet/EDL, and requested extras. Keep previous masters versioned. Use the configured authorized destination; never invent a drive or silently overwrite a master.

Check the actual connector's limits. Estimate preview bitrate from byte budget, runtime, audio rate, and overhead, then measure the result. Fixed size recipes are not portable. Use supported resumable transfers or explicitly described parts when needed. Verify reconstructed destination size/SHA-256 when accessible. A local hash alone does not prove remote delivery.

Use the delivery form with filenames, dimensions, runtime, version/hash, actual destination, checks/untested gates, and review timestamps. Separate:

- `AUTOMATED CHECKS: PASS/PARTIAL/FAIL/UNVERIFIED` with results;
- `DELIVERY: VERIFIED/BLOCKED/PARTIAL/UNVERIFIED` with destination evidence;
- `HUMAN ACCEPTANCE: PENDING/ACCEPTED/CHANGES REQUESTED` with version and explicit owner words if accepted.

Never infer acceptance from silence, thanks for work in progress, or unrelated approval. Archive the EDL, cue sheet, processing decisions, and evidence with the job. Log public-safe reusable lessons only; keep media, transcripts, paths, and private project evidence separate unless their publication is authorized.
