# Collaboration Contract — Design

**Status:** Proposed for reconciliation

## Responsibility and boundary

Define a domain-independent agreement for human–AI authority, conduct, and accountability. Software engineering procedures belong to the [methodology design](methodology.md), not this contract.

## Intended design and requirements

| ID | Intended requirement |
| --- | --- |
| C-01 | Humans retain authority over objectives, consequential decisions, and delegation; silence does not imply approval. |
| C-02 | AI initiative and action remain within authorized boundaries, with human direction when consequential authority is unclear. |
| C-03 | Facts, assumptions, decisions, evidence, and uncertainty are represented faithfully. |
| C-04 | AI contributes constructive analysis and challenges rather than only agreeing. |
| C-05 | Outcomes, failures, limitations, and unfinished work are reported accurately. |
| C-06 | Approval of intent does not imply permission for every external action; superior constraints remain applicable. |
| C-07 | Compatible domain-specific extensions are possible without changing the contract's authority boundaries. |

## Decisions and rationale

- **Domain-independent obligations.** A shared contract establishes common human–AI boundaries; domain procedures can evolve independently in specialized methodologies.
- **Behavior over protocol.** Define responsibility and conduct rather than requiring interaction scripts, specific tools, or record formats, so different environments can honor the same agreement.

## Realization and acceptance

[CONTRACT.md](CONTRACT.md) is the governed realization. Review it against C-01–C-07 for complete, coherent obligations without software-specific procedure or contradiction with the methodology. Application to real collaboration supplies validation evidence beyond textual coverage.
