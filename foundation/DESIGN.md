# Design-Led Development

- Revision: 6
- Status: Draft
- Approval: Rev 3 approved by human (date not recorded).
- Approval: Rev 4 approved by human 2026-11-03.
- Approval: Rev 5 approved by human 2026-11-03.

## Purpose

Develop and maintain **Design-Led Development (DLD)** as a coherent, versioned methodology that humans and AI can learn and apply throughout software projects. Its authoritative specification is [DLD Core](CORE.md).

## Users and intended outcomes

DLD serves humans and AI who develop or maintain software projects together. Users must be able to understand the method, adopt a known version in a project, identify authoritative project decisions, and continue work across sessions and lifecycle activities.

DLD contributors must be able to evolve the methodology and its accompanying materials without creating independent, conflicting versions of Core.

## Scope

This project maintains the canonical DLD Core, project-specific development governance, explanatory documentation, reusable starter artifacts, concrete examples when available, and the means to assemble and validate its distributions.

DLD is independent of programming language, framework, and AI provider. The project does not promise automatic implementation, automatic design synchronization, or formal certification against an external engineering standard.

## Product design

The repository develops **one DLD method with one versioned Core** and produces two distributions from a common source baseline:

- **Development distribution:** The maintained materials needed to develop DLD, including this project's DESIGN and RULES, canonical Core, documentation, examples, starter sources, and packaging infrastructure.
- **Product distribution:** The shared Core, documentation for understanding and adopting DLD, and a clean, copyable project starter. The DLD development project's DESIGN and RULES are not part of the adopted project.

The two distributions share the same DLD version and release tag. Distribution assembly is reproducible from identified maintained sources; successful assembly alone does not constitute human approval or publication.

### Optional supporting materials

The product distribution makes the full adopter-oriented guidance and reference material available separately from the minimal starter. An optional, ready-to-copy documentation overlay allows an adopter to add version-matched support material to the project's own documentation area without editing or duplicating Core, DESIGN, or RULES.

The overlay preserves valid links after copying and is not needed for methodological compliance. A project's human and AI can operate using the starter alone; supporting material assists learning and less-common engineering decisions when requested.

### Adopter's starter

The assembled starter contains a project README and a `foundation/` with an exact copy of the versioned Core, a draft DESIGN template, and a RULES template without pre-adopted project constraints.

Users copy only the starter contents into their own projects. Their DESIGN and RULES then belong to those projects, while the adopted Core remains unchanged for that version. AI is explicitly directed through the project README to read its foundation at the start of a session.

## Responsibilities and relationships

- [`foundation/CORE.md`](CORE.md) is the sole maintained source of the DLD methodology. Copies inserted into distributions are derived from it, not separately edited.
- [`foundation/DESIGN.md`](DESIGN.md) defines the DLD development project's intended outcomes, scope, and design; [`foundation/RULES.md`](RULES.md) contains any separately adopted constraints for this project.
- [`docs/`](../docs/README.md) explains the common method and provides audience-specific [adoption](../docs/guides/adoption.md) and [development](../docs/guides/development.md) guidance. It does not establish competing methodological authority.
- [`examples/`](../examples/README.md) contains concrete demonstrations of DLD, when available, without defining the method.
- [`starter/`](../starter/README.md) maintains clean project-specific README, DESIGN, and RULES templates. Packaging inserts the canonical Core instead of maintaining a second source.
- [`.github/package.py`](../.github/package.py) assembles and validates both distributions according to the [packaging specification](../docs/internal/packaging.md).
- The repository [README](../README.md) is its entry point; [VERSION](../VERSION), [CHANGELOG](../CHANGELOG.md), and [LICENSE](../LICENSE) record method identity, changes, and licensing.

Use the [reference repository layout](../docs/reference/repository-layout.md) selectively. This development repository creates additional directories only for real responsibilities or required tooling conventions.

## Acceptance criteria

- Core is the only authoritative DLD methodology; neither project-specific governance nor documentation independently redefines it.
- The development repository operates as a DLD project using its own DESIGN and RULES under Core.
- Both distributions contain identical canonical Core content and the same DLD version identity.
- Each assembled starter is sufficient for full DLD compliance without supplemental documentation, network access, or DLD-development-specific approvals and rules.
- The product includes optional, locally copyable supporting documentation whose links resolve after installation and whose content does not redefine Core.
- Adoption requires no mandatory AI-provider-specific instruction file or access to the DLD development repository after copying the starter.
- Package validation checks expected contents, shared Core identity, and relative document links.
- Published versions and recorded approvals reflect actual authorized actions rather than inferred success from packaging or commits.
- Documentation and maintained examples remain consistent with Core, and users can distinguish authoritative instructions from explanation.

## Pending changes — Draft revision 6

This proposed revision consolidates the F1–F4 methodology direction and R1–R15 repository direction with the subsequently selected single-Core foundation, removal of `WORKFLOW.md`, responsibility-based repository layout, separated documentation and examples, clean starter, and dual distribution model.

These changes remain **unapproved as Revision 6**. The earlier recorded approvals remain associated with their historical baselines; this document does not extend those approvals to the proposed architecture.

## Open questions

- What evidence from a complete project will demonstrate the methodology's effectiveness and identify necessary refinements?
- What verification and adoption evidence is required before a stable 1.0 release?
