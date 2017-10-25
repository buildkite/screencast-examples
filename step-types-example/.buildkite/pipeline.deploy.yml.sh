#!/bin/bash

set -euo pipefail

IS_ROLLBACK="${IS_ROLLBACK:-false}"
PREVIOUSLY_DEPLOYED_COMMIT="${PREVIOUSLY_DEPLOYED_COMMIT:-}"

echo 'steps:
  - label: ":k8s: Deploy"
    command: "echo update resource"
  - wait
  - label: ":pagerduty: On-call Override"
    command: "echo hello world"'

if [[ "${IS_ROLLBACK}" != "true" ]]; then
  echo '
  - wait
  - block: "Rollback"
    prompt: "Create a rollback deployment for build ${BUILDKITE_BUILD} (to commit ${PREVIOUSLY_DEPLOYED_COMMIT})"
    fields:
      - text: "Reason"
        key: "reason"
        hint: "What is the reason for rolling this build back?"
  - trigger: "${BUILDKITE_PIPELINE_SLUG}"
    label: "Rollback to ${PREVIOUSLY_DEPLOYED_COMMIT}"
    build:
      message: "Rollback"
      commit: "${PREVIOUSLY_DEPLOYED_COMMIT}"
      branch: master
      env:
        IS_ROLLBACK: "true"'
fi