# Signalproof Standards Mapping

**Revision:** V1/RD1  
**Status:** Candidate until governed merge to `main`  
**Scope:** Public standards crosswalk for the Signalproof framework and public Skill Library

Signalproof uses external standards and frameworks as **reference models and crosswalks**, not as substitutes for Signalproof authority, evidence, testing, or human approval.

## Current NIST references

1. **NIST AI Risk Management Framework (AI RMF 1.0 / NIST AI 100-1)**
   - Core functions: **GOVERN, MAP, MEASURE, MANAGE**
   - NIST currently notes that AI RMF 1.0 is being revised.
   - https://www.nist.gov/itl/ai-risk-management-framework

2. **NIST AI 600-1 — Artificial Intelligence Risk Management Framework: Generative Artificial Intelligence Profile**
   - Final publication, July 2024.
   - Cross-sector companion profile for generative AI.
   - https://doi.org/10.6028/NIST.AI.600-1

3. **NIST AI 200-2 Initial Public Draft — TEVV-Athlon Framework**
   - Announced August 7, 2026.
   - Applies to statistical ML, LLMs, multimodal models, agentic systems, and other AI technologies.
   - NIST identifies it as an **Initial Public Draft**; public comments are open through October 6, 2026.
   - https://www.nist.gov/artificial-intelligence/ai-research/tevv-athlon-framework-evaluating-ai-systems

## Signalproof position

Signalproof is **NIST-informed** and may map controls, evidence, acceptance gates, and operating practices to applicable NIST concepts.

Signalproof does **not** claim:

- NIST certification;
- NIST endorsement;
- universal NIST compliance;
- that a crosswalk alone proves implementation;
- that one successful test proves system trustworthiness or deployment readiness.

Where a repository makes a standards-alignment statement, that statement should identify the **specific implemented capability and evidence**, not merely name a framework.

## Canonical public documents

- [NIST AI RMF Mapping](NIST-AI-RMF-MAPPING.md)
- [NIST TEVV Mapping](NIST-TEVV-MAPPING.md)
- [NIST GAI Profile Mapping](NIST-GAI-PROFILE-MAPPING.md)
- [Signalproof AI Acceptance Protocol](SIGNALPROOF-AI-ACCEPTANCE-PROTOCOL.md)
- [Evidence Requirements](EVIDENCE-REQUIREMENTS.md)

## Public repository rule

Each public Signalproof repository should include or link to a repository-specific standards alignment statement that:

1. identifies which NIST concepts are relevant;
2. identifies which Signalproof controls are actually implemented there;
3. separates **IMPLEMENTED**, **PARTIAL**, **PLANNED**, **N/A**, and **UNVERIFIED** states;
4. links claims to public evidence where available;
5. avoids certification/endorsement language.

The crosswalk is an engineering and governance aid. It is not a legal opinion, certification, or substitute for sector-specific obligations.
