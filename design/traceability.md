# Development Traceability Register

**Status:** Reconciliation inventory — not an approval record

This register maps maintained artifacts to the abstract scope that governs them. A file listed here is *covered by a candidate design*; actual verification and human approval remain separate. Generated output under `build/` is covered by Distribution but not tracked in Git.

## Artifact coverage

| Maintained artifact | Owning design | Intended responsibility |
| --- | --- | --- |
| `DESIGN.md` | [Project](../DESIGN.md) | Project-wide architecture and scope boundaries |
| `design/contract.md` | [Contract](contract.md) | Contract requirements and design decisions |
| `design/methodology.md` | [Methodology](methodology.md) | Method requirements and design decisions |
| `design/adoption.md` | [Adoption](adoption.md) | Adoption requirements and design decisions |
| `design/distribution.md` | [Distribution](distribution.md) | Packaging requirements and design decisions |
| `design/assurance.md` | [Assurance](assurance.md) | Verification/validation requirements and decisions |
| `design/release.md` | [Release](release.md) | Identity, repository governance, and licensing design |
| `design/traceability.md` | [Project](../DESIGN.md) | Artifact ownership and reconciliation accounting |
| `dld/CONTRACT.md` | [Contract](contract.md) | Normative human–AI contract |
| `dld/DLD.md` | [Methodology](methodology.md) | Normative engineering methodology |
| `dld/CONTEXT-REGISTRY.md` | [Adoption](adoption.md) | Development project's editable context |
| `product-files/CONTEXT-REGISTRY.md` | [Adoption](adoption.md) | Project-neutral product context template |
| `product-files/README.md` | [Adoption](adoption.md) | Adopter introduction and instructions |
| `dld/supporting/RULES.md` | [Adoption](adoption.md) | Optional project rules template |
| `dld/supporting/repository-layout.md` | [Adoption](adoption.md) | Optional repository layout guidance |
| `product.toml` | [Distribution](distribution.md) | Product file source/destination manifest |
| `scripts/package.ps1` | [Distribution](distribution.md) | Reproducible product assembly |
| `scripts/test.ps1` | [Assurance](assurance.md) | Local regression and fixture checks |
| `scripts/check-text-format.ps1` | [Assurance](assurance.md) | TXT-001 maintained text validation |
| `RULES.md` | [Release and governance](release.md) | Development-only textual constraint TXT-001 |
| `.editorconfig` | [Release and governance](release.md) | Editor defaults for TXT-001 |
| `.gitattributes` | [Release and governance](release.md) | Git text normalization |
| `.gitignore` | [Release and governance](release.md) | Generated `build/` exclusion |
| `README.md` | [Release and governance](release.md) | Development navigation and procedures |
| `VERSION` | [Release and governance](release.md) | Distribution version identity |
| `CHANGELOG.md` | [Release and governance](release.md) | Release change history |
| `LICENSE` | [Release and governance](release.md) | GPLv3 license text |
| `LICENSE-CC0` | [Release and governance](release.md) | CC0 license text |

## Requirement-to-realization review

| Design | Requirements | Implemented in | Evidence or outstanding check |
| --- | --- | --- | --- |
| Contract | C-01–C-07 | `dld/CONTRACT.md` | Section-by-section human content review |
| Methodology | M-01–M-12 | `dld/DLD.md` | Content review and representative adoption validation |
| Adoption | A-01–A-07 | Product README, both registries, supporting material | Product link checks; practical adoption exercise remains |
| Distribution | P-01–P-09 | Manifest and packaging script | Packager and tests; negative-case coverage should be extended |
| Assurance | V-01–V-07 | Validator and tests; human review process | TXT-001 tests and packaging fixture; external validity requires review |
| Release | R-01–R-08 | Metadata, licenses, development configuration | Manifest review, licensing review, actual release authorization |

## Reconciliation state

Every maintained file listed above has a candidate abstract owner and requirement path. This establishes *coverage*, not historical design-first development. The next authority step is human review/approval of scope requirements and decisions, followed by implementation alignment checks and proportionate evidence for outstanding acceptance criteria.
