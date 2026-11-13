# Design-Led Development (DLD)

**Design-Led Development (DLD)** is a design-centered, human-authoritative, AI-assisted methodology for software engineering across the full development lifecycle.

DLD treats **approved abstract design as the authority for intended outcomes**. Humans make and approve consequential design decisions; AI can investigate, propose, and implement within authorized boundaries. Implementation and verification evidence remain traceable to the governing design.

## Getting started

To **adopt DLD in a software project**:

1. Obtain a packaged distribution from [GitHub Releases](https://github.com/3alkan/design-led-development/releases).
2. Follow the [adopter instructions](product-files/README.md) to copy or reconcile the DLD foundation into your project.
3. Read the [Human–AI Collaboration Contract](dld/CONTRACT.md) and [DLD Methodology](dld/DLD.md), then establish your project's own design and context.

The development repository contains additional files not included in the adopter distribution. For a local preview of the current unreleased sources, see [Build a distribution](#development).

## Documentation

- [Collaboration contract](dld/CONTRACT.md) — general human–AI authority and conduct.
- [DLD methodology](dld/DLD.md) — design ownership, approval, realization, evidence, and evolution.
- [Supporting materials](dld/supporting/) — optional design and repository guidance.
- [Context Registry](dld/CONTEXT-REGISTRY.md) — discovery of the development project's governing context, distinct from README navigation.

## Repository structure

This repository **develops and distributes DLD**. The [project design](DESIGN.md) owns the overall development architecture; each scope design governs its realizations.

| Responsibility | Design | Main realization |
| --- | --- | --- |
| Human–AI collaboration | [Contract design](dld/collaboration.md) | [CONTRACT.md](dld/CONTRACT.md) |
| Software engineering methodology | [Methodology design](dld/methodology.md) | [DLD.md](dld/DLD.md) |
| Adoption and project context | [Adoption design](product-files/adoption.md) | [Adopter files](product-files/) and [supporting guidance](dld/supporting/) |
| Product distribution | [Assembly design](scripts/assembly.md) | [Manifest](product.toml) and [packager](scripts/package.ps1) |
| Verification and validation | [Quality design](scripts/quality.md) | [Script tests](scripts/test-scripts.ps1) and [text validator](scripts/validate-text-format.ps1) |
| Release governance | [Release design](release-policy.md) | [VERSION](VERSION), [CHANGELOG.md](CHANGELOG.md), and [LICENSE](LICENSE) |

## Development

**Requirement:** PowerShell 7. No additional PowerShell modules are needed.

From the repository root:

```powershell
# Test repository scripts and maintained text
pwsh -NoProfile -File scripts/test-scripts.ps1

# Validate text encoding and line endings independently
pwsh -NoProfile -File scripts/validate-text-format.ps1

# Build a distribution
pwsh -NoProfile -File scripts/package.ps1
```

The packager reads [product.toml](product.toml), the authoritative source for distributed file membership. It generates `build/product/`, a versioned ZIP, and its SHA-256 checksum. Development-only files are excluded unless selected by the manifest.

## Releases

See [GitHub Releases](https://github.com/3alkan/design-led-development/releases) for published distributions, [VERSION](VERSION) for the version being developed, and [CHANGELOG.md](CHANGELOG.md) for release history. Packaging, approval, and publication are separate activities under the [release policy](release-policy.md).

## License

Original DLD materials are licensed under the [repository license](LICENSE).
