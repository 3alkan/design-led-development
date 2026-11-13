# Adoption and Context — Design

**Status:** Proposed for reconciliation

## Responsibility and boundary

Provide an accessible entry point, editable context discovery, and optional guidance for adopting DLD. The [contract](../dld/CONTRACT.md) and [methodology](../dld/DLD.md) already govern adopter authority, design, rules, and upgrades; this scope does not redefine those obligations.

## Intended design and requirements

| ID | Intended requirement |
| --- | --- |
| A-01 | Adopters have a clear, minimal entry point to the normative DLD sources and initial project setup. |
| A-02 | Adopters can discover their own governing context through an editable, project-neutral registry. |
| A-04 | Development-only context and instructions are not presented as adopter obligations. |
| A-05 | Provide an adaptable example for project-owned rules. |
| A-06 | Optional repository guidance supports varied technologies and project structures without mandating one layout. |
| A-08 | Optional design examples convey sufficient abstract information without prescribing headings or templates. |

## Decisions and rationale

- **Separate context registries.** Development and adopting projects have different authorities and relevant sources. Their registries remain distinct discovery mechanisms, not copies of README navigation.
- **Editable discovery, separate from normative sources.** The adopter registry is project-maintained; the normative DLD files remain identifiable as distributed sources.
- **Optional aids.** Examples and structural suggestions remain nonbinding to avoid turning convenience into methodology requirements.

## Realization and acceptance

The [adopter introduction](README.md) and [adopter registry source](CONTEXT-REGISTRY.md) provide the entry point and context discovery. [Supporting materials](../dld/supporting/) provide optional rules, repository guidance, and a design example. The [distribution design](../scripts/assembly.md) owns their placement and selection, rather than this scope prescribing packaging paths.

Verify that the delivered introduction and registry are usable, links resolve, and no development-only instructions leak into adopter material. Validate that a representative project can locate its governing context through the registry and use optional materials without mistaking them for normative DLD obligations.
