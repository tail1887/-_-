# Collaboration Flow Simulation

This dry run checks whether 협업 하네스 can guide a realistic human-and-AI project flow without building the target project.

## Scenario

Target project: `Study Sprint Board`

One-line description: a small web app where a study team creates weekly tasks, assigns owners, tracks status, and reviews blockers.

Initial human request:

```text
이번 주 스터디 과제를 관리하는 보드를 만들고 싶어.
팀원이 과제를 추가하고, 담당자를 지정하고, 상태를 바꾸고, 금요일에 막힌 일을 볼 수 있으면 좋겠어.
우선 로컬에서 돌아가는 MVP만 만들자.
```

## Step 1. Intake And Earliest Impacted Layer

Earliest impacted layer: Requirements

Reason: the human gave product requirements, not an implementation bug or narrow UI change.

Required context:

- `AGENTS.md`
- `docs/00-layer-map.md`
- Requirements docs in the target project
- `docs/01-product-planning.md`

Expected update in target project:

- Product one-liner
- MVP problem
- Target users
- MVP scope
- Non-MVP scope
- Success criteria

Smoothness result: works. The layer map gives a clear starting point.

Friction: the template does not yet include a filled example of a good `docs/01-product-planning.md`, so a new team may still need judgment about detail level.

## Step 2. Product To Architecture Propagation

Change path:

Requirements -> Product -> Architecture -> Interface -> Development Operations -> Acceptance -> Regression -> Manual Verification -> Workflow

Architecture decisions for the dry run:

- Runtime: local web app
- UI: simple task board
- Data: local JSON or SQLite for MVP
- External services: none
- Infra: local only

Expected update in target project:

- `docs/02-architecture.md` records client, server, data store, and main data flow.
- `docs/03-interface-reference.md` records task fields and basic create/update/list operations.

Smoothness result: mostly works. The propagation path prevents jumping straight into implementation.

Friction: for very small projects, updating both architecture and interface can feel heavy unless the examples show how short those docs can be.

## Step 3. Phase Definition

Earliest useful Phase:

```md
## Phase 0 - Local Task Board Skeleton

### Goal

- Create a local MVP skeleton that can list, add, and update study tasks.

### Scope

- Minimal app structure
- Task model
- Local persistence
- Add/list/update status flow
- Smoke command

### Out Of Scope

- Authentication
- Remote deployment
- Notifications
- Multi-team permissions

### Completion Criteria

- [ ] App starts locally
- [ ] A task can be added
- [ ] A task status can be changed
- [ ] Friday blocker view or filter exists
- [ ] Phase report created
```

Smoothness result: works. The Phase authoring format is clear enough to produce a bounded task.

Friction: the workflow should remind the author to include branch/work location in the Phase title or notes, because that detail is easy to skip.

## Step 4. AI Implementation Handoff

Implementation prompt assembled from the harness:

```text
@AGENTS.md @docs/01-product-planning.md @docs/02-architecture.md @docs/03-interface-reference.md @docs/05-acceptance-scenarios-and-checklist.md @docs/06-regression-and-failure-scenarios.md @docs/07-manual-verification-playbook.md @docs/08-development-workflow.md

Implement Phase 0 - Local Task Board Skeleton only.
Do not add authentication, deployment, notifications, or multi-team permissions.
After implementation, verify the smoke command, acceptance checklist, regression guard, and manual golden path.
Write a Phase report using docs/reports/_template.md.
```

Smoothness result: works. The prompt has enough boundaries to keep implementation scoped.

Friction: the template should encourage including only the relevant sections of long docs once a project grows.

## Step 5. Verification

Acceptance checks:

- App starts locally.
- Task add flow works.
- Task status update works.
- Blocker view or filter works.
- Known limitations are recorded.

Regression guard:

- Existing task data must not disappear after status changes.
- Invalid task title should be rejected or clearly handled.

Manual verification:

- Start local app.
- Add task "Read paper".
- Assign owner.
- Move status from todo to blocked.
- Confirm Friday blocker view shows the task.

Smoothness result: works. `docs/05`, `docs/06`, and `docs/07` divide the verification concerns cleanly.

Friction: the manual verification docs are currently generic; a target project should replace at least golden path and failure scenario files early.

## Step 6. Report Handoff

Expected report summary:

- What changed: local task board skeleton, task model, add/list/update flow.
- What was verified: run command, add task, update status, blocker view.
- Remaining: no authentication, no deployment, no notifications.
- Next context: read Phase 0 report before adding team permissions or deployment.

Smoothness result: works. The report template captures enough handoff context.

Friction: reports may become noisy if every small documentation-only change uses the full template. A short-report option would help.

## Overall Judgment

The 협업 하네스 flow is usable for a realistic collaboration loop:

1. Human gives a product request.
2. AI identifies the earliest impacted layer.
3. Source of Truth docs are updated before implementation.
4. One bounded Phase is defined.
5. Implementation stays scoped.
6. Acceptance, regression, and manual verification are checked.
7. A report preserves handoff context.

## Improvements Found

- Add a short filled example for product planning, architecture, and interface docs.
- Add a reminder that each Phase needs a branch/work location.
- Add a short-report option for documentation-only or tiny changes.
- Add guidance for replacing only the most relevant manual verification files early in a target project.
