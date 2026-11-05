# 1. Start the project

Begin with a problem and a conversation. You do not need to know the implementation stack or have a complete specification.

**Human:** Explain what you want to achieve, who needs it, and any known limits.

**AI:** Help clarify the intent, explain the method, and prepare the starting documents. Distinguish known decisions from questions.

## Prepare the repository

Copy the **contents** of [starter/](../starter/) into your product repository:

```text
project-name/
├── README.md
└── foundation/
    ├── WORKFLOW.md
    ├── RULES.md
    └── DESIGN.md
```

Keep existing source files and decisions if the project already exists. Compare documents before copying so that the starter does not overwrite established work. Existing behavior is useful evidence; discuss which behavior should become part of the approved design.

Here, `project-name/` is the project root; `foundation/` holds its project-wide documents. Feature areas can begin alongside it before implementation exists. Keep each design at its nearest appropriate owning scope; co-locate with realization when helpful. The [detailed design guide](03-develop-detailed-designs.md) explains how that structure develops and when a cross-branch responsibility needs a shared design.

Adapt the README's product name and description. Keep its release baseline. If adopting changes beyond that release, record the source commit and any local adaptations too; the release number alone does not identify unreleased contents.

## Establish the collaboration

Read the workflow with AI. Confirm that the human owns approval and that AI can act independently within delegated implementation freedom. Make any proposed changes to the working method explicit.

Do not assume the AI tool will discover these files automatically. Begin the conversation with a direct instruction such as:

> Read foundation/WORKFLOW.md, foundation/RULES.md, and foundation/DESIGN.md before working. Help me develop the design through discussion. Keep proposals distinct from decisions I approve, and implement only approved scope.

Use your tool's project-instruction mechanism if available, pointing it to these documents without creating another competing copy of the method.

## Prepare the rules

The starter rules file is a format template. Remove its placeholders. If no project-specific requirements have been adopted, leave `# RULES` with a short statement that there are none yet.

Add a rule only when the human has adopted its requirement. Group rules by topic and keep identifiers stable. Include scope or conditions in the requirement and add exceptions or reasons where useful. There are no enabled/disabled status fields: every adopted rule applies.

Formatting conventions belong here. Product behavior belongs in design. Collaboration procedures belong in the workflow.

## Ready to continue

You should have a product repository, a shared understanding of collaboration, and a first statement of the problem. Unresolved product decisions can remain open.

Next: [Define the foundation design](02-define-the-root-design.md).
