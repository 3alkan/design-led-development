# Adopting DLD

**Audience:** Humans and AI applying DLD to a software project. Read [DLD Core](../../foundation/CORE.md) for the authoritative method; this guide explains adoption rather than redefining it.

## Start a new project

1. Copy the **contents** of the distribution's `starter/` into the project root. The assembled starter includes `README.md` and `foundation/{CORE,DESIGN,RULES}.md`.
2. Edit the project README to describe the actual project. Keep its adopted DLD version.
3. Begin an AI session by explicitly asking AI to read `foundation/CORE.md`, `foundation/RULES.md`, `foundation/DESIGN.md`, applicable scoped designs, and the current repository state.
4. With AI, develop the project's first draft design. Human approval of consequential decisions precedes realization of that changed intent.
5. Replace the blank rules statement only if additional project-specific constraints are actually adopted.

A copied Core is **frozen for its adopted DLD version**. It must not be edited to customize the project. An AI instruction file is not required and Markdown auto-discovery must not be assumed.

## Adopt DLD in an existing project

Inspect current behavior, documentation, implementation, and constraints before copying anything. Reconcile conflicting files rather than overwriting project decisions. Existing code is useful evidence, not automatically approved intended design. Establish design authority and approval state explicitly, then proceed incrementally.

## Work and evolve

Use the [practical lifecycle guide](lifecycle/01-start-the-project.md) when helpful. Add scoped designs and other engineering artifacts only when they have a real responsibility. The [repository reference](../reference/repository-layout.md) provides options without prescribing a scaffold.

When adopting a newer DLD release, review its [changelog](../../CHANGELOG.md) and Core changes. Record the new baseline only after deliberate adoption and the necessary human decisions. Preserve project-specific DESIGN, RULES, approved history, and unreconciled proposals.
