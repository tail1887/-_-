# Blocker View Notes

## Running Notes

- Blocker view should read from the same task list used by task CRUD.
- It should filter `Task.status = blocked`.
- It may optionally show `blockerReason`, but should not require a new entity during MVP.

## Decisions

- Do not introduce `Blocker` as a separate MVP entity.
- Treat blocker view as a read/filter projection.

## Open Questions

- Should Friday be hard-coded in MVP copy or represented as a configurable review day?
- Should blocked tasks without owner still appear?

## Links / Evidence

- Related integration workspace: `docs/workflows/feature/integrate-task-board/`
