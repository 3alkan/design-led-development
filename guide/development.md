# Develop and Maintain DLD

This guide is for contributors and AI modifying **the DLD methodology project itself**. It is distributed with the development package, not the user-facing product.

## Start in this repository

1. Read the shared [DLD fundamentals](methodology.md).
2. Read this repository's `foundation/WORKFLOW.md`, `foundation/RULES.md`, and `foundation/DESIGN.md`, followed by the relevant scoped source and current Git state. The development repository therefore **uses DLD in the same way an adopted project does**.
3. Distinguish the last approved design baseline from draft revisions and unapproved proposals. AI proposes; the human approves consequential changes; implementation and verification follow delegated scope.

## Responsibility boundaries

- `foundation/` is the authoritative design and governance of the **DLD development project**, not a template copied into an adopter's software project.
- `guide/` contains the common methodology and reference materials. `guide/development.md` is contributor-specific, while `guide/adoption.md` is user-specific.
- `starter/` contains the copyable operating foundation for an **adopter's project**. Its draft design and blank rules must never be mistaken for the approved DLD design.
- `product/README.md` is the entry page distributed to users as `README.md`.
- `tools/package/` owns package assembly; `dist/` is generated output, not maintained source.

## Making changes

Develop proposed changes in the appropriate design scope, maintain compatibility or document migration needs, and update all affected artifacts together. Review the full product as a human and AI will encounter it: discoverability, operating self-sufficiency, links, permissions, examples, design approval state, and version identity. Do not copy internal development-only material into the user product.

## Verification and release

Build both distributions from the same source snapshot and check their contents. An unreleased draft can be packaged for examination, but it is **not** a published release. On actual authorization, verify the approved design, tests and package checks; align the version, changelog, release tag, and both published assets. Preserve previous approval lines and their identifiable Git baselines; never fabricate approvals or reset their history.

The implementation details for packaging are described in [distribution instructions](../tools/package/README.md).
