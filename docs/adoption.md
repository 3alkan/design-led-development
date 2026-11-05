# Adopt DLD in a Software Project

This guide is for **humans and AI using DLD**, rather than contributors developing DLD itself. Start by learning the [DLD Core](../foundation/CORE.md). The [practical guide](README.md) gives worked activities and prompts.

## New project

1. Copy **the contents of** `starter/` from this distribution into the project root, keeping `foundation/` as a project-wide scope. Adapt the project `README.md`.
2. Give AI the session-start instruction shown in the [product introduction](product.md). Do not assume AI discovered the files automatically.
3. Discuss and draft `foundation/DESIGN.md`: why this project exists, intended outcomes, scope, constraints, and key responsibilities. Do not treat template text as an approval.
4. Review `foundation/RULES.md`; replace placeholders with explicitly adopted rules, or state that none have yet been adopted.
5. Identify the next useful scope and its governing designs. Human approval precedes implementation of consequential design. AI can realize and verify approved increments under delegated freedom.

## Existing project

Inspect the repository and current behavior first. Reconcile the starter documents with existing files; do not overwrite the project's README, requirements, contracts, or working decisions. Treat current implementation as evidence to evaluate, not automatically as approved design. Establish the first agreed design baseline and map existing artifacts to it.

## Resuming with AI

At the start of **each new AI session**, direct AI to read the project's `foundation/CORE.md`, `foundation/RULES.md`, `foundation/DESIGN.md`, the applicable scoped designs, and the current repository state. AI summarizes known approvals, open questions, and the next permitted work before acting. No `AGENTS.md`, proprietary instructions file, network connection, or AI provider is required. Optional tool-specific pointers must reference, not duplicate, the same authority.

## As the project grows

Use the [reference layout](reference-repository-layout.md) as a responsibility catalogue, not a scaffold to create in full. Maintain scope ownership, applicable constraints, requirements and acceptance criteria, verification evidence, release records, operations, maintenance, and eventual retirement as the project needs them.

## Updating the adopted method

Record the DLD version/source baseline in the project README. Review newer DLD Core versions and their migration notes **before** replacing any copied Core baseline or template. Preserve the project's own approved designs, rules, revisions, and history. Changes to its working method or approved design require appropriate human approval.
