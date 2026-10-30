# 4. Realize the design

Turn an approved increment into working implementation while keeping its design authoritative.

**Human:** Remain available for consequential design decisions and review behavior when needed.

**AI:** Read the applicable approved designs and rules, implement within delegated freedom, and perform appropriate technical checks.

## Begin from the approved scope

A useful instruction is:

> Realize the approved renewal design and its approved artifact contracts. Read the governing designs and rules first. Make local implementation choices independently within their boundaries. Bring consequential gaps or contradictions back to discussion.

AI should identify the relevant approved revisions and existing implementation before editing. It can organize the technical work into manageable steps without turning every step into a new design approval.

## Distinguish implementation freedom from design changes

| Finding or choice | How to handle it |
| --- | --- |
| A helper function can be simplified without changing a contract. | AI can make the local implementation choice. |
| A library cannot support approved behavior. | Bring evidence and alternatives to design discussion. |
| The member experience would change to simplify implementation. | Propose a design revision and obtain approval first. |
| Existing code violates an unchanged approved expectation. | Correct the implementation within the authorized scope. |

Read existing code as evidence of the current state. Passing tests or finding an established behavior does not give the code authority over approved design.

## Return new evidence to design

If an important decision is missing, explain the gap, its consequences, and concrete alternatives. Update the relevant design draft and obtain approval before realizing changed requirements. Keep previously approved decisions identifiable.

Continue unaffected approved work where possible. Experiments can inform the decision when their scope is agreed; a successful experiment does not itself approve a design.

## Report the increment

State what was implemented, which design scope it realizes, which checks ran, and what remains. Be explicit about checks that could not be performed.

Keep technical checks proportional to the change. They should provide useful evidence of behavior, interfaces, or constraints rather than merely restating the implementation.

## Ready to continue

The increment should run in the environment needed for assessment, with its remaining limitations visible.

Next: [Verify and deliver](05-verify-and-deliver.md).
