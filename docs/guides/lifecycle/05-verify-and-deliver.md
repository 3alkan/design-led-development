# 5. Evaluate and Deliver Outcomes

**Optional learning chapter.** The appropriate evidence depends on the project and the consequences of failure.

## Verify and validate different questions

**Verification** asks whether the realization conforms to its approved design. **Validation** asks whether the outcome serves its intended need.

For a submission form, verification might include inspecting required fields, testing invalid inputs, and checking the API contract. Validation might involve having intended users complete a realistic application and assessing whether the flow meets their actual needs.

Ask AI:

> Compare the current realization to the approved requirements and intended outcomes. Identify the checks you actually performed, their results, and the properties you still cannot establish.

A compact optional evidence note might be:

| Claim | Supporting observation | Limits |
| --- | --- | --- |
| Required fields are validated | Relevant validation tests passed | End-to-end behavior not yet checked |
| Reviewer can inspect a submission | Reviewer walkthrough succeeded | Accessibility review pending |

This table is an **illustrative record**, not actual verification evidence or a mandatory format.

## Interpret failures

A failed check may indicate a realization defect, an invalid assumption, or a deficiency in intended design. Correct implementation against unchanged approved intent; return consequential design changes to human approval.

A check not performed is not a failed check. Equally, it is not a passed check. Describe the uncertainty.

## Prepare real delivery

Before deployment or release, identify the actual scope, acceptance criteria, permissions, known limitations, and useful operating information. A built archive, tag, or passing test is not publication authorization.

Delivery, support, and retirement practices vary with the kind of software and user context; there is no universal DLD packaging platform or release ceremony.

## What the increment achieves

People can distinguish what was produced, what was checked, what remains uncertain, and what was actually authorized for use.

**Next example:** [Maintain, change, and resume](06-evolve-the-project.md).
