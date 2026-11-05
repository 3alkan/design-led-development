# Adopt DLD

Adoption means establishing a known **methodological foundation** and using it to guide actual project work. It does **not** mean redesigning a complete system, adopting a prescribed directory layout, or rewriting everything into Markdown first.

The [Core](../foundation/CORE.md) is authoritative; the actions below are a practical explanation, not extra requirements.

## 1. Establish the foundation

From a DLD product distribution, copy the **contents** of `starter/` into the project, reconciling rather than overwriting existing files:

```text
README.md
foundation/
  CORE.md
  DESIGN.md
  RULES.md
```

The copied Core is the unchanged adopted method. DESIGN starts as a draft of the project's intended outcomes; RULES says no additional constraints have been adopted until the human actually approves some. Record the adopted DLD version in the README.

The template is not a human approval and does not create authority over an existing codebase.

## 2. Begin with a useful question

For a new project, ask what the project is for, who needs it, and what the next useful outcome would be. For example, a scholarship application service may begin as a public information page, before adding submission handling and review permissions.

You can ask AI:

> Read our project's foundation. Help me define its purpose and the smallest useful next scope. Distinguish what is already approved from open questions. Present consequential choices with their trade-offs; do not treat your proposals as approvals.

AI may investigate and draft freely within its permissions. Consequential intent needs the human's decision before it becomes authoritative.

## 3. Adopt an existing project incrementally

For an established application, inspect the code, tests, configuration, and user behavior **as evidence of what exists**. They are not necessarily evidence of what was intended.

Choose a scope where useful work is needed. Identify governing decisions and relevant dependencies, infer possible design from the existing system, and have the human resolve material gaps. Preserve the boundary between reconciled and unreconciled scopes.

There is no need to reverse-engineer a thousand unrelated files merely to fix a well-contained behavior. Expand the inspection when interfaces or consequences reveal that more context matters.

## 4. Keep the starting footprint small

Do not create directories, twins, traces, or records merely because a reference lists them. Introduce a scoped design when it has meaningful responsibility to own; use ecosystem-native locations when useful.

The minimal starter is sufficient without internet access or extra DLD documentation. For local optional learning material, copy the **contents** of the product's `optional/docs/dld/` into `docs/dld/` beside your adopted foundation.

## 5. Evolve without losing authority

As the project changes, preserve the distinction between approved intent, current realization, and verification evidence. Partial approvals and unfinished work can coexist when their boundaries are discoverable.

A newer DLD release does not automatically upgrade your project. Review its Core and [changelog](../CHANGELOG.md), understand the material implications, authorize the upgrade, and preserve your project-specific DESIGN and RULES.

Next, see [how work proceeds in practice](work.md) or [how to organize ownership](organize.md).
