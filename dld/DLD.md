<!-- SPDX-License-Identifier: GPL-3.0-only -->
# Design-Led Development

**Status:** Draft

## 1. Purpose

Design-Led Development (DLD) is a design-centered, human-authoritative, AI-assisted software engineering methodology spanning the software development lifecycle. It operates under the [Human–AI Collaboration Contract](CONTRACT.md).

**Approved abstract design governs intended engineering outcomes.** Implementations and observations are evidence of what exists, not automatic authority over what should exist. Design only enough for the work at hand; extend it as the project evolves.

Here, **MUST** means required, **MUST NOT** prohibited, **SHOULD** recommended with justified alternatives permitted, and **MAY** optional.

## 2. Design and ownership

A **project** contains identifiable **scopes** of engineering responsibility. **Design** describes intended outcomes, requirements, behavior, architecture, interfaces, constraints, and decisions. **Realization** is concrete work or artifacts implementing design. **Evidence** supports or challenges a claim about design or realization.

Each authoritative decision MUST have one identifiable owning scope. Shared decisions need one governing owner; dependent scopes reference it rather than duplicate authority. Governing relationships and material dependencies MUST remain discoverable. Scopes need not correspond to directories or individual files.

## 3. Decisions and approval

A design decision is **consequential** when it introduces unapproved intent or materially changes approved outcomes, requirements, constraints, interfaces, externally relevant behavior, responsibilities, or delegation. Assess significance by impact and risk, not by labels such as “refactor.”

Consequential design changes MUST be approved by an authorized human before realizing the changed intent. AI MAY investigate and propose changes beforehand, and implement approved intent within delegated boundaries. Unclear authority or approval boundaries MUST be resolved before consequential action.

Approved and proposed content MUST remain distinguishable; partial approval does not cover unresolved choices. Each approval MUST have a discoverable record identifying the approver, accepted scope, content, and revision, with an identifiable, recoverable baseline. A commit or document status alone does not prove approval. Previously approved intent remains governing until changed through approval.

Project-specific rules MAY add compatible constraints. Binding rule changes require the same human approval and recoverability as design changes.

## 4. Engineering cycle

DLD applies to planning, requirements, design, implementation, integration, verification, validation, delivery, operations, maintenance, and retirement. These responsibilities recur and overlap; DLD prescribes no sequential lifecycle model.

For each relevant scope:

1. **Understand** its objective, governing design, approvals, dependencies, constraints, permissions, realization, and evidence.
2. **Design** or refine intended outcomes and affected decisions.
3. **Decide** consequential proposals through human approval.
4. **Realize** authorized work consistent with approved design.
5. **Verify and validate** conformance and intended outcomes.
6. **Report and evolve** results, gaps, unfinished work, and needed corrections or design revisions.

Use this cycle proportionately, not as mandatory steps for every small action.

## 5. Alignment, change, and evidence

Realization MUST remain consistent with approved design. If they conflict, correct the realization or seek approval to revise the design; observed behavior MUST NOT silently redefine intent.

Before consequential changes, assess reasonably discoverable effects on governing and dependent scopes, interfaces, constraints, realization, and verification needs. Disclose material uncertainty. After approval, propagate changes to affected designs and realizations, distinguishing approved intent from incomplete or unverified implementation. Newly discovered consequential effects outside the approval boundary require human resolution.

**Verification** checks conformance to approved design; **validation** checks whether outcomes meet intended needs. Perform proportionate checks within available capabilities. Claims of completion or quality MUST be supported by identifiable evidence, with failures, unperformed checks, and limitations reported accurately.

## 6. Context and continuity

Before consequential work, reconstruct sufficient authoritative context for the active scope. Start with the contract, methodology, applicable project design, approvals, and constraints; expand to relevant dependencies and history as needed.

The editable [Context Registry](CONTEXT-REGISTRY.md) helps locate project-owned design, rules, decisions, and evidence wherever they reside. Registration aids discovery but does not confer authority.

Keep material open decisions, incomplete work, inconsistencies, and evidence discoverable across handoffs. Summaries and AI memory supplement, but do not replace, authoritative project records.

## 7. Adoption and evolution

New projects MAY begin with draft design. Existing projects MAY reconcile their current implementation with approved intent one scope at a time; distinguish reconciled from unreconciled areas.

Adopters keep their distributed contract and methodology unchanged during ordinary project work. Their designs, rules, and context remain project-owned. Adopting a newer DLD version requires a deliberate human decision and assessment of affected approvals and design.

DLD does not prescribe a technology, repository layout, or AI provider. [Supporting materials](supporting/) are optional guidance, not additional obligations.
