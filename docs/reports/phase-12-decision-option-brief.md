# Phase 12 - Decision Option Brief

## Short Report

- Type: docs / workflow hardening
- Date: 2026-06-17
- Changed: added `docs/14-decision-option-brief.md`, workspace `decisions.md`, next-action states, validation rules, and status summaries for high-impact decisions.
- Verified: status summary, default validation, strict validation, integration validation, shell syntax checks, and workflow edge-case tests passed.
- Remaining: Decision Option Brief quality is still mostly human/AI judgment, not semantic automation.
- Next context: use Decision Option Brief only for high-impact choices, not small reversible decisions.
- Risk: overusing the brief can make the harness feel heavy; keep it gated to meaningful decisions.

## Why Added

- Important choices needed richer explanation than a flat list of options.
- Humans should see candidate impact, excluded options, recommendation, and rollback/revisit conditions before confirming.
- Decisions need a durable workspace file separate from running notes.

## Supported Decision Types

- Data / permission
- UI / UX
- Architecture
- Git / collaboration
- Quality / TDD / CI
- Scope / MVP

## Workspace Role

`decisions.md` records:

- Decision Option Briefs
- Accepted Decisions
- Deferred Decisions
- Revisit / Rollback Conditions

## When Not To Use

- button wording
- internal variable names
- small documentation phrasing
- test names
- easy-to-revert UI placement

## Validation Commands

```bash
bash -n scripts/start-workflow.sh
bash -n scripts/validate-harness.sh
bash -n scripts/status-workflow.sh
bash -n tests/workflow-edge-cases.sh
scripts/status-workflow.sh docs/workflows/feature/task-crud
scripts/validate-harness.sh
scripts/validate-harness.sh --strict
scripts/validate-harness.sh --integration
tests/workflow-edge-cases.sh
```

## Validation Result

- `scripts/status-workflow.sh docs/workflows/feature/task-crud` printed decisions status.
- `scripts/validate-harness.sh` passed.
- `scripts/validate-harness.sh --strict` passed.
- `scripts/validate-harness.sh --integration` passed.
- `tests/workflow-edge-cases.sh` passed.
