<!-- SPDX-License-Identifier: GPL-3.0-only -->
# Design-Led Development (DLD)

DLD is a design-centered, human-authoritative, AI-assisted methodology for the software development lifecycle. It can be adopted incrementally in new or existing software projects.

## Adopt DLD

1. Copy the distributed `dld/` folder into your project or reconcile it with an existing installation.
2. Read the unchanged [Collaboration Contract](dld/CONTRACT.md) and [DLD Methodology](dld/DLD.md).
3. Edit [Context Registry](dld/CONTEXT-REGISTRY.md) to reference your project's design, decisions, rules, evidence, and other relevant information wherever located.
4. Establish sufficient project design and obtain human approval for consequential intent before realizing it; distinguish drafts from approved decisions.
5. For each new or resumed work scope, discover governing context progressively, check applicable delegation and permissions, and report evidence and unfinished work truthfully.

The included [supporting materials](dld/supporting/) are optional practical suggestions, including a [minimal-core design-document example](dld/supporting/design-document.md). The [project rules template](dld/supporting/RULES.md) is not an adopted requirement; when useful, copy it to a project-owned location, adapt that copy, and obtain human approval for binding rules. Keep the distributed original as the template. Project-specific sources need not live inside `dld/`.

## Version and adoption

[VERSION](VERSION) identifies the DLD distribution baseline, not the adopting project's own product version. Keep adopted `CONTRACT.md` and `DLD.md` unchanged until deliberately upgrading the adopted DLD version. A new release does not automatically change a project's decisions or approvals.

## Licensing and release status

The editable context registry and copyable project-rules template are CC0-1.0. The contract, methodology, this README, and the other optional supporting materials are GPL-3.0-only. DLD adoption intends those GPL-covered product documents to remain unchanged until a deliberate upgrade, although GPLv3 grants modification and redistribution rights subject to its terms. Read [LICENSE](LICENSE) and [LICENSE-CC0](LICENSE-CC0). Independently developed project code and documents do not become GPLv3-covered merely by using DLD.
