# Distribution Assembly

**Maintainer reference.** This page explains the DLD development project's packaging implementation. It does not impose packaging practices on adopting projects. The normative method remains in [Core](../../foundation/CORE.md).

## Source and outputs

The assembler [`.github/package.py`](../../.github/package.py) builds two ZIP distributions from one source revision:

| Archive | Purpose |
| --- | --- |
| Development | Canonical Core, project DESIGN/RULES, maintained sources, contributor documentation, packaging infrastructure |
| Product | Identical canonical Core, minimal adopter starter, optional learning documents, changelog, license, version |

The product excludes this development project's DESIGN, RULES, contributor documentation, and packaging internals.

The product starter contains only `README.md` and `foundation/{CORE,DESIGN,RULES}.md`. Its Core is copied byte-for-byte from the maintained canonical Core, not edited separately. The starter README's version placeholder is resolved during assembly.

## Optional documentation overlay

The product also contains `optional/docs/dld/`, a **copy-ready optional** collection of the adopter documentation and changelog. It can be copied into an adopter's `docs/dld/`. During assembly, relative Markdown links are rewritten for that installed location and validated.

This overlay is neither part of the required project starter nor a competing specification. It does not create another Core.

## Verification

From the development repository:

```sh
python .github/package.py --check
```

This creates unreleased distribution archives under ignored `dist/`. It checks file membership, Core identity, archive integrity, link resolution (including installed-overlay links), and resolved version labels.

The release version is read from the repository `VERSION` file. During proposal work, Core can carry an intended next version before the release metadata has been updated. Resolve that discrepancy before release.

Release mode additionally requires a clean source tree and exact matching tag. Neither technical validation nor tagging supplies human authorization to merge or publish.

For contributor workflow, see [Contribute](../contribute.md).
