# Blocker View Shared Document Patch Proposals

## Proposed Source Of Truth Changes

| File | Proposed Change | Reason | Merge Risk |
| --- | --- | --- | --- |
| `docs/02-architecture.md` | Add blocker view read path from `TaskStore` | View needs existing task data | Medium |
| `docs/03-interface-reference.md` | Define `listBlockedTasks` or UI filter contract | View needs stable blocked-task contract | High |
| `docs/05-acceptance-scenarios-and-checklist.md` | Add blocked task appears in blocker view scenario | Verifies user-visible view | Low |
| `docs/06-regression-and-failure-scenarios.md` | Blocker view must not mutate task data | Protects read-only behavior | Medium |
| `docs/07-manual-verification-playbook.md` | Add blocker view manual path | Proves blocked task review flow | Low |

## Integration Notes

- Blocker view should use `Task.status = blocked`.
- Do not introduce a separate `Blocker` entity for MVP.

## Conflicts To Resolve

- Confirm task CRUD supports `blocked`.
- Decide whether blocked tasks without owner appear.
