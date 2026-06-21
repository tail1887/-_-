# Pull Request Checklist

## Branch Workspace

- Workspace path:
- Branch:
- Workspace state:
- Related Source of Truth docs:

## Shared Docs

- [ ] Shared docs changed?
- [ ] `shared-docs.md` updated or not applicable
- [ ] `decisions.md` records high-impact accepted/deferred decisions or not applicable
- Notes:

## Git Sync

- [ ] `sync.md` Start Sync recorded
- [ ] `sync.md` Pre-Merge Sync result or deferral reason recorded
- Notes:

## Quality Gates

- Quality gate status:
- [ ] `quality.md` TDD status recorded
- [ ] CI/check commands run or skip reason recorded
- [ ] `scripts/validate-harness.sh` passed
- [ ] `scripts/validate-harness.sh --strict` passed
- [ ] If integration branch: `scripts/validate-harness.sh --integration` passed

## Human Confirmations

- Decision status:
- PR checklist readiness from `scripts/status-workflow.sh`:
- [ ] Required confirmation gates resolved
- [ ] Remaining risks recorded

## Summary

- Changed:
- Verified:
- Remaining risks:
