# 3. Develop scoped designs

**Goal:** Make one useful increment implementable without prematurely designing the entire system.

**Human:** Decide consequential behavior, interfaces, and trade-offs.

**AI:** Propose meaningful boundaries and record decisions with their correct owners.

## Identify the next responsibility

Describe the outcome to be realized and ask AI which scopes are responsible, what the approved foundation already decides, and which consequential decisions remain open.

> Identify the design scopes needed for this increment. Distinguish existing governing decisions, local responsibilities, and unresolved choices. Avoid creating scopes with no decisions to own.

## Place decisions by ownership

The project-wide `foundation/DESIGN.md` governs the overall project. A component or feature design belongs at the **nearest appropriate owning scope**; physical nesting does not itself create authority.

For example:

```text
project/
├── foundation/
│   ├── CORE.md
│   ├── DESIGN.md
│   └── RULES.md
└── lending/
    ├── lending.md
    └── renewal/
        └── renewal.md
```

Here `lending.md` can own the lending area; `renewal.md` owns renewal-specific decisions. Later, implementation can be organized under ecosystem-native source directories while preserving actual ownership and governing references.

For a responsibility spanning frontend and backend, place its common policy with an appropriate shared **responsibility**, not necessarily in the physical common directory. Both sides reference the single owning policy. Avoid generic `design/` or `shared/` containers created only to satisfy a convention.

A specific implementation file may benefit from a neighboring `.md` companion, but DLD does not require every file to have one. Do not create empty forwarding documents.

## Prepare for realization

Record significant inputs, expected outcomes, contracts, constraints, failure behavior, and observable acceptance criteria. Make delegated implementation freedom explicit. Human approval is needed for consequential design changes; use [Core](../../../foundation/CORE.md#6-design-states-and-approval) for the approval process.

When designs move, preserve decisions, approval history, incoming/outgoing references, and governing constraints. A changed scope or authority requires review rather than automatically carrying over approval.

See the [repository reference](../../reference/repository-layout.md) for wider engineering responsibilities.

## Outcome

AI can explain what will be realized, which approved decisions apply, and what remains delegated.

**Continue:** [Realize the design](04-realize-the-design.md).
