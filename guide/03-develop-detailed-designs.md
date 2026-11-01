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

The **project root** contains the product. Its **`root/` directory** holds project-wide workflow, rules, and top-level design. It is not the automatic physical parent of every design scope.

**Folder hierarchy normally expresses design hierarchy.** A folder design owns its scope and delegates narrower responsibilities to nested designs, which inherit applicable ancestor constraints. Keep designs beside the realization they govern. Parents reference delegated scopes, and children identify applicable broader designs so readers can navigate the hierarchy.

The project's top-level design is `root/ROOT.md`, even though its physical directory is beside other scopes. Technical wrappers such as `src/` or framework routes do not need design documents solely because they contain other folders. Follow the applicable design ancestors, without inventing authority for every physical directory.

## Default: keep designs beside implementation

Start with meaningful scopes before choosing a framework. An early design-only structure might be:

```text
project-name/
├── root/
│   └── ROOT.md
└── lending/
    ├── lending.md
    └── renewal/
        └── renewal.md
```

These scope folders can become implementation folders. They do not prescribe a final source layout or require empty implementation files.

If the approved implementation layout later introduces `src/`, reconcile placement with it. Moving designs with their implementation areas preserves the normal hierarchy. Only a responsibility spanning branches may need the shared-design exception explained below. One possible result is:

```text
project-name/
├── root/
│   ├── WORKFLOW.md
│   ├── RULES.md
│   └── ROOT.md
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

The root design defines the product and the responsibilities of lending. `lending.md` defines the lending lifecycle and the place of renewal within it. `renewal.md` owns the renewal behavior and policy. The artifact documents own their detailed contracts or interactions.

The renewal policy belongs in the renewal design. An eligibility artifact references that policy; it does not invent another copy. A form design defines the member's interaction without reassigning policy authority to the UI.

A folder document uses its folder's name. A file companion retains the complete filename and adds `.md`.

## Exception: a responsibility spanning branches

Use this decision order:

1. Keep a scope design within its implementation branch when the responsibility fits there.
2. For a responsibility shared across branches, use an existing common ancestor's design if the decision belongs at that ancestor's level.
3. If the shared responsibility would overload or distort the ancestor's scope, introduce one focused shared design outside the branches. Record its responsibility and participating branches.

For example, a project-wide privacy principle belongs in the root design. Detailed renewal policy spanning frontend and backend may need its own shared design rather than expanding the root document with feature details. Do not create `src/src.md` solely to obtain a physical common ancestor.

This is a limited exception for cross-branch responsibilities. It does not permit arbitrary placement, require every non-artifact design under `design/`, or relocate unrelated module designs. Local hierarchies and adjacent artifact designs remain intact.

```text
project-name/
├── root/
│   ├── WORKFLOW.md
│   ├── RULES.md
│   └── ROOT.md
├── design/
│   └── renewal/
│       └── renewal.md
└── src/
    ├── backend/
    │   ├── backend.md
    │   └── renewal/
    │       ├── renewal.md
    │       ├── eligibility.py.md
    │       └── eligibility.py
    └── frontend/
        ├── frontend.md
        └── renewal/
            ├── renewal.md
            ├── form.tsx.md
            └── form.tsx
```

The root design identifies the shared renewal responsibility. The shared design owns renewal policy, cross-branch contracts, and the allocation of responsibilities. Narrower designs in each branch explain how their branch fulfills those responsibilities.

| Design | Owns | Governing context |
| --- | --- | --- |
| `design/renewal/renewal.md` | Common policy, cross-branch behavior, contracts, and responsibility allocation. | The root design and applicable project constraints. |
| `src/backend/renewal/renewal.md` | Backend validation, processing, and failures within the common contract. | The shared renewal design and applicable backend ancestor constraints. |
| `src/frontend/renewal/renewal.md` | Member interaction and presentation within the common behavior. | The shared renewal design and applicable frontend ancestor constraints. |
| Artifact companions | Detailed contracts delegated to individual files. | Their local branch design and applicable shared decisions. |

Keep the relationships navigable. The shared design links to both branch designs. Each branch design links back to the shared design and identifies its local design ancestors. For example, the backend renewal design can reference `../backend.md` and `../../../design/renewal/renewal.md`; the shared design can reference `../../src/backend/renewal/renewal.md`. These paths illustrate links inside the example project, not files in this guide repository.

Branch designs must satisfy both shared and applicable local ancestor constraints. A conflict returns to design discussion; neither silently overrides the other. Reference shared policy instead of copying it into each branch.

Create a narrower branch design when it has meaningful decisions to own. An empty document that merely forwards readers elsewhere is unnecessary. If none is needed, the shared design links directly to the responsible artifact designs, and those reference the shared design and applicable local ancestors. Other frontend-only or backend-only modules continue to use the normal folder hierarchy.

## Reconcile placement as implementation develops

Choose an arrangement for the relevant scope through design discussion. Do not move existing adopter files automatically or reorganize a project merely to match an example.

When a source layout introduces wrappers such as `src/` or framework routes:

1. Identify where each designed responsibility will be realized. Preserve folder hierarchy by default; use the common-ancestor decision order for cross-branch responsibilities.
2. Preserve the original documents' decisions, revision and approval records, and recoverable history. Use a Git move or an equivalent traceable change when appropriate.
3. Update parent references, child references, incoming links, and mappings to implementation artifacts. Remove obsolete authoritative copies.
4. Check that no scope or approved constraint was lost during the move. Propose and approve any changes in meaning separately.

A mechanical move preserves approval when scope and governing constraints remain unchanged. Moving a design under a different governing ancestor can introduce different constraints; resolve that change through design discussion and approval rather than carrying approval over automatically. If a scope splits, make each resulting document's responsibility and inherited approval context explicit; do not claim approval for newly introduced decisions.

## Make the scope implementable

Describe relevant inputs, outcomes, boundaries, relationships, important failure behavior, and observable acceptance criteria. Include visual and technical decisions where they matter. State which choices AI can make independently.

Resolve contradictions with broader designs before implementation. Discuss consequential unknowns rather than burying assumptions in code.

Obtain human approval for the identified revisions and scope. Keep the approved baseline recoverable in Git or an equivalent record.

## Ready to continue

AI should be able to explain what it will realize, which criteria it must satisfy, and which choices are delegated. Open questions outside the increment may remain.

Next: [Realize the design](04-realize-the-design.md).
