# Design-Led Development

## 1. Purpose

Design-Led Development (DLD) is a design-centered, human-authoritative, AI-assisted software engineering methodology spanning the software development lifecycle. It operates under the [Human–AI Collaboration Contract](CONTRACT.md).

**Approved abstract design governs intended engineering outcomes.** Implementations and observations are evidence of what exists, not automatic authority over what should exist. Design only enough for the work at hand; extend it as the project evolves.

Here, **MUST** means required, **MUST NOT** prohibited, **SHOULD** recommended with justified alternatives permitted, and **MAY** optional.

## 2. Design and ownership

A **project** contains identifiable **scopes** of engineering responsibility. Scopes MAY be progressively decomposed into subordinate scopes as their responsibilities warrant. **Design** describes intended outcomes, requirements, behavior, architecture, interfaces, constraints, and decisions. **Realization** is concrete work or artifacts implementing design. **Evidence** supports or challenges a claim about design or realization.

Each authoritative decision MUST have one identifiable owning scope: the narrowest scope able to govern it coherently. A decision spanning subordinate scopes belongs to their narrowest suitable shared ancestor when it truly governs them together; otherwise an identifiable owning scope governs it and affected scopes reference that authority. Subordinate scopes MUST respect applicable ancestor decisions without duplicating them. Cross-scope dependencies MAY connect any scopes and MUST remain discoverable without forcing unrelated decisions upward.

Maintained facts, configurations, rules, and decisions SHOULD have one identifiable authoritative source. Other artifacts SHOULD reference or consume that source instead of independently restating it. Repeat information only when needed for the artifact's purpose, and keep unavoidable copies consistent through proportionate checks or generation. Descriptions of design intent, normative requirements, and concrete implementation MAY differ in purpose without constituting competing authority.

Each scope's authoritative design MUST provide or reference sufficient information to identify its responsibility and boundary, intended outcomes and constraints, consequential decisions and their rationale, governed realizations, and criteria for evaluating conformity. Applicable information MAY be inherited from governing scopes or distributed among related design artifacts without repeating authority. DLD does not prescribe document headings, media, formats, or templates.

Every maintained realization MUST have an identifiable governing design scope, which MAY cover one artifact, several artifacts, or a subsystem. Decompose designs only as far as responsibility and change isolation justify; individual realization files need not each have a separate design document. Design documents SHOULD be maintained near the realizations they govern where practical. Their authority comes from declared ownership and approval, not filenames or a prescribed directory layout.

## 3. Decisions and approval

A design decision is **consequential** when it introduces unapproved intent or materially changes approved outcomes, requirements, constraints, interfaces, externally relevant behavior, responsibilities, or delegation. Assess significance by impact and risk, not by labels such as “refactor.”

Consequential realization MUST be governed by sufficient approved design before implementation. Consequential design changes MUST be approved by an authorized human before realizing the changed intent. AI MAY investigate, prototype within permission, and propose changes beforehand, and implement approved intent within delegated boundaries. Exploratory realization does not itself approve new product intent. Unclear authority or approval boundaries MUST be resolved before consequential action.

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

Before consequential work, reconstruct sufficient authoritative context for the active scope. Start with the contract, methodology, applicable ancestor and local designs, approvals, and constraints; expand to affected cross-scope dependencies and history as needed. A scope should be understandable with its governing context without loading every unrelated scope.

The editable [Context Registry](CONTEXT-REGISTRY.md) helps locate project-owned design, rules, decisions, and evidence wherever they reside. Registration aids discovery but does not confer authority.

Keep material open decisions, incomplete work, inconsistencies, and evidence discoverable across handoffs. Summaries and AI memory supplement, but do not replace, authoritative project records.

## 7. Adoption and evolution

New projects MAY begin with draft design. Existing projects MAY reconcile their current implementation with approved intent one scope at a time; distinguish reconciled from unreconciled areas.

Adopters keep their distributed contract and methodology unchanged during ordinary project work. Their designs, rules, and context remain project-owned. Adopting a newer DLD version requires a deliberate human decision and assessment of affected approvals and design.

DLD does not prescribe a technology, repository layout, or AI provider. [Supporting materials](supporting) are optional guidance, not additional obligations.
