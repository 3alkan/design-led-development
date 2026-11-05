# Design-Led Development (DLD)

DLD is a design-centered, human-authoritative, AI-assisted software engineering methodology for the **complete software project lifecycle**. Its authoritative abstract project design represents project intent, needs, requirements, structure, behavior, constraints, and decisions; implementations and other concrete artifacts are realizations and evidence, not replacements for design.

This is the **DLD product distribution**, intended for humans and AI using DLD on their software projects. It is not the DLD development repository.

## Learn the method

1. Read [DLD fundamentals](guide/methodology.md) for the principles and human–AI responsibilities.
2. Read [adoption instructions](guide/adoption.md) to start a new project or adapt an existing one.
3. Use the [practical lifecycle guide](guide/README.md) and [reference repository layout](guide/reference-repository-layout.md) as needed.

The guide supports learning and adoption; it does **not** need to be copied into each software project.

## Put DLD into a project

Copy **the contents** of `starter/` into your own project, reviewing existing files first:

```text
my-project/
├── README.md
└── foundation/
    ├── DESIGN.md
    ├── WORKFLOW.md
    └── RULES.md
```

These files are sufficient to establish DLD's operating method within the project; add other engineering artifacts only when needed. The design starts as a **draft**, not an approved requirement. Your project's README describes your own project, not DLD.

## Start a human–AI session

AI tools cannot be assumed to discover Markdown instructions automatically. In every new or resumed AI session, give a direction such as:

> Read this project's `foundation/WORKFLOW.md`, `foundation/RULES.md`, and `foundation/DESIGN.md`, then read the applicable scoped designs and inspect the project state. Follow the workflow and approved design; distinguish drafts from approved decisions. Discuss design-changing decisions with me before implementing them.

The copied `WORKFLOW.md` contains the operating rules; the user need not depend on DLD's GitHub repository or a separate AI-specific entry file. A tool-specific instruction mechanism may point to these files, but is optional and must not duplicate their authority.

## Responsibilities

Humans direct and approve consequential design decisions. AI helps design, identifies uncertainties and conflicts, and may independently realize and verify **approved** scopes within agreed delegation. Discoveries that require changing approved design return for human approval. Work can proceed incrementally through conception, requirements, realization, delivery, operation, maintenance, evolution, and retirement.

## Contents and version

- `guide/` — Shared DLD learning, reference architecture, and user-focused adoption instructions.
- `starter/` — Copyable project-operating templates for human and AI.
- `VERSION` — DLD method baseline; your own project has a separate version and design revision history.
- `LICENSE` — Licensing terms for the distributed materials.

This package and the matching **development distribution** come from one DLD source baseline. A package produced from an unreleased revision is not a published or approved method release. Read the [adoption guide](guide/adoption.md) before changing a project's DLD baseline.
