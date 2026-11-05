# Design-Led Development — Product

Design-Led Development (DLD) is a design-centered, human-authoritative, AI-assisted software engineering methodology. This package provides a **self-contained project starter** and optional learning material.

The [versioned DLD Core](../../foundation/CORE.md) is the **only authoritative specification of the methodology**. The guides in this package help explain Core; no guide is needed for compliance.

## Start using DLD

Copy the **contents of [starter/](../../starter/README.md)** into the root of a new or existing project. Reconcile files if the project already has its own README or governance records.

```text
my-project/
  README.md
  foundation/
    CORE.md
    DESIGN.md
    RULES.md
```

The starter's Core is an unchanged copy of the adopted version. Its DESIGN is an unapproved initial template; RULES begins with no additional adopted project rules. Neither includes the DLD development project's own design or approvals.

Edit the README to explain your project. Work with AI to develop sufficient project-level intent and approve consequential choices explicitly before realizing them. For existing software, reconcile one relevant scope at a time; legacy behavior is evidence, not automatically approved intent.

The starter README includes an AI initialization prompt. It directs AI to the foundation and relevant scopes, then expands context progressively rather than loading the entire project. An AI-specific instruction file or external memory system is not required.

## Learn and explore

Use these resources if helpful:

- [Documentation overview](../README.md)
- [Adoption guide](../guides/adoption.md)
- [Practical learning path](../guides/lifecycle/01-start-the-project.md)
- [Repository organization reference](../reference/repository-layout.md)

These resources are **optional explanations**, not additional rules.

## Optional local documentation

To keep the reference material inside an adopting project, copy the **contents** of `optional/docs/dld/` into that project's `docs/dld/`. This overlay contains version-matched explanations, a documentation index, the changelog, and links adjusted for the installed location.

The overlay does not install or modify a second Core. It can be omitted entirely. A project may use the guides offline without changing its authoritative DESIGN, RULES, or method version.

## Package identity and maintenance

The product package includes the canonical Core, a copyable starter, optional guides and reference material, version information, changelog, and license. It excludes contributor-only governance and packaging internals.

When a new DLD version becomes available, adopting projects keep their current Core until deliberately upgrading. Consult the new Core and changelog, evaluate adoption implications, and preserve existing project-specific approvals and history.
