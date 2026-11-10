# Development Traceability Register

**Status:** Reconciliation inventory — not an approval record

This register maps maintained artifacts to the abstract scope that governs them. A file listed here is *covered by a candidate design*; actual verification and human approval remain separate. Generated output under `build/` is covered by Distribution but not tracked in Git.

## Artifact coverage

| Maintained artifact | Owning design | Intended responsibility |
| --- | --- | --- |
| `DESIGN.md` | [Project](DESIGN.md) | Project-wide architecture and scope boundaries |
| `dld/CONTRACT.design.md` | [Contract](dld/CONTRACT.design.md) | Contract requirements and design decisions |
| `dld/DLD.design.md` | [Methodology](dld/DLD.design.md) | Method requirements and design decisions |
| `product-files/DESIGN.md` | [Adoption](product-files/DESIGN.md) | Adoption requirements and design decisions |
| `scripts/PACKAGE.design.md` | [Distribution](scripts/PACKAGE.design.md) | Packaging requirements and design decisions |
| `scripts/TEST.design.md` | [Assurance](scripts/TEST.design.md) | Verification/validation requirements and decisions |
| `RELEASE.design.md` | [Release](RELEASE.design.md) | Identity, repository governance, and licensing design |
| `TRACEABILITY.md` | [Project](DESIGN.md) | Artifact ownership and reconciliation accounting |
| `dld/CONTRACT.md` | [Contract](dld/CONTRACT.design.md) | Normative human–AI contract |
| `dld/DLD.md` | [Methodology](dld/DLD.design.md) | Normative engineering methodology |
| `dld/CONTEXT-REGISTRY.md` | [Adoption](product-files/DESIGN.md) | Development project's editable context |
| `product-files/CONTEXT-REGISTRY.md` | [Adoption](product-files/DESIGN.md) | Project-neutral product context template |
| `product-files/README.md` | [Adoption](product-files/DESIGN.md) | Adopter introduction and instructions |
| `dld/supporting/RULES.md` | [Adoption](product-files/DESIGN.md) | Optional project rules template |
| `dld/supporting/repository-layout.md` | [Adoption](product-files/DESIGN.md) | Optional repository layout guidance |
| `product.toml` | [Distribution](scripts/PACKAGE.design.md) | Product file source/destination manifest |
| `scripts/package.ps1` | [Distribution](scripts/PACKAGE.design.md) | Reproducible product assembly |
| `scripts/test.ps1` | [Assurance](scripts/TEST.design.md) | Local regression and fixture checks |
| `scripts/check-text-format.ps1` | [Assurance](scripts/TEST.design.md) | TXT-001 maintained text validation |
| `RULES.md` | [Release and governance](RELEASE.design.md) | Development-only textual constraint TXT-001 |
| `.editorconfig` | [Release and governance](RELEASE.design.md) | Editor defaults for TXT-001 |
| `.gitattributes` | [Release and governance](RELEASE.design.md) | Git text normalization |
| `.gitignore` | [Release and governance](RELEASE.design.md) | Generated `build/` exclusion |
| `README.md` | [Release and governance](RELEASE.design.md) | Development navigation and procedures |
| `VERSION` | [Release and governance](RELEASE.design.md) | Distribution version identity |
| `CHANGELOG.md` | [Release and governance](RELEASE.design.md) | Release change history |
| `LICENSE` | [Release and governance](RELEASE.design.md) | GPLv3 license text |
| `LICENSE-CC0` | [Release and governance](RELEASE.design.md) | CC0 license text |

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
