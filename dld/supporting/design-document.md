<!-- SPDX-License-Identifier: GPL-3.0-only -->
# Design Document — Optional Guide

This is a small, expandable reference example for an abstract design. It is **not** a required DLD template or a DLD product file that adopters are expected to edit. Rename, merge, reorder, or omit headings as appropriate; use prose, tables, models, diagrams, or references wherever they express the design more clearly.

What matters is that the authoritative design of a scope, including relevant inherited and referenced information, is sufficient to identify:

1. **Responsibility and boundary:** What does the scope own, and what is outside it?
2. **Intended design:** What outcomes, behavior, requirements, interfaces, and constraints should hold?
3. **Decisions and rationale:** What consequential choices govern the scope, and why were they selected? Where are their approvals recorded?
4. **Realization and acceptance:** What artifacts does the design govern, and how can conformity and intended usefulness be assessed?

A design need not repeat applicable ancestor decisions. Shared concerns belong to the narrowest coherent governing owner; affected scopes reference them. A single design may govern multiple realizations, and a complex scope may split its design among several complementary artifacts.

## Example

```markdown
# Product Assembly

## Responsibility
Assemble a versioned product from explicitly selected sources.
Does not approve or publish releases.

## Intended Design
- Only manifest-selected files enter the distribution.
- Identical inputs produce identical archive bytes.
- Missing or unsafe input is rejected without replacing good output.

## Decisions and Rationale
- Use an explicit manifest to avoid accidental file inclusion.
- Use reproducible ZIP metadata so identical inputs can be audited.
- Approval: link the scope's human decision record when approved.

## Realization and Acceptance
- Realization: product.toml, scripts/package.ps1
- Acceptance: exact file membership, stable archive hash,
  and negative tests for unsafe or missing input.
```

## Extend only when useful

Add interfaces, data models, dependencies, scenarios, quality attributes, risks, failure behavior, alternatives, or subordinate scopes when the responsibility requires them. Some scopes need only paragraphs; others need detailed models. A file named `architecture.md`, `protocol.md`, or `schema.md` may be an authoritative design if its ownership and approval are discoverable.

A working implementation is evidence about existing behavior, not proof that the design was approved. Proposed content and approval records must remain distinguishable.
