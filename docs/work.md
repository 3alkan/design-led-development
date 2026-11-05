# Work with DLD

This guide follows **one illustrative engineering increment** to show the relationship between human decisions, AI autonomy, design, implementation, and evidence. It is not a required lifecycle sequence. DLD's [recurring operating method](../foundation/CORE.md#7-working-method) can repeat or overlap at any scope and lifecycle moment.

## Example: introduce a submission form

Imagine that a small project already has an approved public website. The human now wants visitors to submit an application.

### Understand the current boundary

AI reads the project foundation, the website's governing design, relevant existing code, and any previous decisions about data handling. It establishes what is approved, what is unknown, and which actions are delegated.

It does not need a complete historical reconstruction of unrelated components.

> Help me assess a proposed submission form against our approved project design. Show what is already decided, which scopes it affects, and what remains consequential.

### Propose and decide

AI can compare possible form behavior, validation, storage, and reviewer access. The human may approve an identifiable scope such as “accept a submission with specified required fields and report a successful receipt,” while deferring notification behavior.

This is a **bounded approval**: notification handling remains a proposal rather than becoming silently authorized. An approval record identifies the human, scope, revision, and accepted content; its baseline is preserved separately. A commit alone does not approve it.

### Refine design ownership

The form's user-facing behavior and the receiving service may have different owners. If they share a submission contract, designate one owner of that contract and reference it from both sides.

Co-located `.md` design companions are one option. They are not required for every source file, and a folder hierarchy does not decide authority.

### Realize approved scope

AI may select internal helper functions or a validation implementation within the approved interface, constraints, and explicit delegation. It cannot silently weaken a security requirement, change the promised API, or publish a release without permission.

If a limitation makes the approved design unsuitable, AI presents the evidence and proposes a design revision before changing consequential intent.

### Verify and validate

AI checks the actual result. A unit test of field validation may support a narrow conformance claim; it does not prove that storage, reviewer permissions, or a complete user journey work.

A report distinguishes actual outcomes:

| Question | Example result |
| --- | --- |
| What was implemented? | Form markup and local validation |
| What was checked? | Required-field tests passed |
| What remains unverified? | End-to-end persistence and accessibility |
| What decision is pending? | Whether confirmation email is in scope |

These entries are **illustrative**, not performed checks.

### Evolve and hand off

If the form violates unchanged approved rules, correct the realization. If a new user need changes intended behavior, propose the change at the responsible scope and assess affected dependents.

A useful handoff identifies the active scope, current approvals, completed work, actual evidence, limitations, pending choices, and next action. It helps the next AI session find relevant context, but it cannot supersede project authority.

## When work is different

A project might be investigating feasibility, modernizing an existing subsystem, verifying a product, repairing a defect, or retiring a service. The same distinction remains useful: **approved intent**, **authorized action**, **observed evidence**, and **proposed change** are not the same thing.

Consult [Core](../foundation/CORE.md) for exact obligations and [organization guidance](organize.md) for scope relationships.
