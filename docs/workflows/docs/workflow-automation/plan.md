# Workflow automation Plan

## Branch

- Branch: `docs/workflow-automation`
- Workspace: `docs/workflows/docs/workflow-automation`
- Created: 2026-06-16

## Goal

- Add branch-name-based workflow automation so each branch has its own generated collaboration folder.

## Scope

- Define branch naming rules.
- Add `docs/workflows/` branch workspace model.
- Add a script that creates or switches branches and generates `plan.md`, `notes.md`, and `report.md`.
- Add a lightweight collaboration agreement document.
- Document dry-run and no-checkout modes.

## Out Of Scope

- Enforcing Git hooks automatically.
- Creating remote branches or pull requests.
- Replacing the global Source of Truth docs with branch-local docs.

## Source Of Truth Context

- `AGENTS.md`
- `docs/00-layer-map.md`
- `docs/08-development-workflow.md`

## Implementation Prompt

```text
@AGENTS.md @docs/00-layer-map.md @docs/08-development-workflow.md

Implement only the work described in this branch workspace.
Do not expand scope without updating this plan.
```

## Verification Prompt

```text
@AGENTS.md @docs/05-acceptance-scenarios-and-checklist.md @docs/06-regression-and-failure-scenarios.md @docs/07-manual-verification-playbook.md

Verify the branch work and record evidence in this workspace report.
```

## Completion Criteria

- [x] Scope completed
- [x] Acceptance checked
- [x] Regression/failure scenario checked
- [x] Manual verification recorded
- [x] Report updated
