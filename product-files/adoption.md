# Adoption and Context — Design

**Status:** Proposed for reconciliation

## Responsibility and boundary

Enable projects to adopt DLD incrementally while retaining ownership of their own intent, decisions, context, rules, realizations, and versions. This scope governs adopter-facing guidance and optional aids, not the normative [contract](../dld/CONTRACT.md) or [methodology](../dld/DLD.md).

## Intended design and requirements

| ID | Intended requirement |
| --- | --- |
| A-01 | Adopters have a clear, minimal entry point to the normative DLD sources and initial project setup. |
| A-02 | Adopters can discover their own governing context through an editable, project-neutral registry. |
| A-03 | Project information can reside wherever appropriate; references and registration do not imply approval. |
| A-04 | Development-only context and instructions are not presented as adopter obligations. |
| A-05 | Optional project-rule guidance can be adapted without automatically becoming binding. |
| A-06 | Optional repository guidance supports varied technologies and project structures without mandating one layout. |
| A-07 | Adopters distinguish their product versions from the DLD baseline and decide deliberately when to upgrade it. |
| A-08 | Optional design examples convey sufficient abstract information without prescribing headings or templates. |

## Decisions and rationale

- **Separate context registries.** Development and adopting projects have different authorities and relevant sources. Their registries remain distinct discovery mechanisms, not copies of README navigation.
- **Project-owned changes.** Adopters edit their own registry and adopt or adapt optional rules under their own authority; distributed normative sources remain unchanged during ordinary project work.
- **No preapproved project intent.** A starter cannot decide an adopting project's objectives or rules on its behalf.
- **Optional aids.** Examples and structural suggestions remain nonbinding to avoid turning convenience into methodology requirements.

## Realization and acceptance

The [adopter introduction](README.md) and [adopter registry source](CONTEXT-REGISTRY.md) provide the entry point and context discovery. [Supporting materials](../dld/supporting/) provide optional rules, repository guidance, and a design example. The [distribution design](../scripts/assembly.md) owns their placement and selection, rather than this scope prescribing packaging paths.

Verify that the delivered introduction and registry are usable, their links resolve, and no development-only obligations are presented to adopters. Validate with a representative project that it can adopt DLD, identify its own design and rules, and maintain its context without modifying the normative sources.
