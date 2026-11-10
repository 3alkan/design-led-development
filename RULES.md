# DLD Development Rules

## TXT-001 — Maintained text encoding and line endings

All maintained text files in this repository MUST use UTF-8 without a byte-order mark (BOM) and LF (`\n`) line endings. Binary files are excluded. Exceptions require human approval.

The historical `old/` archive is retained unchanged and excluded from TXT-001 validation; newly maintained sources belong outside it. Git's `.gitattributes` normalizes line endings, `.editorconfig` establishes editor defaults, and `scripts/check-text-format.ps1` validates tracked maintained files. Run the check before accepting changes.
