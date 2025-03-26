#!/bin/sh

# Verify all the resources in current namespace
kubectl get all

# Retrieve all namespace on system
kubectl get ns

# Verify pods in current namespace
kubectl get po -n research

# Start redis pod in finance namespace
kubectl run redis --image redis -n finance

# Verify which namespace is blue pod in
kubectl get pod -A | grep -i "blue"

# Backup of existing tutorial 
mkdir -p env-backup/namespaces
mkdir -p env-backup/pods
mkdir -p env-backup/services

kubectl get ns dev -o yaml > env-backup/namespaces/dev-namespace-definition.yaml
kubectl get ns finance -o yaml > env-backup/namespaces/finance-namespace-definition.yaml
kubectl get ns manufacturing -o yaml > env-backup/namespaces/manufacturing-namespace-definition.yaml
kubectl get ns marketing -o yaml > env-backup/namespaces/marketing-namespace-definition.yaml
kubectl get ns prod -o yaml > env-backup/namespaces/prod-namespace-definition.yaml
kubectl get ns research -o yaml > env-backup/namespaces/research-namespace-definition.yaml

kubectl get po redis-db -n dev -o yaml > env-backup/pods/redis-db.dev-pod-definition.yaml
kubectl get svc db-service -n dev -o yaml > env-backup/services/db-service.dev-svc-definition.yaml

kubectl get po payroll -n finance -o yaml > env-backup/pods/payroll.finance-pod-definition.yaml
kubectl get po redis -n finance -o yaml > env-backup/pods/redis.finance-pod-definition.yaml
kubectl get svc payroll-service -n finance -o yaml > env-backup/services/payroll-service.finance-svc-definition.yaml

kubectl get po red-app -n manufacturing -o yaml > env-backup/pods/red-app.manufacturing-pod-definition.yaml
kubectl get svc red-service -n manufacturing -o yaml > env-backup/services/red-service.manufacturing-svc-definition.yaml

kubectl get po blue -n marketing -o yaml > env-backup/pods/blue.marketing-pod-definition.yaml
kubectl get po redis-db -n marketing -o yaml > env-backup/pods/redis-db.marketing-pod-definition.yaml
kubectl get svc blue-service -n marketing -o yaml > env-backup/services/blue-service.marketing-svc-definition.yaml
kubectl get svc db-service -n marketing -o yaml > env-backup/services/db-service.marketing-svc-definition.yaml

kubectl get po dna-1 -n research -o yaml > env-backup/pods/dna-1.research-pod-definition.yaml
kubectl get po dna-2 -n research -o yaml > env-backup/pods/dna-2.research-pod-definition.yaml
