# Distribution Assembly

DLD maintains one **versioned, immutable Core** at `foundation/CORE.md` and builds two distributions from the same Git source baseline. Both include the exact Core and shared documentation; they differ in audience-specific materials.

- **Development** includes the DLD development project's project-specific foundation, complete maintained sources, documentation, examples, starter templates and package tooling.
- **Product** includes Core as `foundation/CORE.md`, shared documentation plus `docs/adoption.md`, and a clean starter in which `starter/foundation/CORE.md` is generated from the exact same canonical Core. It excludes the development project's DESIGN and RULES.

The maintained `starter/` source contains only README, DESIGN and RULES templates. Its CORE is deliberately **not** independently maintained; an identical Core is inserted into the starter in **both** assembled distributions.

Run `python .github/package.py --check` to build and validate both archives. The build uses Python's standard library, an explicit allowlist, structural checks and Markdown link checks. Draft archives are labeled unreleased. Releasing requires separate, actual human authorization and verification; a successful build or release tag does not itself grant approval.
