#!/bin/bash

set -euo pipefail

echo 'steps:
  - block: "Deployment target"
    fields: 
      - text: "Email address to send notification"
        key: "email"
      - select: "Target"
        key: "deploy-target"
        options:'

SERVERS="staging-1 staging-2 staging-3"

for server in $SERVERS; do
	echo "          - label: $server"
	echo "            value: $server"
done