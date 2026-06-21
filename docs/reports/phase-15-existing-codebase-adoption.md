# Phase 15 - Existing Codebase Adoption

## Short Report

- Type: docs
- Date: 2026-06-17
- Changed: added `docs/16-existing-codebase-adoption.md` and connected Existing Codebase Adoption to Layer Map, README, how-to-use, Development Workflow, Collaboration Agreement, Next Action Menu, Human Command Flow, Context Budget Rule, report template, validation, and edge-case tests.
- Verified: default, strict, integration, and workflow edge-case validation passed.
- Remaining: automation checks structure and references, but cannot prove a real repo baseline captured the right current behavior.
- Next context: use Existing Codebase Adoption when a repo already has code, config, tests, docs, CI, PR, or branch conventions; return future changes to normal Phase Workflow.
- Risk: existing code is baseline evidence for current behavior, not proof of desired or correct behavior.

## Context Budget Evidence

- Context Budget mode: Escalate Read
- Primary context read: `AGENTS.md`, `docs/00-layer-map.md`, `docs/08-development-workflow.md`, `docs/15-context-budget-rule.md`, `docs/reports/_template.md`, validation script, edge-case tests
- Escalated context read: README, how-to-use, collaboration agreement, next action menu, human command flow, report index
- Context omitted intentionally: full historical report contents unrelated to adoption mode

## Design Notes

- The criterion is existing codebase and operational inertia, not project completion.
- Adoption Mode is a separate entry procedure, not a replacement for normal Phase Workflow.
- Baseline + next-change adoption avoids retroactive workspace generation for every existing feature.
- Bounded Audit Read keeps adoption from turning into a full repo crawl.
- Existing CI/PR/branch policy is recorded first and not overwritten blindly.

## Not Automated

- No automatic retroactive workspace generation.
- No automatic CI/PR/branch policy rewrite.
- No automatic declaration that stale docs are Source of Truth.
- No full source crawl by default.

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
