#!/usr/bin/env bash
set -euo pipefail

DOCKER_USER="${DOCKER_USER:-baominh}"
IMAGE_NAME="${IMAGE_NAME:-openclaw-company}"
TAG="${TAG:-latest}"
FULL_IMAGE="${DOCKER_USER}/${IMAGE_NAME}:${TAG}"

echo "=== Building Docker Image ==="
echo "Image: ${FULL_IMAGE}"

cd "$(dirname "$0")/.."

docker build -f docker/Dockerfile -t "${FULL_IMAGE}" .

echo "=== Build Complete ==="
echo "Image: ${FULL_IMAGE}"
echo ""
echo "Run locally:  docker run -v openclaw-data:/app/workspace ${FULL_IMAGE}"
echo "Push:         ./scripts/push.sh"
