# Repository Layout — Optional Reference

DLD does not prescribe a universal repository tree. Begin with your language and framework conventions and add maintained locations only when they serve a real responsibility. This material is practical guidance, not an obligation.

## Small start

```text
project/
├── README.md
├── dld/
│   ├── CONTEXT-REGISTRY.md
│   ├── CONTRACT.md
│   ├── DLD.md
│   └── supporting/
└── ...project files
```

Use the editable `dld/CONTEXT-REGISTRY.md` to locate design, decisions, rules, evidence, and dependencies maintained elsewhere in the project.

## Extend by responsibility

| Responsibility | Common choices |
| --- | --- |
| Code and components | `src/`, `app/`, `lib/`, `packages/`, ecosystem defaults |
| Tests and fixtures | `tests/`, co-located tests |
| Verification and validation evidence | CI artifacts, reports, `verification/` |
| Project and developer documentation | `DESIGN.md`, `docs/`, component-local Markdown |
| Examples and demonstrations | `examples/`, `samples/` |
| Schemas and data evolution | `schemas/`, `migrations/`, ecosystem defaults |
| Assets and localization | `assets/`, `resources/`, `public/`, `locales/` |
| Configuration and environment | Manifests, `config/`, environment-specific configuration |
| Build, CI, and releases | `scripts/`, `tools/`, CI-native files |
| Deployment and infrastructure | `deploy/`, `infra/`, platform-native manifests |
| Operations, security, support | `operations/`, runbooks, policies, incident records |
| Dependencies and third-party code | Lockfiles, manifests, `vendor/` |
| Generated work and distributions | `build/`, `dist/`, external artifact storage |

Keep secrets out of tracked configuration. Avoid retaining generated reports when a durable link to the evidence suffices. Legal and community files may be useful but are not extra DLD foundation requirements.

## Adapt to the project

A small script may need little more than its source and focused tests. Libraries benefit from package-native metadata and examples; applications from framework-native layouts; embedded work from hardware interfaces and validation evidence; services from deployment and operations information; and monorepos from clearly owned components and shared interfaces. High-assurance or regulated work may need more explicit risk, traceability, verification, and retention evidence.

## Extend safely

Identify the responsibility and its owner, follow existing conventions, and keep authoritative design in one logical ownership location. Organize abstract design as a hierarchy of responsibility scopes that can deepen as needed. Prefer keeping each scope's design close to its realizations for navigation and isolation; a single scope may govern several artifacts, or a specific file may warrant its own design. Place shared decisions with the narrowest coherent owning ancestor, and reference cross-scope dependencies without duplicating authority. Use meaningful design filenames such as `architecture.md`, `schema.md`, or `protocol.md` rather than mandatory `DESIGN.md` or `.design` naming. Link governing design, realization, and evidence explicitly: proximity alone does not establish authority.

For a lightweight optional content starting point, see [Design Document](design-document.md). Its four information areas are a convenience, not mandatory headings.

When moving or splitting scopes, preserve or reconcile approvals, governing constraints, and dependencies. Start small and grow only as useful.
