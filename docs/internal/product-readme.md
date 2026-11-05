# Design-Led Development — Product

This distribution provides the **DLD methodology for humans and AI** and a self-contained starter for adopting it in a software project. The [versioned DLD Core](../../foundation/CORE.md) is the single authoritative method.

## Learn DLD

Start with [DLD Core](../../foundation/CORE.md). Continue with the [documentation index](../README.md), [adoption guide](../guides/adoption.md), [practical lifecycle guide](../guides/lifecycle/01-start-the-project.md), and [repository layout reference](../reference/repository-layout.md) as needed. These materials explain Core; they do not replace it.

## Use DLD in a project

Copy the **contents** of `starter/` into the new or existing project's root, reconciling any existing files:

```text
my-project/
├── README.md
└── foundation/
    ├── CORE.md
    ├── DESIGN.md
    └── RULES.md
```

The copied Core is frozen for the adopted version. DESIGN and RULES belong to the adopting project; their templates do not contain approvals or rules inherited from DLD's development project.

At the start of each new or resumed AI session, explicitly direct AI to read the copied `foundation/CORE.md`, `RULES.md`, `DESIGN.md`, applicable scoped designs, and the project state. The starter README supplies a reusable instruction. Automatic Markdown discovery is not assumed and no agent-specific file is required.

## Distribution contents

The product includes Core, learning and adoption documentation, the reference layout, the clean starter, license, version, and changelog. It excludes contributor-specific governance and internal package tooling. Updating an adopted DLD version requires deliberate review and must not overwrite the user's own approved project decisions.
