# Design-Led Development (DLD)

DLD is a design-centered, human-authoritative, AI-assisted methodology for software engineering across the full lifecycle. This distribution includes adoption instructions and a complete, versioned DLD dependency.

## Adopt DLD

1. Copy the complete [dld/](dld/) directory into your project's root (or reconcile an existing installation). Keep the installed dependency unchanged during ordinary project work.
2. Read the [collaboration contract](dld/CONTRACT.md) and [methodology](dld/DLD.md). They govern human–AI authority, design, implementation, evidence, and upgrades.
3. Keep project-owned designs, rules, and context outside the installed `dld/` directory. Make governing information discoverable using a means appropriate to the project.
4. Optionally copy the [Context Registry template](dld/supporting/CONTEXT-REGISTRY.md) to `CONTEXT-REGISTRY.md` in the project root and customize it there. The template assumes the DLD dependency is installed in `dld/` at the root; an equivalent discovery system is also valid.

Optional [supporting guidance](dld/supporting/) includes a [rules template](dld/supporting/RULES.md), [design-document example](dld/supporting/design-document.md), and [repository-layout reference](dld/supporting/repository-layout.md). Copy or adapt templates into project-owned locations as useful; they are not additional obligations.

## Version, history, and license

The dependency's authoritative [VERSION](dld/VERSION), [CHANGELOG](dld/CHANGELOG.md), and [LICENSE](dld/LICENSE) travel with `dld/`. Your own project's version and history remain independent. Review the [methodology's upgrade guidance](dld/DLD.md#7-adoption-and-evolution) before replacing an adopted version.
