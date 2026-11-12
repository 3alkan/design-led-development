# Design-Led Development (DLD)

DLD is a design-centered, human-authoritative, AI-assisted methodology for the software development lifecycle. It can be adopted incrementally in new or existing software projects.

## Adopt DLD

1. Keep the extracted DLD distribution intact as the release reference, including its `VERSION` and `LICENSE` files. Copy its `dld/` folder into your project or reconcile it with an existing installation. When redistributing copies or substantial portions of DLD files, retain the MIT copyright and license notice.
2. Read the unchanged [Collaboration Contract](dld/CONTRACT.md) and [DLD Methodology](dld/DLD.md).
3. Edit [Context Registry](dld/CONTEXT-REGISTRY.md) to reference your project's design, decisions, rules, evidence, and other relevant information wherever located.
4. Establish sufficient project design and obtain human approval for consequential intent before realizing it; distinguish drafts from approved decisions.
5. For each new or resumed work scope, discover governing context progressively, check applicable delegation and permissions, and report evidence and unfinished work truthfully.

The [supporting materials](dld/supporting/) are optional. For project-specific rules, copy and adapt the [rules template](dld/supporting/RULES.md); binding rules require human approval. An optional [design-document example](dld/supporting/design-document.md) is also available. Keep project-owned sources separate from the distributed DLD files.

## Version and adoption

The release reference's [VERSION](VERSION) identifies the DLD distribution baseline, not the adopting project's own product version. Record the adopted DLD version in your project context so it remains identifiable independently of that reference. Keep adopted `CONTRACT.md` and `DLD.md` unchanged until deliberately upgrading the adopted DLD version. A new release does not automatically change a project's decisions or approvals.

## Licensing and release status

The root [MIT License](LICENSE) covers original DLD files, including the editable registry and optional templates. Redistributed copies or substantial portions must retain the copyright and permission notice. Deliberate upgrades of normative documents are methodological guidance, not a restriction on MIT's modification rights. Independently developed project work is not licensed merely by using DLD.
