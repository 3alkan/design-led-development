# Design-Led Development (DLD)

DLD is a **design-centered, human-authoritative, AI-assisted software engineering methodology** spanning the software development lifecycle. Its [Core](foundation/CORE.md) is the sole authoritative method specification.

This is the **DLD development repository**, itself governed as a DLD project by [DESIGN](foundation/DESIGN.md) and [RULES](foundation/RULES.md). The next proposed method version is **0.1.4**; the last recorded published release is **v0.1.3**.

## Repository

| Path | Responsibility |
| --- | --- |
| [`foundation/`](foundation/CORE.md) | Canonical Core and the DLD development project's own DESIGN and RULES |
| [`starter/`](starter/README.md) | Clean adoption templates; packaging generates its Core copy from the canonical file |
| [`docs/supporting/`](docs/supporting/repository-layout.md) | Optional supporting materials, currently one repository layout reference |
| [`.github/`](.github/package.py) | Distribution assembly and validation |
| [`VERSION`](VERSION), [`CHANGELOG.md`](CHANGELOG.md), [`LICENSE`](LICENSE) | Release identity, change history, and license |

No other documentation is required for using DLD. When beginning AI work in this repository, provide Core, DESIGN, RULES, the relevant active scope, and current repository state.

## Distributions

The **development distribution** contains the maintained DLD project and its packaging infrastructure. The **product distribution** contains a product README, minimal copyable starter (with generated Core), optional `supporting/` materials, VERSION, CHANGELOG, and LICENSE.

The product's supporting reference may be copied into an adopting project's `docs/dld/`. It is not part of the required foundation.

Run `python .github/package.py --check` to assemble and validate review archives. Passing checks do not approve design, authorize merging, or publish a release.
