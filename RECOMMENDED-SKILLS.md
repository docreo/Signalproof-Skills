# Signalproof — Recommended Skill Sources

**V1 RD1 · Reviewed and approved for listing on 2026-10-13**

Selected upstream skill sources and related tools recommended by Doc Reo / Signalproof. Follow the original repository links to explore each project.

## About these recommendations

Signalproof learns from skilled engineers, creators, researchers, and open-source communities. These are selected skill sources we recommend exploring for the purposes listed below. Where we adapted a method, we credit its source. Where we inspected a collection or encountered it through another collection, we say so. A recommendation is not a claim that every skill was installed, executed, certified safe, or incorporated into Signalproof.

The repository links lead to the original projects. Signalproof adaptations remain distinguishable from their upstream sources, and applicable license and attribution requirements remain in effect.

## A. Main recommendations

| Creator / maintainer | Original repository | Selected skills / surfaces | Recommendation rationale | Evidence of our relationship |
|---|---|---|---|---|
| **Matt Pocock** | [mattpocock/skills](https://github.com/mattpocock/skills) | `grilling` / `grill-me`, `grill-with-docs`, `domain-modeling`, `teach`; additionally `to-tickets`, `diagnosing-bugs`, `code-review`, and `tdd` as engineering references | Clarify decisions before building, preserve terminology and decisions, teach through practice, and break large work into testable increments. | **Documented selective adaptation and study.** Public Signalproof provenance explicitly records interviewing and teaching adaptations; earlier intake records cover engineering methods. No wholesale upstream-runtime adoption is implied. |
| **Nate Herk** | [nateherkai/scroll-craft](https://github.com/nateherkai/scroll-craft) | `scroll-craft`: experience brief, distinct page structure, motion planning, mobile/reduced-motion treatment, and visual verification | Useful for distinctive, immersive web experiences with explicit creative intent and inspection of changing visual states. | **Documented source/concept study.** Recorded ScrollCraft 0.3.0 intake examined revision `0b816225945e45380397d6a0487efa3c98916858`. It supported independent design work; it did not activate the upstream runtime. This listing recommends the reviewed creative methods; it does not imply installation. |
| **Addy Osmani** | [addyosmani/agent-skills](https://github.com/addyosmani/agent-skills) | `planning-and-task-breakdown`, `debugging-and-error-recovery`, `code-review-and-quality`, `context-engineering`; related `spec-driven-development` | Useful for persistent plans, bounded implementation, evidence-led troubleshooting, and review across several quality dimensions. | **Inspected engineering reference.** Prior research/intake records identify the collection; selected current definitions were rechecked for this listing. A specific incorporated upstream implementation is not established. |
| **Nous Research and Hermes skill contributors** | [NousResearch/hermes-agent](https://github.com/NousResearch/hermes-agent) | `document-to-action-items`, `meeting-action-items`, `weekly-review-planning`, `social-media-content-calendar`, `grounded-citations`; historical `ocr-and-documents` | Convert documents, meetings, and research into traceable outputs and actionable work, without inventing owners, deadlines, evidence, or completion. | **Direct source of six published Signalproof adaptations.** Individual source authors must be credited as below. Historical document extraction is not advertised as a currently existing upstream filename. |
| **HeyGen / HyperFrames contributors** | [heygen-com/hyperframes](https://github.com/heygen-com/hyperframes) | `hyperframes`, `hyperframes-core`, `hyperframes-animation`, `hyperframes-audio`; workflow examples such as `talking-head-recut` | Useful for agent-authored HTML video, seekable animation, media synchronization, previews, and rendering workflows. | **Media workflow/tool reference.** The inventory contains the HyperFrames skill credited to `heygen-com`; media production records describe HyperFrames-based processes. This is not a claim that all current upstream skills were used or validated. |

## B. Selective specialist recommendations

| Creator / maintainer | Original repository | Selected skills | Recommendation rationale | Evidence of our relationship |
|---|---|---|---|---|
| **NVIDIA — SkillSpector** | [NVIDIA/SkillSpector](https://github.com/NVIDIA/SkillSpector) | `skill-inspector` and the SkillSpector scanner | Useful for inspecting agent skills before installation, combining static findings with source-aware review of intent, permissions, and hidden behavior. A scan score alone is not safety certification. | **Previously source-reviewed inspection/integration candidate.** Signalproof research records identify SkillSpector review and bounded adaptation work. The current `skill-inspector` definition was rechecked for this listing; general runtime approval is not asserted. |
| **Jesse Vincent and Prime Radiant / Superpowers contributors** | [obra/superpowers](https://github.com/obra/superpowers) | `systematic-debugging`, `test-driven-development`; planning/review methods as needed | Useful for disciplined debugging and behavior-driven regression protection. Choose the applicable methods rather than imposing the entire framework on every task. | **Source lineage encountered through the audited inventory.** Several Hermes skills expressly declare adaptation from `obra/superpowers`. Original current definitions were inspected for this listing; direct Signalproof incorporation of the upstream framework is not claimed. |
| **Anthropic** | [anthropics/skills](https://github.com/anthropics/skills) | `frontend-design`, `webapp-testing`, `mcp-builder`; document skills as reference material | Useful examples of UI direction, local browser testing, and tool-server construction. | **Reference-level review.** Earlier research identified this collection; selected current instructions were inspected here. Anthropic distinguishes its open-source examples from source-available document skills; do not label the whole collection uniformly open source. |
| **Orchestra Research** | [Orchestra-Research/AI-Research-SKILLs](https://github.com/Orchestra-Research/AI-Research-SKILLs) | `evaluating-llms-harness`, `llama-cpp`, `whisper`; research-writing resources selectively | Useful research and engineering references for model comparison, local inference, and speech transcription. | **Present in the audited Hermes-derived inventory.** Source metadata credits Orchestra Research. Current original definitions were inspected; benchmark results, deployment success, or whole-library adoption are not claimed. |
| **Baoyu / JimLiu** | [JimLiu/baoyu-skills](https://github.com/JimLiu/baoyu-skills) | `baoyu-infographic`, `baoyu-article-illustrator`, `baoyu-comic` | Useful for planning visual explanations and educational graphics from a defined content structure. | **Present in the audited creative inventory.** Individual source metadata credits Baoyu/JimLiu. Original current definitions were rechecked; no actual generation or production use is asserted by this recommendation. |

## Related infrastructure sources

| Creator / maintainer | Original repository | Recommended use | Evidence of our relationship |
|---|---|---|---|
| **NVIDIA NeMo — Switchyard** | [NVIDIA-NeMo/Switchyard](https://github.com/NVIDIA-NeMo/Switchyard) | Model routing that balances task success, cost, and latency across a pool of models. Evaluate whole-workload performance before selecting a routing policy. Switchyard is infrastructure software, rather than an agent skill pack. | **Recorded local pilot/integration work.** Historical evidence establishes non-production exploration; it does not establish current production deployment or installation state. |

## C. Platform-specific recommendations

These official platform skills are recommended when the corresponding platform fits the project. They should not be described as methods already incorporated into Signalproof. Prior source material named these collections; current repositories and selected definitions were verified for this listing.

| Maintainer | Original repository | Selected starting point | Appropriate recommendation wording |
|---|---|---|---|
| **Expo team** | [expo/skills](https://github.com/expo/skills) | `expo-overview`, `expo-project-structure`, `expo-router`, `expo-upgrade` | Consider when building or upgrading an Expo/React Native application. Listed instructions are distinct from paid hosted services or store-account costs. |
| **Supabase team** | [supabase/agent-skills](https://github.com/supabase/agent-skills) | `supabase-postgres-best-practices`; `supabase` when that platform is actually used | Consider for PostgreSQL design, performance, and Supabase-specific development. A skill does not replace real access-control testing. |
| **Stripe team** | [stripe/ai](https://github.com/stripe/ai) | `stripe-best-practices` | Consider when Stripe is the selected payment provider. Start with the relevant skill; the whole plugin/provider stack is not implied. |

## Individual contributors that need explicit credit

The Hermes repository is a collection, not proof that every skill was written solely by Nous Research.

| Source contributor field | Skills with verified attribution | Published Signalproof adaptation relationship |
|---|---|---|
| **Ben Barclay (`benbarclay`) and Hermes Agent** | `document-to-action-items`, `meeting-action-items`, `weekly-review-planning`, `social-media-content-calendar` | Sources of `signalproof-document-actions`, `signalproof-meeting-actions`, `signalproof-weekly-review`, and `signalproof-content-calendar`. |
| **Hermes Agent + Teknium** | `grounded-citations` | Source of `signalproof-source-grounding`. |
| **Hermes Agent** | Historical `ocr-and-documents` | Source of `signalproof-document-extraction`. The current upstream path returned 404; preserve historical credit without inventing a replacement URL. |

All contributor credit above comes from inspected skill metadata. It does not imply that the named people endorse Signalproof.

## Direct links to the selected original skills

### Matt Pocock

- [Grilling](https://github.com/mattpocock/skills/blob/main/skills/productivity/grilling/SKILL.md)
- [Grill Me](https://github.com/mattpocock/skills/blob/main/skills/productivity/grill-me/SKILL.md) — currently a small entry point to `grilling`.
- [Grill with Docs](https://github.com/mattpocock/skills/blob/main/skills/engineering/grill-with-docs/SKILL.md) — currently composes `grilling` and `domain-modeling`.
- [Domain Modeling](https://github.com/mattpocock/skills/blob/main/skills/engineering/domain-modeling/SKILL.md)
- [Teach](https://github.com/mattpocock/skills/blob/main/skills/productivity/teach/SKILL.md)
- [To Tickets](https://github.com/mattpocock/skills/blob/main/skills/engineering/to-tickets/SKILL.md)

### Nate Herk

- [ScrollCraft](https://github.com/nateherkai/scroll-craft/blob/main/plugins/nateherk-design/skills/scroll-craft/SKILL.md)

### Addy Osmani

- [Planning and Task Breakdown](https://github.com/addyosmani/agent-skills/blob/main/skills/planning-and-task-breakdown/SKILL.md)
- [Debugging and Error Recovery](https://github.com/addyosmani/agent-skills/blob/main/skills/debugging-and-error-recovery/SKILL.md)
- [Code Review and Quality](https://github.com/addyosmani/agent-skills/blob/main/skills/code-review-and-quality/SKILL.md)
- [Context Engineering](https://github.com/addyosmani/agent-skills/blob/main/skills/context-engineering/SKILL.md)

### Nous Research / Hermes contributors

- [Document to Action Items](https://github.com/NousResearch/hermes-agent/blob/main/skills/productivity/document-to-action-items/SKILL.md)
- [Meeting Action Items](https://github.com/NousResearch/hermes-agent/blob/main/skills/productivity/meeting-action-items/SKILL.md)
- [Weekly Review and Planning](https://github.com/NousResearch/hermes-agent/blob/main/skills/productivity/weekly-review-planning/SKILL.md)
- [Social Media Content Calendar](https://github.com/NousResearch/hermes-agent/blob/main/optional-skills/creative/social-media-content-calendar/SKILL.md)
- [Grounded Citations](https://github.com/NousResearch/hermes-agent/blob/main/skills/research/grounded-citations/SKILL.md)

### HyperFrames

- [HyperFrames skill entry point](https://github.com/heygen-com/hyperframes/blob/main/skills/hyperframes/SKILL.md)
- [HyperFrames skill directory](https://github.com/heygen-com/hyperframes/tree/main/skills)

### Superpowers

- [Systematic Debugging](https://github.com/obra/superpowers/blob/main/skills/systematic-debugging/SKILL.md)
- [Test-Driven Development](https://github.com/obra/superpowers/blob/main/skills/test-driven-development/SKILL.md)

### Anthropic

- [Frontend Design](https://github.com/anthropics/skills/blob/main/skills/frontend-design/SKILL.md)
- [Web Application Testing](https://github.com/anthropics/skills/blob/main/skills/webapp-testing/SKILL.md)
- [MCP Builder](https://github.com/anthropics/skills/blob/main/skills/mcp-builder/SKILL.md)

### Orchestra Research

- [LLM Evaluation Harness](https://github.com/Orchestra-Research/AI-Research-SKILLs/blob/main/11-evaluation/lm-evaluation-harness/SKILL.md)
- [llama.cpp](https://github.com/Orchestra-Research/AI-Research-SKILLs/blob/main/12-inference-serving/llama-cpp/SKILL.md)
- [Whisper](https://github.com/Orchestra-Research/AI-Research-SKILLs/blob/main/18-multimodal/whisper/SKILL.md)

### Baoyu

- [Infographic](https://github.com/JimLiu/baoyu-skills/blob/main/skills/baoyu-infographic/SKILL.md)
- [Article Illustrator](https://github.com/JimLiu/baoyu-skills/blob/main/skills/baoyu-article-illustrator/SKILL.md)
- [Comic](https://github.com/JimLiu/baoyu-skills/blob/main/skills/baoyu-comic/SKILL.md)

### NVIDIA

- [Skill Inspector](https://github.com/NVIDIA/SkillSpector/blob/main/skills/skill-inspector/SKILL.md)
- [SkillSpector repository and scanner documentation](https://github.com/NVIDIA/SkillSpector)
- [NeMo Switchyard repository and routing documentation](https://github.com/NVIDIA-NeMo/Switchyard)

### Platform-specific skills

- [Expo Upgrade](https://github.com/expo/skills/blob/main/plugins/expo/skills/expo-upgrade/SKILL.md)
- [Supabase PostgreSQL Best Practices](https://github.com/supabase/agent-skills/blob/main/skills/supabase-postgres-best-practices/SKILL.md)
- [Stripe Best Practices](https://github.com/stripe/ai/blob/main/skills/stripe-best-practices/SKILL.md)

## Evidence basis and limits

This listing draws on the 400-version / 319-name-group inventory, the published 48-skill pack's source notices, current public Signalproof learning/dialogue provenance, the recorded ScrollCraft intake, selected prior source-discussion records, and current upstream repository/skill inspection.

Confirmed source adaptation is narrower than inspection. Inspection is narrower than installation or successful execution. Six Hermes-derived procedures and the Matt Pocock teaching lineage are explicitly present in the published pack; other rows carry their distinct relationship labels.

The provenance record for Matt Pocock's interviewing and learning adaptation remains available publicly: [Signalproof learning/dialogue provenance](https://github.com/docreo/Signalproof-Skills/blob/main/provenance/matt-pocock-learning-dialogue-rd1.md).

Public source notices for the existing pack: [Signalproof third-party notices](https://github.com/docreo/Signalproof-Skills/blob/main/packs/public-v1-rd1/THIRD-PARTY-NOTICES.md).

No private server details, personal contacts, internal source text, proprietary creative recipes, unreleased architecture, or client information belong on the public page. Historical review evidence does not certify future upstream revisions. Repository and path links were checked on 2026-10-13; external projects may reorganize them later.

## Attribution and reuse

Keep the original creator, repository, skill or tool name, purpose, and relationship label together when reusing these recommendations. Upstream credit is separate from Signalproof ownership. The named contributors and projects are not claimed to endorse Signalproof.
