# Workflow automation Human Confirmation Gates

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
- Human response: Documentation-only harness work records TDD as not applicable and uses harness validation/edge-case scripts as quality gates.

## Git Sync Confirm

- Status: accepted
- Human response: Documentation-only harness hardening used `--no-checkout`; `sync.md` records that no pull/merge/rebase was run automatically.

## Sync Conflict Confirm

- Status: not needed
- Human response: No upstream/main conflict was simulated for this completed workspace.

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
