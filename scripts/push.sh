#!/usr/bin/env bash
set -euo pipefail

DOCKER_USER="${DOCKER_USER:-baominh}"
IMAGE_NAME="${IMAGE_NAME:-openclaw-company}"
TAG="${TAG:-latest}"
FULL_IMAGE="${DOCKER_USER}/${IMAGE_NAME}:${TAG}"
GIT_SHA=$(git rev-parse --short HEAD 2>/dev/null || echo "unknown")

echo "=== Pushing to DockerHub ==="

docker tag "${FULL_IMAGE}" "${DOCKER_USER}/${IMAGE_NAME}:${GIT_SHA}"

docker push "${FULL_IMAGE}"
docker push "${DOCKER_USER}/${IMAGE_NAME}:${GIT_SHA}"

echo "=== Push Complete ==="
echo "Pushed: ${FULL_IMAGE}"
echo "Pushed: ${DOCKER_USER}/${IMAGE_NAME}:${GIT_SHA}"
