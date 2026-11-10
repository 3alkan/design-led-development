<!-- SPDX-License-Identifier: GPL-3.0-only -->
# Release and Repository Governance Scope — Design

**Status:** Proposed for reconciliation

## Responsibility and boundary

Maintain DLD's identity, licensing, development rules, and release history. Separate development approvals, code integration, packaging, tagging, and publication.

## Intended design and requirements

| ID | Intended requirement | Realization |
| --- | --- | --- |
| R-01 | Maintain a single DLD distribution version, shared by contract and methodology; adopting projects version themselves independently. | [VERSION](VERSION), [README](README.md) |
| R-02 | Use SemVer-style version identifiers, with `v`-prefixed release tags and optional numbered prereleases. | README; package filename |
| R-03 | Maintain release history without rewriting earlier releases to match the current architecture. | [CHANGELOG.md](CHANGELOG.md) |
| R-04 | Default all original repository materials to GPL-3.0-only; record intentional CC0-1.0 end-user-customizable exceptions in a single explicit exception-pattern list. Preserve original terms for third-party works and license texts. | [CC0-FILES.txt](CC0-FILES.txt), [LICENSE](LICENSE), [LICENSE-CC0](LICENSE-CC0), source notices |
| R-05 | Document development purpose, navigation, installation/build commands, and release policy separately from normative product content. | README |
| R-06 | Keep developer-owned design and rules outside the distribution unless explicitly selected as product material. | [DESIGN.md](DESIGN.md), [RULES.md](RULES.md), manifest |
| R-07 | Use standard repository metadata for text defaults and generated output exclusion. | [editor config](.editorconfig), [Git attributes](.gitattributes), [Git ignore](.gitignore) |
| R-08 | Treat approvals of designs, merge permission, a produced package, and authority to publish as distinct decisions. | Contract, methodology and release process |

## Decisions and rationale

- **R-D1:** The root README is development-facing; an adopter-facing README is maintained separately.
- **R-D2:** The manifest determines distribution boundaries, not the directory containing a source.
- **R-D3:** Releases are assembled and verified before an authorized tag/publication operation.
- **R-D4:** Text-format rule TXT-001 is development governance; it does not become an additional adopter obligation.
- **R-D5:** Use SPDX identifiers on maintained original sources where the file format permits comments. LICENSE and LICENSE-CC0 keep their original license text; VERSION remains a machine-readable version token.
- **R-D6:** [CC0-FILES.txt](CC0-FILES.txt) governs exceptions for end-user-customizable sources; all other original files default to GPL-3.0-only. The validator checks source-file notices against the listed patterns. Exception changes require human approval.

## Realization and acceptance

Check version, changelog, license texts, source notices, and product membership. Local tests MUST enforce licensing assignments. Exclude development-only references from adopter files and generated outputs from source control. Publication requires authorization.

