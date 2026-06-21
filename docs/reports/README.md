# Phase Reports

`docs/reports/` is the evidence layer for Phase execution. It is not Source of Truth, but it proves whether Source of Truth was followed.

## Role

- Record what changed and what was verified.
- Link evidence to `docs/05` acceptance criteria.
- Record `docs/06` Regression Guard / Failure Scenario checks.
- Record `docs/07` Manual Verification results.
- Show whether `docs/08` completion gates were satisfied.
- Help AI summarize current status, remaining risk, and next worker context without requiring the human to read every report directly.

## Usage

- After every Phase
- After every Hotfix
- Before the next Phase as context
- Before release/demo as evidence review

## Rules

1. Create a report for each Phase/Hotfix.
2. New reports follow [`_template.md`](_template.md).
3. Keep reports concise.
4. Always preserve changed, verified, remaining, and next context.
5. Do not edit old reports to fix Source of Truth drift.

## Optional: Latest Report Index

When reports grow, maintain a small index of the latest report per area. This index is not Source of Truth. It helps agents find the latest relevant evidence without reading all reports.

| Area | Latest Report | Why Read This |
| --- | --- | --- |
| Template Bootstrap | `phase-0-template-bootstrap.md` | Shows how the original template was adapted into 협업 하네스. |
| Collaboration Flow | `phase-1-collaboration-flow-dry-run.md` | Shows whether the harness supports a realistic request-to-report workflow. |
| Workflow Automation | `phase-2-workflow-automation.md` | Shows the branch workspace automation model and validation. |
| Orchestration Dry Run | `phase-3-orchestration-dry-run.md` | Shows feature separation, shared doc patch tracking, and integration handoff. |
| Edge Case Hardening | `phase-4-edge-case-hardening.md` | Shows tested workflow edge cases and automation hardening. |
| Human Confirmation Gates | `phase-5-human-confirmation-gates.md` | Shows where AI must stop and ask the human for confirmation. |
| Strict Edge Validation | `phase-6-strict-edge-validation.md` | Shows strict checks for confirmations, shared docs, and integration sources. |
| Next Action Menu | `phase-7-next-action-menu.md` | Shows conversational menus for guiding the human's next choice. |
| Git Sync Risk Hardening | `phase-8-git-sync-risk-hardening.md` | Shows Git sync policy, sync.md workspace state, and stricter validation for branch freshness. |
| TDD CI/CD Quality Gates | `phase-9-tdd-ci-quality-gates.md` | Shows TDD/CI/CD quality gate policy and workspace quality.md tracking. |
| Usability Integration Hardening | `phase-10-usability-integration-hardening.md` | Shows status summaries, integration validation, PR handoff, and optional CI examples. |
| License | `phase-17-mit-license-transition.md` | Shows the current MIT License transition for the harness. |
| Decision Option Brief | `phase-12-decision-option-brief.md` | Shows high-impact choice comparison and workspace decisions.md tracking. |
| Semantic Validation Hardening | `phase-13-semantic-validation-hardening.md` | Shows state-aware strict/integration validation and richer status summaries. |
| Context Budget Rule | `phase-14-context-budget-rule.md` | Shows Lite/Escalate/Audit Read modes for token-efficient context loading. |
| Existing Codebase Adoption | `phase-15-existing-codebase-adoption.md` | Shows baseline + next-change adoption for repos with existing codebase or operational inertia. |
| Existing Codebase Gap Assessment | `phase-16-existing-codebase-gap-assessment.md` | Shows infrastructure gap assessment and next Phase promotion rules for existing codebase adoption. |

Update a row only when a new Phase/Hotfix report represents the latest state for that area. Old reports remain historical evidence and are not read as default context. If the index conflicts with Source of Truth, update Source of Truth through the Change Propagation Rule instead of fixing consistency through the index alone.

## Next Phase Context Loading

Read only:

- Latest Report Index in this README
- Previous Phase report
- Latest report for the related area
- 1 additional related report when needed

Read many reports only for audit, retrospective, or whole-project analysis.

## Source of Truth Conflicts

- Source of Truth wins.
- If a report reflects a more accurate implementation state, update Source of Truth through the Change Propagation Rule.
- Do not make consistency by editing reports alone.
