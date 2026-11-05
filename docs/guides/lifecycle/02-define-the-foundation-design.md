# 2. Define the foundation design

**Goal:** Establish enough project-wide design to direct the next useful increment.

**Human:** Decide the project's purpose, outcomes, boundaries, and consequential constraints.

**AI:** Compare options, identify dependencies and unresolved decisions, and maintain an accurate draft.

## Start with the problem

In `foundation/DESIGN.md`, distinguish the problem and intended outcomes from implementation ideas. Ask AI to identify what must be decided now versus later.

> Help me develop the project's foundation DESIGN. Start with its purpose, users, intended outcomes, and scope. Record unresolved consequential questions without treating proposals as approvals.

## Use the current template

The starter organizes the draft around **Purpose**, **Users and intended outcomes**, **Scope**, **Intended behavior**, **Responsibilities and relationships**, **Constraints and shared decisions**, **Acceptance criteria**, and **Open questions**. These are helpful design topics, not a requirement to fill every section before doing useful work.

Keep whole-project decisions here. Place detailed behavior and contracts at their nearest owning design scopes. Reference project RULES rather than copying adopted constraints.

## Identify the approved scope

When the draft can responsibly guide an increment, present its consequential decisions and unresolved questions to the human. Record approval only for the scope and revision actually approved. Keep unresolved or partly approved material explicitly Draft or Mixed. The authoritative [Core approval procedure](../../../foundation/CORE.md#6-design-states-and-approval) governs revision records, approval sweeps, and baseline commits.

Approval does not imply implementation or verification.

## Outcome

The project has an identifiable approved direction for its next increment, while unrelated decisions can remain open.

**Continue:** [Develop scoped designs](03-develop-detailed-designs.md).
