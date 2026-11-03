# 5. Verify and deliver

Determine whether the increment fulfills the approved design and prepare it for actual use.

**Human:** Assess intended outcomes and experience, resolve remaining product decisions, and authorize delivery within agreed permissions.

**AI:** Gather conformance evidence, identify gaps, and prepare appropriate usage and operating information.

## Verify against the design

Ask AI:

> Assess this increment against the approved design. For each important acceptance criterion, explain what you checked, the result, and any limitation. Separate observed evidence from assumptions.

Use the checks suited to the project: automated tests, direct use, interface checks, visual inspection, or operating checks. Technical success alone does not prove the intended experience is correct.

A compact record can be useful:

| Approved expectation | Check and environment | Result | Remaining limitation |
| --- | --- | --- | --- |
| [Expectation] | [Actual check performed] | [Observed result] | [Unverified part or gap] |

This is a blank example, not verification evidence. Store the actual results in a location appropriate to the project, linked from its delivery record or README where useful.

## Review design-document sediment

During routine design audits, classify history embedded in the current design as `SEDIMENT`: superseded wording or revision archaeology in the body, approval-header prose exceeding one line per revision, or rationale duplicated across files. Report each finding with its location and an appropriate correction. Move long-form findings to the project's findings/audit records; preserve superseded versions in Git rather than inside design prose.

A `SEDIMENT` finding is a documentation-maintenance issue, not proof that a design decision is invalid or that approval occurred. A correction must not silently change approved meaning, delete pending draft content, or manufacture an approval record.

## Resolve gaps honestly

Correct implementation that fails approved expectations. If the intended design needs to change, discuss and approve that revision before treating the implementation as conforming.

Keep deferred work outside the claimed delivery scope. The human must explicitly accept remaining limitations; do not label an unmet mandatory expectation as verified.

## Prepare the product for use

Update the product README with actual prerequisites, setup, configuration, and usage instructions. Replace placeholders as information becomes known.

For the intended delivery, provide release notes and the operating information it needs. Depending on the product, this can include deployment, data migration, backup, recovery, or rollback instructions. Avoid imposing irrelevant infrastructure on a small project.

Use a product versioning convention appropriate to its users. Its version is independent of the method baseline recorded in its README.

## Deliver and record

Confirm that the approved release criteria are met and delivery is authorized under the project's agreed permissions. Record the actual version, delivered scope, verification evidence, accepted limitations, and access or installation information.

Do not equate creating a commit with publishing a release. Report what was actually delivered and what remains.

## Ready to continue

Users should be able to obtain and use the delivered product, and maintainers should understand its known state.

Next: [Evolve the project](06-evolve-the-project.md).
