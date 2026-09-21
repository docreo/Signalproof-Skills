# Media Context Validation + Truthful Playback Status — Candidate Learning

**Status:** CANDIDATE  
**Source domain:** Media/DAW UI transport integration  
**Lifecycle:** DISCOVERED -> CANDIDATE; not Active doctrine

## Failure pattern

A shared transport implementation can be correct while a higher-level media surface still fails because the transport entry point also embeds storage-context validation that is only valid for a different surface.

Example class:

- Projects player accepts audio only from governed project `Outputs` folders;
- Song Studio renders a governed `preview.wav` under `Production Sessions/<session>/Renders`;
- Song Studio reuses the Projects `playAudio` entry point;
- the Projects-only validator rejects the production preview before playback;
- the Song Studio UI then posts a success status unconditionally, producing a false user-visible claim.

A second usability failure occurs when non-destructive editing provides duplication/import but no direct way to remove mistaken session entities.

## Candidate principles

### 1. Separate context validation from shared transport mechanics

Keep storage/trust validation specific to the owning surface. After validation succeeds, share the common cue/start/seek/pause/stop transport mechanics.

Do not weaken a Projects validator merely because a Production Studio asset lives somewhere else by design.

### 2. Production previews need a session-bound validator

A production preview should be accepted only when it is the expected render for the active governed session, for example:

`<session-root>/Renders/preview.wav`

The validator should still enforce path containment, resolved-path containment, regular non-link file identity, supported filename characters, audio signature, and supported transport format.

### 3. UI success text must follow actual success

Never post `Playing...`, `Saved...`, `Recorded...`, or similar success text merely because a command handler was invoked. Post success only after the underlying operation returns success.

On failure, surface the actual operation class, such as `PREVIEW PLAY ERROR`, so the human test provides useful evidence.

### 4. Non-destructive editing still needs delete semantics

In a session-based editor, `DELETE CLIP` and `DELETE TRACK` should remove arrangement/session references while preserving immutable source assets on disk. This gives users a way to correct duplicate imports/edits without turning deletion into destructive source mutation.

### 5. Human acceptance should be checkpointed

For a large production surface, reduce the human acceptance test to a small ordered set of user-visible checkpoints such as:

1. session/import/delete;
2. render/play/pause/stop;
3. one representative non-destructive edit;
4. recording/export;
5. persistence and prior-baseline regression.

The human should not be required to re-run internal implementation gates or test every control simultaneously.

## Regression candidates

- Projects playback retains its existing project-Outputs validation;
- Song Studio preview uses a separate session-bound validation path;
- both surfaces share cue/start mechanics only after validation;
- failed preview cue never displays a playing-success message;
- DELETE CLIP removes only the selected session clip;
- DELETE TRACK removes the selected track and its session clips but not source files;
- saved session remains valid after removals;
- acceptance checklist identifies the minimum observable user workflows.

## Governance note

This is public-safe reusable product-learning only. Private artifact hashes, workstation paths, screenshots, exact candidate identities, and canonical Build Ledger chronology remain in private evidence.
