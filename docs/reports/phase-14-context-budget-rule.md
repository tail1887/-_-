# Phase 14 - Context Budget Rule

## Short Report

- Type: docs
- Date: 2026-06-17
- Changed: added `docs/15-context-budget-rule.md`, connected Lite/Escalate/Audit Read to workflow, collaboration, command flow, next-action menus, workspace docs, report template, start workflow generation, validation, and edge-case tests.
- Verified: default, strict, integration, and workflow edge-case validation passed.
- Remaining: semantic judgment is still required to decide when a risk signal truly requires Escalate Read.
- Next context: use Lite Read by default, then expand only when Source of Truth, sync, quality, integration, security, data, or decision risk appears.
- Risk: if AI treats Context Budget as "read less no matter what," required Source of Truth can be missed.

## Context Budget Evidence

- Context Budget mode: Escalate Read
- Primary context read: `AGENTS.md`, `docs/00-layer-map.md`, `docs/08-development-workflow.md`, `docs/10-next-action-menu.md`, `docs/13-human-command-flow.md`, `docs/workflows/README.md`, scripts, tests, report template
- Escalated context read: `docs/09-collaboration-agreement.md`, `docs/04-development-guide.md`, README usage docs, report index, existing workspace reports
- Context omitted intentionally: full historical report contents not directly related to context loading

## Risk Addressed

- Reduced token waste from reading every Source of Truth document for every task.
- Reduced report scanning by reinforcing Latest Report Index and selected-report reading.
- Reduced integration context bloat by starting from source workspace summaries and escalating only on conflict.
- Preserved correctness by making high-risk changes override token savings.

## Rule Summary

- Lite Read: default start mode using `AGENTS.md`, Layer Map, workspace status output, and 1-3 directly relevant Source of Truth files.
- Escalate Read: used for API, data, permission, acceptance, regression, verification, integration, sync, quality, decision, or evidence conflict risk.
- Audit Read: used for whole-project structure checks, risk analysis, retrospectives, migrations, and harness evaluation.

## Remaining Risk

- Automation can verify that the fields and rule references exist, but not whether the selected context was truly sufficient.
- `scripts/status-workflow.sh` summarizes workspace state but cannot replace Source of Truth review for risky changes.
- Archived reports may not contain rich Context Budget evidence unless backfilled manually.

## Validation Commands

```bash
scripts/validate-harness.sh
scripts/validate-harness.sh --strict
scripts/validate-harness.sh --integration
tests/workflow-edge-cases.sh
```

## Validation Result

- Passed: `scripts/validate-harness.sh`
- Passed: `scripts/validate-harness.sh --strict`
- Passed: `scripts/validate-harness.sh --integration`
- Passed: `tests/workflow-edge-cases.sh`
