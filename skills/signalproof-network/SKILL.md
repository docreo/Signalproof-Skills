---
name: signalproof-network
description: Review listening interfaces, outbound destinations, transport validation, telemetry, authentication, network permissions, retry/background behavior, and external data flows for Signalproof systems.
---

# Signalproof Network

## Purpose

`signalproof-network` is the defensive specialist for network exposure and data leaving or entering a trust boundary.

> **Every network path should have an explicit reason, expected data, destination, authentication model, and control.**

## Inheritance

Inherits the active root `signalproof` contract. It does not grant firewall changes, network exposure, credential use, endpoint trust, or deployment authority.

## Contract

1. Identify listening ports/interfaces and outbound destinations.
2. Record whether access is required, optional, or unexpected.
3. Identify authentication and authorization at the network boundary.
4. Verify transport encryption/certificate validation where applicable.
5. Identify project/user metadata, content, identifiers, paths, telemetry, or logs leaving the host.
6. Check retry, polling, background, update, and reconnect behavior.
7. Prefer loopback/local binding when remote exposure is unnecessary.
8. Distinguish outbound-only access from inbound exposure.
9. Treat unknown endpoints or silent telemetry as material findings when data sensitivity warrants.
10. Verify the exact network claim after remediation.

## Status

- **EXPECTED / CONTROLLED**
- **UNEXPECTED EXPOSURE**
- **DATA-FLOW REVIEW REQUIRED**
- **TRANSPORT / AUTH FINDING**
- **UNKNOWN**
- **STOP**

## STOP Conditions

STOP when sensitive data would leave the approved boundary without authority, inbound exposure would be added unnecessarily, TLS/certificate/authentication controls would be disabled for convenience, or an unknown destination must be trusted before proceeding.

## Completion Criteria

Complete when endpoints/interfaces, direction, data classes, authentication, transport, telemetry/background behavior, authority, findings, remediation, and verification are explicit.

## Identity

- **Suite:** Signalproof Skills
- **Skill:** `signalproof-network`
- **Version:** `0.1.0`
- **Maturity:** Active public baseline
- **Parent:** `signalproof` 0.1.1+
- **Domain:** Network exposure, transport and external data flow
- **Created by:** Doc Reo / Signalproof
