# 06. Regression Guard & Failure Scenarios

This document defines what must not break and how failures should behave.

## Purpose

- Protect already implemented behavior.
- Define expected failure and fallback behavior.
- Connect regression/failure checks to manual verification and Phase reports.

## How To Use

1. Before a Phase, read the relevant Regression Guard.
2. Before completion, review at least one relevant Failure Scenario.
3. If tests are missing, run related manual verification.
4. Record results in the Phase report.

## Feature Regression Guard Template

### Template Identity

| Item | Content |
| --- | --- |
| Must not break | This repository is described as the 협업 하네스 reusable template, not as a runnable target application. |
| Failure condition | Core docs revert to the original template name or imply that this repository should implement an app feature. |
| Expected behavior | README, AGENTS, product planning, and workflow docs keep the documentation-first template identity. |
| Verification method | `rg -n "AI-Assisted Development Harness Template|\\[PROJECT_NAME\\]" README.md AGENTS.md docs/01-product-planning.md docs/08-development-workflow.md` and manual doc review. |
| Related docs/interface/Phase | `README.md`, `AGENTS.md`, `docs/01`, `docs/08` |

### Placeholder Strategy

| Item | Content |
| --- | --- |
| Must not break | Target-project placeholders remain only where they are part of reusable template instructions. |
| Failure condition | Repository-specific docs contain unresolved placeholders that should identify 협업 하네스. |
| Expected behavior | Core repository identity is concrete; reusable authoring examples may still use placeholders. |
| Verification method | `rg -n "\\[[A-Z0-9_]+\\]" AGENTS.md README.md 00-how-to-use-this-template.md docs/00-layer-map.md docs/01-product-planning.md docs/04-development-guide.md docs/08-development-workflow.md docs/reports/README.md` |
| Related docs/interface/Phase | `AGENTS.md`, `README.md`, `docs/08` |

### [FEATURE_OR_DOMAIN]

| Item | Content |
| --- | --- |
| Must not break | [BEHAVIOR_TO_PROTECT] |
| Failure condition | [FAILURE_CONDITION] |
| Expected behavior | [EXPECTED_BEHAVIOR] |
| Verification method | [TEST_OR_MANUAL_CHECK] |
| Related docs/interface/Phase | `docs/02`, `docs/03`, `docs/05`, `docs/07`, `docs/08` |

## Feature Failure Scenario Template

### Template Mistaken For Target App

| Item | Content |
| --- | --- |
| Must not break | A reader can tell that the repository is a harness template. |
| Failure condition | Instructions ask the user to run an app, configure app secrets, or implement business features before any target project exists. |
| Expected behavior | The docs direct the reader to copy/adapt the template and define the target project first. |
| Verification method | Manual review of `README.md`, `00-how-to-use-this-template.md`, and `docs/08-development-workflow.md`. |
| Related docs/interface/Phase | `README.md`, `00-how-to-use-this-template.md`, `docs/08` |

### [FAILURE_SCENARIO]

| Item | Content |
| --- | --- |
| Must not break | [CORE_BEHAVIOR] |
| Failure condition | [FAILURE_CONDITION] |
| Expected behavior | [EXPECTED_ERROR_OR_FALLBACK] |
| Verification method | [TEST_OR_MANUAL_CHECK] |
| Related docs/interface/Phase | `docs/03`, `docs/05`, `docs/07`, `docs/08` |

## Common Infrastructure Failure Scenarios

- Missing required environment variable
- Data store unavailable
- Migration/data change failure
- External provider timeout/error
- Background job failure
- Auth/access-control failure
- File or input validation failure

## Phase Report Minimum Format

```text
Regression Guard:
- Checked feature:
- Protected behavior:
- Result:

Failure Scenario:
- Reviewed failure:
- Expected behavior:
- Verification:
- Result:
```
