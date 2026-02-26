#!/usr/bin/env bash
set -euo pipefail

echo "=== OpenClaw Company ==="
echo "Workspace: ${WORKSPACE_ROOT:-/app/workspace}"
echo "Started at: $(date -u +"%Y-%m-%dT%H:%M:%SZ")"

mkdir -p "${WORKSPACE_ROOT:-/app/workspace}"/{inbox,backlog,projects,knowledge/{company,domain,research},runs}

echo "Workspace ready. Waiting for tasks..."
tail -f /dev/null
