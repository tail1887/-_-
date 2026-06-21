# Task CRUD Plan

## Branch

- Branch: `feature/task-crud`
- Workspace: `docs/workflows/feature/task-crud`
- Created: 2026-06-16

## Goal

- Simulate the task creation, list, and status update feature branch for Study Sprint Board.

## Scope

- Define `Task` core fields.
- Simulate create task, list tasks, and update status flows.
- Record intended Source of Truth changes.
- Record merge inputs for the integration branch.

## Out Of Scope

- Blocker-only view.
- Notifications.
- Authentication.
- Remote deployment.
- Real code implementation.

## Source Of Truth Context

Read:

- `AGENTS.md`
- `docs/00-layer-map.md`
- `docs/01-product-planning.md`
- `docs/02-architecture.md`
- `docs/03-interface-reference.md`
- `docs/05-acceptance-scenarios-and-checklist.md`
- `docs/06-regression-and-failure-scenarios.md`
- `docs/07-manual-verification-playbook.md`
- `docs/08-development-workflow.md`
- `docs/09-collaboration-agreement.md`

Would update in target project:

- `docs/02-architecture.md`: task entity, local persistence, task status flow.
- `docs/03-interface-reference.md`: `Task`, `createTask`, `listTasks`, `updateTaskStatus`.
- `docs/05-acceptance-scenarios-and-checklist.md`: task CRUD acceptance.
- `docs/06-regression-and-failure-scenarios.md`: status update must not delete task data.
- `docs/07-manual-verification-playbook.md`: add/list/update status manual path.

## Shared Document Patch Proposal

| File | Proposed Change | Merge Risk |
| --- | --- | --- |
| `docs/02-architecture.md` | Add `Task` entity and local persistence flow | Medium: blocker view also depends on task status |
| `docs/03-interface-reference.md` | Define task fields and CRUD operations | High: blocker view needs compatible `blocked` status semantics |
| `docs/05-acceptance-scenarios-and-checklist.md` | Add task CRUD scenario | Low |
| `docs/06-regression-and-failure-scenarios.md` | Protect task data during status updates | Medium |
| `docs/07-manual-verification-playbook.md` | Add task CRUD manual check | Low |

## Implementation Prompt

```text
@AGENTS.md @docs/00-layer-map.md @docs/02-architecture.md @docs/03-interface-reference.md @docs/05-acceptance-scenarios-and-checklist.md @docs/06-regression-and-failure-scenarios.md @docs/07-manual-verification-playbook.md @docs/08-development-workflow.md

Simulate feature/task-crud only.
Do not implement blocker view.
Record shared document patch proposals and integration inputs in this workspace.
```

## Verification Prompt

```text
@AGENTS.md @docs/workflows/feature/task-crud/plan.md @docs/workflows/feature/task-crud/report.md

Verify that task CRUD can be merged with blocker view through shared task status semantics.
```

## Completion Criteria

- [x] Scope completed
- [x] Shared document patch proposal recorded
- [x] Integration inputs recorded
- [x] Acceptance checked
- [x] Regression/failure scenario checked
- [x] Manual verification recorded
- [x] Report updated
