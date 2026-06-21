# 03. Auth Or Access Control

## Purpose

Verify authentication, authorization, permissions, or access boundaries.

## Preconditions

- Test identities or roles exist
- Protected and public paths are known

## Procedure

1. Access `[PUBLIC_PATH_OR_ACTION]`.
2. Access `[PROTECTED_PATH_OR_ACTION]` without permission.
3. Authenticate or switch to `[ROLE]`.
4. Repeat protected action.
5. Try an unauthorized role or expired session if applicable.

## Expected Result

- Public access works.
- Unauthorized access fails clearly.
- Authorized access succeeds.
- Errors match documented failure format.

## If It Fails

- Check token/session/role state.
- Check permission rules.
- Check error mapping.

## Evidence

- Identity/role used
- Result per action
- Logs/screenshots
