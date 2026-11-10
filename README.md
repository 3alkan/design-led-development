# Design-Led Development — Development Repository

This repository develops Design-Led Development (DLD), a human-governed, AI-assisted software engineering methodology. The current redesign continues the previous **v0.1.4** release and targets **v0.1.5**. It is **draft**, not a published release.

## Sources and responsibilities

- [dld/CONTRACT.md](dld/CONTRACT.md): foundational human–AI collaboration contract.
- [dld/DLD.md](dld/DLD.md): engineering methodology built on that contract.
- [dld/CONTEXT-REGISTRY.md](dld/CONTEXT-REGISTRY.md): editable context registry for DLD development; the clean adopter registry comes from [product-files/CONTEXT-REGISTRY.md](product-files/CONTEXT-REGISTRY.md).
- [DESIGN.md](DESIGN.md): development project architecture and pending approval state.
- [RULES.md](RULES.md): conventions for DLD development only.
- [dld/supporting/](dld/supporting/): optional practical suggestions.
- [product-files/](product-files/): additional product-specific maintained inputs.
- [product.toml](product.toml): the sole specification of product file membership and destinations.
- [scripts/](scripts/): validation and reproducible product assembly.
- [old/](old/): historical reference, not authoritative for the new design.

DLD development uses its own contract and methodology; its development-specific files are not automatically product files. The manifest defines the distribution, including mapping the neutral editable adopter registry into `dld/CONTEXT-REGISTRY.md`.

## Versioning

DLD uses [Semantic Versioning](https://semver.org/) syntax: `MAJOR.MINOR.PATCH[-PRERELEASE]`. In DLD, an incompatible change to the adopted contract or methodological obligations calls for a major version; a compatible addition calls for a minor version; and a compatible clarification or correction calls for a patch version. While the major version is `0`, the methodology is still in initial development and compatibility may evolve.

The next release target is `0.1.5` (Git release tag `v0.1.5` when approved and published). Until then, a numbered prerelease such as `0.1.5-dev.1` identifies a development snapshot; subsequent deliberately numbered snapshots use `-dev.2`, `-dev.3`, and so on. A release candidate, if used, takes the form `0.1.5-rc.1`. A development version is not an approved release, and not every commit increments the number.

The root [VERSION](VERSION) is the current version identifier and is also selected for distribution by `product.toml`. Release history continues in [CHANGELOG.md](CHANGELOG.md). Existing versions through `v0.1.4` retain their historical identities; a future published version omits the prerelease suffix. The leading `v` is used for tags, not in `VERSION`.

## Licensing

DLD uses two licenses with distinct purposes:

- **GPLv3** ([LICENSE](LICENSE)) covers the normative [collaboration contract](dld/CONTRACT.md) and [DLD methodology](dld/DLD.md). Changes or redistribution of these texts are subject to GPLv3; their copies are not intended to be locally modified as part of ordinary DLD adoption.
- **CC0 1.0** ([LICENSE-CC0](LICENSE-CC0)) covers the adopter-editable [context registry](dld/CONTEXT-REGISTRY.md), the [supporting materials](dld/supporting/), and the distributed product introduction maintained at [product-files/README.md](product-files/README.md). These may be copied and adapted freely.

Other development repository files and the historical `old/` material are **not automatically CC0**. Their licensing follows their applicable notices and license terms; this policy does not retroactively relicense older releases.

**Using DLD does not require licensing an adopting project's independently developed code or documents under GPLv3.** Redistributing or modifying GPLv3-covered DLD texts is a separate licensing matter. The two full license texts accompany the distribution.

## Assemble and check

Requires PowerShell 7. Text validation also uses Git.

From the repository root:

```powershell
pwsh -NoProfile -File scripts/test.ps1
pwsh -NoProfile -File scripts/check-text-format.ps1
pwsh -NoProfile -File scripts/package.ps1
```

The packager assembles the files declared in `product.toml` into `build/product/`, a versioned ZIP, and a SHA-256 checksum. It validates the package before replacing existing outputs.

