# [Project name]

[State the project's purpose and intended users in a few sentences.]

## Getting started

[Add only the setup, usage, or operational instructions that are currently needed.]

## Design-Led Development

This project follows **Design-Led Development (DLD)**.

| Foundation file | Responsibility |
| --- | --- |
| [CORE.md](foundation/CORE.md) | The unchanged, adopted DLD methodology. |
| [DESIGN.md](foundation/DESIGN.md) | Project-level intended design, owning scopes, and approval state. |
| [RULES.md](foundation/RULES.md) | Additional human-approved project rules, or a statement that none exist. |

**Adopted DLD version:** `@DLD_BASELINE@`

The README provides navigation; it does not establish independent methodological or design authority. Draft designs and proposed rules are not approved simply because they are present in the repository.

### Working with AI

At the start of a new or resumed AI session, ensure the AI has read the foundation. When the tool does not automatically discover project instructions, explicitly provide this direction:

> Read `foundation/CORE.md`, `foundation/DESIGN.md`, and `foundation/RULES.md`. Follow the adopted DLD Core. Establish the task's active scope, applicable governing designs, approvals, constraints, current realization, available evidence, and actual delegation and permissions. Load relevant dependencies progressively; do not reconstruct unrelated project history. Distinguish approved intent from drafts, missing decisions, and legacy behavior. Propose consequential changes for human approval before realizing them. Report completed work, verification limits, and unresolved matters truthfully.

For ongoing work, consult scoped designs and discoverable handoff information relevant to the task. Handoffs and AI memory assist navigation but do not override approved design or actual project state.

### Adopting and evolving the project

Start with a draft project design and approve consequential intent only when ready. Existing projects may reconcile their implementation with authoritative design one scope at a time. Add scoped designs and supporting artifacts when their responsibilities justify them; no additional DLD folder scaffold is required.

Keep the adopted Core unchanged until a deliberately authorized methodology upgrade. Record project-specific design decisions in their owning designs and additional approved constraints in RULES.
