# Phase 13 - Semantic Validation Hardening

## Short Report

- Type: docs / workflow validation hardening
- Date: 2026-06-17
- Changed: added workspace, quality, decision, and Pre-Merge Sync status fields; made validation state-aware; improved status summary and PR readiness.
- Verified: strict, integration, status, and workflow edge-case validation passed.
- Remaining: semantic quality of decisions and Source of Truth application still requires human/AI judgment.
- Next context: ready/complete workspaces are now stricter than draft/in-progress workspaces.
- Risk: setting a workspace to ready too early will now fail validation until quality, decision, and sync status are resolved.

## Strengthened Semantic Rules

- `Workspace state` now controls strictness.
- `Quality gate status` must be resolved for ready/complete workspaces.
- `Decision status: brief-needed` fails for ready/complete workspaces.
- Pre-Merge Sync needs a result or deferral reason for ready/complete workspaces.
- Integration-ready workspaces require ready or archived source branches with acceptable quality, decision, and sync status.

## Status Summary Priority

`scripts/status-workflow.sh` now reports:

- Workspace state
- Quality gate status
- Decision status
- Pre-Merge Sync result/deferral
- PR checklist readiness

Recommended next action now prioritizes missing files, pending confirmations, decision gaps, quality gaps, sync gaps, integration validation, and PR readiness.

## Validation Commands

```bash
bash -n scripts/start-workflow.sh
bash -n scripts/validate-harness.sh
bash -n scripts/status-workflow.sh
bash -n tests/workflow-edge-cases.sh
scripts/status-workflow.sh docs/workflows/feature/task-crud
scripts/validate-harness.sh
scripts/validate-harness.sh --strict
scripts/validate-harness.sh --integration
tests/workflow-edge-cases.sh
```

## Validation Result

- Passed: script syntax checks for workflow start, validation, status, and edge-case tests.
- Passed: `scripts/validate-harness.sh`
- Passed: `scripts/validate-harness.sh --strict`
- Passed: `scripts/validate-harness.sh --integration`
- Passed: `tests/workflow-edge-cases.sh`
