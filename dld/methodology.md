# Methodology Scope — Design

**Status:** Proposed for reconciliation

## Responsibility and boundary

Define a design-authoritative, human-governed, AI-assisted method for the complete software engineering lifecycle, under the [contract design](collaboration.md). The deliverable is [DLD.md](DLD.md), not the project-specific designs that adopters create.

## Intended design and requirements

| ID | Intended requirement | Product realization |
| --- | --- | --- |
| M-01 | Make approved abstract design authoritative over intended engineering outcomes; keep realizations and observations as evidence. | §1 |
| M-02 | Support sufficient incremental design, without a required tool, technology, repository layout, or sequential lifecycle model. | §§1, 4, 7 |
| M-03 | Define project, scope, design, realization, and evidence with discoverable ownership and dependencies. | §2 |
| M-04 | Require one coherent owning scope for each decision; place shared decisions at their narrowest suitable ancestor, honor inherited decisions, and preserve cross-scope dependency links. | §2 |
| M-05 | Define when changed intent is consequential and requires authorized human approval before realization; permit bounded local execution. | §3 |
| M-06 | Preserve distinguishable proposals, approval records identifying approver/content/scope/revision, and recoverable baselines. | §3 |
| M-07 | Permit project-owned binding rules subject to compatible, recorded approval. | §3 |
| M-08 | Cover planning through retirement with proportionate, recurring understand–design–decide–realize–verify/validate–report/evolve responsibilities. | §4 |
| M-09 | Require implementation alignment with approved intent and assess affected scopes before propagating consequential changes. | §5 |
| M-10 | Distinguish verification from validation; tie claims to identifiable evidence and disclose unperformed checks. | §5 |
| M-11 | Establish sufficient context progressively and preserve relevant handoff records without granting authority to summaries or memory. | §6 |
| M-12 | Support incremental new-project adoption and scope-wise reconciliation of existing projects; require deliberate method upgrades. | §7 |
| M-13 | Require every maintained realization to have an identifiable governing design, allowing one design to cover multiple artifacts or a justified file-level scope. | §2 |
| M-14 | Favor scope-local design placement and meaningful names; do not prescribe a physical hierarchy, suffix, or document count. | §2 |
| M-15 | Require sufficient approved design before consequential realization while allowing authorized exploration and prototypes. | §§1, 3 |
| M-16 | Support progressively deeper decomposition only when independent responsibility or change isolation warrants it. | §2 |
| M-17 | Require sufficient scope identity, intended outcomes, consequential decisions with rationale, governed realizations, and conformity criteria, allowing inheritance and references without mandatory document format. | §2 |
| M-18 | Favor a single identifiable source for maintained facts, configuration, rules, and decisions, with references or consumption rather than competing copies; allow justified duplication with consistency checks. | §2 |

## Decisions and rationale

- **M-D1:** The methodology specializes, rather than duplicates, the general contract.
- **M-D2:** Use coherent responsibility scopes as the unit of ownership, with cross-scope dependencies rather than duplicated shared decisions. This keeps authority local where possible without hiding effects across scopes.
- **M-D3:** Do not prescribe an approval-record tool: approval must be traceable and recoverable, but a mandatory service or file format would burden projects with different workflows.
- **M-D4:** Use one recurring engineering cycle across the SDLC because the same design, decision, realization, and evidence responsibilities recur regardless of sequential or iterative delivery.
- **M-D5:** Supporting materials and the editable registry assist adoption but do not impose methodology obligations.
- **M-D6:** Keep designs close to realizations when practical. Meaningful document names are preferred over obligatory `DESIGN` filenames or `.design` suffixes; ownership and references establish authority.
- **M-D7:** Do not require a design file for every implementation file: design scope follows independent responsibility and change isolation, avoiding documentation whose ownership adds no value.
- **M-D8:** Standardize design information sufficiency, not document presentation; offer a minimal-core, expandable Markdown example as optional guidance.
- **M-D9:** Minimize independently maintained truths without flattening design intent, normative obligations, and realization into one artifact. Context registries provide discovery and do not replace authoritative sources.

## Realization and acceptance

Review each requirement against the corresponding section of [DLD.md](DLD.md). Confirm that approval, design authority, ownership, evidence, change impact, and continuity remain operationally understandable. A representative adopting-project exercise is required to validate usefulness; textual coverage alone is verification, not validation.

