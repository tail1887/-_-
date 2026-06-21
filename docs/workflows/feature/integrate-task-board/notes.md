# Integrate Task Board Notes

## Running Notes

- The harness separates branch-local work well.
- The integration branch needs a first-class checklist for shared document patch proposals.
- Without an explicit shared document patch section, branches can update `docs/02` and `docs/03` inconsistently.

## Decisions

- Keep one shared `Task` entity.
- Keep blocker view as a read-only projection.
- Treat integration branch as the place where Source of Truth patches become authoritative.
- `scripts/start-workflow.sh` now generates `shared-docs.md` by default.

## Open Questions

- Should integration branches have a specialized template?

## Links / Evidence

- `docs/workflows/feature/task-crud/`
- `docs/workflows/feature/blocker-view/`
- `docs/workflows/feature/integrate-task-board/`
