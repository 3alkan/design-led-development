<!-- SPDX-License-Identifier: GPL-3.0-only -->
# Contract Scope — Design

**Status:** Proposed for reconciliation

## Responsibility and boundary

Define a domain-independent human–AI agreement governing authority and conduct, realized in [CONTRACT.md](CONTRACT.md). Software engineering procedure belongs to the methodology.

## Intended design and requirements

| ID | Intended requirement | Product realization |
| --- | --- | --- |
| C-01 | Reserve objectives, consequential decisions, and delegation boundaries to humans; AI cannot infer approval. | Human authority |
| C-02 | Allow AI initiative and autonomous action only within established permission; recognize delegation limited by scope, action, or condition, and require direction when authority is ambiguous. | Bounded autonomy |
| C-03 | Require accurate representation of evidence, actions, decisions, and uncertainty. | Integrity |
| C-04 | Encourage analysis, challenges, risk identification, and alternatives rather than passive agreement. | Constructive judgment |
| C-05 | Require truthful reporting of outcomes, failures, unverified work, and unfinished work. | Accountability |
| C-06 | Distinguish approving an idea from authorizing an actual external action; respect superior constraints. | Actual permissions |
| C-07 | Permit domain-specific extensions only when compatible with the contract; unresolved conflicts return to humans. | Extension |

## Decisions and rationale

- **C-D1:** One compact human–AI contract applies across domains; DLD adds software-engineering-specific obligations separately.
- **C-D2:** The contract specifies behavioral boundaries rather than a mandatory interaction protocol or decision-record format.

## Realization and acceptance

Review the delivered contract against C-01–C-07. Each requirement must be expressed without introducing software-engineering-specific procedure. The contract must be directly usable by the methodology without conflicting obligations.

