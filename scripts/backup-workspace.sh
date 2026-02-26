#!/usr/bin/env bash
set -euo pipefail

NAMESPACE="openclaw"
BACKUP_DIR="./backups"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_FILE="${BACKUP_DIR}/workspace_${TIMESTAMP}.tar.gz"

mkdir -p "${BACKUP_DIR}"

echo "=== Backing up workspace from Minikube ==="

POD=$(kubectl get pods -n "${NAMESPACE}" -l app=openclaw -o jsonpath='{.items[0].metadata.name}')

kubectl exec "${POD}" -n "${NAMESPACE}" -- tar czf /tmp/workspace-backup.tar.gz -C /app workspace

kubectl cp "${NAMESPACE}/${POD}:/tmp/workspace-backup.tar.gz" "${BACKUP_FILE}"

echo "=== Backup Complete ==="
echo "Saved to: ${BACKUP_FILE}"
echo "Size: $(du -h "${BACKUP_FILE}" | cut -f1)"
