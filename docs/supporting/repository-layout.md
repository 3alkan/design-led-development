# Adopting Project Repository Layout — Reference

**Optional DLD supporting material.** This is a practical starting point, not a mandatory scaffold. The adopted `foundation/CORE.md` governs DLD; this reference offers ways to organize engineering artifacts. No international software engineering standard prescribes one universal repository directory tree.

## 1. Start with the minimum

```text
project/
├── README.md
└── foundation/
    ├── CORE.md
    ├── DESIGN.md
    └── RULES.md
```

This is the **DLD foundation**, not necessarily a complete runnable application. Add the software, build files, tests, or other artifacts actually needed for the project. Keep the adopted Core unchanged; use DESIGN for project intent and RULES for additional human-approved project constraints.

## 2. Extend by responsibility

The table lists **possible locations**, not required folder names. A responsibility may live with its component, in a standard ecosystem location, or in an external system. Add a location when it has maintained content and a clear owner.

| Responsibility | Typical options | When and why to add it |
| --- | --- | --- |
| Implementation | `src/`, `app/`, `lib/`, `packages/`, framework-native paths | When building software; prefer established language/framework conventions |
| Tests and fixtures | `tests/`, co-located tests | When checking behavior or contracts; place tests near their ownership or shared scope |
| Verification and validation evidence | CI results, test reports, `verification/` | When evidence must be discoverable or retained; avoid copying generated reports unnecessarily |
| Product or developer documentation | `docs/`, module-local Markdown | When explanations exceed the README or serve a distinct audience |
| Examples, samples and demos | `examples/`, `samples/` | When concrete usage or integration examples benefit users |
| Data definitions and evolution | `schemas/`, `migrations/`, tool-native locations | When contracts, storage formats, or persistent data change independently |
| Static assets and localization | `assets/`, `resources/`, `public/`, `locales/` | When the product includes non-code resources; follow framework conventions |
| Configuration and environments | Manifests, `config/`, `env/` | When settings have distinct responsibility; keep secrets out of committed files |
| Build, CI and release automation | `scripts/`, `tools/`, `.github/`, CI config | When repeatable build, verification, or distribution tasks need maintained automation |
| Infrastructure and deployment | `infra/`, `deploy/`, deployment-native manifests | When infrastructure or rollout definitions are part of the maintained system |
| Operations, security and support | `operations/`, `runbooks/`, policies, incident records | When the product needs monitoring, access, recovery, maintenance, or support artifacts |
| Dependencies and third-party code | Ecosystem manifests, lockfiles, `vendor/` | When reproducibility or offline/supply-chain constraints warrant them |
| Generated intermediates and distributions | `build/`, `dist/`, external artifact storage | When separating generated outputs from maintained inputs; ignore disposable intermediates |

Legal and community files such as `LICENSE`, `CHANGELOG.md`, `CONTRIBUTING.md`, and `CODE_OF_CONDUCT.md` may be useful depending on distribution, licensing, and contributor needs; they are not additional DLD foundation requirements. Tracking, risk, issues, incidents, and release approvals may live in external systems if reliably discoverable.

## 3. Apply it to your project

| Project kind or scale | Sensible starting adaptation |
| --- | --- |
| Small script or tool | Root script or small source directory, tool-native dependencies, focused tests |
| Library or SDK | Package-native structure, tests, examples, build/package metadata |
| Web/mobile/desktop application | Framework-native application and asset layout, tests, configuration |
| Embedded or hardware-linked software | Firmware or platform projects, hardware interfaces, build tooling, validation evidence |
| Service or deployed system | Runtime components, interface contracts, CI, deployment and operations artifacts as needed |
| Multi-component system or monorepo | Owned `apps/` or `packages/` areas, single owners for shared contracts, integration tests and common tooling |
| Regulated or high-assurance work | Explicit verification, traceability, risk, configuration, release, and retention evidence where required by applicable obligations |

Start from the project's **technology conventions**, then increase separation as independent ownership, coordination costs, assurance needs, or deployment boundaries justify it. Project size alone is not a reason to create empty categories.

## 4. How to extend safely

1. **Identify the responsibility:** What real artifact or decision needs an owner?
2. **Check existing conventions:** Use the toolchain's normal placement unless there is a concrete reason not to.
3. **Place authoritative design logically:** Keep one owner for each design decision. Detailed designs may be co-located with implementation or placed at an appropriate shared scope; one-to-one Markdown twins are optional.
4. **Connect dependencies:** Make governing designs, affected interfaces, realizations, and evidence discoverable without duplicating authority.
5. **Expand only when needed:** Add the smallest useful file or directory. When splitting or moving scopes, check approvals, governing constraints, and incoming/outgoing references.

A generated package is not necessarily an approved release. A passing test is not evidence for an unrelated claim. Physical directory structure does not replace approval, verification, or design ownership.

