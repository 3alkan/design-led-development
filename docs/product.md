# Design-Led Development — Product

This is the **DLD user distribution**, for humans and AI applying Design-Led Development to their software projects. Its [DLD Core](../foundation/CORE.md) is the authoritative, versioned methodology. [Documentation](README.md) explains the method, its lifecycle, and repository architecture; the [adoption guide](adoption.md) helps you start.

## Adopt DLD

Copy the **contents** of `starter/` into a new project or reconcile them with an existing project:

```text
my-project/
├── README.md
└── foundation/
    ├── CORE.md       # Frozen DLD method, identical to this package's Core
    ├── DESIGN.md     # This project's draft design
    └── RULES.md      # This project's additional adopted constraints
```

The copied Core is not edited to express project preferences. Write project decisions in DESIGN and additional project constraints in RULES. Use the [reference layout](reference-repository-layout.md) selectively as your project grows.

## Work with AI

At the beginning of every new or resumed AI session, explicitly instruct AI:

> Read `foundation/CORE.md`, `foundation/RULES.md`, and `foundation/DESIGN.md`. Then read applicable scoped designs and inspect the project state. Follow Core, respect the approved design and constraints, and ask before making consequential changes to approved decisions.

No automatic Markdown discovery is assumed and no AI-specific agent file is required. The installed starter is operationally self-contained: the entire DLD package need not be copied to the project.

## Product contents

The package includes the same **DLD Core** as the development distribution; shared documentation; adopter-specific guidance; the clean starter; license, version, and changelog. The development repository's own project DESIGN, RULES, and internal contributor materials are excluded.

DLD Core updates are deliberate, versioned adoption events. They do not automatically approve or replace project-specific design or rules.
