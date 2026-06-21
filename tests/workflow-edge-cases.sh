#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
tmp_root="$(mktemp -d)"
trap 'rm -rf "$tmp_root"' EXIT

fail() {
  echo "FAIL: $*" >&2
  exit 1
}

assert_file() {
  [[ -f "$1" ]] || fail "Expected file: $1"
}

assert_no_file() {
  [[ ! -e "$1" ]] || fail "Expected no file: $1"
}

assert_contains() {
  local file="$1"
  local pattern="$2"
  rg -q "$pattern" "$file" || fail "Expected ${file} to contain ${pattern}"
}

assert_fails() {
  if "$@" >/tmp/workflow-edge-case.out 2>/tmp/workflow-edge-case.err; then
    cat /tmp/workflow-edge-case.out >&2 || true
    cat /tmp/workflow-edge-case.err >&2 || true
    fail "Expected command to fail: $*"
  fi
}

replace_line() {
  local file="$1"
  local prefix="$2"
  local replacement="$3"
  perl -0pi -e "s/\\Q${prefix}\\E.*/${replacement}/" "$file"
}

make_repo() {
  local dir="$1"
  mkdir -p "$dir/scripts"
  cp "$repo_root/scripts/start-workflow.sh" "$dir/scripts/start-workflow.sh"
  cp "$repo_root/scripts/status-workflow.sh" "$dir/scripts/status-workflow.sh"
  chmod +x "$dir/scripts/start-workflow.sh"
  chmod +x "$dir/scripts/status-workflow.sh"
  (
    cd "$dir"
    git init -q
    git config user.email test@example.com
    git config user.name "Workflow Test"
  )
}

case_valid_generation() {
  local dir="$tmp_root/valid"
  make_repo "$dir"
  (
    cd "$dir"
    scripts/start-workflow.sh --no-checkout feature task-board "Task Board"
    assert_file docs/workflows/feature/task-board/plan.md
    assert_file docs/workflows/feature/task-board/notes.md
    assert_file docs/workflows/feature/task-board/report.md
    assert_file docs/workflows/feature/task-board/quality.md
    assert_file docs/workflows/feature/task-board/decisions.md
    assert_file docs/workflows/feature/task-board/shared-docs.md
    assert_file docs/workflows/feature/task-board/sources.md
    assert_file docs/workflows/feature/task-board/confirmations.md
    assert_file docs/workflows/feature/task-board/next-actions.md
    assert_file docs/workflows/feature/task-board/sync.md
    assert_contains docs/workflows/feature/task-board/shared-docs.md '`docs/02-architecture.md`'
    assert_contains docs/workflows/feature/task-board/sources.md 'Source Branch Workspaces'
    assert_contains docs/workflows/feature/task-board/confirmations.md 'Scope Confirm'
    assert_contains docs/workflows/feature/task-board/next-actions.md 'Recommended Next Action'
    assert_contains docs/workflows/feature/task-board/quality.md 'TDD Plan'
    assert_contains docs/workflows/feature/task-board/report.md 'Workspace state: draft'
    assert_contains docs/workflows/feature/task-board/report.md 'Context Budget mode: Lite Read'
    assert_contains docs/workflows/feature/task-board/report.md 'Primary context read:'
    assert_contains docs/workflows/feature/task-board/report.md 'Escalated context read:'
    assert_contains docs/workflows/feature/task-board/report.md 'Context omitted intentionally:'
    assert_contains docs/workflows/feature/task-board/quality.md 'Quality gate status: draft'
    assert_contains docs/workflows/feature/task-board/decisions.md 'Decision Option Briefs'
    assert_contains docs/workflows/feature/task-board/decisions.md 'Decision status: none'
    assert_contains docs/workflows/feature/task-board/sync.md 'Start Sync'
    assert_contains docs/workflows/feature/task-board/sync.md 'deferral reason:'
    scripts/status-workflow.sh docs/workflows/feature/task-board > status.out
    assert_contains status.out 'Workspace Status'
    assert_contains status.out 'Decisions'
    assert_contains status.out 'PR Checklist Readiness'
    assert_contains status.out 'Recommended Next Action'
  )
}

case_dry_run_writes_nothing() {
  local dir="$tmp_root/dry-run"
  make_repo "$dir"
  (
    cd "$dir"
    scripts/start-workflow.sh --dry-run feature task-board "Task Board"
    assert_no_file docs/workflows/feature/task-board/plan.md
  )
}

case_invalid_names_fail() {
  local dir="$tmp_root/invalid"
  make_repo "$dir"
  (
    cd "$dir"
    assert_fails scripts/start-workflow.sh --no-checkout feature TaskBoard "Bad Slug"
    assert_fails scripts/start-workflow.sh --no-checkout feature task_board "Bad Slug"
    assert_fails scripts/start-workflow.sh --no-checkout unknown task-board "Bad Type"
  )
}

case_existing_files_are_preserved() {
  local dir="$tmp_root/preserve"
  make_repo "$dir"
  (
    cd "$dir"
    scripts/start-workflow.sh --no-checkout feature task-board "Task Board"
    printf 'custom plan\n' > docs/workflows/feature/task-board/plan.md
    scripts/start-workflow.sh --no-checkout feature task-board "Task Board"
    assert_contains docs/workflows/feature/task-board/plan.md '^custom plan$'
  )
}

case_checkout_refuses_dirty_worktree() {
  local dir="$tmp_root/dirty"
  make_repo "$dir"
  (
    cd "$dir"
    printf 'dirty\n' > dirty.txt
    assert_fails scripts/start-workflow.sh feature task-board "Task Board"
    scripts/start-workflow.sh --no-checkout feature task-board "Task Board"
    assert_file docs/workflows/feature/task-board/plan.md
    assert_file docs/workflows/feature/task-board/quality.md
    assert_file docs/workflows/feature/task-board/decisions.md
  )
}

case_checkout_creates_branch_and_workspace() {
  local dir="$tmp_root/checkout"
  make_repo "$dir"
  (
    cd "$dir"
    printf 'base\n' > README.md
    git add README.md scripts/start-workflow.sh scripts/status-workflow.sh
    git commit -q -m "test: initial"
    scripts/start-workflow.sh feature task-board "Task Board"
    [[ "$(git branch --show-current)" == "feature/task-board" ]] || fail "Expected feature/task-board branch"
    assert_file docs/workflows/feature/task-board/shared-docs.md
    assert_file docs/workflows/feature/task-board/sources.md
    assert_file docs/workflows/feature/task-board/quality.md
    assert_file docs/workflows/feature/task-board/decisions.md
    assert_file docs/workflows/feature/task-board/confirmations.md
    assert_file docs/workflows/feature/task-board/next-actions.md
    assert_file docs/workflows/feature/task-board/sync.md
    assert_contains docs/workflows/feature/task-board/sync.md 'base commit:'
    scripts/status-workflow.sh > status.out
    assert_contains status.out 'docs/workflows/feature/task-board'
  )
}

case_no_checkout_works_outside_git() {
  local dir="$tmp_root/no-git"
  mkdir -p "$dir/scripts"
  cp "$repo_root/scripts/start-workflow.sh" "$dir/scripts/start-workflow.sh"
  cp "$repo_root/scripts/status-workflow.sh" "$dir/scripts/status-workflow.sh"
  chmod +x "$dir/scripts/start-workflow.sh"
  chmod +x "$dir/scripts/status-workflow.sh"
  (
    cd "$dir"
    scripts/start-workflow.sh --no-checkout docs no-git "No Git"
    assert_file docs/workflows/docs/no-git/shared-docs.md
    assert_file docs/workflows/docs/no-git/sources.md
    assert_file docs/workflows/docs/no-git/quality.md
    assert_file docs/workflows/docs/no-git/decisions.md
    assert_file docs/workflows/docs/no-git/confirmations.md
    assert_file docs/workflows/docs/no-git/next-actions.md
    assert_file docs/workflows/docs/no-git/sync.md
    assert_contains docs/workflows/docs/no-git/sync.md 'not a git worktree'
    scripts/status-workflow.sh docs/workflows/docs/no-git > status.out
    assert_contains status.out 'Workspace Status'
    assert_fails scripts/status-workflow.sh
    assert_fails scripts/start-workflow.sh docs no-git-checkout "No Git Checkout"
  )
}

case_current_harness_integration_validation() {
  (
    cd "$repo_root"
    scripts/validate-harness.sh --integration
    assert_file docs/16-existing-codebase-adoption.md
    assert_contains docs/reports/_template.md 'Baseline Codebase Adoption'
    assert_contains docs/reports/_template.md 'Infrastructure gaps'
    assert_contains docs/16-existing-codebase-adoption.md 'Infrastructure / Operations Gap Assessment'
    assert_contains docs/16-existing-codebase-adoption.md 'Gap To Next Phase Promotion'
  )
}

case_broken_integration_fails() {
  local broken_dir="$repo_root/docs/workflows/feature/broken-integration"
  rm -rf "$broken_dir"
  mkdir -p "$broken_dir"
  cp "$repo_root/docs/workflows/feature/integrate-task-board/"*.md "$broken_dir/"
  printf '# Broken Sources\n\n## Source Branch Workspaces\n\n- `docs/workflows/feature/missing-source/`\n' > "$broken_dir/sources.md"
  (
    cd "$repo_root"
    assert_fails scripts/validate-harness.sh --integration
  )
  rm -rf "$broken_dir"
}

case_broken_decisions_strict_fails() {
  local broken_file="$repo_root/docs/workflows/feature/task-crud/decisions.md"
  local backup_file="$tmp_root/task-crud-decisions.backup"
  cp "$broken_file" "$backup_file"
  printf '# Broken Decisions\n' > "$broken_file"
  (
    cd "$repo_root"
    assert_fails scripts/validate-harness.sh --strict
  )
  cp "$backup_file" "$broken_file"
}

case_draft_workspace_allows_planning_placeholders() {
  local draft_dir="$repo_root/docs/workflows/feature/draft-semantic"
  rm -rf "$draft_dir"
  (
    cd "$repo_root"
    scripts/start-workflow.sh --no-checkout feature draft-semantic "Draft Semantic"
    scripts/validate-harness.sh --strict
  )
  rm -rf "$draft_dir"
}

case_ready_quality_tbd_fails() {
  local dir="$repo_root/docs/workflows/feature/task-crud"
  local backup="$tmp_root/task-crud-quality-ready.backup"
  cp -R "$dir" "$backup"
  replace_line "$dir/report.md" "- Workspace state:" "- Workspace state: ready-for-review"
  replace_line "$dir/quality.md" "- Quality gate status:" "- Quality gate status: planned"
  replace_line "$dir/quality.md" "- Applies:" "- Applies: TBD"
  replace_line "$dir/quality.md" "- CI required:" "- CI required: no"
  (
    cd "$repo_root"
    assert_fails scripts/validate-harness.sh --strict
  )
  rm -rf "$dir"
  cp -R "$backup" "$dir"
}

case_ready_premerge_missing_fails() {
  local dir="$repo_root/docs/workflows/feature/task-crud"
  local backup="$tmp_root/task-crud-sync-ready.backup"
  cp -R "$dir" "$backup"
  replace_line "$dir/report.md" "- Workspace state:" "- Workspace state: ready-for-review"
  replace_line "$dir/quality.md" "- Quality gate status:" "- Quality gate status: passed-with-skips"
  replace_line "$dir/quality.md" "- Applies:" "- Applies: no"
  replace_line "$dir/quality.md" "- CI required:" "- CI required: no"
  replace_line "$dir/sync.md" "- result:" "- result:"
  replace_line "$dir/sync.md" "- deferral reason:" "- deferral reason:"
  (
    cd "$repo_root"
    assert_fails scripts/validate-harness.sh --strict
  )
  rm -rf "$dir"
  cp -R "$backup" "$dir"
}

case_ready_decision_brief_needed_fails() {
  local dir="$repo_root/docs/workflows/feature/task-crud"
  local backup="$tmp_root/task-crud-decision-ready.backup"
  cp -R "$dir" "$backup"
  replace_line "$dir/report.md" "- Workspace state:" "- Workspace state: ready-for-review"
  replace_line "$dir/quality.md" "- Quality gate status:" "- Quality gate status: passed-with-skips"
  replace_line "$dir/quality.md" "- Applies:" "- Applies: no"
  replace_line "$dir/quality.md" "- CI required:" "- CI required: no"
  replace_line "$dir/decisions.md" "- Decision status:" "- Decision status: brief-needed"
  (
    cd "$repo_root"
    assert_fails scripts/validate-harness.sh --strict
  )
  rm -rf "$dir"
  cp -R "$backup" "$dir"
}

case_integration_ready_source_draft_fails() {
  local integration_dir="$repo_root/docs/workflows/feature/integrate-task-board"
  local source_dir="$repo_root/docs/workflows/feature/task-crud"
  local integration_backup="$tmp_root/integration-ready.backup"
  local source_backup="$tmp_root/task-crud-source-draft.backup"
  cp -R "$integration_dir" "$integration_backup"
  cp -R "$source_dir" "$source_backup"
  replace_line "$integration_dir/report.md" "- Workspace state:" "- Workspace state: integration-ready"
  replace_line "$integration_dir/quality.md" "- Quality gate status:" "- Quality gate status: passed-with-skips"
  replace_line "$integration_dir/quality.md" "- Applies:" "- Applies: no"
  replace_line "$integration_dir/quality.md" "- CI required:" "- CI required: no"
  replace_line "$source_dir/report.md" "- Workspace state:" "- Workspace state: draft"
  (
    cd "$repo_root"
    assert_fails scripts/validate-harness.sh --integration
  )
  rm -rf "$integration_dir" "$source_dir"
  cp -R "$integration_backup" "$integration_dir"
  cp -R "$source_backup" "$source_dir"
}

case_current_harness_strict_validation() {
  (
    cd "$repo_root"
    scripts/validate-harness.sh --strict
  )
}

case_valid_generation
case_dry_run_writes_nothing
case_invalid_names_fail
case_existing_files_are_preserved
case_checkout_refuses_dirty_worktree
case_checkout_creates_branch_and_workspace
case_no_checkout_works_outside_git
case_current_harness_integration_validation
case_broken_integration_fails
case_broken_decisions_strict_fails
case_draft_workspace_allows_planning_placeholders
case_ready_quality_tbd_fails
case_ready_premerge_missing_fails
case_ready_decision_brief_needed_fails
case_integration_ready_source_draft_fails
case_current_harness_strict_validation

echo "workflow edge case tests passed"
