# 3. Develop detailed designs

Choose a small, useful increment and develop the design needed to realize it.

**Human:** Decide consequential behavior, experience, interfaces, and constraints.

**AI:** Suggest meaningful boundaries, compare alternatives, and record decisions at the appropriate levels.

## Choose the increment

Describe the outcome you want to implement next. For example, let a member request a loan renewal and understand the result.

Ask AI:

> Identify the design scopes needed for this increment. Show what each scope should decide, which approved decisions govern it, and the open questions that could affect implementation.

Avoid inventing a large document hierarchy in advance. Add a document when a responsibility needs focused discussion or maintenance.

## Understand the normal hierarchy

The **project root** contains the product. Its **`foundation/` directory** holds project-wide Core, project rules, and top-level design. It is not the automatic physical parent of every design scope.

**Ownership and scope determine design authority.** Folder hierarchy can express scope composition, and a scope design delegates narrower responsibilities where appropriate. Co-locate designs with their realizations when it serves ownership; physical nesting alone does not create authority. Parents reference delegated scopes, and children identify applicable broader designs so readers can navigate the hierarchy.

The project's top-level design is `foundation/DESIGN.md`, even though its physical directory is beside other scopes. Technical wrappers such as `src/` or framework routes do not need design documents solely because they contain other folders. Follow the applicable design ancestors, without inventing authority for every physical directory.

## Default: keep designs beside implementation

Start with meaningful scopes before choosing a framework. An early design-only structure might be:

```text
project-name/
├── foundation/
│   └── DESIGN.md
└── lending/
    ├── lending.md
    └── renewal/
        └── renewal.md
```

These scope folders can become implementation folders. They do not prescribe a final source layout or require empty implementation files.

If the approved implementation layout later introduces `src/`, reconcile design ownership and references with it. Moving a design is appropriate only when its ownership and governing constraints remain coherent. Responsibilities spanning branches follow nearest appropriate ownership as explained below. One possible result is:

```text
project-name/
├── foundation/
│   ├── CORE.md
│   ├── RULES.md
│   └── DESIGN.md
└── src/
    └── lending/
        ├── lending.md
        └── renewal/
            ├── renewal.md
            ├── eligibility.py.md
            ├── eligibility.py
            ├── renewal_form.tsx.md
            └── renewal_form.tsx
```

Python, TypeScript, and `src/` are illustrative choices, not required technologies. Add artifact designs when the corresponding responsibilities need them; not every implementation file needs a companion.

The foundation design defines the product and the responsibilities of lending. `lending.md` defines the lending lifecycle and the place of renewal within it. `renewal.md` owns the renewal behavior and policy. The artifact documents own their detailed contracts or interactions.

The renewal policy belongs in the renewal design. An eligibility artifact references that policy; it does not invent another copy. A form design defines the member's interaction without reassigning policy authority to the UI.

A folder document uses its folder's name. A file companion retains the complete filename and adds `.md`.

## Shared responsibility across branches

A design that governs multiple components belongs at the **nearest appropriate common owning scope**, or at a separately identified responsibility within the common parent if that parent is merely a technical wrapper. Avoid a generic top-level `design/` or `shared/` directory created solely to hold otherwise unrelated decisions.

For example, a project-level privacy rule belongs to `foundation/DESIGN.md`, while a renewal policy governing both backend and frontend might be an independently meaningful project-level responsibility:

```text
project-name/
├── foundation/
│   ├── DESIGN.md
│   ├── CORE.md
│   └── RULES.md
├── renewal-policy/
│   └── renewal-policy.md
└── src/
    ├── backend/
    │   ├── backend.md
    │   └── renewal/
    │       ├── renewal.md
    │       └── eligibility.py
    └── frontend/
        ├── frontend.md
        └── renewal/
            ├── renewal.md
            └── form.tsx
```

Here `renewal-policy/renewal-policy.md` is the **single authority** for the common policy and contracts. The backend and frontend designs reference it, own their local behavior, and respect other governing constraints. The foundation identifies the responsibility without duplicating its detailed policy.

Other valid placements are possible, including a common component scope owning its subordinate branches. The decision is based on responsibility, not a mandatory directory name. Where a direct link is useful, the backend design might point to `../../../renewal-policy/renewal-policy.md`; the policy design might link to `../src/backend/renewal/renewal.md`. These are illustrative paths within the example project, not links in this guide.

Create a design document when it owns meaningful decisions. An empty forwarding document is not needed. Preserve reciprocal discoverability, the approved decision owner, and relationships when reorganizing.

## Reconcile placement as implementation develops

Choose an arrangement for the relevant scope through design discussion. Do not move existing adopter files automatically or reorganize a project merely to match an example.

When a source layout introduces wrappers such as `src/` or framework routes:

1. Identify where each designed responsibility will be realized. Respect nearest appropriate scope ownership; use ecosystem-native source locations when appropriate.
2. Preserve the original documents' decisions, revision and approval records, and recoverable history. Use a Git move or an equivalent traceable change when appropriate.
3. Update parent references, child references, incoming links, and mappings to implementation artifacts. Remove obsolete authoritative copies.
4. Check that no scope or approved constraint was lost during the move. Propose and approve any changes in meaning separately.

A mechanical move preserves approval when scope and governing constraints remain unchanged. Moving a design under a different governing ancestor can introduce different constraints; resolve that change through design discussion and approval rather than carrying approval over automatically. If a scope splits, make each resulting document's responsibility and inherited approval context explicit; do not claim approval for newly introduced decisions.

## Make the scope implementable

Describe relevant inputs, outcomes, boundaries, relationships, important failure behavior, and observable acceptance criteria. Include visual and technical decisions where they matter. State which choices AI can make independently.

Resolve contradictions with broader designs before implementation. Discuss consequential unknowns rather than burying assumptions in code.

Obtain human approval for the identified revisions and scope. After approval, follow the [approval sweep](06-evolve-the-project.md#final-state-writing), preserving the prior approved baseline and committing the final-state approved revision. Preserve pending changes as drafts; do not sweep unapproved proposals.

## Ready to continue

AI should be able to explain what it will realize, which criteria it must satisfy, and which choices are delegated. Open questions outside the increment may remain.

Next: [Realize the design](04-realize-the-design.md).
