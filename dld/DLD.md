<!-- SPDX-License-Identifier: GPL-3.0-only -->
# Design-Led Development

**Status:** Draft (target release: 0.1.5)

## 1. Purpose and authority

Design-Led Development (DLD) is a design-centered, human-authoritative, AI-assisted software engineering methodology for the full software development lifecycle. It extends the [Human–AI Collaboration Contract](CONTRACT.md); it does not override that contract.

**Approved abstract design governs intended engineering outcomes.** Realizations and observations reveal what exists, not automatically what should exist. DLD is incremental: establish sufficient approved intent for the active consequential work, not a complete speculative design of the entire project. This methodology does not mandate a lifecycle schedule, framework, tool, AI provider, or repository layout.

In this document **MUST** expresses an obligation; **MUST NOT** a prohibition; **SHOULD** a recommendation for which a justified alternative is possible; and **MAY** a permitted choice.

## 2. Concepts and ownership

- **Project:** the enduring subject of engineering work.
- **Scope:** a responsibility boundary, potentially with governing and dependent scopes.
- **Design:** abstract intended outcomes, requirements, behavior, structure, interfaces, constraints, responsibilities, and decisions.
- **Decision:** a selected direction, authoritative only for its approved content and scope.
- **Realization:** concrete work or artifacts expressing design, such as code, configuration, tests, or operational results.
- **Evidence:** an identifiable observation or result supporting or challenging a scoped claim.
- **Approval:** an explicit human decision accepting identified content as governing intent.
- **Baseline:** an identifiable, recoverable state of approved content and its approval boundary.

Each authoritative design decision MUST have one identifiable owning scope, normally the narrowest scope that can govern it coherently. Shared decisions need one governing owner; dependent scopes refer to that owner rather than create competing authorities. Relationships needed for impact assessment and context discovery MUST remain findable. Logical scopes need not match physical folders; co-located design files are permitted, not required.

## 3. Consequential decisions and delegation

Humans approve consequential design choices and determine AI delegation. AI SHOULD actively investigate alternatives, challenge assumptions, and expose material trade-offs. Within established design and delegation, AI MAY choose local approaches and perform authorized implementation and assessment.

A decision is **consequential** when it introduces unapproved intent; materially changes approved outcomes, requirements, constraints, externally relevant behavior, interfaces, ownership, or commitments; or changes or exceeds delegated authority. Risk, impact, and reversibility SHOULD inform this test; labels such as “refactor” or “fix” do not settle it.

Before realizing consequential changed intent, AI MUST obtain a human decision identifying the affected content and scope. Proposals and investigation MAY proceed before approval. If the boundary is unclear, raise the uncertainty before consequential action.

**Design approval and permission to act are separate.** Approval does not automatically authorize commits, pushes, deployments, purchases, publication, or release. Actual tool permissions and operational authorization still apply.

## 4. Approval and recoverable design

Drafts and unapproved proposals MUST remain distinguishable from approved content. Partial approval applies only to its identified subset; it does not approve unresolved dependencies or adjacent choices. Unapproved changes MUST NOT silently supersede an earlier approved baseline.

Every consequential approval MUST have a truthful, discoverable record identifying the approving human, accepted scope, content, and revision. The corresponding approved content and approval boundary MUST be preserved in an identifiable, recoverable baseline. A commit or document status can help preserve a baseline, but neither itself proves human approval. Do not fabricate approvals or historical records.

Design documents SHOULD state current intended decisions rather than accumulate obsolete debate in their normative body; preserve relevant change and approval history separately or through version control. Scope relocation or reorganization MUST preserve or explicitly reconcile affected authority, approvals, and dependencies. A change that alters governing intent or ownership requires the appropriate human decision.

Project-specific rules MAY be added at project-owned locations and MUST remain compatible with the contract and DLD. Consequential introduction, alteration, and retirement of binding project rules require human approval and recoverable records. No particular filename is required for project design or rules.

## 5. Recurring engineering responsibilities

DLD applies to conception, requirements, design, implementation, integration, verification, validation, delivery, operation, maintenance, evolution, and retirement. These are responsibilities, not mandatory consecutive gates.

At a proportionate granularity, work typically recurs through:

1. **Understand:** establish active scope, applicable authoritative design, approvals, constraints, dependencies, current realization, delegation, and evidence.
2. **Design:** investigate options and express intended outcomes and decisions in their owning scopes.
3. **Decide:** have humans resolve consequential choices and identify delegated local decisions.
4. **Realize:** implement or perform work within approved intent and actual permission.
5. **Verify and validate:** assess conformance and intended outcomes with appropriate evidence.
6. **Report and evolve:** communicate results, gaps, unresolved decisions, and needed corrections or design revisions.

These responsibilities MAY overlap or repeat. They are not a fixed workflow. Regardless of order, consequential changed intent MUST NOT be realized without the required decision.

## 6. Realization, evidence, and change impact

Realizations MUST remain consistent with applicable approved design. If realization disagrees, correct it or propose a design change for human approval; do not silently promote observed behavior to design authority.

**Verification** asks whether realization conforms to approved design. **Validation** asks whether outcomes satisfy intended needs. Perform assessments proportionate to the task and agreed acceptance conditions, within available capabilities, and report unperformed checks and limitations. A completed or quality claim MUST have identifiable supporting evidence for its actual scope; a passing check does not establish unrelated claims.

Before consequential design changes, assess reasonably discoverable material effects on governing and dependent scopes, interfaces, constraints, realizations, and assurance. Disclose uncertainty and impacts not yet evaluated. After approval, propagate the change to affected authoritative designs and realizations while distinguishing approved target, completed work, and outstanding or unverified work. Effects beyond the approved boundary return for human resolution.

Delivery, operation, and retirement require relevant project criteria and actual authorization. A successful build, Git tag, or distribution package is not human approval to publish.

## 7. Context and continuity

Before new or resumed consequential work, establish sufficient relevant governing context. Load it **progressively**: start with the contract, methodology, project-owned context registry, governing design, and active scope; expand to dependencies and history as required. Do not reconstruct unrelated history merely because it exists.

Maintain discoverable records of significant unfinished work, approvals, unresolved choices, material inconsistencies, and evidence across handoffs. Summaries and AI memory aid navigation, but MUST NOT replace authoritative design, present repository state, or actual approval and permissions.

The [Context Registry](CONTEXT-REGISTRY.md) is editable by adopters and should be extended with their relevant project sources wherever located. Registering a document makes it discoverable, not automatically approved.

## 8. Adoption and evolution

New projects MAY begin with draft design and approve only the consequential intent needed for current work. Existing projects MAY reconcile one scope at a time: existing code and documentation are evidence, not automatic approval. Distinguish reconciled from unreconciled scopes.

Adopting projects keep the distributed contract and methodology unchanged in ordinary use and add their own design, rules, and context. A DLD version upgrade is deliberate and human-authorized, with material effects on existing design and approvals reviewed. Projects retain independent product versions.

The DLD distribution's version is in its `VERSION` file. The methodology shares that release lineage; no separate methodology version identifier is required. The release version is not a project design approval, and changing a version number does not automatically change a project's adopted method. [Supporting materials](supporting/) are optional guidance, never additional methodology obligations.
