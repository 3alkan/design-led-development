# 1. Start a project

**Goal:** Establish the project and a human–AI working context. This is an entry point to a repeatable process, not a required phase gate.

**Human:** Explain the problem, intended users, and known constraints.

**AI:** Clarify the goal, identify assumptions, and distinguish proposals from decisions.

## Prepare the foundation

Copy the contents of the distribution's [starter](../../../starter/README.md) into the project root, or reconcile the templates with existing files. The assembled starter provides the project README and `foundation/{CORE,DESIGN,RULES}.md`; the copy of Core must come from the same versioned distribution.

Do not overwrite existing project decisions. For an existing implementation, inspect actual behavior as evidence of the current state, not as automatic approval of that behavior.

## Begin work with AI

Give the AI an explicit request to read the project's Core, RULES, DESIGN, relevant scoped documents, and current state. An AI tool need not discover them automatically.

For example:

> Read my project's foundation and current state. Help me clarify its purpose, known constraints, and next consequential decisions. Keep drafts separate from approved decisions.

Start the first DESIGN as Draft. Keep RULES free of imagined constraints; if none are adopted, say so. Use [adoption guidance](../adoption.md) for upgrades and existing-project reconciliation.

## Outcome

The human and AI understand where methodological and project authority live and have a useful first question or increment. The entire technology stack need not be chosen now.

**Continue:** [Define the foundation design](02-define-the-foundation-design.md).
