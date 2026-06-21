# 02. Architecture

## 1) Technology Stack Rationale

| Area | Choice | Reason |
| --- | --- | --- |
| Runtime | [RUNTIME] | [REASON] |
| UI | [UI_STACK] | [REASON] |
| Data | [DATA_STACK] | [REASON] |
| Infra | [INFRA_STACK] | [REASON] |

## 2) System Composition

```text
[CLIENT_OR_ENTRYPOINT]
  -> [SERVICE_OR_MODULE]
  -> [DATA_OR_EXTERNAL_SYSTEM]
```

## 3) Layer Structure

### [LAYER_OR_PACKAGE]

- Responsibility:
- Main files/modules:
- Boundaries:

## 4) Data Model

### [ENTITY_NAME]

| Field | Type | Notes |
| --- | --- | --- |
| id | [TYPE] | Primary identifier |

## 5) Core Sequences

### Flow A. [FLOW_NAME]

```text
1. [ACTOR] -> [SYSTEM]: [ACTION]
2. [SYSTEM] -> [DEPENDENCY]: [ACTION]
3. [SYSTEM] -> [ACTOR]: [RESULT]
```

## 6) External Integrations

| Integration | Purpose | Failure Handling |
| --- | --- | --- |
| [INTEGRATION] | [PURPOSE] | [FALLBACK] |

## 7) Operations / Deployment

### Environments

- Local:
- Staging:
- Production:

### Environment Variables / Secrets

| Name | Required | Notes |
| --- | --- | --- |
| `[ENV_NAME]` | Yes/No | [NOTES] |

### Health Checks

- [HEALTH_CHECK]

### Migration / Rollback

- Migration command:
- Rollback limitation:
- Data backup note:

### Logging / Monitoring

- Logs:
- Metrics:
- Alerts:
