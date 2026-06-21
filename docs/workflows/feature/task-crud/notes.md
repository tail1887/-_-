# Task CRUD Notes

## Running Notes

- Task CRUD owns the base `Task` entity.
- Status values proposed: `todo`, `in_progress`, `blocked`, `done`.
- `blocked` is included here even though blocker view renders it, because status update must already support it.

## Decisions

- Treat `Task.status` as shared contract.
- Integration branch must reconcile status values before merging blocker view.

## Open Questions

- Should owner be a free-text field for MVP or a user entity?
- Should blocked tasks require a blocker reason?

## Links / Evidence

- Related integration workspace: `docs/workflows/feature/integrate-task-board/`
