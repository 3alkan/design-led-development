# Design-Led Development

**Status:** Draft

## Purpose

Design-Led Development (DLD) is a design-centered, human-authoritative, AI-assisted software engineering methodology applicable across the software development lifecycle. It builds upon the [Human–AI Collaboration Contract](CONTRACT.md), without changing or contradicting it.

## Governing idea

**Approved abstract design governs intended engineering outcomes.** Existing implementation and observations are evidence of the current state, not automatic authority over intended behavior. Design only as much as is needed for the active work; refine and extend it as the project evolves.

## Design and ownership

Design expresses intended outcomes, requirements, behavior, architecture, interfaces, constraints, and decisions. It may be organized in project-level or scoped documents wherever their responsibilities justify. Each consequential design decision must have an identifiable owner and distinguishable approval state. DLD mandates neither one universal repository structure nor one prescribed technology.

## Human authority and AI work

Humans determine and approve consequential design intent, and set delegation boundaries. AI may investigate, challenge, propose, implement, and assess within authorized boundaries. A consequential change establishes or materially changes intended outcomes, requirements, interfaces, constraints, responsibilities, or delegated authority.

Propose consequential changes for human decision **before realizing changed intent**. Silence, proposals, commits, and observed behavior are not approvals. Preserve discoverable records of approved scope and content, and enough history to recover applicable approved intent. Keep unresolved proposals visibly separate.

## Recurring engineering responsibilities

For relevant work, participants should establish governing design and context; develop or refine proposed design; obtain necessary decisions; realize authorized work; verify conformance and validate outcomes; and report results and outstanding gaps. These responsibilities recur and overlap. They are **not mandatory sequential phases** or a fixed recipe.

Realization must align with approved intent. When it does not, correct the realization or propose a design revision rather than silently treating the implementation as the new design. Examine impacts on relevant neighboring and dependent scopes before consequential changes.

## Evidence and continuity

Support claims about completion, correctness, and conformance with proportionate, identifiable evidence. Report what was checked, what was not checked, failures, and uncertainty accurately. Keep governing design, open decisions, incomplete work, and relevant findings discoverable across handoffs.

## Adoption

An adopting project treats its distributed CONTRACT and DLD copies as unchanged until deliberately adopting a newer version. Project design, knowledge, and compatible additional constraints remain project-owned. [Supporting materials](supporting/) are optional suggestions only; they do not establish methodological requirements.
