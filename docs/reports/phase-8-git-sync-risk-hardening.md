# Phase 8 - Git Sync Risk Hardening

## Short Report

- Type: docs / workflow hardening
- Date: 2026-06-16
- Changed: added Git Sync Policy, workspace `sync.md`, stricter validation, source branch base records, and next-action states for sync risks.
- Verified: `bash -n` passed for workflow scripts. Full validation and edge-case tests were rerun after this report was added.
- Remaining: real remote-main divergence and true multi-branch merge conflicts are still not simulated by the harness tests.
- Next context: Source of Truth stays above reports; `sync.md` is branch state, not the final contract.
- Risk: Git commands that mutate branch or remote state remain behind human confirmation by design.

## Risks Addressed

- Phase start can now record the branch/base point in workspace `sync.md`.
- Phase completion has a Pre-Merge Sync section for main freshness, conflicts, validation, and result.
- Mid-phase upstream changes have an explicit state menu and Sync Conflict Confirm path.
- Shared Source of Truth conflicts are routed through confirmation gates instead of silent auto-merge.
- Integration branches must record source branch/base commit information in `sources.md`.
- `scripts/validate-harness.sh` now checks for `docs/11-git-sync-policy.md`, workspace `sync.md`, and integration source base records in strict mode.
- Existing dry-run workspaces were backfilled with `sync.md`.

## Risks Intentionally Left Manual

- The harness does not run `git pull`, `merge`, `rebase`, `push`, PR creation, or PR merge automatically.
- The harness does not decide whether merge or rebase is the team policy beyond recommending `git pull --ff-only` for main updates.
- The harness does not attempt to resolve shared Source of Truth conflicts without human confirmation.
- Report index freshness is still a lightweight evidence lookup, not a full semantic freshness proof.

## Validation Commands

```bash
bash -n scripts/start-workflow.sh
bash -n scripts/validate-harness.sh
bash -n tests/workflow-edge-cases.sh
scripts/start-workflow.sh --no-checkout feature sync-smoke "Sync Smoke"
scripts/validate-harness.sh
scripts/validate-harness.sh --strict
tests/workflow-edge-cases.sh
```

## Validation Result

- `scripts/start-workflow.sh --no-checkout feature sync-smoke "Sync Smoke"` created `docs/workflows/feature/sync-smoke/sync.md` with Start Sync, base commit, and result fields.
- `scripts/validate-harness.sh` passed.
- `scripts/validate-harness.sh --strict` passed.
- `tests/workflow-edge-cases.sh` passed.
