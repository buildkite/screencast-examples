#!/bin/bash

set -euo pipefail

IS_ROLLBACK="${IS_ROLLBACK:-false}"
PREVIOUS_COMMIT="${PREVIOUS_COMMIT:-}"

echo 'steps:
  - label: ":k8s: Deploy"
    command: "echo update resource"
  - wait
  - label: ":pagerduty: Override"
    command: "echo hello world"'

if [[ "${IS_ROLLBACK}" == "true" ]]; then
  echo '
  - wait
  - block: "Rollback"
    hint: "Create a rollback deployment for build ${BUILDKITE_BUILD} (to commit ${PREVIOUS_COMMIT})"
    fields:
      - text: "Reason"
        hint: "What's the reason for rolling this build back?"
  - trigger: "${BUILDKITE_PIPELINE_SLUG}"
    build:
      message: "Rollback"
      commit: "${PREVIOUS_COMMIT}"
      branch: master
      env:
        IS_ROLLBACK: "true"'
done