# Repository Organization — Optional Reference

This page is a **decision aid**, not a DLD-required repository layout. The [adopted Core](../../foundation/CORE.md) establishes logical ownership and one authoritative owner per design decision. File and directory locations are representations of that ownership, not sources of authority.

## Start from responsibilities, not folders

Ask: What must this project maintain, realize, verify, operate, or deliver? Who owns each responsibility? Which other scopes depend on it?

A small project might need only the four-file DLD foundation plus its ecosystem's usual source and test files. A larger system may justify distinct components, tools, configuration, operational documents, and generated outputs.

## One illustrative catalogue

```text
project/
├── README.md
├── foundation/
│   ├── CORE.md
│   ├── DESIGN.md
│   └── RULES.md
├── src/                 # If conventional for this ecosystem
├── tests/               # If tests have a shared owning responsibility
├── docs/                # Optional explanation and product documentation
├── tools/               # Optional maintained engineering utilities
├── config/              # Optional shared configuration
├── infra/               # Optional infrastructure source
├── operations/          # Optional runbooks and support material
├── build/               # Optional generated intermediate artifacts
└── dist/                # Optional assembled deliverables
```

Only the foundation files shown above are the standardized DLD project foundation. **Do not create these other directories unless the project needs them.** Many ecosystems prefer `app/`, `packages/`, co-located tests, or tool-specific locations instead.

## How to choose the owner

A design about a module's private behavior can live close to that module. A shared protocol should have one appropriately responsible owner and be referenced by its consumers. A system-level constraint belongs where it governs the affected scope; copying it into multiple lower-level designs does not create independent authorities.

An adjacent `module.py.md` may be useful when a file has meaningful independent design responsibilities. It is optional. A project may group several files under one owned design or use one file to realize decisions from several scopes.

Cross-scope interactions make a responsibility graph, not necessarily a directory tree. Preserve discoverable references and governing constraints as the project becomes more complex.

## Other common responsibilities

| Responsibility | Possible placement | Consideration |
| --- | --- | --- |
| Maintained implementation | Ecosystem-native source directories | Prefer the conventions of the language or framework |
| Tests and fixtures | Co-located or `tests/` | Choose based on who owns their maintenance |
| Verification evidence | CI artifacts, reports, scope records | Make relevant evidence discoverable; avoid duplicating it |
| Configuration and secrets handling | Local scope, manifests, secure systems | Do not store secret values merely for documentation convenience |
| Infrastructure and deployment | Tool-native files, `infra/`, `deploy/` | Separate ownership when it benefits operations |
| User and maintainer documentation | `docs/` or product-native locations | Documentation is not authoritative just because it is Markdown |
| Generated outputs | Ignored build paths or artifact storage | Distinguish products from maintained source |
| Releases | Distribution and release systems | An artifact is not an approved release just because it exists |

Planning, incidents, risk records, migrations, interfaces, schemas, licenses, and assets may each need independent scope ownership. Create them only as actual responsibilities emerge.

## When restructuring

Before moving or splitting designs, identify incoming and outgoing references, authoritative decisions, and approved boundaries. A location-only move need not change intent. Reassignment of decision authority or governing constraints is a consequential change.

Use [the practical design guide](../guides/lifecycle/03-develop-detailed-designs.md) for a worked approach. The authoritative rules remain in Core.
