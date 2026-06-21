# Task CRUD Shared Document Patch Proposals

## Proposed Source Of Truth Changes

| File | Proposed Change | Reason | Merge Risk |
| --- | --- | --- | --- |
| `docs/02-architecture.md` | Add `Task` entity and local `TaskStore` write/read flow | CRUD needs a persistent task model | Medium |
| `docs/03-interface-reference.md` | Define `Task`, `createTask`, `listTasks`, `updateTaskStatus` | CRUD needs stable contracts | High |
| `docs/05-acceptance-scenarios-and-checklist.md` | Add create/list/update status scenario | Verifies visible feature behavior | Low |
| `docs/06-regression-and-failure-scenarios.md` | Status update must not delete task data | Protects core task data | Medium |
| `docs/07-manual-verification-playbook.md` | Add task CRUD manual path | Proves local MVP behavior | Low |

## Integration Notes

- `Task.status` should include `blocked` so blocker view can reuse the same model.

## Conflicts To Resolve

- Decide whether `blockerReason` belongs in base `Task` during MVP.
