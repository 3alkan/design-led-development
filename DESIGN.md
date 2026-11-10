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

The design follows a responsibility hierarchy. Root decisions govern the entire project; subordinate scopes own increasingly local intent. Each decision belongs to the narrowest coherent governing scope, and dependent scopes reference that owner. Cross-scope dependencies need not be ancestor relationships. Designs are maintained near realizations where practical, using meaningful filenames instead of a mandatory naming suffix.

| Scope | Abstract design | Principal realizations |
| --- | --- | --- |
| Collaboration contract | [Contract design](dld/collaboration.md) | `dld/CONTRACT.md` |
| DLD methodology | [Methodology design](dld/methodology.md) | `dld/DLD.md` |
| Adoption and context | [Adoption design](product-files/adoption.md) | Registries, product README, supporting materials |
| Distribution | [Distribution design](scripts/assembly.md) | `product.toml`, `scripts/package.ps1` |
| Verification and validation | [Assurance design](scripts/quality.md) | `scripts/test.ps1`, `scripts/check-text-format.ps1` |
| Release and governance | [Release design](release-policy.md) | Version, licenses, changelog, development README and configuration |

The [traceability register](TRACEABILITY.md) assigns an owner to every maintained artifact.

## Governing requirements

1. Keep general collaboration requirements in the contract; place software-engineering-specific obligations in the methodology without contradicting the contract.
2. Make approved abstract design the engineering authority for each scope; distinguish it from existing implementation and from unapproved proposals.
3. Preserve a single maintained source for each normative component and distribute its contents unchanged.
4. Keep adopter-editable context independent of normative DLD and development-only governance.
5. Select the distribution explicitly through [product.toml](product.toml); preserve reproducibility, link integrity, and auditable file membership.
6. Separate verification, validation, human design approval, code integration, and publication.
7. Keep scope ownership and material dependencies discoverable while avoiding redundant design authorities.
8. Every maintained realization is governed by an identifiable design scope. One scope may cover multiple artifacts; file-level detail is created only when justified by independent responsibility.
9. Make consequential design decisions and approvals before implementing changed product intent. During reconciliation, treat implemented behavior as evidence and proposed design as pending authority.

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
