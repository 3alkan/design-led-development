# Verification and Validation Scope — Design

**Status:** Proposed for reconciliation

## Intent and boundary

Provide evidence of technical conformance and product suitability. This scope verifies the maintained development sources and assembled DLD distribution; it does not authorize publication or replace human review of the methodology.

## Requirements

| ID | Intended requirement | Realization / evidence |
| --- | --- | --- |
| V-01 | Enforce TXT-001: maintained text is UTF-8 without BOM and uses LF; exempt binary files. | [RULES.md](../RULES.md), [text validator](check-text-format.ps1) |
| V-02 | Validate extracted source archives as well as Git checkouts, without requiring a Git repository. | Recursive source scan, excluding `.git/`, `build/`, and filesystem links |
| V-03 | Detect good text, BOM, CR, invalid UTF-8, and binary exemptions. | [Local tests](test.ps1) |
| V-04 | Exercise packaging on a temporary fixture without altering repository outputs. | Packaging fixture |
| V-05 | Test reproducible archives, broken-link rejection, and preservation of prior outputs after failed validation. | Packaging tests |
| V-06 | Distinguish automated technical verification from human review of contract/methodology coverage and representative-project adoption validation. | Design review and adoption evidence |
| V-07 | Record outcomes and unverified areas truthfully; never equate a passing build with product usefulness or approval. | Test results and review records |

## Design decisions

- **V-D1:** Checks run locally in PowerShell 7; the current project does not depend on hosted CI.
- **V-D2:** TXT-001 checks maintained sources rather than Git's index, so downloaded source archives work.
- **V-D3:** Run functional packaging tests in a temporary directory; generated release artifacts belong to distribution, not test code.
- **V-D4:** Maintain one compact test script until the test suite warrants separate ownership.

## Acceptance and limitations

`scripts/test.ps1`, `scripts/check-text-format.ps1`, and `scripts/package.ps1` must exit successfully on supported input. Negative tests must fail where intended. Checks should cover the requirements above; any untested condition remains an explicit coverage gap, not an assumed success. Human readability and adoption usefulness require independent review or representative use.

## Reconciliation

The current validator and tests implement part of this scope. This file documents the intended assurance obligations; documented tests are not claims that they ran in the current session.
