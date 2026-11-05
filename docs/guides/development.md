# Developing DLD

**Audience:** Contributors and AI maintaining DLD itself. The repository is a DLD project: its [Core](../../foundation/CORE.md) governs the method; [DESIGN](../../foundation/DESIGN.md) describes the DLD project; [RULES](../../foundation/RULES.md) holds additional adopted constraints.

## Start a session

Read Core, RULES, DESIGN, applicable scoped documents, and the current repository state. Identify the last approved design baseline separately from draft changes. Do not infer approval from a commit or from already implemented artifacts.

## Ownership of changes

- **Method changes:** Propose them in the canonical `foundation/CORE.md` and submit them to the human for approval under the project's design authority. Do not maintain a second Core in a guide.
- **DLD product design:** Record project-specific outcomes, packaging architecture, and approved decisions in `foundation/DESIGN.md`.
- **Additional DLD project constraints:** Record only actually adopted requirements in `foundation/RULES.md`.
- **Learning materials:** Update user-facing explanations in `docs/guides/` and `docs/reference/`; ensure they agree with Core.
- **Copyable templates:** Keep `starter/` free of DLD-development-specific decisions. Packaging inserts an exact copy of canonical Core.
- **Demonstrations:** Place actual example projects under `examples/` when they exist.

Review effects across both distributions without making their project-specific authorities identical. Preserve the approval history of existing decisions.

## Validation and delivery

Run `python .github/package.py --check` and inspect the resulting product as an adopter would. Confirm internal links, correct inclusion/exclusion by audience, unchanged Core copies, clean templates, and useful documentation navigation. See the [packaging reference](../internal/packaging.md).

Package validation is not proof of complete methodological effectiveness or human approval. Publish a version only after the applicable design and release decisions have actually been authorized.
