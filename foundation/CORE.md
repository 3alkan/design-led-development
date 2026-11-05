# Design-Led Development — Core Method

DLD Core is the **authoritative, versioned specification of Design-Led Development**. Humans and AI developing DLD and humans and AI using DLD in another project follow the same method. A project adopts a fixed DLD version; the adopted core is not edited to express project preferences. Change the method at its maintained source, review and approve it, and distribute it as a new version. Project-specific design and rules remain separate.

## 1. Purpose and principles

DLD is a design-centered, human-authoritative, AI-assisted approach to engineering software **throughout its complete lifecycle**. It concerns how human and AI work together; normal software engineering practices and lifecycle responsibilities determine what work the project needs.

A project's **approved abstract design is the source of truth** for its intended outcomes, requirements, structure, behavior, interfaces, constraints, and decisions. Implementation, configuration, tests, documentation, operations, and other concrete artifacts realize or provide evidence about that design; they do not silently change approved intent.

Work incrementally. Design the next useful scope to a level sufficient for responsible realization and verification; do not prescribe every future detail. Evidence and feedback may expose a need to revise design, which must be proposed and approved at the appropriate scope.

DLD is not a programming framework, a fixed folder scaffold, an automatic synchronization engine, a mandatory sequential lifecycle, or a claim of certification against a formal standard. It can draw on established engineering knowledge such as SWEBOK and applicable ISO/IEC/IEEE guidance.

## 2. Authority, collaboration, and delegation

The **human** owns project direction, priorities, consequential design decisions, approval, and the boundaries of AI delegation. The **AI** is an active collaborator: it examines information, asks questions, challenges assumptions, identifies conflicts, compares alternatives, proposes and records decisions, and helps verify outcomes.

AI may independently realize and verify **human-approved scope** within granted permissions and delegated implementation freedom. It does not need approval for every local implementation choice that remains within those boundaries. It must not approve its own design, treat a draft as approved, invent missing consequential decisions, or treat existing code as an override of approved design.

A proposed change to approved behavior, scope, interface, constraints, or ownership returns for human approval before its realization. Approved work unaffected by another draft may continue. Project documents operate within the AI tool's governing instructions and the actual permissions granted.

## 3. Project foundation and authority

A DLD project has:
- `foundation/CORE.md`: the **unchanged, versioned DLD method** adopted by the project.
- `foundation/DESIGN.md`: the project's own authoritative project-wide abstract design and approval state.
- `foundation/RULES.md`: additional constraints specifically adopted for this project, or an explicit statement that none exist.
- `README.md`: an ordinary project introduction and a clear human/AI entry instruction pointing to its foundation.

The DLD development repository is itself a DLD project. Its `foundation/CORE.md` is the canonical maintained Core; its `DESIGN.md` describes DLD as the project being engineered; its `RULES.md` holds only constraints specific to maintaining DLD. A project adopting DLD receives an exact, versioned copy of Core and its own clean design and rules templates.

**Core governs the method.** Project rules may specialize choices permitted by Core, but cannot silently override its principles. Project design defines what is being built and cannot redefine the method. If project conditions appear incompatible with Core, surface and resolve the incompatibility rather than editing the adopted Core in place.

## 4. Session initialization and continuity

Do not assume an AI tool discovers Markdown instructions automatically. At the start of a new or resumed human–AI session, explicitly direct AI to read the project's `foundation/CORE.md`, `foundation/RULES.md`, and `foundation/DESIGN.md`; then read applicable scoped design documents and inspect the current repository state.

Before substantive work, AI identifies what is approved, what is draft, the relevant constraints, current realization or evidence, unresolved questions, and what work is delegated. Do not require an AI-specific instruction file. A tool-specific pointer may be used optionally but must not duplicate methodological authority.

Preserve enough state for continuity: identifiable approved design baselines and revisions, current implementation state, verification evidence, unresolved decisions, and a useful next action. Source control history preserves superseded design; current approved design text explains what is true now.

## 5. Design scope, ownership, and placement

DLD design is **logically connected and hierarchically scoped**, but it need not be physically centralized. A decision has **one authoritative owner** at the nearest appropriate scope responsible for it. Higher scopes establish context, constraints, relationships, and delegated responsibilities; narrower scopes elaborate their own decisions while respecting all applicable governing constraints.

Co-locate a design with its realization when this reflects real ownership, but allow design to exist before, after, or across implementation artifacts. For an individual artifact needing a focused design, a neighboring companion such as `module.py.md` can be appropriate; not every file needs a twin. Avoid empty forwarding documents or directories created only to mirror technical hierarchy.

Shared policy spanning branches belongs to the nearest appropriate common owning scope or a meaningful sibling responsibility, with references from participating scopes. There is **no mandatory global `design/` or `shared/` directory**. Technical wrapper folders alone do not imply design authority. Preserve applicable broader constraints and resolve conflicts in design discussion.

Repository structure is responsibility- and ownership-oriented, technology-aware, and selectively adoptable. Ecosystem-native source locations and product definitions take precedence over artificial DLD naming. Keep maintained sources, conventional documentation, tests, verification evidence, engineering tools, configurations, infrastructure/deployment/operations concerns, generated build intermediates, and distributables distinct according to their actual responsibilities. Create folders only when needed.

## 6. Writing and approving design

A design describes its **current intended state**, not the history of negotiations. Its structure should fit its scope, commonly recording purpose, outcomes, responsibilities, relevant requirements and behavior, relationships, constraints, verification criteria, approval state, and open decisions.

A proposed substantive revision remains **Draft**; approved and proposed material can coexist only when clearly labeled (for example, `Status: Mixed` with a `Pending changes — Draft revision N` section). A new proposal does not nullify earlier approved, unchanged decisions.

A design can record:
- `Revision: N`
- `Status: Draft | Approved | Mixed`
- `Approval: Rev N approved by [who] [YYYY-MM-DD]` — only when that approval actually occurred.

On human approval of a defined revision and scope, perform an **approval sweep**: (1) ensure the previous approved baseline is recoverable; (2) remove approved draft annotations and superseded commentary; (3) append a single truthful approval record without rewriting older approval lines; (4) verify the resulting final-state document, then commit its authorized approved baseline with identifiable paths/revisions. Preserve unapproved portions as clearly distinguished drafts. Never invent approvers, dates, evidence, or approvals.

Retain superseded design in Git or equivalent version history; preserve longer audit findings in appropriately owned records rather than the design body. Formatting corrections need not reopen settled decisions. Moving a design preserves approval only when scope and governing constraints remain unchanged; changed ownership or constraints require a fresh human decision.

Design approval, implementation progress, test success, Git commit authorization, and release permission are **separate**. A commit, tag, or passing test does not itself confer approval.

## 7. Working across the software lifecycle

DLD spans conception and feasibility; stakeholder needs and requirements; architecture and detailed design; implementation and integration; verification and validation; packaging, delivery and deployment; operation and support; maintenance and evolution; and retirement. These are responsibilities and feedback loops, not a mandatory linear stage sequence.

A recurring practical cycle is:

1. **Understand:** Read governing design and project state; identify the next useful outcome, constraints, and evidence.
2. **Propose:** Analyze alternatives and record needed design decisions at the responsible scopes.
3. **Decide:** Obtain human approval of consequential changes and the identified revision/scope.
4. **Realize:** Implement and integrate approved scope within delegated freedom.
5. **Verify and validate:** Assess conformance to approved design and suitability for intended use, using appropriate checks and direct evidence.
6. **Report and evolve:** Record results, limitations, discrepancies, and feedback; correct realization or propose design revision where required.

A small approved increment can be implemented while other scopes remain under discussion. Correct a realization that violates unchanged approved design; do not retroactively redefine design to match accidental implementation.

## 8. Evidence, delivery, and versioning

Verification checks whether a realization meets approved design; validation addresses its suitability for intended use. Tests, inspection, demonstrations, operations evidence, and other checks are chosen according to risk and context. Record what was actually performed and distinguish observed results from assumptions. Passing automated tests alone does not establish full design conformance.

Deliver or release only within authorized permissions and with agreed acceptance criteria and limitations explicitly handled. Preserve appropriate installation, use, operations, maintenance, and retirement information. Publication or a Git tag is not proof of human design approval or successful verification.

Suggest meaningful Git checkpoints for approved design baselines, verified increments, and focused corrections; do not commit, push, or publish without actual authorization. Preserve unrelated work.

A project's **product version**, its **design revisions**, and its **adopted DLD Core version** are independent. Adopt DLD updates deliberately by comparing changes and obtaining relevant approval; never overwrite project-specific design or rules as an automatic side effect of upgrading the Core. The adopted Core itself remains frozen for that DLD version.
