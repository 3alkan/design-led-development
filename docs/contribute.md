# Contribute to DLD

This document is for people and AI maintaining **the DLD methodology product itself**. It is not part of the method that adopters must follow.

The DLD development repository follows its own [project DESIGN](../foundation/DESIGN.md) and [RULES](../foundation/RULES.md) under the [canonical Core](../foundation/CORE.md). Check the current approval and delegation boundaries before consequential work.

## Find the owning source

| Change concerns | Owner |
| --- | --- |
| DLD's normative methodology | `foundation/CORE.md` |
| DLD product scope, distributions, acceptance criteria | `foundation/DESIGN.md` |
| Additional approved constraints for the DLD development project | `foundation/RULES.md` |
| Human explanations and optional examples | `docs/`, `examples/` |
| Adoption templates | `starter/` |
| Packaging implementation and checks | `.github/package.py` |

A useful new requirement discovered while writing a guide is a **proposal to change Core**, not permission to make the guide a second normative authority.

## Work coherently

Identify the current version, approved baseline, and relevant draft changes. Consider effects across Core, starter, documentation, package assembly, release notes, and any example projects.

When changing project or methodology intent, present the affected decisions and reasonably discoverable consequences to the human. Keep draft content distinct from approved baselines. A successful implementation or commit does not settle an unapproved design question.

Guidance should prioritize clear explanations, examples, and useful trade-offs. Avoid copying Core's requirements verbatim into multiple documents where they could drift.

## Check distributable results

Use the built-in packaging check:

```sh
python .github/package.py --check
```

Inspect the resulting adopter starter, shared Core identity, product/development content boundaries, and optional documentation overlay. The check validates package construction and links, not the entire methodology's real-world effectiveness.

For implementation details see the [packaging reference](internal/packaging.md).

An approved design, an authorized commit, a successful build, a merge, and a published release are separate events. Release only with the applicable human authorization.
