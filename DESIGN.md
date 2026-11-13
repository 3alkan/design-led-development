# DLD Development — Project Design

**Status:** Proposed for reconciliation

## Responsibility and boundary

Develop and distribute DLD as a coherent, design-led, human-authoritative, AI-assisted methodology. This design owns the development project's structure, conventions, and cross-scope responsibilities; it does not govern an adopting project's own design. Development follows the [collaboration contract](dld/CONTRACT.md) and [methodology](dld/DLD.md).

## Intended design and requirements

1. Maintain one authoritative collaboration contract and one methodology, with their intended content preserved in distribution.
2. Separate development context from adopter-facing content and allow adopters to own their project context independently.
3. Keep distributed content explicitly selected, identifiable, and verifiable.
4. Make scope ownership, dependencies, governing design, and acceptance discoverable without replicating local decisions at project level.
5. Keep authoritative facts, rules, and configuration under identifiable ownership; distinguish context discovery from decision authority.
6. Maintain developer-facing navigation and repository conventions without imposing those conventions on adopting projects.

## Development approach

Prefer the simplest conventional solution sufficient for the responsibility and its actual risks. Add files, abstractions, dependencies, safeguards, or checks only when they serve a meaningful need. Keep changes focused, writing clear, and each artifact's responsibility identifiable. The [methodology](dld/DLD.md#2-design-and-ownership) governs authoritative information and references; this project applies that guidance without duplicating its rules.

## Decisions and rationale

- **Responsibility-based scopes.** Assign local decisions to the scope that can govern them coherently; project design holds shared boundaries. This allows changes without continually rewriting unrelated designs.
- **Separate development and adoption context.** The development project and adopting projects have different governing information. Mixing their introductions, registries, or rules would blur authority.
- **Explicit distribution membership.** Selection is governed by [distribution design](scripts/assembly.md) rather than inferred from directory placement, allowing development material to coexist with product sources.
- **Project-owned conventions.** Repository navigation, text rules, and configuration serve DLD development; they are not methodology obligations for adopters.

## Scope architecture and dependencies

| Scope | Governing design | Principal realizations |
| --- | --- | --- |
| Collaboration | [Contract design](dld/collaboration.md) | [Contract](dld/CONTRACT.md) |
| Methodology | [Methodology design](dld/methodology.md) | [DLD](dld/DLD.md) |
| Adoption and context | [Adoption design](product-files/adoption.md) | [Adopter files](product-files/) and [supporting guidance](dld/supporting/) |
| Distribution | [Assembly design](scripts/assembly.md) | [Manifest](product.toml) and [packager](scripts/package.ps1) |
| Verification and validation | [Assurance design](scripts/quality.md) | [Tests](scripts/test-scripts.ps1) and [text validation](scripts/validate-text-format.ps1) |
| Release governance | [Release design](release-policy.md) | [Version](VERSION), [license](LICENSE), and [history](CHANGELOG.md) |

The contract constrains the methodology and development conduct. Adoption consumes normative sources without changing their authority. Distribution assembles selected sources; assurance evaluates conformance and usefulness; release governance controls release identity and authorization.

## Realization and acceptance

The [README](README.md), [development rules](RULES.md), repository configuration, and [development context registry](dld/CONTEXT-REGISTRY.md) realize project-wide navigation and conventions. The registry locates governing context; it does not grant approval or replace the designs it references.

Review scope ownership against the table and registry; verify distribution membership through the [assembly scope](scripts/assembly.md) and technical behavior through the [assurance scope](scripts/quality.md). Assess methodology usefulness separately through representative adoption. Release decisions follow [release governance](release-policy.md). A successful build alone does not establish design approval or product suitability.
