# DLD Fundamentals

## Purpose

Design-Led Development (DLD) defines how people and AI collaborate to engineer software throughout its **complete lifecycle**. It is an engineering methodology, not a programming framework, repository generator, rigid phase gate, or claim of compliance with a specific standard.

DLD is informed by established software engineering knowledge and practices, including SWEBOK and relevant ISO/IEC/IEEE lifecycle guidance. Projects select suitable techniques and evidence; DLD does not require a standards crosswalk or an exhaustive up-front design.

## The source of truth

The project's **authoritative abstract design** expresses what the project is intended to be: intent, needs, requirements, constraints, relationships, structure, behavior, approved decisions, and lifecycle-relevant knowledge. Design is logically connected across appropriate ownership scopes; it need not reside in one physical directory.

Implementations, configuration, tests, documentation, deployments, and lifecycle records are realizations or evidence related to that design. They can reveal a problem in the design, but cannot silently redefine approved intent. One design decision has one authoritative owner; other scopes reference it.

## Human and AI roles

- **Human:** Defines aims, priorities, acceptable outcomes, and boundaries; approves or rejects consequential design decisions and delegation.
- **AI:** Clarifies, challenges, compares alternatives, proposes and records design changes; independently realizes and verifies approved work within delegated limits; reports evidence and discrepancies.
- **Together:** Inspect the current project state, identify the next useful scope, resolve relevant uncertainty, and keep the abstract design and concrete artifacts consistent.

Approval belongs to the human. AI cannot approve its own proposal. A decision that changes approved behavior, scope, interfaces, constraints, or ownership returns to the human. AI need not request permission for each local realization choice already delegated by an approved design.

## Working across the lifecycle

DLD applies to conception and feasibility; needs and requirements; architecture and detailed design; implementation and integration; verification and validation; delivery and release; deployment and operation; maintenance and change; evolution and retirement. These are **responsibilities**, not a mandatory linear sequence. Feedback at any point may trigger a proposed design revision.

An incremental cycle is: **understand → propose design → human decision/approval → realize → verify/validate → learn/evolve**. Small approved scopes can proceed while other decisions remain open. Approval status, implementation progress, verification, and authorization to publish are distinct.

## Project operating documents

- `foundation/DESIGN.md` — project-wide abstract design and its approval status, linking narrower owned scopes.
- `foundation/WORKFLOW.md` — human–AI working protocol, including handling approvals, realization, verification, and continuity.
- `foundation/RULES.md` — specifically adopted project constraints, not a second copy of the design.
- `README.md` — ordinary project introduction and instructions to start a DLD session.

The starter provides these operating documents. Product users copy the **starter contents**, not the whole DLD guide. AI must be deliberately directed to read the files at the start of a session unless the chosen tool has been configured to do so.

## Repository architecture

DLD's [reference repository layout](reference-repository-layout.md) is a broad, selectively adoptable responsibility catalogue. Place each artifact with the nearest appropriate owning scope, co-locating designs and realizations where meaningful; use ecosystem-native conventions where appropriate. There is no mandatory global `design/` area. Generated `build/` and `dist/` are distinct and normally untracked. A directory exists when its engineering responsibility justifies it.

## Change, evidence, and history

Approved design documents describe the current design rather than embedding revision narratives. Keep identifiable approvals, source baselines, verification evidence, and records of unresolved changes. Do not manufacture human approvals or claim a successful release from a Git tag alone. Adopting a new DLD version is a deliberate project change, not an automatic replacement of its foundation.
