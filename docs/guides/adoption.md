# Adopt DLD in a Project

This guide provides **optional practical suggestions**. The authoritative method is [DLD Core](../../foundation/CORE.md). The project's own foundation and governing scoped designs determine its intended work.

## Begin with the minimal starter

A packaged DLD release provides a starter whose contents can be copied into a project:

```text
README.md
foundation/
  CORE.md
  DESIGN.md
  RULES.md
```

Use the package's **starter** rather than copying the DLD development repository's own foundation. The packaged Core is derived from the canonical Core; the DESIGN template is a draft and RULES begins with no additional adopted constraints.

If the project already has a README or foundation files, reconcile the contents rather than overwriting existing decisions and history. Identify the DLD version adopted by the project in its README.

## First conversation with AI

AI tools do not necessarily discover Markdown files. The starter README contains an initialization request that directs AI to the foundation, current scope, relevant dependencies, approval state, implementation evidence, and actual permissions. For example:

> Read the project foundation, then identify the relevant approved and draft design, constraints, dependencies, and current work state. Help me select the next useful scope. Present consequential design choices for my approval; do not assume that legacy behavior or your own suggestions are approved.

The goal is **sufficient scope-aware context**, not a full reconstruction of unrelated project history. As the work reveals dependencies, expand the context.

## Starting a new project

Begin with purpose, intended users or stakeholders, outcomes, and the responsibilities currently understood. Draft only enough project-level design to govern the next useful increment. AI can investigate alternatives and keep questions visible. The human decides consequential intent and explicitly approves the scope being accepted.

No need to select every library, define every module, or create a design file per source file in advance. Add scoped designs when distinct engineering responsibilities justify them.

## Adopting in an existing project

Treat current code, tests, documentation, and observed behavior as **evidence of the existing system**—not automatic approval of that behavior. Choose a useful work scope, inspect governing dependencies, reconstruct intended requirements, and ask the human to resolve consequential gaps.

Keep reconciled scopes distinct from unexplored ones. Existing systems can continue operating while DLD design authority is established incrementally where consequential work will occur. This avoids a mandatory whole-codebase reverse-engineering exercise.

## Optional local documentation

The starter alone contains all mandatory DLD methodological instructions.

For additional offline reference, copy the **contents** of the product package's `optional/docs/dld/` into your project's `docs/dld/`. Those guides are version-matched and their links are adjusted for that location. They remain optional and cannot supersede the local `foundation/CORE.md`.

When upgrading DLD, compare the new Core and [changelog](../../CHANGELOG.md), assess consequences, and obtain deliberate human authorization. Preserve your project's DESIGN, RULES, their approval history, and existing unreconciled work.

For a concrete example of progressing through an increment, see the [practical guide](lifecycle/01-start-the-project.md). For location decisions, see the [repository reference](../reference/repository-layout.md).
