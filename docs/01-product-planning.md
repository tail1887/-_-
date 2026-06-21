# 01. Product Planning

## 1) Project One-Liner

협업 하네스 is a reusable documentation-first operating template for AI-assisted software collaboration.

## 2) Problem Definition

### MVP/Core Problem

- AI coding work often drifts when requirements, architecture, verification, and reports are not connected.
- Large prompts make it hard to know which context was used, what changed, and what must be verified next.

### Expansion Problems

- Teams may later need example projects, automation, or packaging so the template can be applied faster.

## 3) Target Users

- Developers using AI agents for iterative implementation.
- Project teams that need handoff-ready documentation and verification evidence.
- Students or reviewers who need to prove what was built and how it was checked.

## 4) Goals

- Provide a small, reusable document set for Phase-based AI collaboration.
- Make Source of Truth, implementation flow, acceptance criteria, regression checks, and reports easy to follow.
- Keep the template lightweight enough to apply to small projects.

## 5) MVP Scope

### Core Features

- Layer map for change propagation and context loading.
- Agent rules for Phase-based work.
- Product, architecture, interface, development, acceptance, regression, verification, workflow, and report templates.
- Short application guide for copying the harness into a target project.

### Required Integrations

- None for MVP.

### Optional Extensions

- Example filled project.
- Bootstrap script.
- Packaging for reuse from a template repository.

## 6) Non-MVP Scope

- Building a runnable application inside this repository.
- Defining one universal software stack for every target project.
- Automating every verification step before the manual template flow is stable.

## 7) Key User Flows

### Flow A. Apply To A Target Project

1. Copy the template files into a target project.
2. Replace placeholders and update the layer map.
3. Fill planning, architecture, verification, and workflow documents for the target project.

### Flow B. Run A Phase

1. Read `AGENTS.md`.
2. Use `docs/00-layer-map.md` to load only relevant context.
3. Execute one Phase from `docs/08-development-workflow.md`.
4. Verify against `docs/05`, `docs/06`, and `docs/07`.
5. Write a report in `docs/reports/`.

## 8) Success Criteria

- A new project can adopt the harness by following `00-how-to-use-this-template.md`.
- An AI agent can identify the correct context without reading every file.
- Each Phase leaves a concise report with changed, verified, remaining, and next context.

## 9) Decisions / Open Questions

- Confirmed:
  - This repository is the 협업 하네스 template itself, not a target application built from the template.
  - MVP is documentation-first.
- Open:
  - Should this later include a bootstrap script for copying and renaming placeholders?
  - Should there be a fully filled sample project alongside the blank template?
