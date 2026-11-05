# Design-Led Development

- Revision: 6
- Status: Draft
- Approval: Rev 3 approved by human (date not recorded).
- Approval: Rev 4 approved by human 2026-11-03.
- Approval: Rev 5 approved by human 2026-11-03.

## Purpose

Design-Led Development (DLD) is a design-centered, human-authoritative, AI-assisted software engineering methodology defining how humans and AI collaborate throughout the complete software project lifecycle. The project is the enduring engineering subject; implementations and other concrete artifacts are realizations of, or evidence associated with, its authoritative abstract design.

## Users and outcomes

The approach serves people developing and maintaining projects with AI. It should help them direct the project through understandable design decisions while delegating realization and verification to AI.

Users receive a copyable starting structure and a working method. Their intended outcome is a working product whose intent, boundaries, and approved decisions remain available for future changes.

## Scope

DLD covers software project conception, requirements, architecture, design, realization, verification, validation, delivery, operation, maintenance, evolution, and retirement. These are lifecycle responsibilities, not prescribed sequential stages. The abstract project design is the authoritative, evolving representation of intent, requirements, structure, behavior, constraints, decisions, and lifecycle-relevant knowledge. Evidence can challenge design and prompt human-approved revision.

DLD draws on established software engineering knowledge and standards, including SWEBOK and applicable ISO/IEC/IEEE standards, without claiming mandatory conformance or requiring formal standards mappings.

The current offering consists of four starter documents and a practical lifecycle guide. The starter contains a product README, workflow, rules template, and foundation design template. The guide explains how to apply them from project setup through delivery and evolution.

This repository also maintains its own design, workflow, rules, version, changelog, and license. The approach is independent of language, framework, and AI provider. It does not promise automatic implementation or synchronization when a document is edited.

## Overall design

Human beings decide and approve consequential design choices; AI analyzes, challenges, and proposes. Once the applicable abstract design is approved, AI may autonomously realize and verify delegated work within the agreed constraints. A consequential change to approved design returns to human decision and approval.

DLD provides one comprehensive, selectively adoptable reference repository layout, organized by engineering responsibility and nearest appropriate ownership. Each authoritative decision has a single owning scope. The reference is described in [the repository architecture guide](../guide/reference-repository-layout.md). Projects can adopt applicable portions and justified ecosystem-native extensions; implementation structure does not determine design authority.

The development repository and the DLD distributions are separate: one project version and release tag identifies a stabilized source baseline and two outputs, a development distribution and a product distribution. A tag by itself is not verification or approval.

Users read the workflow, copy the starter contents into their product repository, and develop the project with AI through its design documents.

The human and AI discuss the design and record decisions at appropriate scopes. The human approves designs; AI implements and verifies approved scope within delegated freedom. This cycle continues through delivery and maintenance.

The starter's foundation design remains a draft until the product's human approves it. Its rules file demonstrates the format and contains no pre-adopted product requirements.

## Major areas and relationships

- [starter/](../starter/) is the user-facing product material. Its README introduces the resulting product; its workflow defines collaboration; its rules hold specific requirements; its foundation design establishes product direction.
- [guide/](../guide/README.md) explains application of the workflow through six repeatable stages. It identifies human and AI responsibilities, concrete actions, expected outputs, and readiness to proceed. Its examples and prompts are illustrative; they do not introduce product requirements or claim approval.
- [examples/](../examples/README.md) records the requirements for a complete example; no completed example project is currently included.
- This [workflow](WORKFLOW.md) defines how we maintain the method repository, and these [rules](RULES.md) hold any adopted repository-specific requirements.
- The repository [README](../README.md) introduces the method and explains adoption.
- [VERSION](../VERSION) identifies the method baseline. [CHANGELOG.md](../CHANGELOG.md) explains changes and adoption.

The repository's `foundation/` governs this method; `starter/foundation/` supplies documents for other projects. Their responsibilities and content can differ.

## Shared design decisions

- Design remains the source of truth throughout a project's life.
- The human owns approval; AI actively contributes to design and independently realizes approved scope within delegated boundaries.
- Workflow instructions belong in the workflow. Specific project requirements belong in rules, grouped by topic with stable identifiers and optional exceptions and reasons. Every adopted rule applies.
- Templates are starting points, not approvals or mandatory large forms.
- The method version is this repository's product version. Design revisions advance independently, as do versions of products built using the method.
- AI suggests proportionate commit checkpoints for coherent design baselines, verified implementation increments, and focused corrections. Suggestions identify the intended scope and preserve unrelated work. A suggestion does not authorize a commit; design approval, verification, release, and permission to push remain separate.
- The project root and its `foundation/` directory are distinct. The latter holds project-wide workflow, rules, and top-level design; other scopes do not automatically belong inside it. Folder hierarchy normally expresses design hierarchy, with designs beside their realization and nested designs inheriting applicable ancestor constraints. Technical wrapper folders do not need a design merely because they contain other scopes.
- For a responsibility spanning branches, use an existing common ancestor's design if the decision belongs at its level. Otherwise, a focused shared design may live separately, for example under `design/`. This is a cross-branch exception, not general freedom of placement. Each narrower branch design references the shared design and respects both shared and applicable local ancestor constraints; conflicts return to discussion. The shared design identifies participating branches. Each decision has one owner, and moves preserve decisions, approvals, and references.

- Approved design bodies describe current decisions in final-state voice; Git commits identify approved baselines and preserve superseded wording. Design-specific tags are not required; release tags identify published versions. Approval procedures belong in [WORKFLOW.md](WORKFLOW.md), while extended audit findings stay outside authoritative design bodies.

## Success criteria

- Users can locate and copy the four starter documents without relying on additional materials.
- Users can follow the guide from project setup through delivery, maintenance, and method updates. The guide references the starter's conventions and remains optional to copy into products.
- The workflow explains the complete cycle from initial design through delivery and evolution.
- Document responsibilities are distinct and consistent across the README, starter, and repository governance.
- Placeholder content cannot reasonably be mistaken for adopted rules or approved product design.
- Local links resolve within the repository's defined contents and method version references agree.
- The changelog reflects actual changes without inventing releases or approval history.
- Every approved design baseline can be identified and recovered from an authorized Git commit without requiring a design-specific tag.

## Pending changes — Draft revision 6

All substantive changes in revision 6 are proposed and are **not yet authoritative**. This revision proposes the agreed F1–F4 philosophy and R1–R15 repository direction, including the naming migration and reference layout. Human approval of this exact repository revision has not yet been recorded. The approved Revision 5 baseline remains identifiable in Git. The approval sweep, revision status update, and release authorization must follow actual review.

## Open questions

- What refinements become necessary when applying the starter to a real project?
- What evidence will establish that the method is ready for a stable 1.0.0 release?
