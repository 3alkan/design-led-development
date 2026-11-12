# Release Governance — Design

**Status:** Proposed for reconciliation

## Responsibility and boundary

Govern DLD distribution identity, release history, licensing policy, and authority to publish. Distribution assembly and technical assurance belong to their own scopes; repository organization and development conventions belong to the [project design](DESIGN.md).

## Intended design and requirements

| ID | Intended requirement |
| --- | --- |
| R-01 | Identify each DLD distribution by one authoritative version, independent of the versions of adopting projects. |
| R-02 | Apply a consistent, recognizable release-version and tag convention. Select version changes proportionately to their effect on adopted behavior and compatibility, especially changes to normative obligations. |
| R-03 | Preserve an accurate, discoverable history of releases without rewriting historical terms or outcomes. |
| R-04 | Keep licensing terms authoritative and discoverable; retain applicable third-party terms and subject consequential licensing changes to human approval. |
| R-08 | Distinguish design approval, integration, verified assembly, and publication authority. A successful build does not itself grant permission to publish; one authorization may cover multiple actions when its scope is explicit. |

## Decisions and rationale

- **Unified distribution identity.** Contract and methodology are released together so adopters can identify one coherent DLD baseline rather than coordinate component versions.
- **Proportionate versioning.** Use SemVer-style identifiers and `v`-prefixed tags for recognizable releases; assess the compatibility significance of normative changes rather than treating every edit alike.
- **Single legal authority.** Keep the [license](LICENSE) as the source of legal terms and avoid duplicate per-file declarations that would require synchronization.
- **Publication as an authorized action.** Require release authorization independently of technical success, without prescribing separate approval ceremonies for each step.

## Realization and acceptance

The current identity, release record, and licensing terms are maintained in [VERSION](VERSION), [CHANGELOG.md](CHANGELOG.md), and [LICENSE](LICENSE). Release tags identify published baselines. The [distribution design](scripts/assembly.md) governs package contents and assembly; the [assurance design](scripts/quality.md) governs technical checks.

A release is ready to publish when its version and history agree with the intended baseline, licensing obligations are addressed, relevant verification and limitations are reported, and publication is authorized. Claims of completed verification or publication require evidence.
