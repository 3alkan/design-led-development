# DLD Development — Project Rules

- Revision: 1
- Status: Draft

## TXT-001 — Maintained text encoding and line endings

All maintained text files in the DLD development repository **MUST** be encoded as **UTF-8 without a byte-order mark (BOM)** and **MUST** use **LF (`\n`) line endings**. This applies to documentation, source scripts, configuration, version and license text, and other maintained text artifacts. Binary files are outside this rule. Any necessary exception requires an explicit human-approved change to this rule.

This is a project-specific engineering constraint, not an additional methodological requirement for adopting projects. The adopted [DLD Core](CORE.md) continues to govern approval, amendment, and retirement of rules.
