# 05. Integration

## Purpose

Verify an internal or external integration.

## Preconditions

- Integration config available
- Test endpoint/tool/provider available or mocked
- Timeout/fallback expectation documented

## Procedure

1. Start `[DEPENDENCY]` or enable mock.
2. Trigger `[INTEGRATION_ACTION]`.
3. Confirm success output.
4. Simulate dependency failure if safe.
5. Confirm fallback/error handling.

## Expected Result

- Integration succeeds in the happy path.
- Failure is contained and visible.
- Fallback or retry behavior matches docs.

## If It Fails

- Check credentials/config without exposing secrets.
- Check timeout/retry/logging.
- Check request/response contract.

## Evidence

- Input
- Provider/dependency status
- Output/fallback message
