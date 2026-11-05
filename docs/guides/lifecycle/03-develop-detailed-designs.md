# 3. Refine Owned Design Scopes

**Optional learning chapter.** Decompose only as far as the next engineering task requires.

## Find the owning responsibility

Suppose the project now needs a submission form, an API for receiving submissions, and a reviewer view. These might be distinct responsibilities, but their relationships do not require a new file or directory for every imagined component.

Ask AI:

> Identify the relevant design owners and dependencies for this increment. Show which decisions are already approved, which are delegated implementation choices, and which consequential choices still need human approval.

Place an authoritative decision at the narrowest scope capable of governing all its relevant effects. A shared submission contract should have one owner even if frontend and backend both use it.

## Design enough to realize

For each active responsibility, clarify inputs, outcomes, boundaries, interfaces, failure behavior, constraints, and acceptance conditions. Link to governing scopes rather than copying their approval text.

A possible arrangement—not a required scaffold—could be:

```text
project/
  foundation/
    CORE.md
    DESIGN.md
    RULES.md
  submission/
    submission-design.md
  review/
    review-design.md
```

These documents might instead be co-located with implementation or consolidated under fewer design artifacts. Logical ownership matters more than matching directories.

## Check cross-scope effects

Before approval, assess reasonably discoverable effects on dependent scopes, interfaces, realization, and relevant tests. A human may approve a coherent multi-scope change in one decision if its boundary is explicit.

Unresolved dependencies remain visible. Do not assume approval of one design automatically covers any later discovered consequential changes.

See the optional [repository-layout reference](../../reference/repository-layout.md) for alternative placements.

## What the increment achieves

The team can identify which approved intent governs realization, what choices remain local, and what evidence will matter.

**Next example:** [Realize approved intent](04-realize-the-design.md).
