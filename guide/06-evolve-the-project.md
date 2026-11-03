# 6. Evolve the project

Use the same design-led working cycle after delivery. Preserve intent while responding to defects, changing needs, and new evidence.

**Human:** Prioritize changes and approve consequential revisions.

**AI:** Identify affected scopes, propose alternatives, preserve approved baselines, and realize and verify approved changes.

## Start each change in context

For a reported problem, compare the observed behavior with approved design. An implementation defect can be fixed against unchanged design. A change to intended behavior requires a design revision.

For a renewal-policy change, revise the renewal design rather than changing a constant first. Identify affected artifact contracts and criteria. Broader documents whose decisions remain valid need not repeat the new detail.

Ask AI:

> Identify the scopes affected by this request. Explain whether it corrects implementation or changes approved design. Propose the necessary revisions and identify what can continue unchanged.

Mark meaningful proposed revisions as drafts and preserve the approved baseline. Record actual human approval of the new revision and scope before implementing changed requirements.

## Final-state writing

An approved design document describes **the current state**, not the sequence of edits that produced it. Each paragraph states a current rule, its realization, or at most one sentence of rationale. Do not narrate superseded proposals, audit discoveries, or past wording in the design body.

While revision N is pending, inline `(Draft revision N: …)` markers may identify proposed changes for the approver. These markers exist only in drafts. For a document with both approved and pending work, use `Status: Mixed`, retain only the recorded approved scope as authoritative, and place unapproved proposals in a clearly labeled `Pending changes — Draft revision N` section. If only part of N is approved, identify the approved scope and move the remainder to a new draft revision before sweeping; a partial decision never silently approves the remainder.

**Approval sweeps the draft.** Once the human actually approves the identified scope and revision:

1. Confirm that the last approved baseline is recoverable from Git. Preserve the exact pending draft in a separate commit before sweeping **only when** that intermediate text must be independently recoverable; this extra commit is not mandatory for every approval.
2. Remove inline markers for the approved revision and superseded-history narration from the current design body. Retain the approved decisions and necessary rationale.
3. Append one concise `- Approval: Rev N approved by [who] [YYYY-MM-DD]` header line for each approved revision, keeping earlier entries. Identify the approved scope in the Git commit message or an associated findings/approval record; partial approval does not approve the rest. Never invent approvers or dates.
4. Verify that the final-state text matches the human-approved scope, then **commit the approved baseline**. The commit message identifies the relevant design paths, revision numbers, and approved scope (or points to a separate approval record). One coherent commit may cover several approved designs. No design-specific Git tag is required.

**Baseline identity.** The final-state commit SHA identifies the approved repository snapshot; the design header identifies its own revision and approver. Find the baseline by the descriptive commit message, its SHA, and the design path, even when one commit covers several documents. Git history keeps earlier commits recoverable. Design-specific tags are unnecessary; published method or product releases continue to use release tags.

History has three distinct homes: **Git commits** preserve superseded text and approved design baselines; **findings/audit records** preserve longer investigation and session context outside design bodies; **one-line header approval records** identify who approved which revision and when. Do not paste audit narratives into approval fields or repeat rationale across design files.

The sweep is performed after approval, not as a way of asserting approval for a pending proposal. Committing still requires the permissions defined by the project's workflow; if permission is unavailable, do not claim that the approved baseline has been committed. Request authorization or leave the Git step pending.

## Preserve meaningful checkpoints

AI should notice useful commit checkpoints as work progresses. Examples
include an agreed design revision before implementation, a verified
implementation increment, or a focused correction. Not every document
edit needs a commit, and one coherent change can span several files.

After inspecting the working tree and staged changes, AI might suggest:

> The renewal policy revision and its affected artifact contracts form a
> coherent design baseline to preserve before implementation. Include
> those design changes together and leave the unrelated catalog edits
> out. Suggested message: "Revise the loan renewal policy".

This is an illustrative suggestion, not approval or a command to commit.
The human can request the commit or delegate committing permission for
an explicit scope. Before creating it, review the actual staged contents
so unrelated changes are not included.

A commit preserves a snapshot. It does not grant design approval,
establish verification, publish a release, or authorize a push. Keep
those decisions and their evidence separate.

## Keep knowledge usable

Update affected links when designs move or split. Preserve decisions and approval context. Keep implementation progress and verification evidence distinguishable from design requirements.

When finishing a work session, leave an identifiable account of current approved scope, completed work, checks, unresolved questions, and the next intended work. Use existing project records where practical rather than creating mandatory paperwork for every session.

At the next session, instruct AI to read the applicable workflow, rules, designs, and current repository state. A previous chat's conclusion is not evidence that the files remain unchanged.

## Keep three records independent

| Record | Tracks |
| --- | --- |
| Method baseline | The Design-Led Development version adopted by the product. |
| Product version | Releases of the product you are building. |
| Design revision | Changes and approval within an individual design scope. |

A design revision does not automatically require a product release. A method update does not automatically change product behavior. Choose product release increments based on the project's own release convention.

## Adopt method updates deliberately

Read the method's [changelog](../CHANGELOG.md) and compare the baseline you adopted with the proposed update. Distinguish released entries from Unreleased changes. For adoption beyond a release, use the recorded source commit and local adaptation notes to identify the original contents.

Propose relevant changes to your product's workflow and templates. Preserve product-specific rules and approved decisions; do not overwrite them by copying a new starter blindly.

Obtain human approval for consequential changes to workflow, rules, or design. Update the recorded method baseline and note any recommendations intentionally left out.

## Continue the cycle

After a change is approved, return to [realization](04-realize-the-design.md), then [verification and delivery](05-verify-and-deliver.md). The product should remain understandable and maintainable as its design and implementation evolve.
