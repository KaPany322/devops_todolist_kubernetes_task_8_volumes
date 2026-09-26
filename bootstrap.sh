#!/bin/bash
set -euo pipefail

# Run kubectl with paths relative to this script, regardless of the caller's directory.
cd "$(dirname "${BASH_SOURCE[0]}")"
# Namespace
kubectl apply -f .infrastructure/namespace.yml

# ConfigMap and Secrets
kubectl apply -f .infrastructure/configMap.yml
kubectl apply -f .infrastructure/secret.yml

# PV and PVC
kubectl apply -f .infrastructure/pv.yml
kubectl apply -f .infrastructure/pvc.yml

# Deployment
kubectl apply -f .infrastructure/deployment.yml

# Services
kubectl apply -f .infrastructure/clusterIp.yml
kubectl apply -f .infrastructure/nodeport.yml
kubectl apply -f .infrastructure/hpa.yml
