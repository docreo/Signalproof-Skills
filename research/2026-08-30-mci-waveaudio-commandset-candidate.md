# MCI WaveAudio Command-Set Compatibility — Candidate Learning

**Status:** CANDIDATE  
**Source domain:** Windows legacy media transport  
**Lifecycle:** DISCOVERED -> CANDIDATE; not Active doctrine

## Failure pattern

A legacy MCI transport can successfully open a WAV preview yet fail later with `MCI 261` / "driver cannot recognize the specified command" when the application sends a command that is valid for another MCI device type but not for `waveaudio`.

In the observed case, a shared transport path sent `SETAUDIO ... VOLUME` after opening a `waveaudio` device. The short-path relay had already solved the earlier filename/path problem, so the later failure exposed a distinct command-set mismatch rather than another path defect.

## Candidate principles

1. **MCI commands are device-type specific.** Do not assume a command accepted by `mpegvideo` or digital-video devices is accepted by `waveaudio`.
2. **Gate optional commands by the active device type.** Shared transport code should expose the selected MCI media type and conditionally emit only supported commands.
3. **Keep stage-specific errors.** Distinguish open, time-format, length/status, volume, and play failures so human evidence localizes the failing command.
4. **Do not retry a path fix for a command failure.** Once the file opens successfully, preserve that evidence and move to the next failing transport stage.
5. **Add an executable Windows smoke test.** Before human UI handoff, create a silent WAV and prove the exact intended command subset: open -> set time format -> status length -> play -> pause -> resume -> stop -> close.
6. **Preserve accepted behavior from earlier attempts.** A command-set correction should not regress waveform visualization, editing, source immutability, or protected project playback.
7. **Legacy compatibility is a bridge, not future architecture.** When a Production Audio Core supersedes MCI, keep the legacy path bounded rather than expanding it indefinitely.

## Regression candidates

- `waveaudio` never receives `SETAUDIO`;
- `mpegvideo` retains the previously accepted live-volume behavior;
- Windows silent waveaudio smoke passes for the exact playback command subset;
- user-visible errors identify the failing MCI stage;
- prior path-relay and waveform/edit regressions remain green.

## Governance note

This is public-safe reusable failure intelligence only. Private workstation paths, candidate hashes, screenshots, Build Ledger chronology, and protected artifact identities remain in private evidence.
