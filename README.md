# Design-Led Development (DLD)

DLD is a **design-centered, human-authoritative, AI-assisted software engineering methodology** spanning the software development lifecycle. Its [Core](foundation/CORE.md) is the sole authoritative specification of the method.

This is the **DLD development repository**, itself governed as a DLD project by [DESIGN](foundation/DESIGN.md) and [RULES](foundation/RULES.md). The proposed next method version is **0.1.4**; the repository's current [VERSION](VERSION) remains **0.1.3** until release preparation.

## Repository

| Location | Responsibility |
| --- | --- |
| [`foundation/`](foundation/CORE.md) | Canonical methodology Core and this project's own DESIGN and RULES |
| [`starter/`](starter/README.md) | Project-neutral adoption templates; the Core copy is taken from the canonical source when assembling a product |
| [`docs/supporting/`](docs/supporting/repository-layout.md) | Optional supporting resources, currently a user-project repository-layout reference |
| [`VERSION`](VERSION) | Release version identity |
| [`CHANGELOG.md`](CHANGELOG.md) | Historical changes and adoption implications |
| [`LICENSE`](LICENSE) | License |

The [repository-layout reference](docs/supporting/repository-layout.md) is optional: a DLD user project needs only its README and adopted foundation.

## Intended distributions

The development repository maintains the canonical Core and project-specific governance. The intended **product distribution** contains a product introduction, a copyable starter with a generated Core copy, optional supporting material, VERSION, CHANGELOG, and LICENSE.

Distribution assembly and validation tooling are **not yet present in this minimal repository layout**. The proposed product organization is project design, not a claim that a package has been built or published.

When beginning human–AI work on DLD itself, load the project's Core, DESIGN, RULES, and relevant current scope and evidence. Neither a commit nor an assembled product constitutes approval or release authorization.
