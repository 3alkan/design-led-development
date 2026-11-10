<!-- SPDX-License-Identifier: GPL-3.0-only -->
# Design-Led Development

Design-Led Development (DLD) is a design-centered, human-authoritative, AI-assisted methodology for the software development lifecycle. Approved abstract design governs intended outcomes; concrete realizations are developed and verified against it.

This is the **development repository** for DLD. For the documents delivered to adopting projects, see the [collaboration contract](dld/CONTRACT.md), [methodology](dld/DLD.md), and [adopter introduction](product-files/README.md).

## How this repository is organized

Start with the [project design](DESIGN.md), then follow the relevant scope:

| Responsibility | Abstract design | Realization |
| --- | --- | --- |
| Human–AI collaboration | [Collaboration](dld/collaboration.md) | [Contract](dld/CONTRACT.md) |
| Software engineering methodology | [Methodology](dld/methodology.md) | [DLD](dld/DLD.md) |
| Adoption and project context | [Adoption](product-files/adoption.md) | [Adopter files](product-files/) and [supporting materials](dld/supporting/) |
| Product distribution | [Assembly](scripts/assembly.md) | [Manifest](product.toml) and [packager](scripts/package.ps1) |
| Verification and validation | [Quality](scripts/quality.md) | [Tests](scripts/test.ps1) and [text validator](scripts/check-text-format.ps1) |
| Release and repository governance | [Release policy](release-policy.md) | [Version](VERSION), [changelog](CHANGELOG.md), licensing, and repository configuration |

The [context registry](dld/CONTEXT-REGISTRY.md) locates development context; [traceability](TRACEABILITY.md) records artifact ownership. Scope designs remain proposed for reconciliation.

## Validate and assemble

Requires **PowerShell 7**; no additional modules or external tools are required.

Run from the repository root:

```powershell
pwsh -NoProfile -File scripts/test.ps1
pwsh -NoProfile -File scripts/check-text-format.ps1
pwsh -NoProfile -File scripts/package.ps1
```

The [product manifest](product.toml) selects the distributed files and destinations explicitly. Packaging produces `build/product/`, a versioned ZIP, and a SHA-256 checksum. Development designs and other unselected files are not included in the product.

## Versioning and licensing

[VERSION](VERSION) identifies the DLD distribution, not an adopter's project version. See [release policy](release-policy.md) and [CHANGELOG.md](CHANGELOG.md); packaging, merging, and publishing are separate decisions.

Each source file declares its license in its SPDX header. Most use [GPL-3.0-only](LICENSE); adopter-customizable files use [CC0-1.0](LICENSE-CC0). Independently developed adopter work is not GPL-covered merely by using DLD.
