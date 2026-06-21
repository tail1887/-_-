# AGENTS.md

AI agents working in this repository must follow these minimum rules.
Implementation order, prompts, and completion criteria live in [`docs/08-development-workflow.md`](docs/08-development-workflow.md).

## Project

Target repository: `JUNGLE-TEAM1/NMM_team1`.

**협업 하네스** — AI와 사람이 Phase 단위로 협업하도록 돕는 재사용 가능한 개발 운영 템플릿.

## License

This repository is licensed under the MIT License. See `LICENSE`.

| Priority | Scope | Infrastructure |
| --- | --- | --- |
| P0 | 문서 템플릿을 협업 하네스 용도로 정리 | 로컬 Git 저장소 |
| P1 | 템플릿 품질, 적용 절차, 검증 흐름 보강 | Markdown 문서 |
| P2 | 예시 프로젝트, 자동화, 배포 패키징 확장 | 선택 사항 |

## Source of Truth

0. Layer Map: `docs/00-layer-map.md`
1. Requirements: `README.md`, `00-how-to-use-this-template.md`
2. Product: `docs/01-product-planning.md`
3. Architecture: `docs/02-architecture.md`
4. Interface: `docs/03-interface-reference.md`
5. Development Operations: `docs/04-development-guide.md`
6. Acceptance: `docs/05-acceptance-scenarios-and-checklist.md`
7. Regression: `docs/06-regression-and-failure-scenarios.md`
8. Manual Verification: `docs/07-manual-verification-playbook.md`
9. Workflow: `docs/08-development-workflow.md`
10. Collaboration Agreement: `docs/09-collaboration-agreement.md`
11. Next Action Menu: `docs/10-next-action-menu.md`
12. Git Sync Policy: `docs/11-git-sync-policy.md`
13. Quality Gates: `docs/12-quality-gates.md`
14. Human Command Flow: `docs/13-human-command-flow.md`
15. Decision Option Brief: `docs/14-decision-option-brief.md`
16. Context Budget Rule: `docs/15-context-budget-rule.md`
17. Existing Codebase Adoption: `docs/16-existing-codebase-adoption.md`
18. Branch Workspaces: `docs/workflows/`
19. External Summary: `README.md`

## Tech Stack

- Primary stack: Markdown documentation
- Runtime/platform: local filesystem and Git
- Data layer: none
- External services: none by default
- Infra: none by default

## Work Rules

1. **One task = one Phase.** Do not implement multiple phases in one request.
2. **Follow Phase order.** Use `docs/05` and `docs/08` to find the earliest incomplete Phase.
3. Hotfixes must be marked as `Hotfix`, documented in the current Phase or a Hotfix item, and followed by a return to the original Phase order.
4. Each Phase uses the branch or work location defined in `docs/04` and `docs/08`.
5. If branch creation/switching is unavailable, continue the work and report why.
6. Each implementation branch must have a matching folder under `docs/workflows/`.
7. Any implementation-affecting change must be reflected in the relevant Phase before implementation.
8. Interface or schema changes must update `docs/02` and/or `docs/03`.
9. Keep independent domains/features separated unless the Phase explicitly combines them.
10. Do not perform post-MVP deployment, large rewrites, or unrelated refactors before the defined MVP/core path is stable.
11. Keep README as a concise external summary. Put detail in `docs/`.
12. Before completion, check relevant `docs/06` regression/failure criteria and `docs/07` manual verification.
13. After completion, create a report using `docs/reports/_template.md`.
14. Before the next Phase, check `docs/reports/README.md` Latest Report Index when present, then read the previous Phase report and latest related area report.
15. `docs/reports/` is an evidence layer, not Source of Truth. If it conflicts with Source of Truth, update Source of Truth through the Change Propagation Rule.
16. Follow `docs/11-git-sync-policy.md` before Phase start, during upstream changes, and before merge/PR.
17. Do not run pull, merge, rebase, push, PR creation, or PR merge without human confirmation when the command changes branch state or remote state.
18. Record branch sync status in the workspace `sync.md`.
19. Follow `docs/12-quality-gates.md` for TDD, branch checks, CI, and CD/deploy gates.
20. Record TDD and CI/CD evidence in workspace `quality.md`.
21. Use `scripts/status-workflow.sh` to summarize workspace state before PR/integration handoff when useful.
22. Use `docs/14-decision-option-brief.md` for high-impact choices and record outcomes in workspace `decisions.md`.
23. Follow `docs/15-context-budget-rule.md`: start with Lite Read, escalate when risk signals appear, and use Audit Read for whole-project reviews.
24. Do not omit required Source of Truth context just to save tokens.

## Korean Collaboration Output Rule

사람과 AI가 함께 읽는 협업 산출물은 한국어로 작성한다.

적용 대상:

- branch workspace 문서: `plan.md`, `notes.md`, `quality.md`, `sync.md`, `confirmations.md`, `decisions.md`, `shared-docs.md`, `sources.md`, `next-actions.md`, `report.md`
- `docs/reports/`의 Phase / Hotfix report
- confirmation summary
- Next Action Menu
- target project에 새로 작성되는 acceptance, regression, manual verification 항목

단, 하네스 내부 reference 문서 전체를 이 규칙 때문에 번역하지 않는다.
기존 report나 예시 workspace 같은 historical evidence도 명시 요청이 없으면 번역하지 않는다.

파일 경로, 명령어, 브랜치명, commit hash, API/schema 이름, 환경 변수, 오류 메시지, 테스트 이름, code identifier, script가 파싱하는 상태 label은 번역하지 않는다.

설명, 요약, 결정, 검증 결과, 남은 위험, 다음 행동은 한국어로 쓴다.

## Change Propagation Rule

Documents are organized as reusable layers. When a change occurs, identify the earliest impacted layer in `docs/00-layer-map.md`, then review/update only the later mapped files that are actually affected.

- Requirements change: Requirements -> Product -> Architecture -> Interface -> Development Operations -> Acceptance -> Regression -> Manual Verification -> Workflow
- Product scope or user-flow change: Product -> Architecture -> Interface -> Acceptance -> Regression -> Manual Verification -> Workflow
- Architecture change: Architecture -> Interface -> Acceptance -> Regression -> Manual Verification -> Workflow
- Interface or schema change: Interface -> Acceptance -> Regression -> Manual Verification -> Workflow
- Development operations change: Development Operations -> Manual Verification -> Workflow
- Git sync policy change: Development Operations -> Workflow -> Collaboration Agreement -> Next Action Menu
- Quality gate change: Development Operations -> Acceptance -> Regression -> Manual Verification -> Workflow -> Collaboration Agreement -> Next Action Menu
- Human command flow change: Workflow -> Collaboration Agreement -> Next Action Menu
- Decision option brief change: Workflow -> Collaboration Agreement -> Next Action Menu
- Acceptance scenario change: Acceptance -> Regression -> Manual Verification -> Workflow
- Regression/failure criteria change: Regression -> Manual Verification -> Workflow
- Manual verification change: Manual Verification -> Workflow
- Implementation bug/Hotfix: update the current Workflow Phase first; update Interface, Acceptance, Regression, or Manual Verification if impacted.
- Evidence conflict: Source of Truth layers win; update the earliest impacted Source of Truth layer instead of patching `docs/reports/` alone.

## Context Loading Rule

Do not read every document for every task. Always read `AGENTS.md` first, then use `docs/00-layer-map.md` to load only the layers and sections needed for the change start point.

- Read only the current Phase section of `docs/08-development-workflow.md`.
- Read only the Latest Report Index, previous Phase report, latest related area report, and 1 additional related report when needed.
- Latest Report Index is an evidence lookup index, not Source of Truth. If it conflicts with Source of Truth, update Source of Truth through the Change Propagation Rule.
- Read all reports only for audit, retrospective, or whole-project analysis.
- For document consistency checks, use `rg` first and then read only relevant sections.
- Apply `docs/15-context-budget-rule.md`: default to Lite Read, use Escalate Read for contract/data/security/sync/quality/integration risk, and use Audit Read only for whole-project checks or explicit audits.
- When a workspace exists, use `scripts/status-workflow.sh <workspace>` as a summary entry point before opening detailed workspace files.
- Record Context Budget mode and the main documents read in the Phase report.

Default routing:

- Requirements change: Requirements, Product, and impacted downstream layers
- Architecture change: Architecture, maybe Interface, and impacted Acceptance/Regression/Verification/Workflow sections
- Interface change: Interface and impacted Acceptance/Regression/Verification/Workflow sections
- UI/UX or user-flow change: Acceptance, Manual Verification, current Workflow Phase, and 1-2 relevant reports
- Core feature/integration change: Architecture, Interface, Acceptance, Regression, Manual Verification, current Workflow Phase, and 1-2 relevant reports
- Hotfix: current Workflow Phase, related Regression scenario, related Manual Verification playbook, and previous/relevant report
- Whole-project audit/risk review: Audit Read using Layer Map, relevant Source of Truth layers, latest report index, scripts, tests, and selected reports

## Skill Discovery Rule

Before execution, classify the task type and lightly check whether a relevant Codex skill/plugin/tool or equivalent agent capability is available.

- Prefer checking specialized capabilities for browser/local web verification, document authoring/editing, presentations/slides, spreadsheets/CSV analysis, image generation/editing, OpenAI API/model/SDK work, automation/reminders/repeated tasks, and other tasks with an obvious specialized tool.
- If a relevant skill/plugin/tool exists, follow its workflow.
- If no relevant capability exists, or the task is simple, continue with the default Phase Workflow.
- Do not perform broad skill search for every trivial edit.
- If skill/plugin/tool usage materially affects the result, record it in the Phase report.

## Lightweight Execution Rule

Documents are tools for execution. Do not expand the work just to satisfy documentation.

- Add a new document only when existing documents cannot express the need.
- Limit document edits to the minimum scope directly related to the work.
- Maintain consistency, but do not create extra document work that expands implementation scope.
- Small changes should usually update only the relevant Phase/Hotfix item and report.
- Phase reports are execution evidence, not polished essays.
- Every report must clearly state what changed, what was verified, what remains, and what the next task must know.

## Definition of Done

- Code or artifact implemented
- Tests, build, smoke test, or manual verification completed
- Related `docs/05` acceptance criteria checked
- Related `docs/06` Regression Guard / Failure Scenario reviewed
- Related `docs/07` Manual Verification result recorded
- Phase/Hotfix report written using `docs/reports/_template.md`
- No document drift
- Data changes/migrations verified when applicable
- No secrets committed
- Deployment/CI work includes smoke, image/tag, and rollback notes when applicable

## Avoid

- Inventing requirements not present in docs
- Marking incomplete core requirements as done
- Committing API keys, tokens, private keys, or real credentials
- Creating the entire project in one request unless explicitly doing a throwaway spike

## Commands

```bash
rg -n "\\[[A-Z0-9_]+\\]" .
scripts/start-workflow.sh docs workflow-automation "Workflow automation"
git status --short
```
