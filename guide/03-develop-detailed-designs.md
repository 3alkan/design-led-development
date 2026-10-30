# 3. Develop detailed designs

Choose a small, useful increment and develop the design needed to realize it.

**Human:** Decide consequential behavior, experience, interfaces, and constraints.

**AI:** Suggest meaningful boundaries, compare alternatives, and record decisions at the appropriate levels.

## Choose the increment

Describe the outcome you want to implement next. For example, let a member request a loan renewal and understand the result.

Ask AI:

> Identify the design scopes needed for this increment. Show what each scope should decide, which approved decisions govern it, and the open questions that could affect implementation.

Avoid inventing a large document hierarchy in advance. Add a document when a responsibility needs focused discussion or maintenance.

## Put decisions at their proper level

An illustrative design structure is:

```text
project-name/
├── root/
│   └── ROOT.md
└── lending/
    ├── lending.md
    └── renewal/
        ├── renewal.md
        ├── eligibility.py.md
        └── renewal_form.tsx.md
```

Only design documents are shown. Python and TypeScript are examples, not required technologies.

The root design defines the product and the responsibilities of lending. `lending.md` defines the lending lifecycle and the place of renewal within it. `renewal.md` owns the renewal behavior and policy. The artifact documents own their detailed contracts or interactions.

The renewal policy belongs in the renewal design. An eligibility artifact references that policy; it does not invent another copy. A form design defines the member's interaction without reassigning policy authority to the UI.

A folder document uses its folder's name. A file companion retains the complete filename and adds `.md`. Not every implementation file needs a companion.

## Make the scope implementable

Describe relevant inputs, outcomes, boundaries, relationships, important failure behavior, and observable acceptance criteria. Include visual and technical decisions where they matter. State which choices AI can make independently.

Resolve contradictions with broader designs before implementation. Discuss consequential unknowns rather than burying assumptions in code.

Obtain human approval for the identified revisions and scope. Keep the approved baseline recoverable in Git or an equivalent record.

## Ready to continue

AI should be able to explain what it will realize, which criteria it must satisfy, and which choices are delegated. Open questions outside the increment may remain.

Next: [Realize the design](04-realize-the-design.md).
