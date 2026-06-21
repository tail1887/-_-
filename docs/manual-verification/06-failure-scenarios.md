# 06. Failure Scenarios

## Purpose

Verify representative failures do not crash the system or produce misleading success.

## Preconditions

- Related `docs/06-regression-and-failure-scenarios.md` section identified
- Safe failure reproduction method available

## Procedure

1. Reproduce `[FAILURE_CONDITION]`.
2. Observe user-visible behavior.
3. Observe logs/status/reporting.
4. Restore normal state.

## Expected Result

- Failure is clear and actionable.
- System remains recoverable.
- No unsupported success state is shown.

## If It Fails

- Add or update a Failure Scenario.
- Create a Hotfix candidate.
- Record in Phase report.

## Evidence

- Failure condition
- Expected vs actual behavior
- Logs/screenshots
- Follow-up action
