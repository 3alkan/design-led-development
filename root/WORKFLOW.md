# Repository Development Workflow

This workflow defines how the human and AI develop and maintain Design-Led Development itself. The product is the method and its copyable starter.

## Project foundation

- [ROOT.md](ROOT.md) defines this repository's purpose, scope, overall design, and approval state.
- [RULES.md](RULES.md) records adopted repository-specific requirements.
- This document defines the working process.

The [starter workflow](../starter/root/WORKFLOW.md) is distributed to users for their own projects. It is a separate artifact from this repository's workflow. Review the effect of changes across both scopes without assuming their contents must be identical.

## Human and AI responsibilities

The human directs the method and approves consequential changes to design, workflow, and rules.

AI helps develop the design, challenges assumptions, compares alternatives, and records decisions in their appropriate documents. It realizes approved changes and verifies the results.

AI works independently within approved scope and delegated freedom. It returns consequential missing decisions to discussion and cannot approve its own proposals.

## Design and approval

Begin with the relevant design and its approval state. Keep whole-repository decisions in `ROOT.md`; create focused design documents when a scope needs separate treatment.

Identify the revision and scope when recording human approval. Proposed meaningful changes remain drafts until approved; preserve the approved baseline in Git or another identifiable record. Never invent approval or extend it to later revisions. Formatting and spelling corrections need not reopen settled decisions.

A design's approval state is independent of its implementation progress. Implementation is evidence of the current realization, not authority to redefine the intended design.

## Working cycle

1. Read the applicable design, workflow, rules, and current repository state.
2. Discuss the change and revise the appropriate design scope when its meaning changes.
3. Obtain human approval of consequential decisions and the identified revision.
4. Update the affected starter documents, repository documents, and version records within approved scope.
5. Check that the result fulfills the design and that document responsibilities, links, templates, and version references agree.
6. Report what changed, what was verified, and any remaining gaps or decisions.

Apply the same cycle to maintenance. Fix nonconformance to unchanged approved design without inventing new requirements. Continue unaffected approved work while other changes are discussed.

## Verification

Review the changed documents as a user would encounter them. Confirm that the starter is usable independently after copying and that example placeholders do not claim actual approvals or adopted rules.

Check internal Markdown links, formatting, and consistency among affected documents. When reviewing a staged commit, assess the staged contents rather than relying on other local files. Report limitations honestly; a formatting check alone does not prove that the method is effective.

## Versioning and releases

`VERSION` records the method's release version. The method is this repository's product, so no separate product version is needed here. Design documents have their own revisions. Products using the method version themselves independently.

Keep user-visible changes and adoption guidance under Unreleased in `CHANGELOG.md` during development. The current baseline is `0.1.0-dev`; completing an edit or commit does not automatically require a version increase.

For stable releases, use patch versions for corrections preserving the method, minor versions for compatible additions, and major versions for changes requiring adopters to revise their workflow or documents. During `0.x`, minor releases can contain disruptive changes; explain adoption requirements.

For an authorized release, align `VERSION`, the repository README, and the starter README's method baseline; record the actual release date and changes in the changelog; and create the matching Git tag. Do not claim publication or create release records merely because a draft is ready.

When committing, review and commit the intended staged scope. Preserve unrelated work. Publication follows the human's authorization and applicable permissions.

## Continuity

Keep approved decisions, revision history, unresolved questions, and verification results identifiable for future sessions.

Users adopt method updates deliberately. Explain consequential changes and how to preserve product-specific decisions. Updating the method never automatically overwrites users' documents or approves their product designs.
