# Build a project with AI

This guide shows how to apply [Design-Led Development](methodology.md) in a software project, from an initial idea through delivery and later changes. It is shared learning material in both the development and product distributions. Read [fundamentals](methodology.md) first; see the [adoption guide](adoption.md) for installation and session startup.

The [workflow](../starter/foundation/WORKFLOW.md) defines the working method. This guide explains how to apply it. The [starter](../starter/) supplies the documents you bring into your product repository. Keep this guide in the method repository; you do not need to copy it into the product.

## Choose your starting point

| Stage | Work you do together | Result |
| --- | --- | --- |
| [1. Start the project](01-start-the-project.md) | Set up the documents and establish how to collaborate. | A usable starting repository. |
| [2. Define the foundation design](02-define-the-root-design.md) | Turn the idea into a clear project direction. | An identified, approved design scope. |
| [3. Develop detailed designs](03-develop-detailed-designs.md) | Resolve the next increment at appropriate levels. | Designs sufficient to implement that increment. |
| [4. Realize the design](04-realize-the-design.md) | Implement approved decisions and handle new evidence. | A working increment with visible limitations. |
| [5. Verify and deliver](05-verify-and-deliver.md) | Assess conformance and prepare the product for use. | A verified delivery and operating information. |
| [6. Evolve the project](06-evolve-the-project.md) | Manage changes, resume work, and adopt method updates. | A maintainable product with preserved intent. |

For a new project, begin at stage 1. For an existing project, use stage 1 to reconcile the documents, then identify the design and implementation gaps that matter next.

These six chapters are repeatable practical activities, not the full software lifecycle taxonomy. DLD covers the complete software project lifecycle, including operation, support, and retirement. See the [reference repository architecture](reference-repository-layout.md) for engineering artifact responsibilities. These stages repeat. You can deliver a small approved part while other areas remain under discussion. You do not need to finish the entire project's detailed design before implementing anything.

## Keep the responsibilities clear

The human sets direction and approves consequential decisions. AI helps reason about the design, records decisions, implements approved scope, and verifies the result. Local implementation choices can be delegated without requiring approval of every helper function.

`WORKFLOW.md` holds the process, `RULES.md` holds adopted project-specific requirements, and `DESIGN.md` holds the overall product design. Keep the product README focused on the product and its use.

Prompts, directory trees, and records in this guide are illustrative. Adapt them to the project; they supply no approval, actual verification evidence, or product requirements.
