<!-- SPDX-License-Identifier: GPL-3.0-only -->
# Design-Led Development

Design-Led Development (DLD) is a design-centered, human-authoritative, AI-assisted methodology for the software development lifecycle. Approved abstract design governs intended outcomes; concrete realizations are developed and verified against it.

This is the **development repository** for DLD. For the documents delivered to adopting projects, see the [collaboration contract](dld/CONTRACT.md), [methodology](dld/DLD.md), and [adopter introduction](product-files/README.md).

## How this repository is organized

Development follows DLD itself: design is organized by engineering responsibility, with scope-specific designs maintained near the artifacts they govern. Designs can govern multiple files; names and directory boundaries alone do not establish authority.

Start with the [project design](DESIGN.md) for overall intent, scope ownership, and dependencies. Then follow the relevant scope:

| Responsibility | Abstract design | Realization |
| --- | --- | --- |
| Human–AI collaboration | [Collaboration](dld/collaboration.md) | [Contract](dld/CONTRACT.md) |
| Software engineering methodology | [Methodology](dld/methodology.md) | [DLD](dld/DLD.md) |
| Adoption and project context | [Adoption](product-files/adoption.md) | [Adopter files](product-files/) and [supporting materials](dld/supporting/) |
| Product distribution | [Assembly](scripts/assembly.md) | [Manifest](product.toml) and [packager](scripts/package.ps1) |
| Verification and validation | [Quality](scripts/quality.md) | [Tests](scripts/test.ps1) and [text validator](scripts/check-text-format.ps1) |
| Release and repository governance | [Release policy](release-policy.md) | [Version](VERSION), [changelog](CHANGELOG.md), licensing, and repository configuration |

Every scope design must contain or reference sufficient governing information, but DLD does not mandate document headings. The [optional design-document guide](dld/supporting/design-document.md) illustrates a compact, expandable form used as a starting point for this repository's scope designs.

The [development context registry](dld/CONTEXT-REGISTRY.md) helps discover governing sources. [Traceability](TRACEABILITY.md) records artifact ownership and reconciliation coverage. Design approval is separate from implementation completion; the scope designs on this working branch remain proposed for reconciliation.

## Validate and assemble

Requires **PowerShell 7**; no Git checkout or external PowerShell modules are required.

Run from the repository root:

```powershell
pwsh -NoProfile -File scripts/test.ps1
pwsh -NoProfile -File scripts/check-text-format.ps1
pwsh -NoProfile -File scripts/package.ps1
```

The [product manifest](product.toml) selects the distributed files and destinations explicitly. Packaging produces `build/product/`, a versioned ZIP, and a SHA-256 checksum. Development designs and other unselected files are not included in the product.

## Versioning and licensing

[VERSION](VERSION) identifies the current DLD product baseline; it is not an adopting project's version. See [release policy](release-policy.md) for versioning and publication decisions and [CHANGELOG.md](CHANGELOG.md) for release history. A merge, successful package build, tag, and GitHub Release are distinct events.

**GPL-3.0-only covers original repository content by default**, including the development registry, abstract designs, normative documents, scripts, adopter introduction, and supporting reference guidance. **CC0-1.0 applies to two end-user-customizable sources:** the [product context registry](product-files/CONTEXT-REGISTRY.md), distributed as `dld/CONTEXT-REGISTRY.md`, and the [optional project-rules template](dld/supporting/RULES.md), which is intended to be copied and adapted as a separate project-owned file. Other distributed DLD files are intended to remain unchanged until a deliberate upgrade; GPLv3 nonetheless grants recipients rights to modify and redistribute GPL-covered material subject to its terms. See [LICENSE](LICENSE), [LICENSE-CC0](LICENSE-CC0), and the file notices. The license texts and third-party works retain their applicable terms. Using DLD does not by itself require licensing independently developed project work under GPLv3.
