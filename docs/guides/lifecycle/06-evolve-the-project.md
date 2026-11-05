# 6. Maintain, Change, and Resume

**Optional learning chapter.** Projects evolve through defects, new needs, operational evidence, refactoring, and eventual retirement.

## Decide what kind of change is needed

A bug can be a mismatch between concrete behavior and unchanged approved design. In that case, correct the realization.

A requested change to an approved interface, governing requirement, or responsibility is different: identify its owning design, assess consequences, and obtain a human decision before realizing changed intent.

A useful prompt:

> Analyze this change against the currently approved design. Identify affected owning and dependent scopes, distinguish implementation defects from changed intent, and show which decisions need human approval.

## Follow effects across scopes

A local-looking interface change can affect several consumers. Before consequential approval, assess reasonably discoverable material effects; after approval, propagate the change through affected designs and realizations. Report dependencies not yet assessed and propagation that is not yet verified.

Do not describe an approved target state as already implemented. Keep those facts distinct.

## Resume without reconstructing everything

A new AI session can begin with the project foundation, the active and governing scopes, the relevant approved state, and current realization evidence. Load additional dependencies only if the work reveals that they matter.

Useful handoff information includes the active scope, completed work, actual checks, known failures, unresolved decisions, pending authorization, and a suggested next action. This summary helps navigation but does not supersede approved design or current files.

## Upgrade the method separately

The adopted Core version, a project design revision, and a product release version are different. A new DLD release does not automatically change a project's adopted Core. Review the [changelog](../../../CHANGELOG.md), assess adoption effects, and obtain deliberate human authorization before upgrading the methodology.

## What the increment achieves

The project can continue with coherent design authority and a discoverable history, without assuming that every collaborator has read every artifact.

**Continue:** Return to whichever [practical activity](01-start-the-project.md) fits the next need.
