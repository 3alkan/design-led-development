# Worked Examples

Worked examples show how **Design-Led Development (DLD)** is applied to real or illustrative software projects. They complement the [DLD Core](../foundation/CORE.md), [practical guide](../docs/README.md), and [reference repository layout](../docs/reference/repository-layout.md); they do not define new methodological rules.

No completed worked example is currently included. This directory is maintained only when a useful example exists; an empty example is not required for adopting DLD.

## What an example demonstrates

An example should make the relationship between **approved abstract design**, **realization**, and **evidence** understandable to both humans and AI. Depending on its purpose, it should show:

- The project's intent, stakeholders, needs, outcomes, scope, and constraints.
- The project-level `foundation/` documents, adapted from the [starter](../starter) without treating template placeholders as approved decisions.
- Design decisions at the nearest appropriate owning scopes, with clear cross-scope references and no competing authoritative copies.
- Human decisions and approvals, AI proposals and delegated realization, and how consequential discoveries return for human review.
- Implementation, integration, verification, and validation against the applicable approved design.
- Relevant delivery, operation, maintenance, change, or retirement concerns and the evidence they generate.
- How the abstract design and its concrete realizations remain coherent when the project evolves.

The **complete software project lifecycle** is DLD's scope, but an individual example may focus on one activity or increment. State what the example covers instead of inventing lifecycle history or unnecessary repository directories.

## Structure and ownership

Use the [reference layout](../docs/reference/repository-layout.md) selectively, respecting the example project's technology and responsibilities. Do not require generic `design/`, `shared/`, or other directories without an actual owner or need.

Keep an example's own design authority within that example project. It does not govern the DLD methodology or other examples. The DLD development repository itself is also an application of DLD, with its own authoritative [foundation](../foundation/DESIGN.md).

## Authenticity and verification

Clearly distinguish **real decisions, recorded human approvals, and performed checks** from illustrative scenarios, simulated records, proposals, and unverified claims. A commit, passing test, or release tag does not by itself constitute human design approval.

Record enough setup information for someone to understand or reproduce the example within its declared constraints. Explain important trade-offs and limitations without turning the example into a competing copy of the methodology guide.

Each example project has its own project and design versions, independent of the version of DLD it adopts.

## Distribution boundary

Examples are maintained in the DLD **development distribution**. The user-facing **product distribution** provides the shared methodology, adoption guidance, and self-contained starter; a worked example is included in the product only when it has been deliberately selected and verified as useful for adopters.
