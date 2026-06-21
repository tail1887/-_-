# Blocker View Plan

## Branch

- Branch: `feature/blocker-view`
- Workspace: `docs/workflows/feature/blocker-view`
- Created: 2026-06-16

## Goal

- Simulate the Friday blocker view feature branch for Study Sprint Board.

## Scope

- Define a view that filters tasks with `status = blocked`.
- Record intended Source of Truth changes.
- Record merge inputs for the integration branch.

## Out Of Scope

- Creating tasks.
- Updating task status.
- Notifications.
- Authentication.
- Real code implementation.

## Source Of Truth Context

Read:

- `AGENTS.md`
- `docs/00-layer-map.md`
- `docs/02-architecture.md`
- `docs/03-interface-reference.md`
- `docs/05-acceptance-scenarios-and-checklist.md`
- `docs/06-regression-and-failure-scenarios.md`
- `docs/07-manual-verification-playbook.md`
- `docs/08-development-workflow.md`
- `docs/09-collaboration-agreement.md`

Would update in target project:

- `docs/02-architecture.md`: blocker view reads existing tasks and filters blocked status.
- `docs/03-interface-reference.md`: `listBlockedTasks` or UI filter contract.
- `docs/05-acceptance-scenarios-and-checklist.md`: blocked task appears in blocker view.
- `docs/06-regression-and-failure-scenarios.md`: blocker view must not mutate task status.
- `docs/07-manual-verification-playbook.md`: Friday blocker view manual check.

## Shared Document Patch Proposal

| File | Proposed Change | Merge Risk |
| --- | --- | --- |
| `docs/02-architecture.md` | Add blocker view read path from task store | Medium: must use same task store as CRUD |
| `docs/03-interface-reference.md` | Add blocked-task filter/view contract | High: must not invent a second blocker entity |
| `docs/05-acceptance-scenarios-and-checklist.md` | Add blocker view scenario | Low |
| `docs/06-regression-and-failure-scenarios.md` | View must not mutate tasks | Medium |
| `docs/07-manual-verification-playbook.md` | Add blocker view manual check | Low |

## Implementation Prompt

```text
@AGENTS.md @docs/00-layer-map.md @docs/02-architecture.md @docs/03-interface-reference.md @docs/05-acceptance-scenarios-and-checklist.md @docs/06-regression-and-failure-scenarios.md @docs/07-manual-verification-playbook.md @docs/08-development-workflow.md

Simulate feature/blocker-view only.
Do not implement task creation or status update.
Record shared document patch proposals and integration inputs in this workspace.
```

## Verification Prompt

```text
@AGENTS.md @docs/workflows/feature/blocker-view/plan.md @docs/workflows/feature/blocker-view/report.md

Verify that blocker view depends on the shared Task contract and does not create a separate blocker model.
```

## Completion Criteria

- [x] Scope completed
- [x] Shared document patch proposal recorded
- [x] Integration inputs recorded
- [x] Acceptance checked
- [x] Regression/failure scenario checked
- [x] Manual verification recorded
- [x] Report updated
