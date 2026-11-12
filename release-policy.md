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
| R-04 | Use the repository's root [LICENSE](LICENSE) as the authority for original DLD licensing terms; preserve separate third-party terms when applicable. Changes to licensing require human review. | [LICENSE](LICENSE), source notices |
| R-05 | Document development purpose, navigation, installation/build commands, and release policy separately from normative product content. | README |
| R-06 | Keep developer-owned design and rules outside the distribution unless explicitly selected as product material. | [DESIGN.md](DESIGN.md), [RULES.md](RULES.md), manifest |
| R-07 | Use standard repository metadata for text defaults and generated output exclusion. | [editor config](.editorconfig), [Git attributes](.gitattributes), [Git ignore](.gitignore) |
| R-08 | Treat approvals of designs, merge permission, a produced package, and authority to publish as distinct decisions. | Contract, methodology and release process |

## Decisions and rationale

- **R-D1:** Maintain separate development and adopter READMEs because build instructions and repository governance should not be delivered as adopter instructions.
- **R-D2:** Let the manifest determine distribution boundaries instead of assuming that everything in a source directory is product material; this preserves a single explicit authority for packaging.
- **R-D3:** Keep assembly and verification separate from tagging and publication so a generated artifact cannot by itself imply human release authorization.
- **R-D4:** Apply TXT-001 to maintained repository sources only; adopters should not inherit DLD's development conventions as new methodology obligations.
- **R-D5:** Keep [LICENSE](LICENSE) and [VERSION](VERSION) as their respective authoritative sources; repeated headers and embedded version declarations would create avoidable synchronization work.

## Realization and acceptance

Check version, changelog, root license text, and product membership. License suitability and changes to license assignments require human review. Exclude development-only references from adopter files and generated outputs from source control. Publication requires authorization.

