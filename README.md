# Design-Led Development

A way to work with AI to realize a project from beginning to end, prioritizing design as the source of truth throughout the process.

The approach brings together project management, human–AI roles and permissions, and project realization. The intended outcome is a working product with the design knowledge needed to maintain and evolve it.

## Start a project

1. Read the [workflow](starter/root/WORKFLOW.md).
2. Copy the **contents** of [starter/](starter/) into your product repository. For an existing project, reconcile these documents with existing files before copying.
3. Adapt the product README and develop the project's top-level design in `root/ROOT.md` with AI.
4. Add adopted project-specific requirements to `root/RULES.md`. Group them by topic, keep identifiers stable, and include exceptions and reasons where helpful. Remove template placeholders.
5. Approve the relevant design, then implement and verify it in manageable increments. Repeat as the project evolves.

The starting product structure is:

```text
project-name/
├── README.md
└── root/
    ├── WORKFLOW.md
    ├── RULES.md
    └── ROOT.md
```

| Document | Responsibility |
| --- | --- |
| `README.md` | Introduces the product and explains how to use it. |
| `root/WORKFLOW.md` | Defines how the human and AI work together. |
| `root/RULES.md` | Records specific project requirements; every adopted rule applies. |
| `root/ROOT.md` | Defines the product's overall design, revision, and approval state. |

The starter contains templates, not an approved product design or pre-adopted project rules. Adapt them through discussion with the human.

## Repository structure

- [starter/](starter/) contains the four documents users copy into their projects.
- [root/](root/ROOT.md) contains the design, workflow, and rules governing development of this method itself.
- [CHANGELOG.md](CHANGELOG.md) records method changes and adoption guidance.
- [VERSION](VERSION) identifies the method baseline.
- [LICENSE](LICENSE) contains this repository's license.

## Development and versioning

Before changing this repository, read its [root design](root/ROOT.md), [workflow](root/WORKFLOW.md), and [rules](root/RULES.md).

The current method version is `0.1.0-dev`, an unreleased development baseline. The method is this repository's product, so it has one release version. Its design documents have independent revisions. Products built using the starter maintain their own versions and release histories.

See the [repository workflow](root/WORKFLOW.md) for change and release practices.
