# 4. Realize the design

**Goal:** Produce a working increment that conforms to an approved design.

**Human:** Remain responsible for consequential decisions and any required permissions.

**AI:** Implement, integrate, and perform proportionate checks within approved scope.

## Establish the realization boundary

Before editing, read the applicable approved designs, project RULES, relevant existing artifacts, and constraints. Identify which technical choices were delegated.

> Implement the approved scope and its interfaces. Make local implementation choices within the delegated boundaries, verify the relevant behavior, and raise consequential conflicts before changing design intent.

Simplifying a helper or choosing an internal algorithm can be within delegated freedom. Changing an approved contract, user behavior, or safety constraint is a design decision requiring human review. If a tool or dependency cannot satisfy the design, return evidence and alternatives to discussion rather than silently redefining requirements.

## Maintain design–realization consistency

Keep changed implementation and supporting artifacts traceable to their owning design scope. Inspect whether the realized behavior matches intended outcomes, interfaces, constraints, and failure handling. Fix implementation defects against unchanged design. If new evidence calls the design into question, propose a revision and wait for approval before implementing that changed intent.

Use meaningful increments, preserving unrelated work. Report what was implemented, what was actually checked, and remaining gaps.

## Outcome

A working increment with an explicit relationship to approved design and honestly reported limitations.

**Continue:** [Verify and deliver](05-verify-and-deliver.md).
