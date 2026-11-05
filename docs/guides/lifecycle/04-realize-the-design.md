# 4. Realize Approved Intent

**Optional learning chapter.** Realization can include code, configuration, documentation, integration, operations, or other concrete engineering outcomes.

## Establish the boundary before acting

Review the active scope's approved design, governing constraints, actual implementation state, and permissions. AI can make local implementation choices within its delegation.

For example, the human may approve the behavior of a submission endpoint without selecting every function name or internal parsing technique. AI may implement those local details provided they remain consistent with approved behavior and constraints.

A practical AI request:

> Realize this approved scope within the applicable design and current permissions. Explain any consequential conflict rather than silently changing intent. Check relevant interfaces and report the evidence you actually obtain.

## Discover implementation constraints

An existing library might fail to provide a required capability. That finding is evidence. AI can investigate alternatives, demonstrate the problem, and propose a changed design where necessary. It cannot quietly remove the requirement.

Similarly, if code violates unchanged approved design, correcting the code is ordinarily a realization correction rather than a new design decision, provided the correction remains within delegated authority.

## Integrate and observe

Check affected interfaces, dependent scopes, configuration, tests, and user-facing behavior. Maintain enough traceability to identify which design obligations the concrete result implements.

Work in meaningful increments. A completed edit is not proof of correctness; report any checks not performed and any uncertainty that remains.

## What the increment achieves

A concrete increment exists or is in progress, with its governing intent and current verification limits identifiable.

**Next example:** [Evaluate and deliver](05-verify-and-deliver.md).
