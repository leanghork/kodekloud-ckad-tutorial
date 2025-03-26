#!/bin/sh

# Verify the resources in default namespace
kubectl get all

# Verify the deployments in default namespace
kubectl get deploy

# Retrieve frontend-deployment deployments definition file
kubectl get deploy -o yaml > frontend-deployment-definition.yaml

# Verify the replicasets in default namespace
kubectl get rs

# Verify the pods in default namespace
kubectl get po

# Verify image used to create frontend-deployment via describe replicaset
kubectl describe rs frontend-deployment | grep -i "image:"

# Verify image used to create frontend-deployment via describe pod
kubectl describe po frontend-deployment | grep -i "image:"

# Backup
cp -rp deployment-definition-1.yaml deployment-definition-1-error.yaml

kubectl apply -f deployment-definition-1.yaml

# Generate deployment definition file 
kubectl create deploy httpd-frontend --replicas 3 --image httpd:2.4-alpine -o yaml --dry-run=client > httpd-frontend-deployment-definition.yaml

# Create deployment directly
kubectl create deploy httpd-frontend --replicas 3 --image httpd:2.4-alpine
