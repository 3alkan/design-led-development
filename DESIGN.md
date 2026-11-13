# DLD Development — Project Design

**Status:** Proposed for reconciliation

## Responsibility and boundary

Develop and distribute DLD as a coherent, design-led, human-authoritative, AI-assisted methodology. This design owns the development project's structure, conventions, and cross-scope responsibilities; it does not govern an adopting project's own design. Development follows the [collaboration contract](dld/CONTRACT.md) and [methodology](dld/DLD.md).

## Intended design and requirements

1. Maintain the [contract](dld/CONTRACT.md) and [methodology](dld/DLD.md) as the foundational sources of DLD, with their content preserved in distribution; neither needs a separate design counterpart.
2. Separate development context from adopter-facing content.
3. Keep distributed content explicitly selected, identifiable, and verifiable.
4. Make this project's responsibility boundaries and dependencies discoverable.
5. Maintain developer-facing navigation and repository conventions without imposing those conventions on adopting projects.

## Development approach

Prefer the simplest conventional solution sufficient for the responsibility and its actual risks. Add files, abstractions, dependencies, safeguards, or checks only when they serve a meaningful need. Keep changes focused, writing clear, and each artifact's responsibility identifiable. The [methodology](dld/DLD.md#2-design-and-ownership) governs authoritative information and references; this project applies that guidance without duplicating its rules.

## Decisions and rationale

- **Separate development and adoption context.** The development project and adopting projects have different governing information. Mixing their introductions, registries, or rules would blur authority.
- **Explicit distribution membership.** Selection is governed by [distribution design](scripts/assembly.md) rather than inferred from directory placement, allowing development material to coexist with product sources.
- **Project-owned conventions.** Repository navigation, text rules, and configuration serve DLD development; they are not methodology obligations for adopters.

## Scope architecture and dependencies

| Scope | Governing design | Principal realizations |
| --- | --- | --- |
| Foundational human–AI contract | [CONTRACT.md](dld/CONTRACT.md) | Foundational source; no separate design file |
| Foundational DLD methodology | [DLD.md](dld/DLD.md) | Foundational source; no separate design file |
| Adoption and context | [Adoption design](product-files/adoption.md) | [Adopter files](product-files/) and [supporting guidance](dld/supporting/) |
| Distribution | [Assembly design](scripts/assembly.md) | [Manifest](product.toml) and [packager](scripts/package.ps1) |
| Verification and validation | [Assurance design](scripts/quality.md) | [Tests](scripts/test-scripts.ps1) and [text validation](scripts/validate-text-format.ps1) |
| Release governance | [Release design](release-policy.md) | [Version](VERSION), [license](LICENSE), and [history](CHANGELOG.md) |

The [contract](dld/CONTRACT.md) and [methodology](dld/DLD.md) govern development directly. The remaining scope designs address this repository's adoption, distribution, assurance, and release responsibilities without restating foundational obligations.

## Realization and acceptance

The [README](README.md), [development rules](RULES.md), repository configuration, and [development context registry](dld/CONTEXT-REGISTRY.md) realize project-wide navigation and conventions.

Review the foundational sources and project scope ownership against the table and registry. Verify distribution membership through the [assembly scope](scripts/assembly.md) and technical behavior through the [assurance scope](scripts/quality.md); assess adoption suitability through representative use. Release readiness is governed by [release governance](release-policy.md).
