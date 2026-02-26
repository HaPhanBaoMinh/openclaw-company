# OpenClaw Company

AI-driven company with 3 agents: **Boss**, **Coder**, **Researcher**.

## Quick Start

```bash
cp .env.example .env    # Fill in your API keys
./scripts/build.sh      # Build Docker image
./scripts/deploy.sh     # Deploy to Minikube
```

## Architecture

```
Boss     → Decides, plans, assigns
Coder    → Implements, tests, deploys
Researcher → Investigates, compares, recommends
```

## Scripts

| Script | Description |
|--------|-------------|
| `scripts/build.sh` | Build Docker image |
| `scripts/push.sh` | Push to DockerHub |
| `scripts/deploy.sh` | Deploy to Minikube |
| `scripts/redeploy.sh` | Build + Push + Deploy (full pipeline) |
| `scripts/backup-workspace.sh` | Backup workspace from Minikube |

## Data Persistence

All workspace data is stored in a **PersistentVolumeClaim** (`openclaw-workspace-pvc`).

- Pod crashes → data survives
- Pod restarts → data survives
- Pod deleted → data survives (PVC is independent)
- Only deleting the PVC itself removes data

## Kubernetes Manifests

```
k8s/
├── namespace.yaml      # openclaw namespace
├── pvc.yaml            # 5Gi persistent storage
├── configmap.yaml      # non-secret config
├── secret.yaml         # API keys (edit before deploy)
├── deployment.yaml     # main pod with PVC mount
├── service.yaml        # ClusterIP service
└── init-job.yaml       # one-time workspace init
```

## Workspace Structure

```
workspace/
├── inbox/          # Raw incoming requests
├── backlog/        # Structured tasks
├── projects/       # Code + deliverables
├── knowledge/      # Cumulative intelligence
├── skills/         # Agent charters + playbooks
├── tools/          # Tool registry + templates
└── runs/           # Execution audit trail
```
