# 2. Define the foundation design

Develop `foundation/DESIGN.md` through conversation. It is the project's top-level design and should explain what the product is meant to become.

**Human:** Choose the purpose, priorities, boundaries, and intended outcomes.

**AI:** Ask focused questions, compare alternatives, expose conflicts, and write the emerging design. Do not fill consequential gaps with invented decisions.

## Start with purpose and outcomes

Explain the problem in the user's terms before deciding how to build it. A useful opening prompt is:

> Help me define the project in foundation/DESIGN.md. Start with the problem, intended users, and outcomes. Identify what we know and the decisions we still need to make.

For a lending service, an outcome might be that members can see their active loans and request an eligible renewal. Questions about eligibility, dates, and confirmation can then be assigned to more detailed scopes.

## Work through the root template

| Section | What to establish |
| --- | --- |
| Purpose | Why the product should exist. |
| Users and outcomes | Who it serves and what they should achieve. |
| Scope | What is included and explicitly excluded. |
| Overall design | How the product works and the intended experience. |
| Major areas and relationships | Responsibilities and how they work together. |
| Shared design decisions | Decisions governing several areas, including consequential technical choices. |
| Success criteria | Observable evidence that the whole product fulfills its purpose. |
| Open questions | Decisions that remain unresolved. |

Use the amount of detail needed for the next decisions. Leave detailed contracts and screen behavior to their own scopes. Reference adopted rules rather than copying them into the design.

## Establish an approved baseline

Ask AI to summarize the proposed revision, its scope, and consequential open questions. Resolve the questions that block the next work; identify deferred questions and their boundaries explicitly.

The human can approve an identified revision or an explicit part of it. Record the exact approved scope and revision so the approval can be understood in a later session. If only part is approved, move the remainder to a separately identified pending revision; use `Status: Mixed` while approved and draft sections coexist.

Keep draft annotations only in unapproved sections. After actual approval, follow the [final-state writing and approval sweep](06-evolve-the-project.md#final-state-writing), including the recoverable prior baseline and identifiable final-state commit. Never convert a draft marker into historical prose inside the design body.

Keep implementation progress separate. Approval means the design may be realized; it does not mean the product exists or has passed verification.

## Ready to continue

You should have enough approved direction to select a useful first increment. You do not need to resolve every future feature.

Next: [Develop detailed designs](03-develop-detailed-designs.md).
