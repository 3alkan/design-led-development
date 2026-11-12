# Adoption and Context Scope — Design

**Status:** Proposed for reconciliation

## Responsibility and boundary

Enable a new or existing project to adopt DLD incrementally while keeping its own design, rules, decisions, implementation, and versioning independent.

This scope owns the adopter introduction, editable registry template, and optional practical materials. It does not own the normative contract or methodology.

## Intended design and requirements

| ID | Intended requirement | Realization |
| --- | --- | --- |
| A-01 | Give adopters a short path to copy the DLD foundation, read the normative sources, and start with relevant approved intent. | [Product README](README.md) |
| A-02 | Supply a project-neutral, editable context registry with links to the two normative documents and optional resources. | [Product registry](CONTEXT-REGISTRY.md) |
| A-03 | Allow project sources anywhere in the repository; a registry entry must not imply approval. | Product registry; product README |
| A-04 | Keep development-only navigation separate from distributed adopter context. | [Development registry](../dld/CONTEXT-REGISTRY.md); [manifest](../product.toml) |
| A-05 | Provide an optional rules template that an adopter can copy and modify in a project-owned location; the distributed source itself does not constitute adopted rules. | [Rules template](../dld/supporting/RULES.md) |
| A-06 | Provide practical, technology-aware repository-layout suggestions without mandating a universal tree. | [Layout reference](../dld/supporting/repository-layout.md) |
| A-07 | Explain that adopters maintain their own product versions and upgrade adopted normative DLD deliberately. | Product README |
| A-08 | Offer a minimal-core design document example that scales with scope complexity, without imposing headings or a template on adopters. | [Design-document guidance](../dld/supporting/design-document.md) |

## Decisions and rationale

- **A-D1:** Keep development and adopter context registries distinct because each discovers a different project's governing context. The manifest maps the neutral adopter source to `dld/CONTEXT-REGISTRY.md` in the distribution; neither registry is merely README navigation.
- **A-D2:** Adopters edit their context registry in place so it continues to locate their own authoritative sources. They copy the rules template before editing so optional project rules do not modify the distributed reference.
- **A-D3:** Do not ship preapproved project design or rules: an adopting project's intent and binding constraints require its own human decisions.
- **A-D4:** Keep supporting materials optional so useful examples do not become accidental methodology requirements.

## Realization and acceptance

An extracted product must open at its own README. All links from the delivered registry and introduction must resolve inside the distribution. No developer-specific navigation or local governance may appear in the adopter registry. A representative adoption must demonstrate that the adopter can link project-owned design and rules without altering the normative DLD files.

