# 04. Data Flow

## Purpose

Verify data creation, transformation, persistence, retrieval, or export.

## Preconditions

- Data store or file location available
- Test input prepared
- Expected output known

## Procedure

1. Create or import `[TEST_DATA]`.
2. Trigger `[PROCESS_OR_ACTION]`.
3. Retrieve or inspect `[RESULT_LOCATION]`.
4. Confirm data shape, state, and ownership.

## Expected Result

- Data is stored or emitted in the expected shape.
- Invalid data is rejected or handled.
- No unrelated data is modified.

## If It Fails

- Check schema/interface mismatch.
- Check migration/data initialization.
- Check ownership or transaction boundaries.

## Evidence

- Input data
- Output data
- Query/log/screenshot
