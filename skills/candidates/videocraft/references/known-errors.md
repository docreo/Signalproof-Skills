# Known errors and prevention

Generalized failure classes; test applicability locally. Private scripts and historical environment limits are excluded.

| Fingerprint | Prevention |
|---|---|
| Transcript for another video | Confirm topic, speakers, sampled words against recording. |
| Long word drift | Monotonic anchors and gap alignment; inspect early/middle/late spans. |
| Numeral/hyphen mismatch | Sequence mapping with insertions/deletions; never zip by index. |
| Cue on wrong repeated phrase | Occurrence ID or explicit after-anchor. |
| Inverted/estimated timing | Validate bounds; label uncertainty; confirm critical spans manually. |
| Hook tokens present but meaning changed | Check context and claim as well as word membership. |
| Face covered/payoff clipped | Shot-aware native layout; full-size QC in each orientation. |
| Soft opening | Compare actual sources and first usable frame. |
| Color shifted | Check channel order, sRGB/linear conversion, view transform, final encode. |
| Small emblem malformed | Inspect full detail and intended display size. |
| Chunk incomplete/process vanished | Supported job runner, exit status, decoded counts before mux. |
| Wrong process killed | Exact PIDs; no broad name/pattern termination. |
| Render memory exhausted | Benchmark concurrency; mix after renders if resources require. |
| Rounding disagrees with runtime | Rational fps and frame plan; derive seconds from frames. |
| Ending truncated at caption end | Explicit program duration; avoid indiscriminate shortest-stream mux. |
| Audio drifts after joins | Account for crossfade overlap; place stems on picture clock. |
| Locked mix normalized | Separate preservation/editable modes; disclose target conflicts. |
| Lossy export not sample identical | PCM proof before encode; final lag/quality checks separately. |
| AI shot freezes/morphs | Clean subshots, shorten/replace; retain required provenance. |
| Transfer silently failed | Verify destination size/hash or report blocked/unverified. |
| Small request expands to extra wraps | Honor scope; extras require applicable request/profile. |
| Acceptance inferred from thanks/silence | Explicit acceptance of actual version and scope. |

Record fingerprint, evidence, changed condition, bounded remedy, and verification in the job record. Retry only with material change. Propose reusable rules through authorized change control; do not silently modify installed skills during media jobs.
