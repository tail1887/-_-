# Phase 3 - Orchestration Dry Run Report

## Phase / Hotfix

- Type: Phase 3
- Branch/work location: `/Users/tail1/Documents/협업 하네스`
- Date: 2026-06-16

## Reference Docs

- `AGENTS.md`
- `docs/00-layer-map.md`
- `docs/04-development-guide.md`
- `docs/08-development-workflow.md`
- `docs/09-collaboration-agreement.md`
- `docs/workflows/README.md`
- `docs/reports/_template.md`

## Goal

- Verify whether 협업 하네스 supports feature separation and later integration through a simulated orchestration flow.

## Scenario

- Project: Study Sprint Board
- Feature branch 1: `feature/task-crud`
- Feature branch 2: `feature/blocker-view`
- Integration branch: `feature/integrate-task-board`

## Changed Files

- `docs/workflows/feature/task-crud/`
- `docs/workflows/feature/blocker-view/`
- `docs/workflows/feature/integrate-task-board/`
- `docs/workflows/README.md`
- `docs/08-development-workflow.md`
- `docs/09-collaboration-agreement.md`
- `scripts/start-workflow.sh`
- `docs/reports/phase-3-orchestration-dry-run.md`

## Implementation Summary

- Created three branch workspaces using `scripts/start-workflow.sh --no-checkout`.
- Filled each workspace with simulated `plan.md`, `notes.md`, and `report.md`.
- Added `shared-docs.md` as the missing standard artifact for shared Source of Truth patch proposals.
- Updated the workflow, branch workspace README, collaboration agreement, and automation script to include `shared-docs.md`.
- Simulated integration of task CRUD and blocker view into one coherent MVP flow.

## Branch Separation Result

Feature branch separation worked well:

- `feature/task-crud` owned the base `Task` entity, CRUD operations, and status update behavior.
- `feature/blocker-view` owned a read-only projection over tasks with `status = blocked`.
- Each branch could keep local scope, notes, and report evidence inside its own workspace.

Main friction:

- Both branches needed to propose changes to `docs/02`, `docs/03`, `docs/05`, `docs/06`, and `docs/07`.
- Without a standard `shared-docs.md`, integration had to infer shared doc changes from notes and reports.

## Integration Result

Integration worked after adding explicit shared document patch tracking:

- One `Task` entity remained authoritative.
- `blocked` became part of the shared `Task.status` contract.
- Blocker view stayed a read-only projection instead of creating a separate `Blocker` entity.
- Acceptance merged into one path: create task -> assign owner -> mark blocked -> see in blocker view.
- Regression guards stayed distinct: status update preserves task data; blocker view does not mutate tasks.
- Manual verification merged into one golden path plus optional feature-specific checks.

## Collision / Drift Findings

| Area | Risk | Result |
| --- | --- | --- |
| `docs/02-architecture.md` | Separate branches may describe different data flows | Resolved by integration branch using one `TaskStore` |
| `docs/03-interface-reference.md` | Branches may define incompatible task/blocker contracts | Resolved by one `Task` contract and `blocked` status |
| `docs/05-acceptance-scenarios-and-checklist.md` | Feature scenarios may not form an MVP flow | Resolved by integrated golden path |
| `docs/06-regression-and-failure-scenarios.md` | Duplicate regression guards may hide gaps | Resolved by separating write-preservation and read-only-view guards |
| `docs/07-manual-verification-playbook.md` | Manual checks may duplicate setup | Resolved by one integrated manual golden path |

## Skill / Tool Usage

- Used skill/plugin/tool: shell, `scripts/start-workflow.sh`, `apply_patch`, `rg`
- Reason: create workspaces, simulate orchestration, update template docs.
- Impact: revealed and fixed the missing shared document patch artifact.
- Not used because: no browser, app runtime, spreadsheet, presentation, or image workflow was needed.

## Verification Commands

```bash
bash -n scripts/start-workflow.sh
scripts/start-workflow.sh --dry-run feature merge-smoke "Merge Smoke"
scripts/start-workflow.sh --no-checkout test shared-docs-smoke-fixed "Shared Docs Smoke Fixed"
test -f docs/workflows/test/shared-docs-smoke-fixed/shared-docs.md
rg -n "shared-docs.md|Integration Branch Rule|Integration Agreement" docs scripts
git status --short
```

## Regression Guard

- Checked feature: branch workspace separation and integration handoff.
- Protected behavior: feature branches can remain separate while integration branch can see shared Source of Truth patch proposals.
- Result: passed after adding `shared-docs.md` and fixing shell backtick escaping in the generator.

## Failure Scenario

- Reviewed failure: integration branch cannot tell what shared docs each feature intended to change.
- Expected behavior: each source branch records proposed shared doc changes in `shared-docs.md`.
- Verification: three simulated branch workspaces contain `shared-docs.md`; smoke generation also creates the file with literal Markdown paths.
- Result: passed.

## Manual Verification

- Document executed: `docs/workflows/feature/integrate-task-board/plan.md`
- Environment: local Markdown repository
- Result: integration checklist shows what must be combined and what conflicts were resolved.
- Failure/limitation: no real Git branch merge was performed because this is a documentation-only simulation.
- Evidence: branch workspaces and this report.

## docs/05 Acceptance Link

- Related item: template adoption and Phase execution flow.
- Status: passed for orchestration dry run.
- Evidence: three branch workspaces and integration report.

## Document Updates

- Updated: workflow, collaboration agreement, branch workspace README, script, branch workspaces, final report.
- Not updated and why: target-project Source of Truth docs were not edited because Study Sprint Board is simulated only.

## Failed / Incomplete / Follow-Up TODO

- Consider whether integration branches should use a dedicated `integration.md` file in addition to `shared-docs.md`.
- Consider a `--integration` flag for `scripts/start-workflow.sh`.
- Decide whether to clean up smoke-test generated workspaces after validation or keep them as examples.

## Context For Next Phase

- Read `docs/workflows/feature/integrate-task-board/shared-docs.md` and `docs/workflows/feature/integrate-task-board/plan.md`.
- If improving automation, add optional integration-specific template generation.

## Secret / Migration / Env Check

- Secret check: no secrets added.
- Migration/data change: none.
- Env change: none.

## Final Judgment

- Done: feature separation and integration were simulated successfully.
- Remaining risk: real Git merges may expose file-level conflicts not represented in this documentation-only dry run.
