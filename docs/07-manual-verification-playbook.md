# 07. Manual Verification Playbook

This document routes manual verification. Detailed procedures live in `docs/manual-verification/`.

## Purpose

- Verify demo, UX, integration, and human-facing flows that automated tests do not fully cover.
- Record manual evidence in Phase reports.
- Connect failed manual verification to `docs/06` failure scenarios or current Phase TODOs.

## When To Use

- Before Phase completion
- Before release/demo rehearsal
- After UX, integration, or external-provider changes
- After Hotfixes
- When automated tests are absent or insufficient

## Execution Rules

1. Run at least one relevant manual verification document before Phase completion.
2. Record results in the Phase report using `docs/reports/_template.md`.
3. Treat demo/UX quality as a manual verification concern.
4. Link failures to `docs/06` Failure Scenario and report TODOs.

## Detailed Verification Documents

- [Environment Setup](manual-verification/00-environment-setup.md)
- [Golden Path](manual-verification/01-golden-path.md)
- [Core Feature](manual-verification/02-core-feature.md)
- [Auth or Access Control](manual-verification/03-auth-or-access-control.md)
- [Data Flow](manual-verification/04-data-flow.md)
- [Integration](manual-verification/05-integration.md)
- [Failure Scenarios](manual-verification/06-failure-scenarios.md)

## 협업 하네스 Minimum Manual Check

1. Open `README.md` and confirm the repository is described as a reusable 협업 하네스 template.
2. Open `00-how-to-use-this-template.md` and confirm the apply order is clear.
3. Open `AGENTS.md` and confirm Source of Truth, context loading, and reporting rules are concrete for this repository.
4. Open `docs/08-development-workflow.md` and confirm Phase 0 describes documentation template bootstrap.
5. Confirm target-project placeholders remain only in reusable template examples or placeholder lists.

## Phase Report Format

```text
Manual Verification:
- Document executed:
- Environment:
- Result:
- Failure/limitation:
- Evidence:
```
