# Design-Led Development — Core

**DLD Core version: 0.1.4**

Design-Led Development (DLD) is a **design-centered, human-authoritative, AI-assisted software engineering methodology** applicable throughout the software development lifecycle (SDLC). This Core is intended to be the complete authoritative specification of the DLD method for humans and AI. A project can apply it with its minimal foundation alone; supporting guides, templates, tools, and examples are optional.

## 1. Identity and Principles

### 1.1 Normative language

In this specification, **MUST** means required for DLD compliance; **MUST NOT** means prohibited; **SHOULD** means recommended, with a justified alternative permitted; and **MAY** means optional or permitted. These meanings apply only to the capitalized terms.

### 1.2 Governing principles

DLD makes **approved abstract design** the authority for intended project outcomes and engineering decisions. Realization and evidence inform design but do not silently redefine approved intent.

Humans retain authority over consequential decisions, approvals, and delegation. AI contributes actively to investigation, critique, design, realization, and assessment within approved intent and granted permissions.

DLD applies incrementally. A project MUST establish sufficient approved design for consequential work in the affected scope; it need not design the entire project before work begins. Uncertainty and feedback MAY lead to new proposals, which remain non-authoritative until appropriately approved.

DLD governs collaboration and design authority across the SDLC. It does not prescribe a programming language, framework, AI provider, repository layout beyond the project foundation, or sequential SDLC model. Project practices MAY be more restrictive than Core but MUST NOT override it.

## 2. Conceptual Model

The following concepts describe engineering responsibilities and authority; they do not each require a distinct file or structured data object.

| Concept | Meaning |
| --- | --- |
| **Project** | The enduring subject of engineering work, with intended outcomes and a changing realized state. |
| **Scope** | An identifiable responsibility boundary within the project, with governing and dependent relationships. |
| **Design** | The abstract description of intended outcomes, requirements, behavior, structure, responsibilities, interfaces, constraints, and decisions for one or more scopes. |
| **Decision** | A selected direction that affects intended project behavior or engineering responsibilities; it is authoritative only within an approved boundary. |
| **Requirement** | A needed capability, property, or outcome the project intends to satisfy. |
| **Constraint** | A condition limiting acceptable decisions, designs, or realizations. |
| **Realization** | Concrete engineering work or artifacts that implement or enact design, including code, configuration, tests, operational material, or delivered results. |
| **Evidence** | An identifiable observation, result, record, or assessment supporting or challenging a bounded engineering claim. |
| **Authority** | The right to establish or change governing intent or authorize an action. |
| **Delegation** | An explicit boundary within which another participant, including AI, may decide or act. |
| **Approval** | An authorized human decision accepting identifiable proposed content as governing intent. |
| **Revision** | An identifiable state or change set of design or rules content. |
| **Baseline** | An identifiable, recoverable snapshot of content and its applicable authority state. |

Projects contain scopes. Scopes form a logical responsibility hierarchy and may also have cross-scope dependencies. Each authoritative decision has one owning scope. Approved design governs the corresponding realization; evidence evaluates realization and intended outcomes. Feedback may lead to proposed corrections or design changes, but it does not itself grant approval.

Approval, the recording of approval, baseline preservation, verification, committing, and release authorization are distinct events.

## 3. Human–AI Authority

### 3.1 Human authority and AI participation

Humans MUST retain authority over project direction, consequential intended outcomes, approval of consequential design decisions, and the boundaries of AI delegation. AI SHOULD investigate alternatives, challenge assumptions, identify inconsistencies, explain trade-offs, and propose changes rather than act only as a passive executor.

AI MUST NOT approve its own proposals, infer approval from silence, or treat a draft, implementation behavior, or a commit as human approval. Within approved design and explicit delegation, AI MAY select local implementation approaches, perform work, and assess results independently.

### 3.2 Consequential decision test

A decision is consequential when it would establish previously unapproved project intent; materially alter approved requirements, constraints, externally relevant behavior, interfaces, responsibilities, or commitments; or change or exceed a delegation boundary.

Before accepting or realizing consequential changed intent, AI MUST obtain a human decision covering the affected content and scope. AI MAY analyze and propose such changes before approval. If AI cannot establish whether a decision is within approved intent and delegation, it MUST identify the uncertainty and seek human resolution before proceeding with the consequential change.

The impact, reversibility, and risk of a decision SHOULD inform this assessment. A decision's label, such as “refactoring” or “technology selection,” does not by itself establish whether it is consequential.

### 3.3 Permission to act

Design authority and permission to perform external actions are separate. Approval of a design does not itself authorize committing, pushing, deploying, publishing, purchasing, or releasing. AI MUST act within actual available permissions and any explicit operational delegation. It MUST NOT claim to have taken actions that were unavailable or unsuccessful.

Project documents remain subject to applicable governing laws, organizational constraints, and the instructions and permissions of the execution environment. Conflicts or missing authority MUST be surfaced rather than silently bypassed.

## 4. Project Foundation

Every DLD project MUST maintain the following foundation:

| Location | Responsibility |
| --- | --- |
| `README.md` | Human and AI entry point, navigation, and instructions for finding the project's governing context. |
| `foundation/CORE.md` | The project's unchanged adopted DLD Core version; methodological authority. |
| `foundation/DESIGN.md` | Project-level abstract design, including scope, intended outcomes, governing decisions, and their approval state. |
| `foundation/RULES.md` | Additional human-approved project constraints, or an explicit statement that none have been adopted. |

**Core defines the method; DESIGN defines the project; RULES adds project constraints.** The README is an entry point, not an independent source of methodological or design authority. DESIGN and RULES have distinct responsibilities; neither silently overrides the other. Conflicting requirements MUST be exposed and resolved through the applicable human authority before consequential work proceeds.

A foundation MAY contain draft project design during initial adoption. Draft material MUST remain distinguishable from approved intent. Additional scoped designs and work artifacts MAY be placed where ownership and ecosystem conventions justify them. Core does not require a global design directory, a universal source tree, or an AI-provider-specific instruction file.

The project entry point MUST make the foundation discoverable to new human and AI participants. Where an AI tool does not automatically inspect project files, the human or tool setup MUST direct it to the foundation before substantive DLD work.

## 5. Design Architecture

### 5.1 Scope ownership

Design scopes MUST be organized by engineering responsibility. Each authoritative decision MUST have one identifiable owning scope, SHOULD be owned by the narrowest scope able to govern it coherently, and MUST respect applicable governing decisions and constraints.

Decisions shared by multiple scopes MUST have one governing owner, such as an appropriate common scope or an explicitly identified shared responsibility. Dependent scopes MUST refer to the authoritative decision rather than establish competing copies.

Scopes MAY have cross-scope dependencies. Their governing and dependent relationships MUST remain discoverable to the degree needed for context loading, impact analysis, and assurance. The logical scope hierarchy does not mandate a matching file or directory tree.

### 5.2 Representing and changing scopes

A scoped design MAY precede its implementation, be co-located with an implementation artifact, or live at another appropriate ownership location. A companion Markdown twin MAY be useful, but one-to-one design-to-file twinning is not required. Physical placement alone MUST NOT establish or change authority.

When a scope is moved, divided, combined, or reassigned, applicable design authority, approval history, and dependencies MUST be preserved or explicitly reconciled. A purely administrative relocation MAY retain existing approval if its meaning, ownership, and governing constraints are unchanged. Consequential changes to ownership or intent require human approval.

Designs SHOULD describe the current intended state of their scope. Historical material SHOULD remain recoverable without obscuring the current authoritative design.

## 6. Design Governance

### 6.1 Proposal and approval states

Proposed content MUST be distinguishable from approved content. A design revision MAY be described as **Draft** (unapproved proposed content), **Approved** (the identified scope and revision are approved), or **Mixed** (approved content coexists with explicitly bounded draft proposals). These labels summarize authority; they do not replace identifiable approval records.

An approval MUST be an explicit human decision identifying the approving human, approved scope, revision, and content. An approval MAY cover an entire scope or an explicitly bounded subset of proposed decisions. Partial approvals MUST distinguish accepted content from unresolved proposals and MUST NOT imply approval of dependent choices outside the stated boundary.

An unapproved proposal MUST NOT supersede unchanged previously approved decisions. Where no relevant approved intent yet exists, consequential realization MUST wait for the necessary human decision; investigation and drafting MAY continue.

### 6.2 Approval records and recoverable baselines

Each approval MUST have a truthful, discoverable record identifying the approved scope, revision, content, and approving human. The approved content and its approval boundary MUST also be preserved in an identifiable, recoverable baseline. These are separate obligations: an approval may have occurred before baseline preservation is completed. A revision identifier or document status alone is not proof of approval. The record MUST NOT invent an approver, decision, date, or outcome.

On approval, the participant MUST reconcile the current-state design to the precise decision, keep unresolved proposals distinct, retain relevant approval history, and verify that the recorded approved boundary matches what the human accepted. Baseline preservation MUST be performed only within actual permissions and authorization. If preservation is unavailable or fails, the participant MUST report that the human approval occurred but the durable baseline remains outstanding, MUST identify where the approved content can currently be found, and MUST NOT represent the approval as a completed frozen baseline. Further work that requires reliable recovery of that baseline MUST wait until preservation is completed.

A version-control commit or equivalent snapshot MAY preserve a baseline, but committing does not itself approve design. Separate draft-only commits, dedicated design tags, and formal approval registries are not universally required.

### 6.3 Project rules

Project-specific rules MUST be established, consequentially amended, and retired through explicit human authorization. AI MAY propose rules and assess their impact but MUST NOT independently make them binding. Existing approved rules remain governing until their replacement or retirement is approved. Rule changes MUST remain identifiable and recoverable under the same approval principles as design changes. Project rules MUST NOT redefine or contradict the adopted Core.

## 7. Working Method

DLD applies throughout conception and feasibility, needs and requirements, architecture and design, implementation and integration, verification and validation, delivery and deployment, operation and support, maintenance and evolution, and retirement. These are lifecycle responsibilities, not mandatory sequential gates.

For the active scope, use the following recurring **logical operating cycle**, at a granularity appropriate to the work:

1. **Understand:** Identify the objective, owning scope, governing design, applicable constraints, approvals, permissions, relevant realizations, and evidence.
2. **Design:** Investigate alternatives and develop or refine abstract intended outcomes and decisions in their owning scopes.
3. **Decide:** Resolve consequential choices through human authority; identify approved boundaries and delegated local choices.
4. **Realize:** Perform authorized work aligned with applicable approved design, including integration with affected scopes.
5. **Verify and validate:** Evaluate conformance and intended outcomes using proportionate evidence; distinguish what has and has not been established.
6. **Report and evolve:** Communicate completed work, evidence, deviations, unresolved choices, and next actions; correct realizations or propose design revisions.

These activities MAY overlap, repeat, or be unnecessary in a particular work episode. Their order is not a mandatory project schedule. Regardless of sequence, consequential changed intent MUST NOT be realized without appropriate approval, and completion claims MUST follow the evidence obligations in Section 8.

## 8. Realization and Assurance

### 8.1 Alignment with approved design

Before consequential realization, the participant MUST establish the applicable approved design and constraints for the affected scope. Realizations MUST remain consistent with that design, and the relationships needed to identify affected work MUST remain discoverable.

If implementation conflicts with unchanged approved design, the realization SHOULD be corrected. If evidence suggests that approved intent is unsuitable, the participant MUST propose the consequential design revision for human decision before realizing the changed intent. Existing implementation MUST NOT silently acquire design authority.

### 8.2 Verification, validation, and evidence

**Verification** evaluates conformance to approved design. **Validation** evaluates whether the resulting outcome meets intended needs. The participant MUST perform the assessments relevant to the work and its agreed acceptance criteria, subject to actual tools and permissions, and MUST report material limitations.

Claims of conformance, quality, successful checks, or completion MUST be supported by identifiable evidence appropriate to the claim's scope and consequences. Reports MUST distinguish verified results, observed failures, checks not performed, and inconclusive evidence. A check MUST NOT be reported as passed if it did not run or its result is unavailable. Passing one check MUST NOT be represented as proof of unrelated properties.

The depth of assurance SHOULD be proportional to uncertainty and consequences of failure. No specific test framework, evidence format, or traceability matrix is required. Evidence MAY include test results, reviews, measurements, inspections, demonstrations, or operational observations.

### 8.3 Delivery and external actions

Delivery, deployment, release, and retirement MUST satisfy applicable project criteria and actual authorization. Known limitations and unresolved assurance gaps MUST be communicated to the responsible human decision-makers. Packaging, tagging, or passing automated checks MUST NOT be treated as release approval. Relevant operational and support information SHOULD accompany delivered outcomes according to their use and risk.

## 9. Evolution and Continuity

### 9.1 Impact and propagation

Before approving a consequential design change, participants MUST assess reasonably discoverable material effects sufficiently to inform the human decision. The assessment MUST consider relevant governing and dependent scopes, interfaces, constraints, realizations, and assurance obligations to the extent they may be affected. Uncertainty or unavailable information MUST be disclosed; approval MUST NOT be represented as covering effects outside its identified boundary. Newly discovered consequential effects outside that boundary MUST return for human resolution.

Approved changes MUST be propagated to affected authoritative designs and realizations. The participant MUST maintain an identifiable distinction between approved target intent, implemented state, and incomplete or unverified propagation. Impact assessment and its record SHOULD be proportionate to the change; no separate change-request system is required.

### 9.2 Progressive context reconstruction

At the beginning of new or resumed consequential work, the participant MUST establish sufficient authoritative context for the active scope. This includes the project foundation, applicable governing and scoped designs, known approval and delegation boundaries, relevant dependencies, actual realization state, and material evidence.

Context SHOULD be loaded progressively: begin with the foundation and governing and active scopes; expand to affected dependencies, neighboring scopes, and history when the work requires them. The participant is not required to reconstruct unrelated project history. If essential authoritative context or permission cannot be established, it MUST be reported and resolved before consequential action.

### 9.3 Handoff

Material unfinished work, unresolved decisions, known inconsistencies, relevant evidence, and next actions MUST remain discoverable across handoffs. A concise summary, task record, or generated index MAY assist navigation, but MUST NOT supersede authoritative design, actual project state, or approval records. AI MUST NOT infer continuing authority from an earlier conversation when current authority or delegation cannot be established.

## 10. Adoption and Versioning

### 10.1 New and existing projects

A new project adopts DLD by establishing the foundation and progressively developing and approving sufficient project and scoped design. Initial drafts MAY exist without claiming authority.

An existing project MAY adopt DLD incrementally through **scoped reconciliation**. Existing code, documentation, configuration, and observed behavior are evidence of the current system, not automatically approved design. For each scope requiring consequential work, participants MUST examine relevant evidence, identify uncertainties and dependencies, establish intended design sufficiently for the work, and obtain required human approval. Reconciled and unreconciled areas MUST remain distinguishable. Existing operation MAY continue outside a reconciliation effort, subject to other governing obligations.

### 10.2 Method version integrity

Each project MUST identify its adopted DLD Core version and retain that Core unchanged during ordinary project evolution. New DLD versions do not automatically alter a project's authority. An upgrade MUST be deliberate and human-authorized, with material implications for project design, rules, and existing approvals assessed before adoption.

The adopted DLD method version, project design revisions, and project product or release versions are separate identities. A methodology upgrade MUST NOT silently overwrite project-specific DESIGN, RULES, or their approval history. Project-specific additions belong in their owned design or rules, not through editing the adopted Core.
