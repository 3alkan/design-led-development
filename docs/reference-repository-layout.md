# Reference Repository Layout (Candidate v1)

This guide describes a **comprehensive reference**, not a required scaffold. Projects instantiate only responsibilities they actually need. It is informed by software engineering practice and standards, but is not a formal conformance specification.

## Architectural rules

1. One authoritative owner per design decision, located at the nearest appropriate scope encompassing its responsibility. Other scopes reference rather than duplicate it.
2. Organize primarily by engineering responsibility; co-locate scoped designs, realizations, and tests when meaningful. Cross-scope relationships may be explicit links instead of directory nesting.
3. Preserve ecosystem-native source, configuration, build, CI, and packaging conventions when these are the natural owners.
4. Treat lifecycle stages as activities across areas, not as the primary directory taxonomy.
5. Separate authoritative design, maintained realization sources, generated outputs, supporting documentation, verification evidence, and lifecycle records.
6. Create additional directories only for distinct, appropriately owned responsibilities; keep them discoverable.

## Reference structure

```text
project/
├── README.md                 # Entry point
├── LICENSE                   # License, when applicable
├── CHANGELOG.md              # Change and release overview, when applicable
├── VERSION                   # Optional; ecosystem manifests may own versioning
├── foundation/               # Project-wide authority
│   ├── DESIGN.md             # Comprehensive project-wide abstract design
│   ├── CORE.md           # Human–AI collaboration and delegated authority
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

- `foundation/` owns the project-wide design and governance, not all detailed designs. A scoped design belongs at the nearest appropriate owning scope and may predate or outlive its implementation.
- For shared decisions, use the nearest appropriate common owner or an independently meaningful sibling scope at that level; do not create a mandatory global `design/` or `shared/` folder.
- `docs/` retains the conventional meaning of user, developer, and reference documentation; a Markdown file is not authoritative merely by residing in `docs/`.
- `tests/` contains maintained executable tests and fixtures serving shared or cross-scope needs. Component tests may be co-located. `verification/` covers broader plans, assessment, validation, and evidence without duplicating tests; external CI evidence may be referenced.
- `tools/` holds project-wide engineering utilities; a component-owned utility may stay with that component. Place configuration with its owner; `config/` is only for independently owned shared configuration.
- `infra/`, `deploy/`, and `operations/` are separate responsibilities that can be co-located, grouped, or omitted according to project need.
- Planning, risk, changes, incidents, support, and retirement records belong with their responsible scopes or external systems, with discoverable references. They must not be confused with the authoritative design.
- `build/` and `dist/` distinguish generated intermediate artifacts from assembled product outputs. A distributable is not a verified, authorized release simply because it exists.

## Product boundaries and packaging

Each distributable has identifiable maintained inputs, an ecosystem-native or simple explicit assembly definition, and verifiable outputs. One repository may produce several products. DLD itself has one version and release tag with two distributions: **development** (materials to maintain DLD) and **product** (materials needed to use DLD). Do not copy the DLD development project's own `foundation/` into adopters' projects; the product's starter contains a separate, unapproved `foundation/` template for users.

## Extensions

Add `apps/`, `packages/`, `assets/`, `schemas/`, `migrations/`, `vendor/`, `benchmarks/`, or other structures only where justified by an explicit engineering responsibility or toolchain convention. Identify the owner and relationships; avoid duplicate authority and needless empty folders.
