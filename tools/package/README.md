# Packaging DLD Distributions

DLD is **one project, one version and release tag, and two distributions** from the same source baseline. Both contain the common learning resources; each has its own audience-specific entry and guidance.

- **Product**: `product/README.md` becomes the package `README.md`; include `VERSION`, `LICENSE`, `guide/methodology.md`, `guide/README.md`, the general reference and six lifecycle chapters, `guide/adoption.md`, and the independent `starter/` with its own `foundation/`. Exclude contributor-only files and DLD's internal `foundation/`.
- **Development**: include DLD's repository `README.md`, `foundation/`, `guide/` (including common and development guidance), `starter/`, `product/`, `examples/`, packaging tools, version, changelog, and license. It is the project source required to modify DLD.

The development repository itself follows DLD; its `foundation/` is project governance. The adopter's copy of `starter/foundation/` is a new draft for their project, not DLD's approved design. The two areas have related roles but distinct authorities.

Use `python tools/package/build.py` to generate two review packages under `dist/`. This uses only Python's standard library and a strictly maintained allowlist, not indiscriminate directory copying. For publication, use `--release` on a clean, approved, correctly tagged version, after verification and explicit human release authorization. Building an archive alone never constitutes approval or publication.

The package check validates required files, relative Markdown links, scope separation, the absence of `AGENTS.md`, and shared learning content. Run `python tools/package/build.py --check` to build and validate both packages as a development check. Adjust the allowlist when adding maintained user-visible materials.
