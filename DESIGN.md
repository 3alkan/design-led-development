# DLD Development — Project Design

**Status:** Draft

## Purpose

Develop and distribute Design-Led Development (DLD) as a coherent, versioned methodology for software engineering with human–AI collaboration. This document governs the design of the DLD development project, not the projects adopting DLD.

## Product architecture

The product separates four responsibilities:

| Component | Responsibility |
| --- | --- |
| [Contract](dld/CONTRACT.md) | General human–AI collaboration boundaries; normative |
| [Methodology](dld/DLD.md) | Design-led software engineering practices under the contract; normative |
| Context registry | Editable discovery of project-specific design, rules, decisions, and evidence; non-normative |
| [Supporting materials](dld/supporting/) | Optional examples and templates; non-normative |

Adopters retain their own design, implementation, decisions, and rules. The contract and methodology are adopted unchanged until a deliberate upgrade; the registry and supporting materials may be customized.

## Development and distribution

The repository maintains one canonical source for each normative component. Development-specific design, rules, and other internal materials are separate from the adopter distribution.

The [product manifest](product.toml) defines which maintained source files appear in the distribution and their destinations. In particular, development uses [its own context registry](dld/CONTEXT-REGISTRY.md), while the product receives a separate [project-neutral registry](product-files/CONTEXT-REGISTRY.md). Both refer to the same normative components without duplicating their authority.

## Design invariants

1. The contract is the general collaboration authority; the methodology adds compatible software engineering requirements without redefining it.
2. Each normative component has one canonical maintained source. Distributed copies preserve that source unchanged.
3. Adopter-editable material does not create or alter normative DLD obligations.
4. Development-specific context and constraints do not enter the adopter distribution.
5. Distribution contents and destinations are explicitly selected by the manifest, never inferred from directory contents.
6. The development project and adopting projects retain separate designs, decisions, and release identities.

## Acceptance criteria

An assembled distribution is consistent with this design when:

- It contains exactly the manifest-selected files at their declared destinations.
- Its contract and methodology match their canonical sources.
- Its initial registry is project-neutral, editable, and points to the distributed normative files.
- Its internal references resolve within the distribution.
- Its version and license files accompany the selected content.
- Its archive is reproducible from the same inputs, with a verifiable checksum.

Release approval is governed separately from product assembly.
