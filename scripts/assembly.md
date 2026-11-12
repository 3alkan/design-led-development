# Distribution Scope — Design

**Status:** Proposed for reconciliation

## Responsibility and boundary

Transform maintained DLD product sources into a reproducible, verifiable distribution without including development-only material. [product.toml](../product.toml) owns file membership and destinations; [package.ps1](package.ps1) realizes assembly.

## Intended design and requirements

| ID | Intended requirement | Realization |
| --- | --- | --- |
| P-01 | Select distribution entries explicitly; support individual files, recursive directory mappings, and filename wildcards, with predictable expansion. | `product.toml`, manifest parser |
| P-02 | Reject incomplete, duplicate, missing, unsafe or linked sources, unmatched patterns, and conflicting destinations. | Manifest/source checks |
| P-03 | Assemble only the selected files, preserving their bytes at declared destinations. | Staged product tree, membership check |
| P-04 | Validate local Markdown references against the assembled layout and prevent escaping the product boundary. | Product link check |
| P-05 | Use the root version identifier to name the versioned ZIP and one containing directory; include the selected version file. | Version parsing, ZIP creation |
| P-06 | Generate deterministic ZIP ordering, metadata, and payloads for identical inputs. | Sorted entries, fixed timestamps |
| P-07 | Emit a SHA-256 checksum for the ZIP. | ZIP checksum |
| P-08 | Validate the staged package before replacing generated outputs. Report replacement failures; generated outputs can be rebuilt. | Build staging |
| P-09 | Work locally with PowerShell 7 and built-in platform functionality; no CI service dependency. | `scripts/package.ps1` |

## Decisions and rationale

- **P-D1:** One TOML manifest is the product-membership authority. Exact files map to files; a source ending in `/` recursively maps its contents into a destination ending in `/`; a filename pattern containing one `*` maps matching immediate files into a destination ending in `/`. Preserve subpaths under a directory, sort expansions deterministically, reject overlaps and link traversal. This is not a general-purpose TOML or glob parser.
- **P-D2:** Stage assembled files in `build/` so invalid inputs are rejected before replacing generated outputs; the product, ZIP, and checksum remain regenerable build artifacts rather than repository sources.
- **P-D3:** ZIP entry content is stored without compression to make deterministic output simple; compression ratio is not an acceptance goal.
- **P-D4:** Use `dld-v<VERSION>/` inside the archive to identify an extracted distribution; leave `build/product/` unwrapped for straightforward local inspection.
- **P-D5:** Replace generated outputs without multi-file rollback: they are reproducible build artifacts, and the complexity of transactional recovery is disproportionate. Failed replacement must be reported and outputs rebuilt before use.

## Realization and acceptance

The assembled file set must equal the manifest destinations exactly; product copies match source bytes; no product-local Markdown links are broken. Repeated packaging of identical inputs must produce identical SHA-256 digests. Invalid manifests, broken links, and unsafe paths must be rejected before replacing existing outputs. A real PowerShell 7 run is needed to establish execution evidence.

