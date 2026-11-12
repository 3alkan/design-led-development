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
| Verification and validation | [Assurance design](scripts/quality.md) | `scripts/test-scripts.ps1`, `scripts/validate-text-format.ps1` |
| Release and governance | [Release design](release-policy.md) | Version, licenses, changelog, development README and configuration |

## Project requirements

1. Maintain one canonical contract and methodology source; distribute each unchanged.
2. Separate development-only context from adopter-facing material.
3. Assemble and verify only the files selected in [product.toml](product.toml).
4. Keep scope ownership, dependencies, verification, and release authority discoverable.
5. Give maintained facts, rules, and configuration a single authoritative owner wherever practical. Other scopes reference or consume that owner rather than independently declaring the same decision; context registries retain their distinct discovery responsibility.

## Decisions and rationale

- **Separate development and adopter sources.** The development repository includes design and verification work that adopters do not need. The [adoption design](product-files/adoption.md) governs the distinct adopter-facing introduction and context registry; the [distribution design](scripts/assembly.md) governs which sources are delivered.
- **Assign decisions to responsibility scopes.** Keep project-wide boundaries here and detailed choices in the linked scope designs. This limits competing authority and allows individual parts of DLD to evolve without repeatedly editing the root design.
- **Use an explicit product manifest.** Let [product.toml](product.toml) define distribution membership so packaging does not infer product content from the repository layout. The assembly design governs how that selection is implemented.

## Scope dependencies

- The contract constrains the methodology and all development work.
- The methodology governs how the development project changes its design and realizations.
- Adoption depends on contract and methodology content but cannot modify normative obligations.
- Distribution consumes canonical product files and adopter-specific sources.
- Assurance evaluates source constraints, product correctness, and adoption suitability.
- Release governance establishes identity and policy for the verified distribution.

## Realization and acceptance

This design governs the development repository as a whole; the scope table identifies its principal realizations. Evaluate the project-level requirements by checking that:

- Each maintained artifact can be traced to an owning scope and its design, using the [scope architecture](#scope-architecture) and [context registry](dld/CONTEXT-REGISTRY.md) for discovery.
- Development-only files remain outside the product, and product contents follow [product.toml](product.toml), as checked under the [distribution design](scripts/assembly.md).
- The [assurance design](scripts/quality.md) supplies technical checks and distinguishes them from human review and representative adoption.
- [Release governance](release-policy.md) preserves the independent decisions to approve designs, integrate changes, and publish a release.

Acceptance of the complete project depends on the relevant subordinate criteria and evidence; a successful package alone does not prove methodology usefulness. The scope designs remain proposed for reconciliation until the necessary human approvals are established.
