# Integrate Task Board Source Branches

Use this file when this branch depends on or integrates other branch workspaces.

## Source Branch Workspaces

- `docs/workflows/feature/task-crud/`
- `docs/workflows/feature/blocker-view/`

## Required Source Files

For each source branch, read:

- `plan.md`
- `shared-docs.md`
- `report.md`
- `quality.md`
- `decisions.md`
- `confirmations.md`
- `sync.md`

## Source Branch Base Records

| Source Branch | Workspace | Base Commit | Read At | Notes |
| --- | --- | --- | --- | --- |
| `feature/task-crud` | `docs/workflows/feature/task-crud/` | `unborn` | 2026-06-16 | Dry-run source workspace read; local repo has no first commit yet. |
| `feature/blocker-view` | `docs/workflows/feature/blocker-view/` | `unborn` | 2026-06-16 | Dry-run source workspace read; local repo has no first commit yet. |

## Integration Notes

- `feature/task-crud` owns the base `Task` entity and status update behavior.
- `feature/blocker-view` owns the blocked-task read projection.
- Integration reconciles both into one `Task.status = blocked` contract.
