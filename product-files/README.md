<!-- SPDX-License-Identifier: GPL-3.0-only -->
# Design-Led Development (DLD)

DLD is a design-centered, human-authoritative, AI-assisted methodology for the software development lifecycle. It can be adopted incrementally in new or existing software projects.

## Adopt DLD

1. Copy the distributed `dld/` folder into your project or reconcile it with an existing installation.
2. Read the unchanged [Collaboration Contract](dld/CONTRACT.md) and [DLD Methodology](dld/DLD.md).
3. Edit [Context Registry](dld/CONTEXT-REGISTRY.md) to reference your project's design, decisions, rules, evidence, and other relevant information wherever located.
4. Establish sufficient project design and obtain human approval for consequential intent before realizing it; distinguish drafts from approved decisions.
5. For each new or resumed work scope, discover governing context progressively, check applicable delegation and permissions, and report evidence and unfinished work truthfully.

The [supporting materials](dld/supporting/) are optional. For project-specific rules, copy and adapt the [rules template](dld/supporting/RULES.md); binding rules require human approval. An optional [design-document example](dld/supporting/design-document.md) is also available. Keep project-owned sources separate from the distributed DLD files.

## Version and adoption

[VERSION](VERSION) identifies the DLD distribution baseline, not the adopting project's own product version. Keep adopted `CONTRACT.md` and `DLD.md` unchanged until deliberately upgrading the adopted DLD version. A new release does not automatically change a project's decisions or approvals.

## Licensing and release status

Each file identifies its license in an SPDX header: the editable context registry and project-rules template use CC0-1.0; other original product documents use GPL-3.0-only. See [LICENSE](LICENSE) and [LICENSE-CC0](LICENSE-CC0). GPLv3 permits modification and redistribution subject to its terms, although DLD recommends deliberate upgrades of normative documents. Independently developed project work is not GPL-covered merely by using DLD.
