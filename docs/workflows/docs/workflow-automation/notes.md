# Workflow automation Notes

## Running Notes

- The shared `docs/08-development-workflow.md` should stay common.
- Branch-specific work belongs under `docs/workflows/<type>/<slug>/`.
- `--no-checkout` is useful when the user wants files generated without touching the current Git branch.

## Decisions

- Use `<type>/<short-kebab-name>` as the branch naming convention.
- Generate `plan.md`, `notes.md`, and `report.md` for each branch workspace.
- Add one shared collaboration agreement document instead of scattering team-level rules across every workflow.

## Open Questions

- Should a Git hook call the script automatically on branch creation, or is explicit script usage safer?

## Links / Evidence

- `scripts/start-workflow.sh`
- `docs/workflows/README.md`
- `docs/09-collaboration-agreement.md`
