# Adoption and Context — Design

**Status:** Proposed for reconciliation

## Responsibility and boundary

Provide an accessible entry point, optional project-owned context discovery, and practical guidance for adopting a self-contained DLD dependency. The [contract](../dld/CONTRACT.md) and [methodology](../dld/DLD.md) already govern adopter authority, design, rules, and upgrades; this scope does not redefine those obligations.

## Intended design and requirements

| ID | Intended requirement |
| --- | --- |
| A-01 | Adopters have a clear, minimal entry point to the normative DLD sources and initial project setup. |
| A-02 | Provide an optional registry template that works at a project root beside an unchanged `dld/` installation; other discovery mechanisms remain acceptable. |
| A-04 | Installation and upgrade guidance clearly separates the distributable, unchanged DLD dependency from project-owned context and instructions. |
| A-05 | Provide an adaptable example for project-owned rules. |
| A-06 | Optional repository guidance supports varied technologies and project structures without mandating one layout. |
| A-08 | Optional design examples convey sufficient abstract information without prescribing headings or templates. |

## Decisions and rationale

- **Separate context ownership.** Development maintains its registry independently; the product carries only an optional template, and the adopting project maintains its own registry or equivalent mechanism outside `dld/`.
- **Replaceable installation.** The complete versioned `dld/` directory is adopted unchanged and may be replaced on deliberate upgrade without overwriting project-owned information.
- **Optional aids.** Examples and structural suggestions remain nonbinding to avoid turning convenience into methodology requirements.

## Realization and acceptance

The [adopter introduction](README.md) provides the entry point. The optional [registry template](../dld/supporting/CONTEXT-REGISTRY.md) and [supporting materials](../dld/supporting/) provide reusable context, rules, repository, and design guidance. The [distribution design](../scripts/assembly.md) owns their placement and selection, rather than this scope prescribing packaging paths.

Verify that the delivered introduction, self-contained `dld/` directory, and supporting templates are usable; references resolve within the product; and no development-only instructions become adopter obligations. Check representative adoption using a root registry created from the template, and check that replacing `dld/` leaves project-owned information untouched.
