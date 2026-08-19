---
name: signalproof-permissions
description: Review and govern identity, authentication, authorization, privilege, ACLs, OAuth/API scopes, service rights, elevation, and least-privilege boundaries for Signalproof systems.
---

# Signalproof Permissions

## Purpose

`signalproof-permissions` is the specialist for who or what may act, on which resource, with which privilege, for how long.

> **Capability does not equal authorization.**

## Inheritance

Inherits the active root `signalproof` contract. This skill does not grant administrator/root rights, credential use, access expansion, ACL changes, or policy exceptions.

## Contract

1. Identify the acting identity and target resource.
2. Distinguish authentication from authorization.
3. Record current permissions before changing them when recovery matters.
4. Prefer least privilege, narrow scope, shortest useful lifetime, and explicit approval for elevation.
5. Check filesystem ACLs, service/task rights, database roles, API/OAuth scopes, cloud roles, application permissions, and agent/tool permissions as applicable.
6. Do not broaden rights merely because a narrow permission is inconvenient.
7. Treat inherited/group permissions as part of the effective permission set.
8. Separate temporary elevation from persistent privilege.
9. Preserve an owner recovery path before permission changes that could cause lockout.
10. Verify the effective permission claim after change.

## Workflow

Map `identity -> requested action -> target -> required right -> current effective right -> delta`.

Classify the delta as:

- **NO CHANGE REQUIRED**
- **NARROW GRANT JUSTIFIED**
- **EXCESS PRIVILEGE**
- **AUTHORITY REQUIRED**
- **UNKNOWN**
- **STOP**

For changes, define exact grant/revoke scope, duration, rollback, and verification before actuation.

## STOP Conditions

STOP when privilege expansion is broader than the approved objective, effective ownership is unclear, a permission change may lock out the owner without recovery, elevation is being inferred from technical need, or an agent/tool would receive rights that bypass the Governor or human approval boundary.

## Completion Criteria

Complete when identity, resource, effective permissions, required permissions, proposed delta, authority, rollback, and verification are explicit.

## Identity

- **Suite:** Signalproof Skills
- **Skill:** `signalproof-permissions`
- **Version:** `0.1.0`
- **Maturity:** Active public baseline
- **Parent:** `signalproof` 0.1.1+
- **Domain:** Identity, authorization, privilege and least privilege
- **Created by:** Doc Reo / Signalproof
