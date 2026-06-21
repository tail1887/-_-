# How To Use 협업 하네스

이 저장소는 다른 소프트웨어 프로젝트에 복사해서 쓰는 AI 협업 운영 템플릿입니다.

## Apply To A New Project

1. 이 저장소의 문서 파일을 새 프로젝트 루트로 복사한다.
2. 대상 프로젝트에 맞게 자리표시자를 바꾼다.
3. `docs/00-layer-map.md`에서 각 레이어가 실제 파일을 가리키게 한다.
4. `docs/01-product-planning.md`에 제품 범위, 비범위, 성공 기준을 먼저 적는다.
5. `docs/02-architecture.md`와 `docs/03-interface-reference.md`에 구조와 계약을 적는다.
6. `docs/04-development-guide.md`에 실행, 테스트, 브랜치, 환경 규칙을 적는다.
7. `docs/05-acceptance-scenarios-and-checklist.md`에 수용 시나리오를 정의한다.
8. `docs/06-regression-and-failure-scenarios.md`에 깨지면 안 되는 동작과 실패 조건을 정의한다.
9. `docs/07-manual-verification-playbook.md`와 `docs/manual-verification/`에 수동 검증 절차를 연결한다.
10. `docs/08-development-workflow.md`에 Phase queue를 만든다.
11. `docs/09-collaboration-agreement.md`에 팀 협의 기준을 확인하거나 필요한 만큼 줄인다.
12. `docs/11-git-sync-policy.md`에서 main 최신화, PR 통합, 충돌 확인 관문을 프로젝트 방식에 맞춘다.
13. `docs/12-quality-gates.md`에서 TDD 적용 기준과 CI/CD 품질 게이트를 프로젝트 방식에 맞춘다.
14. `docs/13-human-command-flow.md`에서 사람이 AI에게 줄 실제 명령 흐름을 확인한다.
15. `docs/14-decision-option-brief.md`에서 고영향 선택 후보 비교 형식을 확인한다.
16. `docs/15-context-budget-rule.md`에서 Lite/Escalate/Audit Read 기준을 확인한다.
17. 이미 코드베이스가 있는 repo라면 `docs/16-existing-codebase-adoption.md`로 baseline + next-change 적용을 먼저 한다.
18. 각 브랜치 작업은 `scripts/start-workflow.sh`로 시작해 브랜치와 `docs/workflows/` 작업 폴더를 함께 만든다.
19. 각 Phase 또는 Hotfix가 끝날 때 `docs/reports/_template.md`를 복사해 보고서를 남긴다.
20. 보고서가 많아지면 `docs/reports/README.md`의 Latest Report Index를 관리한다.

## Apply To An Existing Codebase

Use this mode when the repo already has code, config, tests, docs, CI, PR, or branch conventions.
The criterion is existing codebase and operational inertia, not project completion.

Do not run a full migration first.
Do not create retroactive workspaces for every existing feature.

Instead:

1. Follow `docs/16-existing-codebase-adoption.md`.
2. Use Bounded Audit Read from `docs/15-context-budget-rule.md`.
3. Create a baseline report for the current repo state.
4. Record existing run/build/test commands and CI/PR/branch policy.
5. Mark stale or missing docs as gaps.
6. Start the next real change with a normal branch workspace.

## Branch Workspace Automation

```bash
scripts/start-workflow.sh feature task-board "Task board MVP"
```

Creates:

- Git branch: `feature/task-board`
- Workspace: `docs/workflows/feature/task-board/`
- `plan.md`
- `notes.md`
- `report.md`
- `quality.md`
- `decisions.md`
- `shared-docs.md`
- `sources.md`
- `confirmations.md`
- `next-actions.md`
- `sync.md`

Preview without writing:

```bash
scripts/start-workflow.sh --dry-run feature task-board "Task board MVP"
```

## Placeholder Replacement

- `[TARGET_PROJECT_NAME]`
- `[ONE_LINE_PROJECT_DESCRIPTION]`
- `[REQUIREMENTS_DOC]`
- `[PRIMARY_STACK]`
- `[RUNTIME_OR_PLATFORM]`
- `[DATA_LAYER]`
- `[EXTERNAL_SERVICES]`
- `[INFRA_APPROACH]`
- `[RUN_COMMANDS]`
- `[FEATURE_OR_DOMAIN]`
- `[INTERFACE_NAME]`
- `[PHASE_NAME]`

## Minimal Version

작은 프로젝트라면 아래 파일만 유지해도 됩니다.

- `AGENTS.md`
- `docs/00-layer-map.md`
- `docs/04-development-guide.md`
- `docs/05-acceptance-scenarios-and-checklist.md`
- `docs/06-regression-and-failure-scenarios.md`
- `docs/07-manual-verification-playbook.md`
- `docs/08-development-workflow.md`
- `docs/09-collaboration-agreement.md`
- `docs/10-next-action-menu.md`
- `docs/11-git-sync-policy.md`
- `docs/12-quality-gates.md`
- `docs/13-human-command-flow.md`
- `docs/14-decision-option-brief.md`
- `docs/15-context-budget-rule.md`
- `docs/16-existing-codebase-adoption.md`
- `docs/workflows/README.md`
- `docs/reports/_template.md`

## Full Version

요구사항, 아키텍처, 인터페이스 계약, 수동 검증, 실행 보고서, AI 문맥 라우팅이 모두 필요한 프로젝트에서는 전체 폴더를 사용합니다.

## License Notice

이 저장소는 All Rights Reserved 라이선스를 사용합니다.

개인적인 검토 또는 학습 목적의 열람은 허용되지만, 저작권자의 명시적 서면 허가 없이 복사, 수정, 재배포, 재게시, 상업적 사용, 파생 템플릿 또는 파생 워크플로우 시스템 제작에 사용할 수 없습니다.

자세한 내용은 `LICENSE`를 확인하세요.

## When It Feels Too Heavy

- Source of Truth 구조는 유지하되 각 문서의 활성 섹션만 채운다.
- 문서명이 달라도 `docs/00-layer-map.md`를 작은 라우팅 지도처럼 유지한다.
- 보고서는 짧게 쓴다: changed, verified, remaining, next context.
- Latest Report Index는 영역별 최신 보고서만 둔다.
- 전문 도구나 플러그인은 작업에 분명히 도움이 될 때만 사용한다.
- 새 문서는 기존 문서로 표현할 수 없을 때만 추가한다.
- 기본은 Lite Read로 시작하고, 위험 신호가 있으면 Escalate Read로 확장한다.
