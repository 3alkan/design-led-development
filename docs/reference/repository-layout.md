# Reference Repository Layout

This reference describes a **comprehensive catalogue of engineering responsibilities**, not a mandatory scaffold. Projects instantiate only responsibilities they actually need. It is informed by software engineering practice and standards, but is not a formal conformance specification.

## How to use this reference

Use the [Core's scope and ownership principles](../../foundation/CORE.md#5-design-scopes-and-ownership) to determine which responsibility owns an artifact. The layout below is a catalogue, not a set of additional DLD rules.

Start with the engineering responsibilities the project actually has. Prefer ecosystem-native conventions for source and build configuration, keep authoritative designs and relevant evidence discoverable, and separate maintained sources from generated outputs. Add folders only when their ownership and purpose are meaningful.

## Reference structure

```text
project/
├── README.md                 # Entry point
├── LICENSE                   # License, when applicable
├── CHANGELOG.md              # Change and release overview, when applicable
├── VERSION                   # Optional; ecosystem manifests may own versioning
├── foundation/               # Project-wide authority
│   ├── CORE.md               # Frozen adopted DLD methodology
│   ├── DESIGN.md             # Project-wide authoritative abstract design
│   └── RULES.md              # Project-specific adopted constraints
├── src/                      # Implementation source where conventional
├── tests/                    # Shared / cross-scope executable tests
├── verification/             # Verification and validation plans and evidence
├── docs/                     # Conventional explanatory/product documentation
├── examples/                 # Examples and demonstrations
├── tools/                    # Shared engineering utilities
├── config/                   # Optional independently owned shared configuration
├── infra/                    # Optional infrastructure definitions
├── deploy/                   # Optional deployment definitions
├── operations/               # Optional operations and recovery artifacts
├── build/                    # Generated intermediate outputs (normally ignored)
└── dist/                     # Generated distributables (normally ignored)
```

This tree is a catalogue of responsibilities, not an instruction to create empty directories. Ecosystem-specific files such as `pyproject.toml`, `CMakeLists.txt`, and `.github/workflows/` remain where their tools expect them. Software source may exist outside `src/` in legitimate ecosystems.

## Placement and relationships

- `foundation/CORE.md` defines the adopted, versioned DLD working method and is not customized within the project. `foundation/DESIGN.md` and `RULES.md` are project-specific; `foundation/` is not the home of every detailed design. A scoped design belongs at the nearest appropriate owning scope and may predate or outlive its implementation.
- For shared decisions, use the nearest appropriate common owner or an independently meaningful sibling scope at that level; do not create a mandatory global `design/` or `shared/` folder.
- `docs/` retains the conventional meaning of user, developer, and reference documentation; a Markdown file is not authoritative merely by residing in `docs/`.
- `tests/` contains maintained executable tests and fixtures serving shared or cross-scope needs. Component tests may be co-located. `verification/` covers broader plans, assessment, validation, and evidence without duplicating tests; external CI evidence may be referenced.
- `tools/` holds project-wide engineering utilities; a component-owned utility may stay with that component. Place configuration with its owner; `config/` is only for independently owned shared configuration.
- `infra/`, `deploy/`, and `operations/` are separate responsibilities that can be co-located, grouped, or omitted according to project need.
- Planning, risk, changes, incidents, support, and retirement records belong with their responsible scopes or external systems, with discoverable references. They must not be confused with the authoritative design.
- `build/` and `dist/` distinguish generated intermediate artifacts from assembled product outputs. A distributable is not a verified, authorized release simply because it exists.

## Distribution responsibilities

A project may produce one or more distributable artifacts. Identify the maintained inputs, ownership of assembly, output boundaries, and verification evidence for each distribution. A generated package is not automatically an approved or authorized release.

DLD's own distribution process is documented separately for contributors in the development repository; an adopting project follows the packaging conventions appropriate to its technology and products.

## Extensions

Add `apps/`, `packages/`, `assets/`, `schemas/`, `migrations/`, `vendor/`, `benchmarks/`, or other structures only where justified by an explicit engineering responsibility or toolchain convention. Identify the owner and relationships; avoid duplicate authority and needless empty folders.
