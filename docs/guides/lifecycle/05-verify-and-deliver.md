# 5. Verify, validate, and deliver

**Goal:** Establish evidence about the realized increment and prepare it for actual use.

**Human:** Assess intended outcomes, decide acceptance of limitations, and authorize delivery.

**AI:** Perform relevant checks, expose discrepancies, and prepare supporting information.

## Verify and validate

**Verification** asks whether realization conforms to approved design. **Validation** asks whether it meets the intended use. Select tests, inspection, direct use, demonstrations, and operating checks according to context and risk.

> Compare the realized increment with its approved requirements and acceptance criteria. Record checks actually performed, results, gaps, and anything unverified.

A compact evidence record can be:

| Approved criterion | Performed check | Observed result | Remaining limitation |
| --- | --- | --- | --- |
| [Criterion] | [Actual check/environment] | [Result] | [Gap or untested part] |

This is a template, **not evidence**. An implementation defect should be corrected; a proposed change to design intent needs human review under Core. Passing tests alone cannot establish every intended outcome.

## Prepare delivery

Provide actual setup, usage, configuration, operating, and recovery instructions as applicable. Record release identity, delivered scope, known limitations, verification evidence, and where the result can be obtained.

Do not prescribe deployment infrastructure for a project that does not need it. Delivery requires agreed criteria and authorization; a commit, package, or tag is not itself authorization or proof of approval.

## Outcome

The delivered scope and its evidence are identifiable; users have the information needed to operate the product.

**Continue:** [Evolve the project](06-evolve-the-project.md).
