# 00. Environment Setup

## Purpose

Confirm the local or target verification environment is ready.

## Preconditions

- Required tools installed
- Required env examples available
- No real secrets committed

## Procedure

1. Run `[SETUP_COMMAND]`.
2. Run `[MIGRATION_OR_INIT_COMMAND]` if applicable.
3. Start `[SERVICE_OR_APP]`.
4. Check `[HEALTH_OR_SMOKE_TARGET]`.

## Expected Result

- Required services start.
- Health/smoke target responds.
- Logs do not show blocking errors.

## If It Fails

- Check env values.
- Check port/process conflicts.
- Check dependency installation.
- Check migration/data initialization.

## Evidence

- Commands run
- Result
- Logs/screenshots if useful
