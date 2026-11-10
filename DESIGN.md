# DLD Development — Project Design

**Status:** Proposed for reconciliation

## Purpose

Develop, verify, and distribute Design-Led Development (DLD) as a coherent, versioned human–AI software engineering methodology. The development project adopts its own [contract](dld/CONTRACT.md) and [methodology](dld/DLD.md). This document governs the development project, not an adopting project's design.

## Product architecture

| Component | Responsibility | Authority |
| --- | --- | --- |
| [Contract](dld/CONTRACT.md) | General human–AI collaboration boundaries | Normative |
| [Methodology](dld/DLD.md) | Design-led software engineering obligations under the contract | Normative |
| [Context registry](product-files/CONTEXT-REGISTRY.md) | Editable discovery of adopting-project sources | Non-normative |
| [Supporting materials](dld/supporting) | Optional examples and templates | Non-normative |

Normative sources are maintained once and distributed unchanged. Adopters own their project-specific designs, rules, decisions, and implementations.

## Scope architecture

These are logical responsibility boundaries. Scope designs are located near their realizations where practical; project-level choices govern cross-scope interactions.

| Scope | Abstract design | Principal realizations |
| --- | --- | --- |
| Collaboration contract | [Contract design](dld/CONTRACT.design.md) | `dld/CONTRACT.md` |
| DLD methodology | [Methodology design](dld/DLD.design.md) | `dld/DLD.md` |
| Adoption and context | [Adoption design](product-files/DESIGN.md) | Registries, product README, supporting materials |
| Distribution | [Distribution design](scripts/PACKAGE.design.md) | `product.toml`, `scripts/package.ps1` |
| Verification and validation | [Assurance design](scripts/TEST.design.md) | `scripts/test.ps1`, `scripts/check-text-format.ps1` |
| Release and governance | [Release design](RELEASE.design.md) | Version, licenses, changelog, development README and configuration |

The [traceability register](TRACEABILITY.md) assigns an owner to every maintained artifact.

## Governing requirements

1. Keep general collaboration requirements in the contract; place software-engineering-specific obligations in the methodology without contradicting the contract.
2. Make approved abstract design the engineering authority for each scope; distinguish it from existing implementation and from unapproved proposals.
3. Preserve a single maintained source for each normative component and distribute its contents unchanged.
4. Keep adopter-editable context independent of normative DLD and development-only governance.
5. Select the distribution explicitly through [product.toml](product.toml); preserve reproducibility, link integrity, and auditable file membership.
6. Separate verification, validation, human design approval, code integration, and publication.
7. Keep scope ownership and material dependencies discoverable while avoiding redundant design authorities.

## Scope dependencies

- The contract constrains the methodology and all development work.
- The methodology governs how the development project changes its design and realizations.
- Adoption depends on contract and methodology content but cannot modify normative obligations.
- Distribution consumes canonical product files and adopter-specific sources.
- Assurance evaluates source constraints, product correctness, and adoption suitability.
- Release governance establishes identity and policy for the verified distribution.

## Acceptance criteria

The project design is reconciled when every maintained implementation and supporting artifact has an identifiable owner, intended requirements, and an acceptance path; cross-scope rules do not conflict; and product assembly matches the manifest with a reproducible, verifiable result.

Approval of this design and each consequential scope choice must be recorded explicitly. The existing code and its history are evidence for reconciliation, not proof of prior design approval.
