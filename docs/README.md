# DLD Documentation

This is the documentation home for **Design-Led Development (DLD)**. [DLD Core](../foundation/CORE.md) is the authoritative specification for humans and AI; documents here explain its use, offer examples, or describe how DLD itself is maintained. Documentation does not independently define or change the methodology.

## Choose your path

| I want to… | Start here |
| --- | --- |
| Understand what DLD is and how it works | [DLD Core](../foundation/CORE.md) |
| Apply DLD to a new or existing project | [Adoption guide](guides/adoption.md) |
| Work through a complete development increment | [Practical lifecycle guide](guides/lifecycle/01-start-the-project.md) |
| Decide where engineering artifacts belong | [Repository layout reference](reference/repository-layout.md) |

## Practical lifecycle guide

The chapters form an example **repeatable learning path**, not mandatory waterfall stages. Start wherever the project needs work.

1. [Start a project](guides/lifecycle/01-start-the-project.md)
2. [Define its foundation design](guides/lifecycle/02-define-the-foundation-design.md)
3. [Develop scoped designs](guides/lifecycle/03-develop-detailed-designs.md)
4. [Realize an approved design](guides/lifecycle/04-realize-the-design.md)
5. [Verify, validate, and deliver](guides/lifecycle/05-verify-and-deliver.md)
6. [Evolve and maintain](guides/lifecycle/06-evolve-the-project.md)

## Documentation boundaries

- **Core** answers *what DLD requires*; it is shared, versioned, and authoritative.
- **Guides** answer *how to apply DLD to a task or audience*; their prompts are examples, not approvals or new rules.
- **Reference** helps choose suitable engineering structures; its directory catalogue is not a mandatory scaffold.
- **Internal documentation** describes how DLD's maintained source becomes distributable artifacts. It is for contributors, not adopters.

The **product distribution** contains Core, this documentation index, the adoption and practical guides, and the repository reference. The **development distribution** additionally includes contributor guidance and internal packaging documentation. Only the generated `starter/` contents are copied into a user's own project.
