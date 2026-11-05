# DLD Distribution Boundaries

DLD is one versioned software engineering methodology project. A stabilized release tag identifies one repository baseline and two matching distributions:

- **Development distribution**: source snapshot for developing and maintaining DLD, including its project design, maintained sources, guides, examples, engineering tools, and verification definitions. Git metadata may be obtained by cloning the tagged repository rather than embedded in the archive.
- **Product distribution**: user-facing methodology introduction, guide, reference repository layout, starter templates, and relevant license and version information. It excludes the DLD development project's internal `foundation/`, verification records, and engineering-only tools.

Packaging selects maintained source files without promoting generated outputs to design authority. Publish packages only after verification, explicit human authorization, and matching version/tag identity. `build/` and `dist/` are generated work areas, not automatically version-controlled sources.

The project starter's `foundation/DESIGN.md` is a draft template for the *adopter's* project, not the approved DLD development design. The exact build automation and release checks can be extended without changing these boundaries.
