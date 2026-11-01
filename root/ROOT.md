# Design-Led Development

Revision: 2
Status: Approved
Approval: The human authorized adopting issue #1's commit checkpoint improvement and releasing the updated method. Revision 1 remains identifiable at tag v0.1.0. This approval does not claim real-project validation.

## Purpose

Present a way to work with AI to realize a project from beginning to end, prioritizing design as the source of truth throughout the process.

## Users and outcomes

The approach serves people developing and maintaining projects with AI. It should help them direct the project through understandable design decisions while delegating realization and verification to AI.

Users receive a copyable starting structure and a working method. Their intended outcome is a working product whose intent, boundaries, and approved decisions remain available for future changes.

## Scope

The current offering consists of four starter documents and a practical lifecycle guide. The starter contains a product README, workflow, rules template, and root design template. The guide explains how to apply them from project setup through delivery and evolution.

This repository also maintains its own design, workflow, rules, version, changelog, and license. The approach is independent of language, framework, and AI provider. It does not promise automatic implementation or synchronization when a document is edited.

## Overall design

Users read the workflow, copy the starter contents into their product repository, and develop the project with AI through its design documents.

The human and AI discuss the design and record decisions at appropriate scopes. The human approves designs; AI implements and verifies approved scope within delegated freedom. This cycle continues through delivery and maintenance.

The starter's root design remains a draft until the product's human approves it. Its rules file demonstrates the format and contains no pre-adopted product requirements.

## Major areas and relationships

- [starter/](../starter/) is the user-facing product material. Its README introduces the resulting product; its workflow defines collaboration; its rules hold specific requirements; its root design establishes product direction.
- [guide/](../guide/README.md) explains application of the workflow through six repeatable stages. It identifies human and AI responsibilities, concrete actions, expected outputs, and readiness to proceed. Its examples and prompts are illustrative; they do not introduce product requirements or claim approval.
- [examples/](../examples/README.md) records what a future complete example should demonstrate. The initial release contains this index only, not a completed example project.
- This [workflow](WORKFLOW.md) defines how we maintain the method repository, and these [rules](RULES.md) hold any adopted repository-specific requirements.
- The repository [README](../README.md) introduces the method and explains adoption.
- [VERSION](../VERSION) identifies the method baseline. [CHANGELOG.md](../CHANGELOG.md) explains changes and adoption.

The repository's `root/` governs this method; `starter/root/` supplies documents for other projects. Their responsibilities and content can differ.

## Shared design decisions

- Design remains the source of truth throughout a project's life.
- The human owns approval; AI actively contributes to design and independently realizes approved scope within delegated boundaries.
- Workflow instructions belong in the workflow. Specific project requirements belong in rules, grouped by topic with stable identifiers and optional exceptions and reasons. Every adopted rule applies.
- Templates are starting points, not approvals or mandatory large forms.
- The method version is this repository's product version. Design revisions advance independently, as do versions of products built using the method.
- AI suggests proportionate commit checkpoints for coherent design baselines, verified implementation increments, and focused corrections. Suggestions identify the intended scope and preserve unrelated work. A suggestion does not authorize a commit; design approval, verification, release, and permission to push remain separate.

## Success criteria

- Users can locate and copy the four starter documents without relying on additional materials.
- Users can follow the guide from project setup through delivery, maintenance, and method updates. The guide references the starter's conventions and remains optional to copy into products.
- The workflow explains the complete cycle from initial design through delivery and evolution.
- Document responsibilities are distinct and consistent across the README, starter, and repository governance.
- Placeholder content cannot reasonably be mistaken for adopted rules or approved product design.
- Local links resolve within the repository's defined contents and method version references agree.
- The changelog reflects actual changes without inventing releases or approval history.

## Open questions

- What refinements become necessary when applying the starter to a real project?
- What evidence will establish that the method is ready for a stable 1.0.0 release?
