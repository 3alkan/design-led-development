# Design-Led Development Workflow

This workflow defines how the human and AI work together to realize
a project from beginning to end.

Design is the project's source of truth. The human and AI develop
the design together, recording the project's purpose, behavior,
structure, and constraints in Markdown documents.

The human directs the project and approves its design. AI contributes
to design discussions, realizes approved designs, and verifies that
the implementation fulfills them.

Design continues to govern the project through implementation,
delivery, maintenance, and future changes.

## Project foundation

The project's working method, mandatory rules, and top-level design
are recorded in three documents under `root/`:

- `WORKFLOW.md` defines how the human and AI work together.
- `RULES.md` defines project rules that must be followed.
- `ROOT.md` defines the project's purpose, scope, intended outcomes,
  and overall design.

The human and AI maintain these documents as the project evolves.
AI may propose changes; the human approves changes to the working
method, rules, and design.

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

Design begins in `root/ROOT.md`, which establishes the project's
overall purpose, scope, major responsibilities, and shared constraints.

As the design develops, divide it into meaningful scopes. Each
design document owns the decisions appropriate to its scope and
references the broader decisions that govern it.

A parent document establishes context and delegates responsibilities.
Child documents develop those responsibilities in detail. Keep
decisions at their appropriate level instead of collecting every
detail in the parent or repeating shared decisions across documents.

A folder's design document lives inside that folder and uses its
name, such as `lending/lending.md`.

When an individual file needs a focused design, its document lives
beside it and keeps the complete filename with `.md` appended,
such as `eligibility.py.md`.

Design documents can exist before their corresponding implementation.
Not every implementation file needs a separate design document.

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
   for the identified revisions and implementation scope.

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
