# 05. Acceptance Scenarios & Checklist

## 1) Representative Success Scenario

1. A developer starts from `README.md`.
2. The developer reads `00-how-to-use-this-template.md` and copies the harness into a target project.
3. The developer replaces target-project placeholders and updates `docs/00-layer-map.md`.
4. An AI agent can then follow `AGENTS.md` and `docs/08-development-workflow.md` to complete one Phase with a report.

## 2) Golden Path

- [ ] Template files exist in the expected structure
- [ ] Core guide explains how to apply the harness to a target project
- [ ] Layer map points to the repository Source of Truth files
- [ ] Agent rules explain context loading, change propagation, and reports
- [ ] Workflow defines Phase start and completion gates
- [ ] Result is visible in `README.md`, `AGENTS.md`, and `docs/08-development-workflow.md`
- [ ] Error/fallback states are understandable

## 3) Feature Completion Criteria

### Template Adoption

- [ ] Happy path works
- [ ] Required document structure is produced
- [ ] User-visible guidance exists
- [ ] Failure state is handled
- [ ] Related interfaces match `docs/03`
- [ ] Related regression guard exists in `docs/06`
- [ ] Manual verification exists in `docs/07` or `docs/manual-verification/`

### [FEATURE_OR_DOMAIN]

- [ ] Happy path works
- [ ] Required state is persisted or output is produced
- [ ] User-visible feedback exists
- [ ] Failure state is handled
- [ ] Related interfaces match `docs/03`
- [ ] Related regression guard exists in `docs/06`
- [ ] Manual verification exists in `docs/07` or `docs/manual-verification/`

## 4) Document / Contract Consistency

- [ ] `docs/02` architecture matches implementation
- [ ] `docs/03` interface contracts match implementation
- [ ] `docs/06` regression/failure criteria match behavior
- [ ] `docs/07` manual verification matches current workflows
- [ ] `docs/08` Phase status matches actual progress

## 5) Deployment / Operations Criteria

- [ ] Health/smoke checks pass
- [ ] Required env values are documented
- [ ] Migration/data changes verified
- [ ] Logs expose actionable failures
- [ ] Rollback or recovery note exists

## 6) Release / Submission Gate

- [ ] Golden Path completed at least once
- [ ] Tests/build/smoke/manual verification recorded
- [ ] No secrets committed
- [ ] Known limitations documented
- [ ] Latest report links evidence to acceptance criteria
