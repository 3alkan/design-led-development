# Design-Led Development (DLD)

DLD is a **design-centered, human-authoritative, AI-assisted software engineering methodology**. This distribution provides a minimal project starter and one optional supporting reference. The versioned Core contained in the starter is the authoritative specification.

## Adopt DLD

Copy the **contents** of [starter/](starter/README.md) into your new or existing project, reconciling any existing files:

```text
project/
  README.md
  foundation/
    CORE.md
    DESIGN.md
    RULES.md
```

The starter's Core is the unchanged adopted method; DESIGN starts as an unapproved project template, and RULES starts without additional adopted constraints. The project README explains how to establish sufficient context for AI collaboration. You do not need additional guides or a tool-specific AI instruction file.

## Optional repository layout reference

The [repository layout reference](supporting/repository-layout.md) explains how to extend the minimum foundation with implementation, tests, documentation, build, deployment, and other responsibilities. It is **optional** and does not create DLD requirements.

To keep it in a user project, copy `supporting/repository-layout.md` to `docs/dld/repository-layout.md`. It can also be read directly from this product distribution.

## Version and terms

See [VERSION](VERSION), [CHANGELOG.md](CHANGELOG.md), and [LICENSE](LICENSE). An adopting project retains its chosen Core version until a deliberate methodology upgrade. The product's README is an introduction, not an alternative methodology specification.
