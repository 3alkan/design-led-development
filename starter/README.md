# [Project name]

[Briefly describe the project, its intended users, and its purpose.]

## Getting started

[Provide the instructions needed to set up, run, or use the project.]

## Development with DLD

This project follows **Design-Led Development (DLD)**.

- [CORE.md](foundation/CORE.md) defines the adopted, versioned DLD methodology.
- [DESIGN.md](foundation/DESIGN.md) defines this project's design, including its approval state.
- [RULES.md](foundation/RULES.md) records additional project-specific constraints, if any.

At the start of each new or resumed AI session, explicitly instruct AI:

> Read `foundation/CORE.md`, `foundation/RULES.md`, and `foundation/DESIGN.md`. Read applicable scoped designs and inspect the current project state. Distinguish approved decisions from drafts, follow DLD Core, and discuss consequential design changes before realizing them.

AI tools may not discover these documents automatically. The foundation contains the project's working authority within applicable tool instructions and permissions; no AI-specific instruction file is required.

**Adopted DLD version:** `@DLD_BASELINE@`

The adopted Core remains unchanged for that version. Project-specific decisions belong in DESIGN and RULES, not in Core.
