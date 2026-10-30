# Working together through Markdown design

This is a reusable human–AI engineering approach. It is independent of any
particular project, framework, or programming language.

## The central idea

**The Markdown design files are the project’s source of truth. Implementation
is a realization of that design and has no authority over it.**

These files are first-class engineering objects. They are where we develop the
project: explore needs, compare alternatives, define responsibilities, make
decisions, resolve problems, and agree on changes. They are not explanations
written afterward to describe whatever the code happens to do.

The human wants to focus engineering attention on design. The AI helps reason
about that design and takes responsibility for producing and checking its
implementation. The human should be able to steer the project through its
Markdown files without having to manage every code detail.

## Authority and responsibility

The human owns design approval and can revise the direction of the project.
The AI can question assumptions, identify conflicts, propose alternatives, and
edit draft designs as part of the discussion. It cannot approve its own design
proposals or silently turn implementation choices into requirements.

Approved Markdown governs the corresponding implementation. If the two differ,
the difference is a gap to resolve; the code does not become correct simply
because it already exists or passes tests.

Implementation can reveal useful evidence: a constraint, a cost, a failure, or
an opportunity. That evidence returns to the design discussion. It does not
authorize the AI to redefine the approved design.

This is project-design authority. It does not override the AI’s governing
instructions, access permissions, or the human’s current directions.

## Organize design by scope and layer

Each design file owns a meaningful scope and the decisions appropriate to that
scope. Use the scope’s own name.

Consider a library lending system. Its design needs to cover the purpose of the
whole service, the lending lifecycle, individual borrowing workflows, and the
responsibilities of the artifacts that realize those workflows.

The design hierarchy could be:

```text
library/
  library.md
  lending/
    lending.md
    renewal/
      renewal.md
      eligibility.py.md
      due_date.py.md
      renewal_form.tsx.md
```

Only the design documents are shown. Their corresponding implementation files
can be created after approval. This is an example of scope, not a prescribed
technology stack or folder structure.

- A folder document lives inside its folder: `library/library.md`,
  `lending/lending.md`, or `renewal/renewal.md`.
- A file document lives beside its corresponding file and keeps the complete
  filename: `eligibility.py.md` defines the design assigned to `eligibility.py`.
- The design document can exist before the implementation folder or file does.
- Not every file needs a design companion. Generated files, dependencies, and
  trivial artifacts normally do not need separate specifications.

File-level documents matter because a folder can contain many files and many
independent decisions. Putting all those decisions into one folder document
would make it difficult to discuss, approve, and maintain them separately.

The design hierarchy should represent meaningful engineering boundaries. It
should not merely reproduce an existing code structure without considering
whether that structure makes sense.

### Each layer stays at its own level

| Design document | Decisions it owns | Detail it leaves to other scopes |
| --- | --- | --- |
| `library.md` | Who the service serves, its purpose, privacy principles, and the responsibilities of major areas such as catalog, membership, and lending. | Renewal limits, date calculations, and individual screens. |
| `lending.md` | The loan lifecycle, the responsibilities of checkout, return, and renewal, and how lending relates to membership and reservations. | The complete renewal policy and the internals of each workflow. |
| `renewal.md` | When members may renew, what blocks renewal, the extension policy, and what a successful renewal means. It assigns responsibilities to eligibility checking, date calculation, and the member interface. | Each artifact’s detailed contract and interaction behavior. |
| `eligibility.py.md` | What information the eligibility check requires, the decision and reasons it returns, and how it handles missing information. It specifies that checking eligibility does not itself change a loan. | The renewal policy it references, the date calculation, and screen layout. |
| `due_date.py.md` | The date calculation’s inputs, interpretation of dates, output guarantees, and invalid-input behavior, within the approved extension policy. | Who is eligible and how the result is presented to members. |
| `renewal_form.tsx.md` | What the member sees before confirming, how the current and proposed due dates are presented, and how pending, rejection, and success states behave. | Reimplementing eligibility rules or deciding the extension policy. |

The file-level documents are not descriptions of existing Python or TypeScript
code. They are specifications that the AI must realize in those files. Their
filenames identify focused design scopes; they do not give the implementation
authority over the decisions.

For example, suppose we discuss changing the extension from 14 days to 21 days.
That decision belongs in `renewal.md`. It does not require adding a date rule to
`library.md`, and it must not be introduced by changing a constant in code first.
After approval, the AI updates the realization and checks the affected contracts
and experience. If a file-level contract also needs to change, its design
document is revised and included in the approval scope. Documents whose
decisions remain valid do not need to repeat the new policy.

Conversely, discussing how the confirmation form preserves the member’s context
after a failed request belongs in `renewal_form.tsx.md`. It should not bloat the
whole lending specification.

The parent establishes context, responsibilities, and shared constraints. Its
children own the details delegated to them. A folder document is not a container
for every decision made anywhere beneath it.

A lower-level document references shared decisions rather than duplicating
them. It can add detail, but it cannot silently contradict a broader approved
constraint. Conflicts must be resolved explicitly in the Markdown design.
An exception requires an explicit approved design decision.

## What belongs in a design file

Include what is needed to discuss and govern that particular scope. Depending
on the layer, this can include:

- Its purpose and responsibilities.
- The experience, behavior, and outcomes it should produce.
- Its relationships with other scopes and any interfaces between them.
- Constraints, boundaries, and relevant tradeoffs.
- Visual direction, where appearance matters.
- Important empty, loading, failure, and recovery behavior.
- Open questions and decisions that still need approval.
- Observable criteria for assessing whether implementation realizes the design.
- Choices explicitly delegated to the AI.

Design can be abstract, but important expectations must be clear enough to
implement and assess. “Make it welcoming” expresses direction. “The first screen
explains who the service is for and gives visitors a clear next action” adds an
expectation we can evaluate.

Technical design also belongs here when it is meaningful at the document’s
layer. A data contract or architectural boundary may be an important design
decision. The document does not need to prescribe every variable name or repeat
the implementation line by line.

Do not expand every small document into a large mandatory template. Use the
amount of structure its decisions require.

## Approval and implementation are separate

A design’s approval status is different from its implementation progress.

- **Draft:** under discussion; proposed changes are not yet authorized for
  implementation.
- **Approved:** the human has approved an identified revision within a stated
  scope.

An approved design can be unimplemented, partly implemented, or fully realized.
“Approved” does not mean “finished,” and “implemented” does not mean “approved.”

Record approval simply enough that a later AI session can identify what was
actually approved. For example:

```markdown
Scope: Loan renewal
Design revision: 3
Design status: Approved
Approved revision: 3
Approval: Human approved revision 3 in the design discussion.
```

This is an illustrative record, not an approval to copy into real documents.
Never invent an approval, date, or revision history.

When an approved design changes in meaning, mark the proposed revision as a
draft and keep the previously approved baseline identifiable, for example
through version control. The AI must not treat an earlier approval as approval
of later edits. Formatting and spelling corrections need not reopen settled
design decisions.

## The working flow

1. **Find the relevant design.** Read the target scope’s Markdown and the broader
   documents whose decisions apply. Identify the approved baseline and any open
   questions.
2. **Do engineering work in Markdown.** Discuss needs, explore options, reason
   about consequences, and edit the appropriate design files. Keep each decision
   at its own layer.
3. **Resolve uncertainty.** Identify conflicts and consequential missing
   decisions. Propose concrete choices instead of hiding assumptions in code.
4. **Obtain human approval.** Make the design revision and approval scope clear.
   The human can approve several related documents together when that scope is
   explicit.
5. **Realize the approved design.** The AI implements it, including the necessary
   technical work within delegated boundaries.
6. **Verify conformance.** Check the implementation against the design’s
   responsibilities, constraints, behavior, and visual expectations. Technical
   checks support this assessment but do not replace it.
7. **Report the result.** Explain what was realized, what was verified, and any
   remaining gaps. If evidence requires reconsidering the design, bring it back
   to the appropriate Markdown scope.

The flow repeats through design revisions. It is not a one-time specification
followed by a separate, implementation-led project.

## Open implementation choices versus open design decisions

The AI should act autonomously within the freedom the design gives it. This
approach should not require the human to approve every helper function.

A local implementation choice is normally delegated when it preserves the
approved behavior, interfaces, constraints, and experience. A consequential
choice that changes those things belongs in the design discussion.

If the distinction is unclear, state the assumption and its consequences in the
relevant Markdown file and discuss it. Missing design is not unlimited
permission to invent the project through implementation.

Experiments and prototypes can inform a decision when their scope is agreed.
Their output is evidence, not an approved design. A successful prototype does
not silently become the project’s specification.

## Keeping design and realization aligned

- Start requested changes at the appropriate Markdown layer.
- Read existing code to understand the current realization, not to infer that
  its behavior has design authority.
- Do not rewrite the design merely to make existing code appear compliant.
- Keep observed implementation state separate from normative requirements.
- Preserve decisions and their approval context across sessions.
- Surface drift instead of silently maintaining two competing versions of the
  project.
- If a design file moves or its scope is split, preserve its decisions and
  update the affected references.

Synchronization is work the AI performs during an active task. This approach
does not imply that editing Markdown automatically launches a background build
or updates a deployed system.

Not every `.md` file is an authoritative specification. A README, meeting note,
or implementation report can remain informational. Identify which documents
define the design, their scopes, and their approval states.

## Instruction for a new AI chat or session

The following can be pasted into a new session along with this guide:

> Work with me through the Markdown design files as first-class engineering
> objects. They are the project’s source of truth; implementation is a derived
> realization with no authority to redefine them. We do our engineering work in
> these files: discuss alternatives, define behavior and constraints, resolve
> decisions, and approve revisions. Each document owns its own layer. Folder
> documents use the folder’s name, and file-level documents can use the complete
> filename plus `.md` to isolate detailed decisions. Do not crowd lower-level
> details into parent documents. Read the relevant design and its approval state
> before acting. Help me refine drafts; implement approved designs within their
> delegated freedom; verify the result against those designs. If implementation
> reveals a consequential problem or missing decision, bring the evidence back
> to the Markdown discussion instead of silently changing the intended result.
> Never approve your own proposal or treat existing code as a specification.

## What makes the approach successful

The human can make and review engineering decisions through focused Markdown
documents. The AI can realize approved decisions reliably without requiring
constant code-level direction. A new session can understand the project’s
intent, boundaries, unresolved questions, and approvals from those documents.

The measure is fidelity to the approved design—not simply how much code the AI
produces or how many technical checks pass.
