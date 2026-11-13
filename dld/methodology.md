# DLD Methodology — Design

**Status:** Proposed for reconciliation

## Responsibility and boundary

Define a design-authoritative, human-governed, AI-assisted approach across the software engineering lifecycle. The method operates under the [collaboration contract](CONTRACT.md); projects adopting it retain authority over their own designs and rules.

## Intended design and requirements

| ID | Intended requirement |
| --- | --- |
| M-01 | Approved abstract design governs intended engineering outcomes; realizations and observations provide evidence, not replacement authority. |
| M-02 | Design may evolve incrementally without requiring a technology, tool, repository layout, or sequential lifecycle. |
| M-03 | Projects and responsibility scopes have identifiable design, realization, evidence, ownership, and dependencies. |
| M-04 | Decisions have coherent owners; inherited and cross-scope effects remain discoverable without competing authority. |
| M-05 | Consequential changes require authorized human decisions, while bounded AI execution remains possible. |
| M-06 | Proposed and approved intent remain distinguishable, with discoverable approval and recoverable baselines. |
| M-07 | Projects may govern additional compatible binding rules through authorized decisions. |
| M-08 | Planning through retirement is supported by proportionate, recurring engineering responsibilities. |
| M-09 | Realizations remain aligned with approved intent; consequential changes consider affected scopes. |
| M-10 | Conformance and suitability are evaluated distinctly, with claims tied to evidence and limitations disclosed. |
| M-11 | Relevant authoritative context and material handoff knowledge remain discoverable without relying on summaries as authority. |
| M-12 | New and existing projects can adopt and evolve DLD deliberately and incrementally. |
| M-13 | Every maintained realization has an identifiable governing design, which may cover multiple artifacts. |
| M-14 | Design ownership is discoverable without imposing mandatory filenames, placement, or document counts. |
| M-15 | Consequential realization follows sufficient approved design; authorized exploration does not itself establish approval. |
| M-16 | Design decomposition follows genuine differences in responsibility and change impact. |
| M-17 | Scope design sufficiently communicates responsibility, intent, governing decisions, realizations, and evaluation criteria without prescribed presentation. |
| M-18 | Maintained information has an identifiable source of authority, with proportionate treatment of necessary copies. |

## Decisions and rationale

- **Methodology complements the contract.** Engineering responsibilities specialize general human–AI boundaries without duplicating them.
- **Responsibility-based ownership.** Coherent scopes and discoverable dependencies allow decisions to remain local while shared constraints govern affected work.
- **Tool-independent authority.** Human approval must be attributable and recoverable, but no particular approval tool or record format is essential.
- **Recurring lifecycle responsibilities.** Understanding, design, decisions, realization, and evaluation recur regardless of delivery process; a mandatory sequence would limit applicability.
- **Proportionate design granularity.** Designs should cover responsibilities, not automatically mirror implementation files. Names, locations, and decomposition remain adaptable.
- **Information sufficiency over templates.** Designs must convey enough to govern work; optional examples help without imposing documentation machinery.
- **Distinct authorities.** Design, realization, evidence, and context discovery serve different purposes. Repeating maintained truths across them creates unnecessary reconciliation work.

## Realization and acceptance

[DLD.md](DLD.md) is the authoritative methodology realization. Review M-01–M-18 against its sections on purpose, ownership, decisions, lifecycle, alignment, continuity, and adoption. Confirm that requirements are coherent with the [contract](CONTRACT.md) and that consequential authority is unambiguous. Representative adoption in a software project is needed to assess practical usefulness; textual coverage alone establishes neither approval nor validation.
