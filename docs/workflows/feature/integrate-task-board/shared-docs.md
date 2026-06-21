# Integrate Task Board Shared Document Patch Proposals

## Source Branches

- `docs/workflows/feature/task-crud/shared-docs.md`
- `docs/workflows/feature/blocker-view/shared-docs.md`

## Reconciled Source Of Truth Changes

| File | Reconciled Change | Source Inputs | Result |
| --- | --- | --- | --- |
| `docs/02-architecture.md` | One `TaskStore`; CRUD writes tasks; blocker view reads and filters blocked tasks | task-crud, blocker-view | Compatible |
| `docs/03-interface-reference.md` | One `Task` contract with `status` values `todo`, `in_progress`, `blocked`, `done`; operations include CRUD and blocked filter | task-crud, blocker-view | Compatible after status alignment |
| `docs/05-acceptance-scenarios-and-checklist.md` | Integrated path: create task -> assign owner -> mark blocked -> see in blocker view -> task remains in full list | task-crud, blocker-view | Compatible |
| `docs/06-regression-and-failure-scenarios.md` | Keep two guards: status update preserves data; blocker view is read-only | task-crud, blocker-view | Not duplicate |
| `docs/07-manual-verification-playbook.md` | One golden path plus optional feature-specific checks | task-crud, blocker-view | Compatible |

## Integration Notes

- Integration is smooth if source branches record `shared-docs.md`.
- Without `shared-docs.md`, integration must infer changes from `plan.md`, `notes.md`, and `report.md`.

## Conflicts To Resolve

- `blockerReason` remains optional.
- Owner remains free-text for MVP unless product scope changes.
