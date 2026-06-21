# Integrate Task Board Plan

## Branch

- Branch: `feature/integrate-task-board`
- Workspace: `docs/workflows/feature/integrate-task-board`
- Created: 2026-06-16

## Goal

- Simulate integration of `feature/task-crud` and `feature/blocker-view` into one Study Sprint Board MVP flow.

## Scope

- Merge shared document patch proposals.
- Identify conflicts, duplicates, and document drift.
- Produce an integration checklist.
- Verify that the integrated MVP has one task model and one blocked-task view.

## Out Of Scope

- Real code implementation.
- Remote branch merge.
- Deployment.

## Source Branch Inputs

- `docs/workflows/feature/task-crud/plan.md`
- `docs/workflows/feature/task-crud/report.md`
- `docs/workflows/feature/blocker-view/plan.md`
- `docs/workflows/feature/blocker-view/report.md`

## Integration Checklist

- [x] Confirm both branches use one `Task` entity.
- [x] Confirm task CRUD includes `blocked` as a valid status.
- [x] Confirm blocker view is a read/filter projection, not a separate entity.
- [x] Merge `docs/02` proposals into one architecture flow.
- [x] Merge `docs/03` proposals into one interface contract.
- [x] Merge `docs/05` scenarios into one MVP acceptance path.
- [x] Merge `docs/06` regression guards without duplication.
- [x] Merge `docs/07` manual verification into one golden path.
- [x] Record unresolved questions: `blockerReason`, owner model, Friday configurability.

## Conflict / Drift Review

| Area | Conflict | Resolution |
| --- | --- | --- |
| Data model | Task CRUD owns `Task.status`; blocker view needs `blocked` | Define `blocked` in base `Task.status` contract |
| Entity boundary | Blocker view could introduce separate `Blocker` entity | Keep blocker view as read-only task projection for MVP |
| Acceptance | CRUD and blocker view have separate success paths | Merge into one path: create task -> mark blocked -> see in blocker view |
| Regression | Status update and blocker filtering both protect task data | Keep two guards with different protected behavior |
| Manual verification | Separate manual checks duplicate setup | Make one integrated golden path and keep feature-specific checks optional |

## Proposed Integrated Source Of Truth Patch

Architecture:

- `TaskStore` persists tasks locally.
- Task CRUD writes to `TaskStore`.
- Blocker view reads from `TaskStore` and filters `status = blocked`.

Interface:

- `Task`: `id`, `title`, `owner`, `status`, optional `blockerReason`, `createdAt`, `updatedAt`.
- `status`: `todo`, `in_progress`, `blocked`, `done`.
- Operations: `createTask`, `listTasks`, `updateTaskStatus`, `listBlockedTasks`.

Acceptance:

- Create a task.
- Assign owner.
- Change status to `blocked`.
- Confirm blocker view shows the task.
- Confirm task remains in full list.

Regression:

- Updating status must not delete title, owner, or blocker reason.
- Blocker view must not mutate tasks.

Manual verification:

- Add "Read paper".
- Assign owner.
- Mark as blocked.
- Open blocker view.
- Confirm blocked task appears and full task list remains intact.

## Implementation Prompt

```text
@AGENTS.md @docs/workflows/feature/task-crud/report.md @docs/workflows/feature/blocker-view/report.md

Simulate integration only.
Merge branch workspace proposals into one coherent Source of Truth patch.
Do not implement code.
```

## Verification Prompt

```text
@AGENTS.md @docs/workflows/feature/integrate-task-board/plan.md

Verify that integration resolves shared model conflicts and gives the next worker enough context.
```

## Completion Criteria

- [x] Source branch inputs reviewed
- [x] Integration checklist completed
- [x] Conflict/drift review completed
- [x] Integrated Source of Truth patch proposed
- [x] Report updated
