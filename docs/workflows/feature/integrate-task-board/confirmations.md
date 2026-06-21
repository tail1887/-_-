# Integrate Task Board Human Confirmation Gates

Use this file to record when AI should stop and ask for human confirmation.

## Scope Confirm

- Status: accepted
- Ask human to confirm:
  - branch/workspace
  - included scope
  - excluded scope
  - impacted Source of Truth docs
- Human response:
- Accepted by completed harness dry run evidence.

## Contract Confirm

- Status: accepted
- Ask human to confirm:
  - data model changes
  - interface/API/CLI/UI contract changes
  - external dependencies
  - shared Source of Truth changes
- Human response:
- Accepted by completed harness dry run evidence.

## Scope Change Confirm

- Status: not needed
- Ask human when:
  - work expands beyond `plan.md`
  - a feature should move to another branch
  - implementation reveals a new product decision
- Human response:
- Accepted by completed harness dry run evidence.

## Verification Confirm

- Status: accepted
- Ask human to confirm:
  - test/build/smoke commands
  - manual verification path
  - completion criteria
- Human response:
- Accepted by completed harness dry run evidence.

## Quality Gate Confirm

- Status: accepted
- Human response: Integration dry-run checked document-level quality gates only; no real CI/CD pipeline was executed.

## Git Sync Confirm

- Status: accepted
- Human response: Integration dry-run records source branch base information in `sources.md`; no real merge/rebase/push was performed.

## Sync Conflict Confirm

- Status: accepted
- Human response: Shared Source of Truth conflict risk was handled as documentation simulation and recorded in integration `shared-docs.md`/`sources.md`.

## Completion Confirm

- Status: accepted
- Ask human to confirm:
  - changed summary
  - verification result
  - remaining risk
  - next task context
- Human response:
- Accepted by completed harness dry run evidence.

## Integration Conflict Confirm

- Status: not needed
- Ask human when:
  - this branch integrates multiple source branches
  - shared data model or interface conflicts exist
  - acceptance/regression/manual verification paths conflict
- Human response:
- Accepted by completed harness dry run evidence.
