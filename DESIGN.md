# DLD Development — Project Design

**Status:** Draft — pending an explicit approval of this version's content.

## Purpose

Maintain and distribute DLD as one coherent, versioned methodology for humans and AI collaborating on software engineering. This development repository adopts its own [contract](dld/CONTRACT.md) and [methodology](dld/DLD.md). The historical `old/` directory is reference material, not a governing source.

## Product boundary

The distributed product provides the immutable adopted contract and methodology, an **editable context registry**, optional guidance, a product introduction, and release/license metadata. Adopters own their project-specific designs, rules, approvals, and implementation. Supporting suggestions cannot introduce normative obligations.

The development registry at [dld/CONTEXT-REGISTRY.md](dld/CONTEXT-REGISTRY.md) references this development project. The product's neutral initial registry is maintained separately at [product-files/CONTEXT-REGISTRY.md](product-files/CONTEXT-REGISTRY.md); the distribution maps it to `dld/CONTEXT-REGISTRY.md`. Keeping two audience-specific registries prevents development-only governance and links from leaking into adopter copies. Changes to their common foundational references must remain consistent.

## Artifact ownership

| Location | Responsibility |
| --- | --- |
| `dld/CONTRACT.md` | General human–AI contract |
| `dld/DLD.md` | Normative DLD method, extending the contract |
| `dld/CONTEXT-REGISTRY.md` | This development project's context navigation |
| `DESIGN.md` and `RULES.md` | Development-specific design and approved additional constraints |
| `product-files/` | Product-only maintained sources, including the neutral registry and introduction |
| `dld/supporting/` | Optional guidance and editable templates |
| `product.toml` | Authoritative product source-to-destination mapping |
| `scripts/` | Local assembly and validation tooling |
| `VERSION`, `CHANGELOG.md` and license texts | Release identity, continuity, and licensing |
| `old/` | Historical reference, retained unchanged |

## Releases and assurance

The next release target is `0.1.5`, continuing `0.1.4`. Development snapshots use SemVer-style prereleases, for example `0.1.5-dev.1`. A single version identifies the DLD distribution; there is no independent methodology version sequence. Adopting projects version their own products independently.

A distribution must be assembled only from `product.toml` inputs, without automatically including development-only files. Its links, source equivalence, version, archive membership, and checksum should be checked. Reproducible packaging and preservation of previous successful outputs are goals of the packaging implementation. Passing checks, approval of method content, Git merge, and release publication are separate acts.

## Open work

- Validate a complete product assembly on a supported environment.
- Exercise adoption on a representative independent project.
- Review and explicitly approve the final v0.1.5 methodology and release content before publication.
