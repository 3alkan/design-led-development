# Distribution — Design

**Status:** Proposed for reconciliation

## Responsibility and boundary

Assemble an identifiable, reproducible DLD distribution from explicitly selected authoritative sources. This scope owns product selection and assembly, not source-content decisions, release approval, or publication.

## Intended design and requirements

| ID | Intended requirement |
| --- | --- |
| P-01 | Distribution membership and destinations are explicitly governed, with predictable expansion for grouped sources. |
| P-02 | Invalid or ambiguous selections fail rather than silently adding, omitting, or overwriting content. |
| P-03 | The assembled distribution contains exactly the selected content, preserving source content. |
| P-04 | Internal references in the delivered material remain usable within the assembled product. |
| P-05 | Each distribution identifies its DLD baseline consistently in the package and its contents. |
| P-06 | Identical sources and selection produce reproducible release artifacts. |
| P-07 | An integrity checksum accompanies the distributable archive. |
| P-08 | Validate assembled output before replacing generated artifacts, and report failures without implying success. |
| P-09 | Packaging remains usable locally without hosted services or added dependencies. |

## Decisions and rationale

- **Explicit selection.** Use a single product manifest to avoid inferring membership from repository structure; allow exact files, recursive directories, and filename wildcards to keep selection practical without building a general-purpose glob system.
- **Simple, deterministic packaging.** Stable file ordering and ZIP metadata make identical inputs reproducible. Archive compression is not needed for this small text-based product.
- **Regenerable outputs.** Build in a staging area before replacement. Generated artifacts can be rebuilt, so multi-output transactional rollback is disproportionate.
- **Self-contained distribution.** Include a versioned containing directory in the archive to make extracted releases recognizable, while retaining an unwrapped local product for inspection.

## Realization and acceptance

[product.toml](../product.toml) governs selected files and destinations. [package.ps1](package.ps1) assembles `build/product/`, a versioned ZIP, and its SHA-256 checksum using PowerShell 7 and built-in platform functionality. The current manifest supports exact mappings, recursive directory mappings, and immediate-file wildcard patterns.

Check that selected files alone are included, their bytes are preserved, links resolve, invalid paths or overlaps are rejected, and repeated builds of identical inputs yield identical archive hashes. An invalid package must fail before replacing existing outputs; a filesystem replacement failure must be reported so outputs can be rebuilt. Executing the script is required to establish implementation evidence.
