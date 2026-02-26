#!/usr/bin/env bash
set -euo pipefail

DOCKER_USER="${DOCKER_USER:-baominh}"
IMAGE_NAME="${IMAGE_NAME:-openclaw-company}"
TAG="${TAG:-latest}"
NAMESPACE="openclaw"

echo "=== Deploying to Minikube ==="

# Ensure minikube is running
if ! minikube status | grep -q "Running"; then
  echo "Starting minikube..."
  minikube start
fi

# Apply manifests in order
echo "1/6 Creating namespace..."
kubectl apply -f k8s/namespace.yaml

echo "2/6 Creating PVC (persistent storage)..."
kubectl apply -f k8s/pvc.yaml

echo "3/6 Creating ConfigMap..."
kubectl apply -f k8s/configmap.yaml

echo "4/6 Creating Secrets..."
kubectl apply -f k8s/secret.yaml

echo "5/6 Creating Service..."
kubectl apply -f k8s/service.yaml

echo "6/6 Deploying application..."
kubectl apply -f k8s/deployment.yaml

# Wait for rollout
echo ""
echo "Waiting for deployment rollout..."
kubectl rollout status deployment/openclaw -n "${NAMESPACE}" --timeout=120s

echo ""
echo "=== Deployment Complete ==="
kubectl get pods -n "${NAMESPACE}"
echo ""
echo "PVC status:"
kubectl get pvc -n "${NAMESPACE}"
echo ""
echo "Pod logs:  kubectl logs -f deploy/openclaw -n ${NAMESPACE}"
echo "Shell:     kubectl exec -it deploy/openclaw -n ${NAMESPACE} -- bash"
echo "Workspace: kubectl exec deploy/openclaw -n ${NAMESPACE} -- ls /app/workspace"
