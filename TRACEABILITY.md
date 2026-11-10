# Development Traceability Register

**Status:** Reconciliation inventory — not an approval record

This register maps maintained artifacts to the abstract scope that governs them. Designs are named for their responsibility and located near realizations where practical; the register is navigation and coverage evidence, not a centralized source of design authority. A file listed here is *covered by a candidate design*; actual verification and human approval remain separate. Generated output under `build/` is covered by Distribution but not tracked in Git.

## Artifact coverage

| Maintained artifact | Owning design | Intended responsibility |
| --- | --- | --- |
| `DESIGN.md` | [Project](DESIGN.md) | Project-wide architecture and scope boundaries |
| `dld/collaboration.md` | [Contract](dld/collaboration.md) | Contract requirements and design decisions |
| `dld/methodology.md` | [Methodology](dld/methodology.md) | Method requirements and design decisions |
| `product-files/adoption.md` | [Adoption](product-files/adoption.md) | Adoption requirements and design decisions |
| `scripts/assembly.md` | [Distribution](scripts/assembly.md) | Packaging requirements and design decisions |
| `scripts/quality.md` | [Assurance](scripts/quality.md) | Verification/validation requirements and decisions |
| `release-policy.md` | [Release](release-policy.md) | Identity, repository governance, and licensing design |
| `TRACEABILITY.md` | [Project](DESIGN.md) | Artifact ownership and reconciliation accounting |
| `dld/CONTRACT.md` | [Contract](dld/collaboration.md) | Normative human–AI contract |
| `dld/DLD.md` | [Methodology](dld/methodology.md) | Normative engineering methodology |
| `dld/CONTEXT-REGISTRY.md` | [Adoption](product-files/adoption.md) | Development project's editable context |
| `product-files/CONTEXT-REGISTRY.md` | [Adoption](product-files/adoption.md) | Project-neutral product context template |
| `product-files/README.md` | [Adoption](product-files/adoption.md) | Adopter introduction and instructions |
| `dld/supporting/RULES.md` | [Adoption](product-files/adoption.md) | Optional project rules template |
| `dld/supporting/repository-layout.md` | [Adoption](product-files/adoption.md) | Optional repository layout guidance |
| `product.toml` | [Distribution](scripts/assembly.md) | Product file source/destination manifest |
| `scripts/package.ps1` | [Distribution](scripts/assembly.md) | Reproducible product assembly |
| `scripts/test.ps1` | [Assurance](scripts/quality.md) | Local regression and fixture checks |
| `scripts/check-text-format.ps1` | [Assurance](scripts/quality.md) | TXT-001 maintained text validation |
| `RULES.md` | [Release and governance](release-policy.md) | Development-only textual constraint TXT-001 |
| `.editorconfig` | [Release and governance](release-policy.md) | Editor defaults for TXT-001 |
| `.gitattributes` | [Release and governance](release-policy.md) | Git text normalization |
| `.gitignore` | [Release and governance](release-policy.md) | Generated `build/` exclusion |
| `README.md` | [Release and governance](release-policy.md) | Development navigation and procedures |
| `VERSION` | [Release and governance](release-policy.md) | Distribution version identity |
| `CHANGELOG.md` | [Release and governance](release-policy.md) | Release change history |
| `LICENSE` | [Release and governance](release-policy.md) | GPLv3 license text |
| `LICENSE-CC0` | [Release and governance](release-policy.md) | CC0 license text |

## Requirement-to-realization review

| Design | Requirements | Implemented in | Evidence or outstanding check |
| --- | --- | --- | --- |
| Contract | C-01–C-07 | `dld/CONTRACT.md` | Section-by-section human content review |
| Methodology | M-01–M-16 | `dld/DLD.md` | Content review and representative adoption validation |
| Adoption | A-01–A-07 | Product README, both registries, supporting material | Product link checks; practical adoption exercise remains |
| Distribution | P-01–P-09 | Manifest and packaging script | Packager and tests; negative-case coverage should be extended |
| Assurance | V-01–V-07 | Validator and tests; human review process | TXT-001 tests and packaging fixture; external validity requires review |
| Release | R-01–R-08 | Metadata, licenses, development configuration | Manifest review, licensing review, actual release authorization |

## Reconciliation state

Every maintained file listed above has a candidate abstract owner and requirement path. This establishes *coverage*, not historical design-first development. The next authority step is human review/approval of scope requirements and decisions, followed by implementation alignment checks and proportionate evidence for outstanding acceptance criteria.
