# 6. Evolve and maintain the project

**Goal:** Preserve project intent while responding to defects, changes, evidence, operation, and eventual retirement.

**Human:** Prioritize changing needs and approve consequential revisions.

**AI:** Identify affected scopes, compare realization with design, propose revisions, and verify approved changes.

## Classify the change

When a problem or request arises, determine whether actual behavior violates **unchanged approved design** or the intended design itself must change.

> Identify the design scopes affected by this change, distinguish an implementation correction from a proposed design change, and show what approved work can continue unchanged.

Correct the first case through realization. For the second, revise the appropriate authoritative design and obtain human approval before realizing the changed intent. Do not rewrite design merely to justify accidental implementation.

## Preserve continuity

Maintain navigable references among owning designs, implementations, and relevant evidence. After a substantial increment, preserve meaningful, authorized commit checkpoints and clearly distinguish approved baselines, completed realization, verification results, remaining decisions, and next work.

The [Core approval procedure](../../../foundation/CORE.md#6-design-states-and-approval) is authoritative for Draft, Mixed, partial approval, approval records, and final-state writing. A guide does not repeat or redefine that process.

## Maintain independent versions

A project's product release, each design revision, and the adopted DLD Core version describe different things. Updating one does not automatically update the others. Do not overwrite project-specific DESIGN, RULES, approvals, or history when adopting a newer DLD release.

Review the method [changelog](../../../CHANGELOG.md) before upgrading. Preserve the existing Core until an appropriate new version is deliberately adopted. Use relevant evidence from operation and users when prioritizing maintenance or retirement.

## Outcome

The project can continue coherently through later increments and lifecycle responsibilities without losing approved intent.

**Continue:** Return to the [appropriate activity](01-start-the-project.md) for the next scope.
