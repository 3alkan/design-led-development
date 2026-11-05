# Developing DLD

This document is for humans and AI developing and maintaining the DLD methodology. All work follows the same [DLD Core](../foundation/CORE.md) that is delivered to adopters.

## Start work

Read `foundation/CORE.md`, `foundation/RULES.md`, and `foundation/DESIGN.md`; then inspect relevant scoped documents and the current repository state. The **Core** defines how DLD works; this project's **DESIGN** defines the DLD product's intended behavior, and **RULES** add any development-specific constraints. Do not mistake pending design revision 6 for an approved baseline.

## Sources and audiences

- `foundation/CORE.md` is the single maintained methodological source. Project-specific rules and design must not redefine it.
- `docs/` contains human/AI learning materials, reference guidance, and separate adopter and developer instructions. Docs explain Core rather than establishing competing authority.
- `starter/` contains clean, project-agnostic README, DESIGN, and RULES templates; Core is injected from its canonical source when building the product starter.
- `examples/` contains concrete demonstrations when available.
- `.github/package.py` contains the packaging process. The archives under `dist/` are generated, not maintained sources.

## Change and review

Develop proposed methodological changes **in Core first**, then align affected examples, templates, and documentation. Develop project-specific changes in the DLD project's DESIGN or RULES, not in the method. Keep one owner for each decision and preserve approved design history. Only humans approve consequential decisions. An authorized commit is not itself approval.

When changing the user-facing product, verify that a person can learn DLD and that AI can use its copied project foundation with no reliance on the DLD development repository. Test the packaged file layout, internal links, absence of development-only project documents, and the identity of the Core in all destinations.

## Packages and release

Run `python .github/package.py --check`. It builds the **development** and **product** archives from one source and checks package boundaries. Review the [release and packaging details](packaging.md) before publication. A tag, build, or passing automated check is not permission to publish. After actual human approval, ensure version, release records, verification and authorization agree.

Never edit an adopted project's frozen Core or overwrite its DESIGN or RULES as a side effect of upgrading DLD.
