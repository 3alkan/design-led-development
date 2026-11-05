# Design-Led Development (DLD)

**DLD is a design-centered, human-authoritative, AI-assisted software engineering methodology for the complete software project lifecycle.** Its versioned [Core](foundation/CORE.md) is the single authoritative specification of the method.

## This repository

This is **DLD's development repository**, and it is itself a project using DLD. Its [project design](foundation/DESIGN.md) defines what DLD is being developed to become; its [project rules](foundation/RULES.md) contain constraints specific to this development project. Both are governed by [DLD Core](foundation/CORE.md).

One stabilized source baseline and version produce two distributions:

| Distribution | Intended use |
| --- | --- |
| **Development** | Maintain and evolve DLD, including its own design, documentation, templates, examples, and packaging infrastructure. |
| **Product** | Learn DLD and apply it in other software projects using the shared Core, user documentation, and a clean copyable starter. |

Both audiences use **the same versioned Core**, not independently maintained methodologies. Adopting projects must not modify their frozen Core to express project preferences; their `DESIGN.md` and `RULES.md` are project-specific.

## Start here

- **Develop DLD:** Read [Core](foundation/CORE.md), [development guidance](docs/development.md), [project design](foundation/DESIGN.md), and [project rules](foundation/RULES.md).
- **Use DLD in your project:** Read the [product introduction](docs/product.md) and [adoption guide](docs/adoption.md). Only the generated starter contents belong in your project.
- **Learn DLD:** Begin with [Core](foundation/CORE.md), then explore the [documentation](docs/README.md) and [reference repository layout](docs/reference-repository-layout.md).

At the start of each new or resumed AI session in this repository, explicitly ask AI to read `foundation/CORE.md`, `foundation/RULES.md`, and `foundation/DESIGN.md`, followed by applicable scoped designs and the repository state. Do not assume automatic discovery or create a mandatory AI-specific instruction file.

## Repository structure

| Path | Responsibility |
| --- | --- |
| [`foundation/`](foundation/CORE.md) | Canonical DLD Core; DLD's own project-specific DESIGN and RULES. |
| [`docs/`](docs/README.md) | Shared reference and lifecycle guidance, plus adopter- and developer-specific guides. |
| [`examples/`](examples/README.md) | Concrete examples applying DLD, when available. |
| [`starter/`](starter/README.md) | Clean, copyable project templates; the versioned Core is inserted from the canonical source when distributed. |
| [`.github/`](.github/workflows/package-check.yml) | Repository-native package validation and assembly infrastructure. |
| [`CHANGELOG.md`](CHANGELOG.md) | Method changes and adoption implications. |
| [`VERSION`](VERSION) | DLD release version, independent of design revisions or adopter project versions. |
| [`LICENSE`](LICENSE) | License for the distributed DLD materials. |

Generated packages under `dist/` are ignored. This is a deliberately small development repository; the [reference layout](docs/reference-repository-layout.md) is a **selectively adoptable general reference**, not a list of directories DLD itself must create.

## Package validation

```sh
python .github/package.py --check
```

The script assembles and checks both distributions from the same version. Packaging does not itself approve a design or publish a release; see [development guidance](docs/development.md).

## Version and status

The last documented published release is **`v0.1.3`**. The changes on this proposal branch remain under review, with the earlier approved design history preserved. See the [changelog](CHANGELOG.md). DLD has not yet been validated through a complete real-world software project.
