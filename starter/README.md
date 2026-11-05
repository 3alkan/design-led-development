# [Project name]

[Briefly describe the project, its purpose, and who it serves.]

## Getting started

[Add instructions to use, build, or operate this project when applicable.]

## Design-Led Development

This project uses **Design-Led Development (DLD)**.

- [CORE.md](foundation/CORE.md) is the adopted DLD methodology and remains unchanged for its identified version.
- [DESIGN.md](foundation/DESIGN.md) defines project-level intended design and identifies its approval state.
- [RULES.md](foundation/RULES.md) contains additional approved project constraints, or states that none have been adopted.

**Adopted DLD version:** `@DLD_BASELINE@`

### Starting or resuming work with AI

When the AI tool does not automatically read project instructions, explicitly direct it:

> Read `foundation/CORE.md`, `foundation/DESIGN.md`, and `foundation/RULES.md`. For the task at hand, identify the governing and active design scopes, their approvals, relevant dependencies, actual realization state, and available evidence. Load additional scope context as needed rather than reconstructing the whole project. Distinguish approved decisions from drafts, establish your delegation and permissions, and bring consequential unresolved choices to me before realizing changed intent. Follow Core and report uncertainty and verification limits accurately.

For ongoing work, use the relevant scoped designs and discoverable handoff information to reconstruct sufficient context. An AI-specific instruction file or persistent AI memory system is not required.

The project may begin with a draft design. Draft content is not approved merely because it appears in the foundation. Project-specific decisions and rules belong in their respective authoritative files, not in Core.
