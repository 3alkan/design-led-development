# Adoption and Context Scope — Design

**Status:** Proposed for reconciliation

## Intent and boundary

Enable a new or existing project to adopt DLD incrementally while keeping its own design, rules, decisions, implementation, and versioning independent.

This scope owns the adopter introduction, editable registry template, and optional practical materials. It does not own the normative contract or methodology.

## Requirements

| ID | Intended requirement | Realization |
| --- | --- | --- |
| A-01 | Give adopters a short path to copy the DLD foundation, read the normative sources, and start with relevant approved intent. | [Product README](README.md) |
| A-02 | Supply a project-neutral, editable context registry with links to the two normative documents and optional resources. | [Product registry](CONTEXT-REGISTRY.md) |
| A-03 | Allow project sources anywhere in the repository; a registry entry must not imply approval. | Product registry; product README |
| A-04 | Keep development-only navigation separate from distributed adopter context. | [Development registry](../dld/CONTEXT-REGISTRY.md); [manifest](../product.toml) |
| A-05 | Provide optional, adaptable project-rules guidance without treating the template as adopted rules. | [Rules template](../dld/supporting/RULES.md) |
| A-06 | Provide practical, technology-aware repository-layout suggestions without mandating a universal tree. | [Layout reference](../dld/supporting/repository-layout.md) |
| A-07 | Explain that adopters maintain their own product versions and upgrade adopted normative DLD deliberately. | Product README |

## Design decisions

- **A-D1:** The development registry and product registry are separate source files because their audiences differ; distribution maps the neutral source to the conventional `dld/CONTEXT-REGISTRY.md` destination.
- **A-D2:** Adoption materials use CC0 so they can be tailored; normative source copies remain GPLv3.
- **A-D3:** No starter project design or rules are automatically approved or prescribed.
- **A-D4:** Supporting materials are kept few and optional; further materials require a demonstrated need.

## Acceptance

An extracted product must open at its own README. All links from the delivered registry and introduction must resolve inside the distribution. No developer-specific navigation or local governance may appear in the adopter registry. A representative adoption must demonstrate that the adopter can link project-owned design and rules without altering the normative DLD files.

## Reconciliation

Requirements and decisions are derived from existing adopter-facing sources and product mappings and await explicit design approval.
