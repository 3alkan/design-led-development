# Design-Led Development

A way to work with AI to realize a project from beginning to end, prioritizing design as the source of truth throughout the process.

The approach brings together project management, human–AI roles and permissions, and project realization. The intended outcome is a working product with the design knowledge needed to maintain and evolve it.

## Start a project

1. Read the [workflow](starter/root/WORKFLOW.md), then follow the [practical guide](guide/README.md) to apply it from project setup through delivery and evolution.
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

The project root is `project-name/`; its `root/` directory holds project-wide documents. Folder hierarchy normally expresses design hierarchy. A responsibility spanning branches can use a focused shared design when it does not fit the common ancestor's scope; narrower designs remain in their branches. See [design placement](guide/03-develop-detailed-designs.md) for examples.

## Repository structure

- [starter/](starter/) contains the four documents users copy into their projects.
- [guide/](guide/README.md) explains how to use the method throughout a project's life, with prompts, examples, and readiness checks.
- [examples/](examples/README.md) describes the intended worked examples; no complete example project is included in this release.
- [root/](root/ROOT.md) contains the design, workflow, and rules governing development of this method itself.
- [CHANGELOG.md](CHANGELOG.md) records method changes and adoption guidance.
- [VERSION](VERSION) identifies the method baseline.
- [LICENSE](LICENSE) contains this repository's license.

## Development and versioning

Before changing this repository, read its [root design](root/ROOT.md), [workflow](root/WORKFLOW.md), and [rules](root/RULES.md).

The latest released method version is `0.1.2`, identified by Git tag `v0.1.2`. This release clarifies folder design hierarchy and its cross-branch exception, improves template rendering, and distinguishes release baselines from later adaptations. Changes listed under Unreleased in the changelog are not part of that tag. The `VERSION` file currently names intended release `0.1.3`, which is **not published** until its release checklist is completed and `v0.1.3` is tagged.

The method has not yet been validated through a complete real project. Feedback from that use will inform later releases.

Use a tagged version when adopting the method so you can identify the source baseline. Read the [changelog](CHANGELOG.md) before adopting later versions and preserve your project's own rules and design decisions.

The method is this repository's product, so it has one release version. Its design documents have independent revisions. Products built using the starter maintain their own versions and release histories.

See the [repository workflow](root/WORKFLOW.md) for change and release practices.
