# Design-Led Development — Core

Design-Led Development (DLD) is a **design-centered, human-authoritative, AI-assisted software engineering methodology** covering the complete software project lifecycle.

This document is the **single authoritative specification of the DLD method** for both humans and AI. The DLD development repository maintains the canonical Core. Each adopting project uses an unchanged copy from an identified DLD version. Project-specific decisions belong in the project's DESIGN and RULES, not in Core.

## 1. Foundations

The **project** is the enduring engineering subject. Its authoritative abstract design expresses intended outcomes, requirements, behavior, structure, responsibilities, interfaces, constraints, and decisions. Implementation and other concrete artifacts realize that design or provide evidence about it; they do not independently redefine approved intent.

The human and AI develop the design together. The human owns consequential decisions and their approval. AI contributes to reasoning, design, realization, and verification within the authority delegated to it.

Work in useful increments. Develop each scope sufficiently to realize and assess it responsibly; a complete upfront specification of every future detail is not required. Observations, tests, and feedback may reveal deficiencies and lead to proposed design changes.

DLD governs **how engineering work is directed and carried out with AI**, not which programming language, framework, tool, or lifecycle model a project must use. It applies to established engineering disciplines without claiming automatic synchronization or formal conformance to standards.

## 2. Authority and responsibility

**Human responsibilities**

- Set project direction, priorities, intended outcomes, and acceptable boundaries.
- Decide and approve consequential changes to design, constraints, scope, interfaces, and delegated authority.
- Authorize actions requiring permission, including commits, releases, and publication, unless that permission has already been explicitly delegated.

**AI responsibilities**

- Examine the current design, relevant project evidence, and applicable constraints.
- Ask clarifying questions, identify conflicts and gaps, compare options, and propose and record changes.
- Realize and verify approved scope independently where implementation choices and actions have been delegated.
- Report assumptions, evidence, limitations, unresolved decisions, and deviations from approved design.

AI must not approve its own proposals, treat drafts as approved, silently choose consequential requirements, or use existing implementation as authority to override an approved design. A decision affecting approved behavior, scope, interfaces, constraints, ownership, or delegation returns to the human before the changed intent is realized.

The human need not approve every local implementation choice. AI may proceed within an approved scope and its actual permissions, and unaffected approved work may continue while another change is pending. DLD documents operate within the governing instructions and permissions of the AI environment.

## 3. Project foundation

Every project using DLD has these documents:

| Document | Authority |
| --- | --- |
| `foundation/CORE.md` | The adopted, versioned DLD methodology; unchanged within that adopted version. |
| `foundation/DESIGN.md` | The project's authoritative overall abstract design and its approval state. |
| `foundation/RULES.md` | Additional, explicitly adopted project-specific constraints; states when none exist. |
| `README.md` | The project's ordinary entry point, including how to start work with human and AI. |

**Core defines the method. DESIGN defines the project. RULES constrains the project.** A project's design or rules may specialize choices permitted by Core but must not silently contradict or redefine it. If a conflict appears, make it explicit and resolve it rather than editing the adopted Core.

DLD's own development repository follows the same structure. Its Core is the canonical method source; its DESIGN and RULES apply specifically to the DLD development project. Starter templates for other projects contain no DLD-development-specific design approvals or rules.

## 4. Starting and resuming work

An AI tool may not discover project Markdown files automatically. At the beginning of a new or resumed human–AI session, the human explicitly directs AI to read `foundation/CORE.md`, `foundation/RULES.md`, and `foundation/DESIGN.md`, then any applicable scoped designs and the current project state.

Before substantive action, AI establishes:

1. The intended task, responsible design scope, and applicable constraints.
2. Which decisions are approved, which are drafts, and which are unresolved.
3. The current realization and relevant evidence, including known discrepancies.
4. The work and actions already authorized or delegated.

If essential information or authority is missing, resolve it with the human before making a consequential change. An AI-specific instruction file is not required. Optional tool-specific pointers may direct AI to the foundation without becoming another source of methodological authority.

Preserve enough state for future sessions to identify approved baselines, work completed, verification evidence, outstanding decisions, and the next useful action.

## 5. Design scopes and ownership

Design is **logically hierarchical and connected by responsibility**; it need not be centralized in one physical directory.

Every authoritative design decision has **one owning scope**. The project-wide DESIGN establishes shared direction, constraints, responsibilities, and relationships. Narrower designs own their delegated decisions and respect applicable governing designs and project rules. Reference a decision owned elsewhere instead of duplicating its authority.

Locate a scoped design at the nearest appropriate owner. Co-locate it with its realization when that accurately reflects responsibility. Designs may precede implementation; a focused companion such as `module.py.md` can be useful, but not every source file or intermediary folder needs a design document.

For responsibilities spanning branches, use an appropriate common owning scope or a separately meaningful sibling responsibility. Identify the participating scopes and preserve navigable references and governing constraints. Physical wrapper directories do not themselves acquire design authority. No global `design/` or `shared/` directory is required.

Use ecosystem-native structures where they have genuine ownership. Distinguish maintained source, supporting documentation, tests, verification evidence, tools, configuration, delivery and operations artifacts, generated intermediate outputs, and distributables according to their actual responsibilities. Create directories and documents when needed, not to satisfy an empty scaffold.

When moving, splitting, or combining design scopes, preserve decisions, approvals, history, and references. An administrative move preserves prior approval only when scope and governing constraints remain unchanged. Changes of meaning, responsibility, or governing constraints require human approval.

## 6. Design states and approval

Design documents describe **the current intended state** of their scope. Use concise current-state requirements and only the rationale necessary to understand them. Keep superseded wording and extended audit narratives in version history or separately owned records rather than in the authoritative design body.

An identifiable revision has an approval state:

- **Draft:** Its proposed changes are not yet approved.
- **Approved:** The identified design revision and scope have been approved by the human.
- **Mixed:** Previously approved decisions remain authoritative while distinctly marked proposed changes await decision.

The document identifies its revision and status, for example `Revision: 1` and `Status: Draft`. Record an actual approval using one `- Approval: Rev N approved by [who] [YYYY-MM-DD]` line for the relevant revision. Never fabricate an approval, approver, date, or verification result. A template is a draft, not a project approval.

For a mixed state, distinguish proposals under a heading such as `Pending changes — Draft revision N`, or mark proposed content explicitly. A proposed revision does not revoke unchanged, previously approved decisions. For partial approval, clearly identify the approved portion and retain the remaining proposals in a separately identified draft revision.

### Approval procedure

When the human approves a defined revision and scope:

1. Ensure the previous approved baseline remains identifiable and recoverable in version control or an equivalent record.
2. Reconcile the design with precisely what was approved. Remove approved draft markers and superseded commentary; preserve any unresolved proposals as drafts.
3. Append the truthful one-line approval record, retaining earlier approval entries.
4. Review the resulting current-state document against the approved decision.
5. Commit the approved baseline **when authorized**, identifying the design paths, revisions, and approved scope. If committing is not authorized or possible, report that the baseline commit remains pending.

An additional commit of the pre-approval draft is necessary only when that exact intermediate state needs independent recovery. A design-specific tag is not required. Version history preserves past design text; a revision's approval record identifies the human decision, while an identifiable commit records the approved snapshot.

**Approval, implementation progress, verification, committing, and release authorization are different states.** None automatically grants another. Formatting or spelling corrections that do not change decisions need not reopen prior approval.

## 7. Working across the lifecycle

DLD applies to conception and feasibility; stakeholder needs and requirements; architecture and design; implementation and integration; verification and validation; packaging, delivery, and deployment; operation and support; maintenance and evolution; and retirement. These are **engineering responsibilities with feedback**, not mandatory sequential phases.

Use the following recurring cycle for the scope being worked on:

1. **Understand:** Read governing designs and evidence; define the next useful outcome and identify gaps or constraints.
2. **Develop design:** Discuss needs and alternatives; place proposed decisions with their authoritative owners.
3. **Decide:** Obtain human approval for consequential decisions and identify the approved revision and scope.
4. **Realize:** Implement and integrate the approved scope within delegated freedom and permissions.
5. **Verify and validate:** Collect evidence of conformance to the design and suitability for intended use.
6. **Report and evolve:** Explain results, limitations, and discrepancies; correct realizations or propose necessary design revisions.

The cycle repeats at different scopes and lifecycle moments. A small approved increment may proceed while unrelated decisions remain open.

When concrete work conflicts with an unchanged approved design, correct the concrete work. If evidence suggests the intended design itself should change, propose that change and obtain human approval before realizing the changed intent.

## 8. Evidence, delivery, and continuity

**Verification** asks whether a realization satisfies its approved design. **Validation** asks whether the result serves the intended need. Select tests, reviews, demonstrations, observations, and operational evidence appropriate to the scope and risk. Record what was actually checked, the outcome, and any limitations; do not equate a passing test with complete conformance.

Before delivering or releasing, satisfy the project's agreed criteria, permissions, and acceptance of known limitations. Provide the installation, use, operation, support, maintenance, and retirement information appropriate to the product. A generated package, Git tag, or automated check is not proof of approval or permission to publish.

Propose proportionate Git checkpoints for identifiable design baselines, verified realization increments, and focused corrections. Inspect the intended scope and preserve unrelated work. Commit, push, publish, or modify release records only when authorized or within explicitly delegated permission.

Maintain traceability between owned design decisions, their realizations, and relevant verification evidence. Keep current authoritative designs understandable while retaining recoverable history and enough project context to continue work after an interruption.

## 9. Versions and adoption

Distinguish the **project's own product version**, **design document revisions**, and **adopted DLD version**. They evolve independently.

A project adopts a specific DLD Core version and keeps that Core unchanged. To upgrade DLD, review the new method and its adoption implications, deliberately replace the Core with the new version, and reconcile any project-specific constraints or procedures through the required human decisions. Do not overwrite the project's DESIGN, RULES, or their approval history.

DLD's development repository maintains the canonical Core and produces development and product distributions from one versioned source baseline. Changes to DLD itself are made in that canonical source and reviewed under the DLD development project's own design and approval process. A source change or successful package build is not, by itself, an approved or published method release.
