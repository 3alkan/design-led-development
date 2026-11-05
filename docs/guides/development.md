# Developing the DLD Methodology

**Audience:** Contributors to the DLD development repository. This is project-specific guidance, not an extension of the [methodological Core](../../foundation/CORE.md).

## Establish the working authority

Before consequential work, inspect [Core](../../foundation/CORE.md), the DLD project's [DESIGN](../../foundation/DESIGN.md) and [RULES](../../foundation/RULES.md), the active change scope, approval state, actual files, and relevant verification evidence.

A draft design or implementation commit is not evidence of human approval. The project DESIGN may retain earlier approved revisions while its current revision is a proposal. Keep those boundaries accurate.

## Know which responsibility owns the change

| Change | Primary owner |
| --- | --- |
| What DLD requires of adopters | Canonical `foundation/CORE.md` |
| DLD product, distributions, and development project intent | `foundation/DESIGN.md` |
| Additional constraints adopted for developing DLD | `foundation/RULES.md` |
| Explaining an already defined DLD behavior | `docs/` |
| Reusable clean adopting-project templates | `starter/` |
| Package assembly and validation | `.github/package.py` and project-owned packaging reference |
| Illustrative uses of the method | `examples/` |

A guide must not silently resolve a gap in Core by inventing a new requirement. If an explanation reveals ambiguity or a missing mandatory rule, propose a change to the governing Core instead.

## Review changes coherently

For a proposed change, identify its owner, possible effects on the starter, guidance, package output, and adoption behavior. Assess the affected scopes before consequential approval. Keep the method's proposed new text distinct from any existing approved version.

When updating only explanations, avoid turning optional suggestions into commands that appear obligatory. Link to Core for authority; use concrete examples for understanding. Check both the adopter's view and the maintainer's view.

## Packaging and evidence

Run the repository's package check:

```sh
python .github/package.py --check
```

Review the assembled starter, ensure its Core equals the canonical Core byte-for-byte, inspect the product's optional documentation overlay, and check the development-only exclusions. See [packaging documentation](../internal/packaging.md).

A passing package check supports only the properties it actually tests. It does not approve the methodology, the DLD project DESIGN, or a public release. Final merge, tagging, and publication require their own authorization.

Keep current implementation state, known limitations, and handoff information discoverable so a later AI session can continue without reconstructing the entire project.
