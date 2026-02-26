#!/usr/bin/env bash
set -euo pipefail

NAMESPACE="openclaw"

echo "=== Full Redeploy Pipeline ==="
echo ""

echo "Step 1: Build"
./scripts/build.sh

echo ""
echo "Step 2: Push to DockerHub"
./scripts/push.sh

echo ""
echo "Step 3: Deploy to Minikube"
./scripts/deploy.sh

echo ""
echo "Step 4: Restart pods (pull latest image)"
kubectl rollout restart deployment/openclaw -n "${NAMESPACE}"
kubectl rollout status deployment/openclaw -n "${NAMESPACE}" --timeout=120s

echo ""
echo "=== Redeploy Complete ==="
echo "Data persisted in PVC: openclaw-workspace-pvc"
echo "Even if pod restarts, all workspace data is safe."
