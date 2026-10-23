# Editorial workflow

## Intake and source lock

Work on copies. Probe media with an available inspector such as ffprobe; save stream metadata with the job. Do not assume 59.94 is 60 or force every job to 30 fps. Honor the approved delivery rate, including rational rates, and record conversions. Check rotation and color metadata.

Inspect first/last frames, scene changes, representative speech/action, and captions. Compare alternative sources at the same crop and time. Sharpness metrics can help, but noise and oversharpening score highly; inspect the picture. Never imply upscaling restores lost detail.

Identify whether audio is a locked finished mix, locked voice, or editable stems. Record permitted processing and additions. Extract a derived analysis copy if useful; leave the production original intact.

## Words before cues

1. Confirm the transcript describes this recording. Use owner-approved text for wording and embedded subtitles for timing when appropriate; neither automatically overrules the audio.
2. Resolve conflicts and spelling before animation. Keep an alignment-only normalization map for numerals, acronyms, and hyphenated words; restore display spelling.
3. Use an installed aligner/ASR when available and authorized. Do not assume downloads are blocked or repeatedly contact a refused host. Embedded captions and manually confirmed spans are valid fallbacks.
4. Align short clips within caption segments. For long files, establish monotonic anchors, then align gaps. Do not assume sliding forced alignment remains synchronized through music or missing words.
5. Map token sequences with insertions/deletions; never blindly zip transcript and aligner tokens. Record word source start/end, program start/end, and confidence (`confirmed`, `aligned`, `approximate`).
6. Assert finite, nonnegative, ordered spans within the correct clip. Keep simultaneous speakers on separate tracks rather than deleting genuine overlap.
7. Resolve repeated phrases by occurrence or after-anchor. Copy cue phrases from locked text. Confirm bleep spans by listening and waveform inspection; estimated timing is insufficient.

Save `words.json`, editable timed text, and `.srt` when captions are in scope. Review samples across the whole recording and every critical cue. State measured drift and uncertainty.

## Cut plan

Map topics, hook/payoff pairs, recurring bookends, sign-offs, false starts, and standalone ideas. Read/listen through enough of the source to preserve context and conclusions. Keep outputs coherent rather than forcing arbitrary lengths.

Use the cut-plan form. Show a recommendation and useful alternative when ambiguous. Obtain approval for the specific split structure before rendering it; source inspection, timing, and asset readiness may continue while pending.

After approval, create an EDL with source ranges, program start/end, audio policy, transitions, captions, and wrapper durations. Distinguish half-open frame ranges `[start, end)` from inclusive labels. Place audio at picture times; account for overlap consumed by a crossfade in the program clock.

Avoid cutting phonemes. Seek natural pauses; edge fades can prevent clicks on editable material. Do not fade a locked waveform without permission. Never rearrange words into a new sentence or remove context that changes a claim.

## Versions and bounded fixes

Share one EDL and cue IDs across landscape/portrait. Reflow graphics and captions natively; adjust crops per shot to preserve speakers, gestures, and titles. Do not assume fixed safe-zone coordinates fit every destination UI.

For a timestamp fix, locate the program range and its dependencies. Preserve approved content elsewhere. If stream splicing would break timestamps, codec compatibility, or GOP boundaries, use a verified re-encode route. Explain necessary wider re-encoding separately from editorial changes. Keep the prior master; verify patched seams, captions, audio, duration, and final artifact.
