# 2. Develop Project-Level Intent

**Optional learning chapter.** The project-level design describes governing intent; it does not need to settle every future engineering choice.

## Begin with purpose and boundaries

In `foundation/DESIGN.md`, consider the project's purpose, intended users, outcomes, scope, constraints, significant responsibilities, and how success would be recognized.

For a simple application, a draft might say it should accept a defined form from applicants and let an authorized reviewer inspect submissions. Which authentication system and hosting platform to use may remain open.

A practical AI request:

> Help me refine the project's draft DESIGN into clear intended outcomes, requirements, and project boundaries. Identify assumptions separately from approved decisions. Compare consequential options before asking me to choose.

## Separate owners and decisions

Keep project-wide governing choices in the foundation design. A detailed submission-validation rule may belong to a later form scope; a rule governing every submission may belong at a shared project-level responsibility.

Avoid duplicating the same authoritative decision in both places. References and explanations can repeat its context, not create a second source of approval.

## Approve a bounded increment

When enough design exists to direct work, present the proposed consequential content and its meaningful impact. A human may accept only the clearly identified portion necessary for the current increment.

The actual approval must identify the approving human, scope, revision, and content. Record it truthfully and preserve an identifiable recoverable baseline; a commit or an AI-generated heading is not approval. Unresolved parts remain proposals.

Refer to [Core's design governance](../../../foundation/CORE.md#6-design-governance) for the binding rules.

## What the increment achieves

One sufficiently defined and approved boundary can guide the next scope of work. Other parts of the project remain open without blocking unrelated approved work.

**Next example:** [Refine owned scopes](03-develop-detailed-designs.md).
