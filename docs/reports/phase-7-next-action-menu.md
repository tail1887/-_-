# Phase 7 - Next Action Menu Report

## Phase / Hotfix

- Type: Phase 7
- Branch/work location: `/Users/tail1/Documents/협업 하네스`
- Date: 2026-06-16

## Reference Docs

- `docs/08-development-workflow.md`
- `docs/09-collaboration-agreement.md`
- `docs/10-next-action-menu.md`
- `docs/workflows/README.md`
- `scripts/start-workflow.sh`
- `scripts/validate-harness.sh`
- `tests/workflow-edge-cases.sh`

## Goal

- Add a conversational next-action UI protocol so AI can guide the human through the next collaboration choice.

## Changed Files

- `docs/10-next-action-menu.md`
- `scripts/start-workflow.sh`
- `scripts/validate-harness.sh`
- `tests/workflow-edge-cases.sh`
- `docs/08-development-workflow.md`
- `docs/09-collaboration-agreement.md`
- `docs/workflows/README.md`
- `docs/workflows/**/next-actions.md`
- `docs/reports/phase-7-next-action-menu.md`

## Implementation Summary

- Added `docs/10-next-action-menu.md` as the state-based menu reference.
- Added generated `next-actions.md` to every branch workspace.
- Updated strict validation to fail when `Recommended Next Action` is empty.
- Updated edge-case tests to verify `next-actions.md` generation.
- Backfilled existing simulated workspaces with state-appropriate next action menus.

## User Experience

AI should now end major steps with a concise menu:

```text
Current state:
- Scope drafted.

Recommended next action:
- Ask for Scope Confirm.
- Reason: implementation should not start until included/excluded scope is clear.

Options:
1. Confirm scope and continue.
2. Revise scope.
3. Split work into another branch.

Waiting on you:
- Choose a number or answer naturally.
```

## Verification Commands

```bash
scripts/start-workflow.sh --no-checkout feature next-action-smoke "Next Action Smoke"
test -f docs/workflows/feature/next-action-smoke/next-actions.md
scripts/validate-harness.sh
scripts/validate-harness.sh --strict
tests/workflow-edge-cases.sh
```

## Regression Guard

- Checked feature: workspace generation and strict readiness validation.
- Protected behavior: each workspace has a next action menu and strict validation requires a recommended next action.
- Result: passed.

## Failure Scenario

- Reviewed failure: AI asks "what next?" without useful options.
- Expected behavior: AI presents current state, recommended next action, 2-4 options, and next AI action.
- Verification: `docs/10-next-action-menu.md` and generated workspace `next-actions.md`.
- Result: passed.

## Manual Verification

- Document executed: `docs/10-next-action-menu.md`
- Environment: local Markdown repository
- Result: state menus cover workspace creation, scope, contract, implementation, verification, completion, and integration.
- Failure/limitation: this is a conversational protocol, not a graphical UI.
- Evidence: generated `next-actions.md` files.

## docs/05 Acceptance Link

- Related item: collaboration workflow clarity.
- Status: passed.
- Evidence: next-action menu docs, strict validation, edge tests.

## Document Updates

- Updated: workflow guide, collaboration agreement, branch workspace guide, report index.
- Not updated and why: no target-project Source of Truth docs changed.

## Failed / Incomplete / Follow-Up TODO

- Consider adding a helper command to update `next-actions.md` based on confirmation status.
- Consider adding a future web UI that renders the same state menu.

## Context For Next Phase

- Use `docs/10-next-action-menu.md` whenever AI needs to guide the human's next choice.

## Secret / Migration / Env Check

- Secret check: no secrets added.
- Migration/data change: none.
- Env change: none.

## Final Judgment

- Done: next-action conversational UI protocol added and tested.
- Remaining risk: AI must still follow the protocol in conversation; the harness can validate files, not force tone.
