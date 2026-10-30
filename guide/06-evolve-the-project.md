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

Read the method's [changelog](../CHANGELOG.md) and compare the baseline you adopted with the proposed update. For development baselines, use the recorded source commit when needed to identify the original contents.

Propose relevant changes to your product's workflow and templates. Preserve product-specific rules and approved decisions; do not overwrite them by copying a new starter blindly.

Obtain human approval for consequential changes to workflow, rules, or design. Update the recorded method baseline and note any recommendations intentionally left out.

## Continue the cycle

After a change is approved, return to [realization](04-realize-the-design.md), then [verification and delivery](05-verify-and-deliver.md). The product should remain understandable and maintainable as its design and implementation evolve.
