# Understand and Use DLD

**Design-Led Development (DLD)** is a design-centered method for humans and AI to develop and evolve software together. Its central idea is that **approved abstract design governs what a project intends to do**, while implementation and evidence show what has actually been realized.

The [DLD Core](../foundation/CORE.md) is the complete authoritative specification. **Nothing in this documentation is required to comply with DLD.** These pages explain, illustrate, and help you apply the Core; they do not add rules.

## Choose a starting point

| If you want to… | Read |
| --- | --- |
| Understand the method itself | [DLD Core](../foundation/CORE.md) |
| Begin a new project or introduce DLD to an existing one | [Adopt DLD](adopt.md) |
| See how a human and AI work through an actual increment | [Work with DLD](work.md) |
| Decide where designs and implementation artifacts belong | [Organize a project](organize.md) |
| Improve the DLD methodology and its distributions | [Contribute to DLD](contribute.md) |

A good first reading is **Core → Adopt → Work**, but readers can start with the question relevant to them. The pages are independent learning resources, not a mandatory workflow.

## The mental model

- **Intent:** People and AI develop abstract designs, but humans approve consequential intended outcomes.
- **Ownership:** Decisions have identifiable design owners, organized by engineering responsibility.
- **Realization:** Implementation choices may be delegated within approved design and permissions.
- **Evidence:** Verification and validation assess claims about the result; findings can lead to corrections or new design proposals.
- **Continuity:** Participants resume from sufficient authoritative context for their current scope, rather than reconstructing an entire mature project.

For detailed boundaries, approval rules, and requirements, consult Core rather than treating this summary as an alternative specification.

## What is included when adopting

A DLD starter supplies a project README and `foundation/{CORE,DESIGN,RULES}.md`. That foundation is sufficient to practice the method. Supporting documentation can be consulted separately or copied from a version-matched optional overlay into a project's `docs/dld/` directory.

The adopted Core is unchanged for its version. A project's own DESIGN and RULES are different documents with different authority. Neither these guides nor examples can approve project choices on behalf of a human.
