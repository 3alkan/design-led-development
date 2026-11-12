# DLD Development Rules

## TXT-001 — Maintained text encoding and line endings

All maintained text files in this repository MUST use UTF-8 without a byte-order mark (BOM) and LF (`\n`) line endings. Binary files are excluded. Exceptions require human approval.

Git's `.gitattributes` normalizes line endings, `.editorconfig` establishes editor defaults, and `scripts/validate-text-format.ps1` validates maintained files. Run the check before accepting changes.
