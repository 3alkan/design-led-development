<!-- SPDX-License-Identifier: CC0-1.0 -->
# Repository Layout — Optional Suggestions

DLD does not prescribe a universal directory tree. Prefer ecosystem conventions and add structures only when a real responsibility needs them.

## Illustrative start

```text
project/
├── README.md
├── dld/
│   ├── CONTEXT-REGISTRY.md
│   ├── CONTRACT.md
│   ├── DLD.md
│   └── supporting/
└── ...project-specific files
```

The project may maintain its design, implementation, rules, and evidence outside the DLD folder. Register or link relevant project context through project-owned entry points.

## Common options

| Responsibility | Typical location | When useful |
| --- | --- | --- |
| Implementation | `src/`, `app/`, `packages/`, framework defaults | Follow the language and framework |
| Tests | `tests/`, colocated tests | Keep verification near ownership |
| Design | `DESIGN.md`, `docs/`, scoped Markdown | When intent and decisions need durable ownership |
| Developer documentation | `docs/`, module READMEs | When explanations exceed the entry point |
| Build and CI | `scripts/`, `tools/`, native CI paths | When repeatable automation is needed |
| Configuration | Manifests, `config/` | When configuration has separate responsibility |
| Infrastructure and operations | `infra/`, `deploy/`, `operations/` | When deployed systems need it |
| Generated outputs | `build/`, `dist/` | When generated files should be separated |

Avoid creating empty directories for speculative future needs. Link to the single owner of a decision rather than duplicating its authority. The optional [rulebook](RULES.md) can be copied and customized.

**Everything here is practical guidance, not an obligation.**
