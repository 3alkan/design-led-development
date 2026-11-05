# DLD Distribution Assembly — Maintainer Reference

**Development-only documentation.** This describes the DLD project's current packaging implementation, not requirements of the DLD methodology. The [canonical Core](../../foundation/CORE.md) remains authoritative for what adopters must do.

## Inputs and audiences

The source repository owns one canonical `foundation/CORE.md`. The package assembler at [`.github/package.py`](../../.github/package.py) uses explicit file lists to construct **development** and **product** archives from an identified source baseline.

| Output | Intended audience | Distinguishing content |
| --- | --- | --- |
| Development archive | Contributors maintaining DLD | Development DESIGN and RULES, contributor guidance, packaging sources |
| Product archive | People adopting DLD | Methodology Core, clean starter, explanatory guides and references, license, version, changelog |

Both outputs use the same Core bytes and version identity. The generated starter Core is copied from the canonical maintained source; it is never maintained independently.

## The starter and optional overlay

The starter contains exactly:

```text
starter/
  README.md
  foundation/
    CORE.md
    DESIGN.md
    RULES.md
```

The README's version placeholder is filled during assembly. For unreleased package checks, its label identifies an unreleased source snapshot. The project-neutral DESIGN is a draft, and RULES adopts no additional constraints.

The product separately includes the optional documentation overlay `optional/docs/dld/`. An adopter may copy its contents into `docs/dld/` beside the starter. The assembler rewrites relative links for that installed location and includes version-matched explanatory materials and the changelog. The overlay must not contain a second Core or the DLD development project's governance documents.

## Validate from the repository

```sh
python .github/package.py --check
```

The assembler builds both ZIP archives under ignored `dist/` and checks expected inclusion and exclusions, byte-for-byte shared Core identity, version placeholder resolution, relative Markdown links, optional overlay links in an installed-project view, and ZIP integrity.

The repository `VERSION` is the distribution version used by the current assembler. During proposal development, Core may identify an intended next version before `VERSION` is advanced for release preparation; this temporary mismatch must be resolved before publication.

## Publication boundaries

The assembler's `--release` mode checks for a clean tree and an exact matching version tag. Those are technical prerequisites, not proof of human approval or independent permission to merge, tag, or publish.

Before an authorized release, review the current approved design baseline, Core identity, starter, changelog, release version, relevant verification results, and known limitations. Do not claim complete methodological validation from package assembly alone.

See the [development guide](../guides/development.md) for change ownership and contributor work.
