# Design-Led Development (DLD)

DLD is a **design-centered, human-authoritative, AI-assisted software engineering methodology** spanning the software development lifecycle. Its [Core](foundation/CORE.md) is the sole authoritative specification of the method.

This is the **DLD development repository**, itself governed as a DLD project by [DESIGN](foundation/DESIGN.md) and [RULES](foundation/RULES.md). The proposed next method version is **0.1.4**; the repository's [VERSION](VERSION) is being aligned to **0.1.4** as an unreleased release candidate; version alignment is not publication.

## Repository

| Location | Responsibility |
| --- | --- |
| [`foundation/`](foundation/CORE.md) | Canonical methodology Core and this project's own DESIGN and RULES |
| [`starter/`](starter/README.md) | Project-neutral adoption templates; the Core copy is taken from the canonical source when assembling a product |
| [`docs/supporting/`](docs/supporting/repository-layout.md) | Optional supporting resources, currently an adopting-project repository-layout reference |
| [`VERSION`](VERSION) | Release version identity |
| [`CHANGELOG.md`](CHANGELOG.md) | Historical changes and adoption implications |
| [`LICENSE`](LICENSE), [`LICENSE-CC0`](LICENSE-CC0) | Full GPLv3 and CC0-1.0 license texts; file applicability explained below |

The [repository-layout reference](docs/supporting/repository-layout.md) is optional: an adopting project needs only its README and adopted foundation.

## Licensing

The DLD methodology, including [CORE.md](foundation/CORE.md), and the [supporting reference](docs/supporting/repository-layout.md) are provided under the **GNU General Public License version 3 (GPLv3)**; see [LICENSE](LICENSE). DLD development documentation is also covered by GPLv3 unless otherwise indicated.

**Exception for reusable starter templates:** [`starter/README.md`](starter/README.md), [`starter/foundation/DESIGN.md`](starter/foundation/DESIGN.md), and [`starter/foundation/RULES.md`](starter/foundation/RULES.md) are dedicated under **[CC0 1.0 Universal](LICENSE-CC0)** (also available [online](https://creativecommons.org/publicdomain/zero/1.0/legalcode.en)). They may be freely copied, modified, and reused in adopting projects, including proprietary projects, without attribution or retaining a CC0 notice. The generated `starter/foundation/CORE.md` is a copy of the GPLv3-covered Core, **not** a CC0 template.

Following DLD or using the CC0 starter templates does not by itself impose GPLv3 on independently developed project code and documents. Redistribution of GPLv3-covered DLD material remains subject to its license terms.

## Intended distributions

The development repository maintains the canonical Core and project-specific governance. The intended **product distribution** contains a product introduction, a copyable starter with a generated Core copy, optional supporting material, VERSION, CHANGELOG, LICENSE, and LICENSE-CC0.

The local [PowerShell packaging script](scripts/package.ps1) assembles and validates the proposed product with no external modules. Run `pwsh -File scripts/package.ps1` after preparing a matching `VERSION` and Core version. Packaging requires `VERSION` to match the version declared in the frozen Core. Successful assembly is not itself evidence of release authorization. An assembled package is not a published release.

When beginning human–AI work on DLD itself, load the project's Core, DESIGN, RULES, and relevant current scope and evidence. Neither a commit nor an assembled product constitutes approval or release authorization.
