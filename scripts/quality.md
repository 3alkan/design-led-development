# Verification and Validation — Design

**Status:** Proposed for reconciliation

## Responsibility and boundary

Provide proportionate evidence of source and distribution conformance, and support evaluation of DLD's usefulness. This scope does not approve designs, make publication decisions, or equate technical success with validation.

## Intended design and requirements

| ID | Intended requirement |
| --- | --- |
| V-01 | Maintained source text conforms to the project's governing text rules, with binary material excluded. |
| V-02 | Local verification is practical for both source checkouts and extracted source archives. |
| V-03 | Automated checks distinguish conforming text from relevant encoding and line-ending violations. |
| V-04 | Packaging behavior is testable without changing actual release outputs. |
| V-05 | Checks cover ordinary packaging success, reproducibility, invalid selections, and broken internal references. |
| V-06 | Technical verification and human assessment of intended usefulness remain distinct. |
| V-07 | Verification outcomes, unperformed checks, and limitations are reported accurately. |
| V-08 | Distribution checks include the applicable license material without duplicating its legal terms. |
| V-09 | Scope designs are reviewed for sufficient governing information, not mandatory section headings. |

## Decisions and rationale

- **Local, dependency-light checks.** Contributors should be able to evaluate maintained sources without a hosted service or Git-specific environment.
- **Separate verification from validation.** Automated tests can establish technical behavior; human review and representative adoption are needed to assess coherence and usefulness.
- **Isolated test artifacts.** Exercise packaging on temporary inputs to avoid altering release outputs during negative tests.
- **Proportionate coverage.** Retain a compact test entry point until independent responsibilities justify splitting it; favor meaningful behavior checks over hypothetical failure machinery.

## Realization and acceptance

[Development rules](../RULES.md) own the text constraints. [Text validator](validate-text-format.ps1) checks maintained sources, and [script tests](test-scripts.ps1) exercise formatting and packaging behavior. [Packager](package.ps1) produces the artifacts under test. The [optional design guide](../dld/supporting/design-document.md) illustrates governing information without imposing a template.

Verify that conforming sources pass, expected invalid cases fail, tests avoid changing real release outputs, and relevant license content is selected in the [manifest](../product.toml). Review the contract and methodology for design consistency, and use representative adoption to assess their practical suitability. Report evidence and gaps without treating test success as approval.
