# Workflow Automation Shared Document Patch Proposals

## Proposed Source Of Truth Changes

| File | Proposed Change | Reason | Merge Risk |
| --- | --- | --- | --- |
| `docs/04-development-guide.md` | Document branch naming and workflow script usage | Automation changes development operations | Low |
| `docs/08-development-workflow.md` | Document branch workspace model and integration rule | Workflow behavior changed | Medium |
| `docs/09-collaboration-agreement.md` | Document shared-doc and integration agreements | Team collaboration model changed | Medium |
| `docs/workflows/README.md` | Document generated workspace files | Branch workspace usage changed | Low |

## Integration Notes

- `shared-docs.md` is now generated for new workspaces.
- Existing workspaces need the file added when adopting the newer template.

## Conflicts To Resolve

- Decide later whether integration branches need a dedicated `integration.md` file.
