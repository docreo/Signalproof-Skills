# Signalproof × NIST AI 600-1 Generative AI Profile

**Revision:** V1/RD1  
**Reference:** NIST AI 600-1, Artificial Intelligence Risk Management Framework: Generative Artificial Intelligence Profile  
**Publication status:** Final, July 2024

NIST AI 600-1 is a cross-sector companion to AI RMF 1.0 focused on risks that are unique to or amplified by generative AI.

Signalproof uses the GAI Profile as a **risk-reference layer** when the system under test or governance includes generative models.

## Signalproof areas that support GAI risk management

| Signalproof area | Relevance to generative-AI risk management |
|---|---|
| Identity / route verification | Makes the selected model/provider/route explicit and helps prevent hidden substitution |
| Human authority / approvals | Keeps consequential action bounded by explicit authority |
| Context / memory controls | Helps distinguish approved context from untrusted or stale context |
| Security / execution boundaries | Addresses prompt/code injection, tool misuse, secret exposure, and untrusted-input concerns |
| Data/network boundaries | Makes external transfer and connector exposure explicit |
| Evidence discipline | Prevents unsupported model output from being upgraded into fact or authority |
| Evaluate / Verify | Separates model output quality from proof of a system requirement |
| Recovery / rollback | Preserves containment and return paths after failures |
| Release / deployment gates | Prevents a benchmark or demo result from automatically authorizing deployment |
| Continuous learning / Known Errors | Preserves recurring failure intelligence without uncontrolled self-modification |

## Use rule

A repository or acceptance report should not claim “GAI Profile compliant” merely because it implements one or more controls.

Instead, use statements such as:

> This component implements controls that are mapped to selected NIST AI RMF / GAI Profile risk-management concepts. The mapping is informational and does not represent NIST certification or endorsement.

## Source

- NIST AI 600-1 publication page: https://www.nist.gov/publications/artificial-intelligence-risk-management-framework-generative-artificial-intelligence
- DOI: https://doi.org/10.6028/NIST.AI.600-1
