# Organize Engineering Responsibilities

DLD designs are organized by **logical engineering responsibility**, not by a universal folder scheme. This reference is a set of options and trade-offs, not a prescribed repository scaffold.

The [Core's design architecture](../foundation/CORE.md#5-design-architecture) owns the actual method.

## Start with ownership

Ask three questions: What decision is being made? Which scope can govern its consequences coherently? Which other scopes rely on it?

A decision about one module's internal behavior may belong near that module. A contract between two modules belongs to one governing responsibility and can be referenced by both. A system-wide security constraint should not have multiple independently authoritative copies.

A design may govern many files. One file may realize several design scopes. Names and physical nesting are conveniences rather than proof of authority.

## An illustrative repository

```text
project/
  README.md
  foundation/
    CORE.md
    DESIGN.md
    RULES.md
  app/                # Ecosystem-specific maintained code
  tests/              # Shared tests, if useful
  docs/               # Product or technical explanations
  tools/              # Shared maintained tooling
  dist/               # Generated distributables
```

Only the standardized foundation is a DLD structural requirement. Every other location above is an optional example; many ecosystems use `src/`, `packages/`, co-located tests, or entirely different layouts.

## Common choices

| Responsibility | Possible location | Reason to choose it |
| --- | --- | --- |
| Module-owned design | Adjacent to the module | Easier scoped discovery and local maintenance |
| Shared interface | One common governing owner | Avoid competing contract definitions |
| Product explanations | `docs/` or product-native help | Separate assistance from authoritative design |
| Tests and evidence | Near the owning scope, CI, or shared test area | Make results discoverable without unnecessary duplication |
| Configuration | Beside its owner or in shared config | Reflect which component actually governs it |
| Build intermediates | Ignored build/cache paths | Separate generated outputs from maintained source |
| Release packages | Distribution or registry area | Distinguish assembled outputs from authorized releases |

File-adjacent design twins can be helpful when a file contains a distinct owned engineering responsibility. No twinning ratio or global `design/` directory is necessary.

## Keep navigation proportional

A small project may need only the README and project DESIGN. A larger project benefits from narrow scoped documents, discoverable relationships, and useful handoff summaries. Add indexes when they remove real search cost; indexes do not replace the authoritative content they point to.

Before moving a design, inspect its owning decisions, references, and dependent scopes. An administrative move can preserve approval if authority and meaning remain unchanged; a reassignment of responsibility is different.

See [the working example](work.md) for a multi-scope change.
