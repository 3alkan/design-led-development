# Design-Led Development (DLD)

**Design-Led Development (DLD)** is a design-centered, human-authoritative, AI-assisted software engineering methodology spanning the complete software project lifecycle. The project's approved abstract design expresses its intent, requirements, responsibilities, behavior, constraints, and decisions. Concrete artifacts realize or provide evidence about that design; they do not silently replace its authority.

Humans make and approve consequential design decisions. AI helps develop and assess designs and may independently realize and verify approved scope within delegated boundaries. DLD is technology- and AI-provider-independent and informed by established software engineering practices without claiming formal standards compliance.

## About this repository

**This is the development repository for DLD itself**, not the directory a user copies into a software project.

DLD is developed **using DLD**. This repository has its own project-wide design, workflow, and rules in `foundation/`, just as an adopting project does. The method applies across conception, requirements, architecture, implementation, verification, delivery, operation, maintenance, evolution, and retirement.

The repository maintains the method, its documentation, the copyable project starter, packaging definitions, and supporting engineering artifacts. One approved and stabilized source baseline is intended to produce two distributions under **one version and release tag**:

| Distribution | Audience | Contents |
| --- | --- | --- |
| **Development** | People and AI maintaining DLD | DLD's own project foundation, maintained sources, shared learning material, contributor guidance, and engineering tools. |
| **Product** | People and AI applying DLD to other projects | Shared learning material, adoption guidance, reference repository architecture, and a self-contained starter. |

Both distributions teach the same DLD methodology. Their audience-specific guides and project-specific operating instructions have distinct responsibilities.

## Start here

**To develop DLD:** Read the [shared fundamentals](guide/methodology.md) and [development guide](guide/development.md). This repository is governed by its [design](foundation/DESIGN.md), [workflow](foundation/WORKFLOW.md), and [rules](foundation/RULES.md).

**To use DLD in another project:** Begin with the [product introduction](product/README.md) and [adoption guide](guide/adoption.md). Copy only the contents of [starter/](starter/) into the target project, reconciling any existing files. The starter's `foundation/` then belongs to that project, not to this DLD repository.

**To understand repository organization:** Read the [reference repository layout](guide/reference-repository-layout.md). It is a comprehensive, selectively adoptable responsibility catalogue, not a requirement to create every directory.

## Working on DLD with AI

At the start of a new or resumed AI session, explicitly direct AI to:

> Read `foundation/WORKFLOW.md`, `foundation/RULES.md`, and `foundation/DESIGN.md`; then read applicable scoped designs and inspect the current repository state. Distinguish approved decisions from draft changes and work only within authorized scope. Bring consequential design changes back for human approval.

Do not assume an AI tool automatically discovers Markdown instructions. No `AGENTS.md` is required. The [development guide](guide/development.md) provides DLD-specific contributor practices; the [workflow](foundation/WORKFLOW.md) governs this project's collaboration and approval process.

## Repository contents

| Location | Responsibility |
| --- | --- |
| [`foundation/`](foundation/DESIGN.md) | Authoritative project-wide design and working governance for developing DLD itself. |
| [`guide/`](guide/README.md) | Shared methodology, lifecycle guidance, reference architecture, and separate adopter/developer guides. |
| [`starter/`](starter/README.md) | Copyable, self-contained operating documents for an adopter's software project. |
| [`product/`](product/README.md) | Maintained entry content for the user-facing product distribution. |
| [`examples/`](examples/README.md) | Worked examples, when available, showing DLD applied in practice. |
| [`tools/package/`](tools/package/README.md) | Distribution assembly definitions and validation. |
| [`CHANGELOG.md`](CHANGELOG.md) | Method changes and adoption implications. |
| [`VERSION`](VERSION) | Method version identity. |
| [`LICENSE`](LICENSE) | Repository license. |

The guide, starter, and product entry content are **maintained sources**. Generated packages belong in `dist/` and are normally not tracked. The development repository's `foundation/` is not copied into the user-facing product; the adopter receives the separate starter template.

## Build and validate distributions

The packaging process uses Python's standard library:

```sh
python tools/package/build.py --check
```

It assembles and checks both distributions from explicitly selected maintained sources. See [packaging instructions](tools/package/README.md) for package boundaries and release safeguards.

Successful packaging does not itself establish human design approval, completed verification of the methodology, or authorization to publish a release.

## Versioning and current status

The last documented published DLD release is **`v0.1.3`**. See the [changelog](CHANGELOG.md) for its scope and adoption guidance.

This branch contains a **proposed architectural revision under review**. Its changes are not a published release or a new human-approved design baseline. The project-wide design records its own revision and approval history, independently of DLD's release version. Software projects adopting DLD maintain their own versions, design approvals, and release histories.

DLD has not yet been validated through a complete real-world software project. Claims about its effectiveness must be supported by actual use and evidence.
