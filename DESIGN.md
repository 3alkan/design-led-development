<!-- SPDX-License-Identifier: MIT -->
# DLD Development — Project Design

**Status:** Proposed for reconciliation

## Purpose

Develop, verify, and distribute Design-Led Development (DLD) as a coherent, versioned human–AI software engineering methodology. The development project adopts its own [contract](dld/CONTRACT.md) and [methodology](dld/DLD.md). This document governs the development project, not an adopting project's design.

## Scope architecture

Scope boundaries follow engineering responsibility. The linked scope designs own their local requirements and decisions.

| Scope | Abstract design | Principal realizations |
| --- | --- | --- |
| Collaboration contract | [Contract design](dld/collaboration.md) | `dld/CONTRACT.md` |
| DLD methodology | [Methodology design](dld/methodology.md) | `dld/DLD.md` |
| Adoption and context | [Adoption design](product-files/adoption.md) | Registries, product README, supporting materials |
| Distribution | [Distribution design](scripts/assembly.md) | `product.toml`, `scripts/package.ps1` |
| Verification and validation | [Assurance design](scripts/quality.md) | `scripts/test.ps1`, `scripts/check-text-format.ps1` |
| Release and governance | [Release design](release-policy.md) | Version, licenses, changelog, development README and configuration |

## Project requirements

1. Maintain one canonical contract and methodology source; distribute each unchanged.
2. Separate development-only context from adopter-facing material.
3. Assemble and verify only the files selected in [product.toml](product.toml).
4. Keep scope ownership, dependencies, verification, and release authority discoverable.

## Scope dependencies

- The contract constrains the methodology and all development work.
- The methodology governs how the development project changes its design and realizations.
- Adoption depends on contract and methodology content but cannot modify normative obligations.
- Distribution consumes canonical product files and adopter-specific sources.
- Assurance evaluates source constraints, product correctness, and adoption suitability.
- Release governance establishes identity and policy for the verified distribution.

## Acceptance criteria

Every maintained artifact has a governing scope and acceptance path, cross-scope requirements are consistent, and the manifest produces a reproducible, verified product. Scope designs remain proposed until human approval.
