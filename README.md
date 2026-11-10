# Design-Led Development — Development Repository

This repository develops Design-Led Development (DLD), a human-governed, AI-assisted software engineering methodology. The current redesign continues the previous **v0.1.4** release and targets **v0.1.5**. It is **draft**, not a published release.

## Sources and responsibilities

- [dld/CONTRACT.md](dld/CONTRACT.md): foundational human–AI collaboration contract.
- [dld/DLD.md](dld/DLD.md): engineering methodology built on that contract.
- [dld/CONTEXT-REGISTRY.md](dld/CONTEXT-REGISTRY.md): discovery of DLD and project context.
- [RULES.md](RULES.md): conventions for DLD development only.
- [dld/supporting/](dld/supporting/): optional practical suggestions.
- [product-files/](product-files/): additional product-specific maintained inputs.
- [product.toml](product.toml): the sole specification of product file membership and destinations.
- [scripts/](scripts/): packaging automation when implemented.
- [old/](old/): historical reference, not authoritative for the new design.

DLD development uses its own contract and methodology; its development-specific files are not automatically product files. The manifest defines the distribution. Nothing here implies release or design approval merely because it has been committed.

## Versioning

DLD uses [Semantic Versioning](https://semver.org/) syntax: `MAJOR.MINOR.PATCH[-PRERELEASE]`. In DLD, an incompatible change to the adopted contract or methodological obligations calls for a major version; a compatible addition calls for a minor version; and a compatible clarification or correction calls for a patch version. While the major version is `0`, the methodology is still in initial development and compatibility may evolve.

The next release target is `0.1.5` (Git release tag `v0.1.5` when approved and published). Until then, a numbered prerelease such as `0.1.5-dev.1` identifies a development snapshot; subsequent deliberately numbered snapshots use `-dev.2`, `-dev.3`, and so on. A release candidate, if used, takes the form `0.1.5-rc.1`. A development version is not an approved release, and not every commit increments the number.

The root [VERSION](VERSION) is the current version identifier and is also selected for distribution by `product.toml`. Release history continues in [CHANGELOG.md](CHANGELOG.md). Existing versions through `v0.1.4` retain their historical identities; a future published version omits the prerelease suffix. The leading `v` is used for tags, not in `VERSION`.
