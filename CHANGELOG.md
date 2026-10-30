# Changelog

This file records changes to the Design-Led Development method and its starter. Products built using the method maintain their own changelogs.

## Unreleased — 0.1.0-dev

### Starter

- Replace the original top-level workflow with a rewritten workflow in `starter/root/WORKFLOW.md`, covering human–AI responsibilities, design organization and approval, realization, verification, delivery, and continuity.
- Add a product README template covering setup, usage, project status, development, releases, the adopted method baseline, and licensing.
- Add a minimal rules template grouped by topic with stable identifiers, the requirement and its scope or conditions, and optional exceptions and reasons. Adopted rules apply without status fields.
- Add a root design template covering purpose, users and outcomes, scope, overall design, major areas and relationships, shared decisions, success criteria, and open questions. Include revision and approval information without claiming product approval.

### Repository

- Add a practical guide covering project setup, root design, detailed designs, realization, verification and delivery, and ongoing evolution. Include adoption of existing projects, optional prompts and examples, and independent version records. Link it from the repository README and design.

- Define this method repository's own design, workflow, and rules under `root/`, separately from the materials copied into products.
- Update the repository README around the copyable starter and its use.
- Establish `VERSION` as the method's release baseline, independently of design revisions and the releases of products using it.

### Adoption

Copy the contents of `starter/` into a new product repository, replace placeholders, and develop and approve the product design with the human. Add only project-specific rules that are actually adopted.

For an existing project, reconcile the starter with its documents and approved decisions before adoption. Preserve product-specific rules and record the method baseline in the product README.

This is an unreleased development baseline. These entries do not declare or publish a release.
