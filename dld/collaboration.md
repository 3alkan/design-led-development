# Contract Scope — Design

**Status:** Proposed for reconciliation

## Intent and boundary

Provide a general, portable agreement governing human–AI collaboration in any domain. This scope defines the intended content and properties of the contract; the contractual obligations delivered to adopters are realized in [CONTRACT.md](CONTRACT.md).

The contract governs participants and authority, not a software lifecycle, repository practice, or tool.

## Requirements

| ID | Intended requirement | Product realization |
| --- | --- | --- |
| C-01 | Reserve objectives, consequential decisions, and delegation boundaries to humans; AI cannot infer approval. | Human authority |
| C-02 | Allow AI initiative and autonomous action only within established permission; recognize delegation limited by scope, action, or condition, and require direction when authority is ambiguous. | Bounded autonomy |
| C-03 | Require accurate representation of evidence, actions, decisions, and uncertainty. | Integrity |
| C-04 | Encourage analysis, challenges, risk identification, and alternatives rather than passive agreement. | Constructive judgment |
| C-05 | Require truthful reporting of outcomes, failures, unverified work, and unfinished work. | Accountability |
| C-06 | Distinguish approving an idea from authorizing an actual external action; respect superior constraints. | Actual permissions |
| C-07 | Permit domain-specific extensions only when compatible with the contract; unresolved conflicts return to humans. | Extension |

## Design decisions

- **C-D1:** One compact human–AI contract applies across domains; DLD adds software-engineering-specific obligations separately.
- **C-D2:** The contract specifies behavioral boundaries rather than a mandatory interaction protocol or decision-record format.
- **C-D3:** The maintained contract is a normative, GPLv3-covered product source; adoption does not require changing its text.

## Acceptance

Review the delivered contract against C-01–C-07. Each requirement must be expressed without introducing software-engineering-specific procedure. The contract must be directly usable by the methodology without conflicting obligations.

## Reconciliation

The seven requirements and three decisions above were reconstructed from the current product. They are candidate design authority until explicitly approved; the existing text alone does not prove that approval.
