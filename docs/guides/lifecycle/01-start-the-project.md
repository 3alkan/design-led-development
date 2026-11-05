# 1. Establish a Project and Working Context

**Optional learning chapter.** These chapters illustrate a possible journey, not mandatory SDLC phases. [Core](../../../foundation/CORE.md) governs the actual DLD method.

## Start from a concrete outcome

A human might begin with: “We want a small application that accepts scholarship applications.” AI can help clarify who uses it, what outcomes matter, and which assumptions are still unverified.

Rather than designing the entire system, identify the **next useful scope**. That might be a public information page before adding applicant accounts or review workflows.

## Establish the project foundation

For a new project, copy the contents of the release [starter](../../../starter/README.md) and adapt the README, draft DESIGN, and RULES to the project. Use the exact versioned Core provided by the distribution.

For an existing project, first understand what files and current behavior exist. Reconcile rather than overwrite any existing authoritative material.

## Begin with sufficient AI context

One useful prompt is:

> Read my project's DLD foundation, identify what is approved and what is still draft, and help me establish the next useful project scope. Ask for human decisions when a proposed choice would establish consequential intent.

As the system grows, use progressive context loading: foundation first, then active and governing scopes, then material dependencies. Do not load unrelated history.

## What the first increment achieves

The participants understand the immediate objective, the relevant project authority, and the most important unresolved decisions. Nothing here implies that the design has been approved or that implementation has been authorized.

**Next example:** [Develop project-level intent](02-define-the-foundation-design.md).
