# Distribution Packaging

**Audience:** DLD maintainers. This document describes distribution assembly, not the DLD methodology. The canonical [Core](../../foundation/CORE.md) remains the only authoritative method specification.

## Source and outputs

One identified source baseline and DLD version produce two archives:

| Archive | Includes | Excludes |
| --- | --- | --- |
| **Development** | Repository governance, canonical Core, maintained docs, examples, starter sources, CI and packaging code | Generated build intermediates |
| **Product** | Canonical Core, shared docs, adoption and lifecycle guides, reference layout, clean starter, version, license and changelog | DLD project's DESIGN/RULES, developer guide, packaging internals |

Both archives include a copyable starter whose `foundation/CORE.md` is generated **byte-for-byte** from the canonical source. The starter's DESIGN and RULES remain project-neutral. A product user copies only the starter contents, not the DLD repository's own foundation.

## Build and verify

From the development repository:

```sh
python .github/package.py --check
```

The Python standard-library assembler uses explicit source lists; it validates package contents, relative links, shared-file identity, and archive integrity. Generated archives belong under ignored `dist/`.

An unreleased archive is a review artifact, not a publication. A matching tag and successful build do not imply human approval or permission to release. Before publishing, confirm the approved method baseline, changelog, version, required verification, and actual release authorization.

See the [developer guide](../guides/development.md) for the contributor process.
