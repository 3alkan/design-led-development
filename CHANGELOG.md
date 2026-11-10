# Changelog

This file records the ongoing history of Design-Led Development (DLD). The v0.1.5 work continues the existing v0.1.4 release series.

## 0.1.5 — Unreleased (development: 0.1.5-dev.1)

- Redesign the DLD distribution around a general human–AI contract and a design-led software engineering methodology.
- Introduce an adopter-editable context registry and optional supporting materials.
- Define explicit product file mapping and separate development-only resources.
- Adopt SemVer-style versions, with numbered development prereleases; preserve historical release records.

This entry documents work in progress, not an approved or published release.

---

This file records changes to the Design-Led Development method and its starter. Products built using the method maintain their own changelogs.

## 0.1.4 — 2026-11-06

- Establish **DLD Version** (every DLD distribution release) and **Methodology Version** (the latest release with normative methodology changes) in the canonical/distributed Core; record both in the starter README. For this release both are 0.1.4. Packaging checks the release identity and carries the methodology identifier forward.

- Add a dependency-free PowerShell 7 product assembly script with explicit file mapping, staged validation, a reproducible versioned ZIP, and a SHA-256 checksum; add a dedicated product README source.

- Clarify licensing: GPLv3 for DLD Core and supporting materials; CC0-1.0 for the three freely reusable starter templates (excluding the generated Core copy), including a full offline CC0 legal text.

- Consolidate the versioned DLD methodology into one authoritative `foundation/CORE.md` with human approval, scope ownership, evidence, and continuity rules.
- Maintain a clean four-file project starter; generate its Core directly from the canonical source.
- Simplify supporting documentation to one optional project repository layout reference, maintained at `docs/supporting/repository-layout.md`.
- Package a product with its own introduction, a single copyable starter (including Core), optional `supporting/` material, VERSION, CHANGELOG, LICENSE, and LICENSE-CC0.
- Keep DLD-development governance and distribution assembly tooling out of the adopter product.
- Packaging script operation was reported successful by the project maintainer on 2026-11-06. Detailed test cases and reproducibility checks were not independently observed in this review; no broader verification claim is implied.
- Release tag: `v0.1.4`. Publication and GitHub Release assets are separate from this source-history entry.

## 0.1.3 — 2026-11-03

Final-state writing discipline and repository-wide consistency corrections from [issue #3](https://github.com/3alkan/design-led-development/issues/3). Release tag: `v0.1.3`.

- Add final-state writing discipline to the guide, repository workflow, and copyable starter: approved design bodies describe current decisions rather than accumulating revision archaeology ([issue #3](https://github.com/3alkan/design-led-development/issues/3)).
- Define the human-approval sweep: preserve the previous baseline, remove approved draft markers, append one concise approval record, and commit the final-state approved scope; retain audit-session evidence separately.
- Classify document sediment during audits and demonstrate final-state voice in root and component design examples.
- Resolve the repository-wide pre-release audit: clarify partial approvals, identifiable approval commits, repeatable one-line approval records, and the final-state commit sequence; fix the starter's approval checklist.
- Require an identifiable commit for an approved design baseline without requiring any design-specific tag or a separate draft commit for every approval. Release tags remain required. Preserve human approval and Git-operation authorization boundaries.

### Adoption

Review the updated workflow before applying it to product designs. Add the final-state writing and `SEDIMENT` audit guidance, retain local project requirements, and perform sweeps only on genuinely approved revisions. Do not fabricate past approval dates or overwrite existing tags.

### Validation and limitations

The changes underwent a repository-wide documentation audit, including a check of 58 relative Markdown links with no broken local targets found. The starter remains a template, not an approved product design. No full real-project lifecycle or executable test-suite validation is claimed.

## 0.1.2 — 2026-11-01

Clarify design hierarchy and the cross-branch exception from [issue #2](https://github.com/3alkan/design-led-development/issues/2), with repository-wide consistency and template rendering fixes. Git tag: `v0.1.2`.

### Changed

- Clarify the project root, the project-wide `foundation/` directory, and design hierarchy in response to [issue #2](https://github.com/3alkan/design-led-development/issues/2).
- Preserve folder hierarchy as the default design hierarchy, with designs beside implementation and nested scopes inheriting applicable ancestor constraints.
- For cross-branch responsibilities, first use an existing common ancestor's design when appropriate. Allow a focused separate shared design only when the responsibility would overload or distort the ancestor's scope. Keep narrower branch designs local, respecting both shared and local ancestor constraints.
- Demonstrate common policy and contracts in a shared design, narrower behavior in branch designs, and artifact designs beside individual files. Require navigable references without duplicated decision ownership; no general separate-placement exception is introduced.
- Explain how early design folders evolve into source layouts, with co-located and shared-scope examples. Preserve decisions, approval history, and references when moving designs; do not move adopter files automatically.
- Record the approved placement decision as repository design revision 3 and align repository, setup, and starter workflow terminology.
- Clarify that moves preserve approval only when scope and governing constraints remain unchanged, and allow direct shared-to-artifact references when an intermediate branch design is unnecessary.
- Distinguish the released baseline from unreleased source and local adaptations, and make template placeholders and approval fields readable in rendered Markdown.

### Adoption

Review the placement guidance against the project's existing hierarchy. Use an appropriate common ancestor before introducing a separate cross-branch design. Update branch references and implementation mappings deliberately, and resolve conflicts between shared and local ancestor constraints through discussion. Existing adopters need not move files just to match an illustrative tree.

Merge the updated workflow through the project's human approval process, preserve product-specific decisions, and record release baseline `0.1.2` in the product README. Replace angle-bracket template placeholders with visible square-bracket placeholders where needed; this formatting change does not alter adopted requirements or approval scope.

### Validation and limitations

Checks cover all repository Markdown documents, rendered placeholders and approval fields, internal links, illustrative cross-branch paths, version references, release history, and use of the copied four-file starter in isolation. A complete worked example and full real-project lifecycle validation remain pending.

## 0.1.1 — 2026-11-01

Clarify commit checkpoint guidance from [issue #1](https://github.com/3alkan/design-led-development/issues/1). Git tag: `v0.1.1`.

### Changed

- Have AI suggest proportionate commit checkpoints for agreed design baselines, appropriately verified implementation increments, and focused corrections in both workflows.
- Explain that suggestions identify coherent scope after inspecting working and staged changes, preserve unrelated work, and can include a proposed message.
- Keep commit authorization explicit and separate from design approval, conformance evidence, release, and permission to push.
- Add a practical example to the project evolution guide and record the approved change as repository design revision 2.

### Adoption

Merge the commit checkpoint section from `starter/foundation/WORKFLOW.md` into your project's workflow through the human approval process. Preserve project-specific decisions and update the method baseline in the product README to `0.1.1`. No product rules, implementation changes, or automatic committing permission are required.

### Validation and limitations

This patch clarifies the existing baseline-preservation process without changing design authority or granting new committing permissions. Full real-project lifecycle validation remains pending.

## 0.1.0 — 2026-10-31

Initial release of the method, copyable starter, and practical guide. Git tag: `v0.1.0`.

### Starter

- Replace the original top-level workflow with a rewritten workflow in `starter/foundation/WORKFLOW.md`, covering human–AI responsibilities, design organization and approval, realization, verification, delivery, and continuity.
- Add a product README template covering setup, usage, project status, development, releases, the adopted method baseline, and licensing.
- Add a minimal rules template grouped by topic with stable identifiers, the requirement and its scope or conditions, and optional exceptions and reasons. Adopted rules apply without status fields.
- Add a foundation design template covering purpose, users and outcomes, scope, overall design, major areas and relationships, shared decisions, success criteria, and open questions. Include revision and approval information without claiming product approval.

### Repository

- Add a practical guide covering project setup, foundation design, detailed designs, realization, verification and delivery, and ongoing evolution. Include adoption of existing projects, optional prompts and examples, and independent version records. Link it from the repository README and design.
- Add an examples index describing the expected scope and evidence for future worked projects.
- Define this method repository's own design, workflow, and rules under `foundation/`, separately from the materials copied into products.
- Update the repository README around the copyable starter and its use.
- Establish `VERSION` as the method's release baseline, independently of design revisions and the releases of products using it.

### Adoption

Copy the contents of `starter/` into a new product repository, replace placeholders, and develop and approve the product design with the human. Add only project-specific rules that are actually adopted.

For an existing project, reconcile the starter with its documents and approved decisions before adoption. Preserve product-specific rules and record the method baseline in the product README.

### Validation and limitations

Release checks cover internal document links, Markdown structure and formatting, version consistency, and use of the copied starter in isolation. The starter design remains a draft and the rules remain placeholders until adapted for a product.

No complete worked project is included, and the method has not yet been validated through a real project's full lifecycle. The next step is to use this release in another project and bring the findings back into the method.
