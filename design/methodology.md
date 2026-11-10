# Methodology Scope — Design

**Status:** Proposed for reconciliation

## Intent and boundary

Define a design-authoritative, human-governed, AI-assisted method for the complete software engineering lifecycle, under the [contract design](contract.md). The deliverable is [DLD.md](../dld/DLD.md), not the project-specific designs that adopters create.

## Requirements

| ID | Intended requirement | Product realization |
| --- | --- | --- |
| M-01 | Make approved abstract design authoritative over intended engineering outcomes; keep realizations and observations as evidence. | §1 |
| M-02 | Support sufficient incremental design, without a required tool, technology, repository layout, or sequential lifecycle model. | §§1, 4, 7 |
| M-03 | Define project, scope, design, realization, and evidence with discoverable ownership and dependencies. | §2 |
| M-04 | Require one owning scope per authoritative decision, including shared decisions. | §2 |
| M-05 | Define when changed intent is consequential and requires authorized human approval before realization; permit bounded local execution. | §3 |
| M-06 | Preserve distinguishable proposals, approval records identifying approver/content/scope/revision, and recoverable baselines. | §3 |
| M-07 | Permit project-owned binding rules subject to compatible, recorded approval. | §3 |
| M-08 | Cover planning through retirement with proportionate, recurring understand–design–decide–realize–verify/validate–report/evolve responsibilities. | §4 |
| M-09 | Require implementation alignment with approved intent and assess affected scopes before propagating consequential changes. | §5 |
| M-10 | Distinguish verification from validation; tie claims to identifiable evidence and disclose unperformed checks. | §5 |
| M-11 | Establish sufficient context progressively and preserve relevant handoff records without granting authority to summaries or memory. | §6 |
| M-12 | Support incremental new-project adoption and scope-wise reconciliation of existing projects; require deliberate method upgrades. | §7 |

## Design decisions

- **M-D1:** The methodology specializes, rather than duplicates, the general contract.
- **M-D2:** Conceptual scopes are responsibility boundaries; folder layout and filenames are not normative.
- **M-D3:** Design approval is scoped and recorded, but no particular approval-record tool is imposed.
- **M-D4:** One recurring engineering cycle spans SDLC responsibilities instead of prescribing Waterfall or Agile.
- **M-D5:** Supporting materials and the editable registry assist adoption but do not impose methodology obligations.

## Acceptance

Review each requirement against the corresponding section of [DLD.md](../dld/DLD.md). Confirm that approval, design authority, ownership, evidence, change impact, and continuity remain operationally understandable. A representative adopting-project exercise is required to validate usefulness; textual coverage alone is verification, not validation.

## Reconciliation

These requirements express intended behavior inferred from the current implementation and earlier approved high-level project principles. Their detailed scope remains proposed until explicit approval.
