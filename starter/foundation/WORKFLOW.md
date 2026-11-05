# Design-Led Development Workflow

This workflow defines how the human and AI work together to realize
a project from beginning to end.

The comprehensive abstract project design is authoritative throughout the complete software lifecycle. Humans and AI develop it together, recording project intent, requirements, structure, behavior, constraints, and decisions at their proper ownership scopes.

The human directs the project and approves its design. AI contributes
to design discussions, realizes approved designs, and verifies that
the implementation fulfills them.

Design continues to govern the project through conception, realization, verification, delivery, operation, maintenance, evolution, and retirement.

## Session start and continuity

AI tools are not guaranteed to discover these files automatically. At the beginning of a new or resumed human–AI session, the human explicitly directs AI to read this `WORKFLOW.md`, `RULES.md`, `DESIGN.md`, the applicable scoped designs, and the current repository state. AI identifies approved versus pending scope and the next permitted activity before acting. The project's `README.md` provides a concise reusable startup instruction; no separate AI-agent file is required.

## Project foundation

The project's working method, mandatory rules, and top-level design
are recorded in three documents under `foundation/`:

- `WORKFLOW.md` defines how the human and AI work together.
- `RULES.md` defines project rules that must be followed.
- `DESIGN.md` defines the project's purpose, scope, intended outcomes,
  and overall design.

The project root is the directory containing the whole product.
The `foundation/` directory inside it holds these project-wide documents;
it is not automatically the container for other design or implementation
scopes. Other scopes normally live alongside it or within source areas.

The human and AI maintain these documents as the project evolves.
AI may propose changes; the human approves changes to the working
method, rules, and design.

These documents define project authority within the AI tool's
governing instructions and access permissions.

The repository's `README.md` introduces the product and explains
how to use it. It directs contributors to these documents.

## Human and AI responsibilities

The human directs the project, sets priorities, and approves design
decisions. The human can revise the project's direction at any time.

AI is an active collaborator in developing the design. It asks
questions, challenges assumptions, identifies conflicts, and proposes
alternatives. It records the resulting decisions in the appropriate
design documents.

AI realizes approved designs and verifies the implementation against
them. It acts independently within the freedom those designs and
project rules provide.

When a decision would change approved behavior, scope, interfaces,
or constraints, AI brings it back to the human for discussion and
approval. It does not silently resolve missing design through code.

AI cannot approve its own proposals or treat existing implementation
as authority to redefine the design.

## Organizing the design

Design begins in `foundation/DESIGN.md`, which establishes the project's
overall purpose, scope, major responsibilities, and shared constraints.

As the design develops, divide it into meaningful scopes. Each
design document owns the decisions appropriate to its scope and
references the broader decisions that govern it.

A parent document establishes context and delegates responsibilities.
Child documents develop those responsibilities in detail. Keep
decisions at their appropriate level instead of collecting every
detail in the parent or repeating shared decisions across documents.

Use engineering responsibility and the nearest appropriate owning scope to organize design. Physical hierarchy can express scope composition but does not alone establish authority.
Co-locate scope designs with realization where appropriate, not at the expense of authority or hierarchy. Nested
designs inherit applicable constraints from their governing ancestors,
starting with the project's top-level design in `foundation/DESIGN.md`.
A folder's design document lives inside that folder and uses its
name, such as `lending/lending.md` or `src/lending/lending.md`.

When an individual file needs a focused design, its document lives
beside it and keeps the complete filename with `.md` appended,
such as `eligibility.py.md`.

Design documents can exist before their corresponding implementation.
Not every implementation file needs a separate design document.

Early scope folders may become implementation folders. They do not
commit the project to a framework or final source layout. When that
layout is selected, reconcile design placement with it rather than
keeping duplicate authoritative copies in old and new locations.

For responsibilities spanning branches, place an authoritative shared design at the lowest appropriate common owning scope, or at a meaningful sibling scope when the common physical ancestor has no relevant ownership. Name it for the responsibility, not because it is generically "shared." No global `design/` directory is required. Reference that design from affected scopes, and preserve all applicable broader constraints.

One decision has one authoritative owner. A scope should link to the decisions governing it rather than reproduce them. Do not create empty forwarding documents merely to mimic directory hierarchy. Designs can exist before realizations and need not be coupled to implementation filenames when that would misrepresent their responsibility.

When moving or splitting a design, preserve its decisions, revision
and approval records, and identifiable history. Update incoming and
outgoing references and implementation mappings. A mechanical path
change preserves approval when scope and governing constraints remain
unchanged. Moving under a different governing ancestor or changing
responsibilities can change the design; resolve those effects and
obtain approval before treating the new arrangement as approved.
Adopting a method update alone does not authorize moving product files.

Lower-level designs must respect applicable rules and broader approved
designs. Resolve contradictions explicitly through design discussion.

## What a design document contains

A design document contains the decisions needed to understand,
realize, and verify its scope.

Depending on that scope, it can define:

- Purpose and responsibilities.
- Intended behavior, experience, and outcomes.
- Relationships and interfaces with other scopes.
- Constraints and relevant tradeoffs.
- Important failure states and recovery behavior.
- Visual direction where appearance matters.
- Observable criteria for verifying the result.
- Implementation choices delegated to AI.
- Open questions and proposals awaiting approval.

Include technical decisions when they matter at that document's
level. Keep implementation details within the freedom delegated
to AI unless they require an explicit design decision.

Separate agreed decisions from proposals and unresolved questions.
Make important expectations clear enough to implement and assess.

Use only the structure the scope needs. A small design does not
require a large template.

## Document voice and final-state writing

Approved design documents describe **what is true now**: each paragraph states the rule, how it is realized, or no more than one sentence of rationale. Do not embed descriptions of past revisions, superseded wording, audit sessions, or duplicated rationale in current design bodies.

During an unapproved revision, `(Draft revision N: …)` markers may indicate proposed changes for human review. These annotations exist only in drafts; they are not permanent design prose. Use `Status: Mixed` when approved and pending material coexist, with proposals under a visibly labeled `Pending changes — Draft revision N` section. On partial approval, identify the approved portion and move the unapproved remainder into a new draft revision before sweeping; previously approved content stays authoritative.

On human approval of identified revision N and scope, perform the **approval sweep**:

1. Verify that the previous approved baseline is recoverable from Git. Commit the exact pending draft separately only when that intermediate text must be independently recoverable; this extra commit is optional.
2. Remove the approved revision's inline draft markers, retaining approved current-state decisions without superseded-history narration.
3. Append exactly one `- Approval: Rev N approved by [who] [YYYY-MM-DD]` header line per approved revision, keeping earlier lines. Identify the approved scope in the commit message or findings/approval record; never invent an approval, identity, or date.
4. Check the final-state text against the approved scope, then commit the approved baseline with authorization. Identify the design paths and revision numbers in the commit message; one coherent commit may include multiple approved documents. No design-specific Git tag is required. Leave unapproved scope visibly marked as draft.

The final-state commit SHA identifies the approved repository snapshot, while the design header identifies the revision and approver. Use the commit message and relevant document path to find that baseline. Design-specific tags are unnecessary; published product or method versions still use release tags.

History has exactly three destinations: Git commits for superseded versions and approved baselines, a separate findings/audit area for long-form reviews and session records, and one-line approval-header entries for who approved which revision and when. A Git tag or commit is not itself human approval; ask for authorized Git operations when permission is missing.

When reviewing designs, classify historical narration in the body, multi-line approval prose, and repeated rationale across files as `SEDIMENT` findings. Correct them without changing approved meaning or discarding pending work.

A component design follows the same voice and approval format as the foundation design. For example, an approved component document can use:

```markdown
# Renewal component

- Revision: 2
- Status: Approved
- Approval: Rev 1 approved by [approver] [YYYY-MM-DD]
- Approval: Rev 2 approved by [approver] [YYYY-MM-DD]

## Responsibility

Validate renewal requests against the renewal policy defined by the governing design.

## Realization

Return an eligibility result and a reason code to the calling scope.
```

This example is illustrative, not an actual product approval.

## Design approval

Design is developed through discussion and recorded as a draft.
The human approves an identified revision within an explicit scope
before AI realizes it.

Approval can cover one document or several related documents.
Record it clearly enough that a later session can identify what
was approved. Never invent approval or extend it to later changes.

Approval status and implementation progress are separate.
An approved design may be unimplemented, partly implemented,
or fully realized.

When proposing a meaningful change to an approved design, mark
the proposed revision as a draft and keep the approved baseline
identifiable through version control or an equivalent record.

Earlier approval remains valid for unchanged decisions. Formatting
and spelling corrections do not require renewed design approval.

AI can continue implementing unaffected approved scope while
proposed changes are under discussion.

## The working cycle

1. Understand the scope.
   Read the applicable workflow, rules, and design documents.
   Identify approved decisions, existing implementation, and
   unresolved questions.

2. Develop the design.
   Discuss needs, compare alternatives, and record decisions
   in the appropriate design scopes.

3. Approve the design.
   Resolve consequential questions and obtain human approval
   for the identified revisions and implementation scope. Preserve
   the previous approved baseline, remove approved draft markers,
   append the one-line approval record, verify the final-state design,
   and commit its approved scope with an identifying message.

4. Realize the design.
   AI implements the approved scope in manageable increments,
   acting independently within delegated boundaries.

5. Verify the result.
   Assess implementation against the approved design using
   appropriate checks and direct observation.

6. Report and continue.
   Explain what was realized, what was verified, and what remains.
   Use that evidence to decide the next increment or design revision.

Repeat this cycle throughout the project. Design can develop
incrementally; the entire project need not be specified before
implementation begins.

If implementation reveals a consequential problem or missing
decision, return it to the relevant design discussion. Preserve
the approved intent until a change is approved.

## Commit checkpoints

AI should suggest a commit when work reaches a meaningful, coherent
checkpoint: an agreed design baseline worth preserving, a completed
implementation increment with appropriate verification, or a focused
correction.

Inspect the working tree and staged changes before suggesting the
checkpoint. Briefly explain why it is useful and identify which changes
belong together. Optionally propose a commit message. Preserve unrelated
work; avoid suggestions after every small edit or a rigid relationship
between documents and commits.

A suggestion does not authorize creating a commit. Commit only when
requested or within explicitly delegated committing permissions.
A commit does not itself approve design, prove conformance, publish
a release, or authorize a push.

## Verification and delivery

Verification determines whether the implementation fulfills
the approved design within the scope being delivered.

AI checks relevant behavior, interfaces, constraints, failure
states, and visual expectations. Technical checks support this
assessment; passing tests alone does not establish conformance.

Record what was checked, the results, and any limitations.
Keep verified outcomes separate from assumptions and unchecked claims.

When implementation differs from the approved design, identify
the gap. Correct the implementation or propose a design revision
for human approval.

Before delivery, make the product usable in its intended environment.
Provide the setup, configuration, usage, and maintenance information
appropriate to the product.

Deliver within the project's agreed permissions when the approved
release criteria are met and remaining limitations are explicitly
accepted by the human.

Report what was delivered, its version, verification evidence,
and any remaining work.

## Evolution and continuity

Continue using the working cycle after delivery. New features,
changing needs, and maintenance remain governed by design.

For each requested change, identify the affected design scopes.
If implementation violates an unchanged approved design, correct
the implementation. If intended behavior changes, revise and
approve the design before realizing the change.

Keep design documents, their relationships, and approval records
current. When a scope moves or splits, preserve its decisions
and update references.

Record enough project state for a new human or AI session to
continue: approved baselines, implementation progress, verification
results, unresolved questions, and the next intended work.

At the start of a new session, AI reads the applicable documents
and checks the current repository state before acting.

Maintain product release history separately from design revisions
and the version of the development method adopted by the project.
Review method updates deliberately, preserving project-specific
rules and decisions.
