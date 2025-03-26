#!/bin/sh

# List all pods in default namespace
kubectl get po

# List all replicasets in default namespace
kubectl get rs

# List all replicasets in default namespace
kubectl get rs

# Verify image used to create new-replica-set via describe replicaset
kubectl describe rs new-replica-set | grep -i "image:"

# Verify pods in new-replica-set replicaset
kubectl get rs new-replica-set

# Delete pod by label
kubectl delete po -l name=busybox-pod

# Backup existing replicaset-definition-1.yaml
cp -rp replicaset-definition-1.yaml replicaset-definition-1-error.yaml

# Create replicaset using fixed definition file
kubectl apply -f replicaset-definition-1.yaml

# Backup existing replicaset-definition-2.yaml
cp -rp replicaset-definition-2.yaml replicaset-definition-2-error.yaml

# Create replicaset using fixed definition file
kubectl apply -f replicaset-definition-2.yaml

# Delete replicaset
kubectl delete -f replicaset-definition-2.yaml
kubectl delete rs replicaset-1

# Retrieve new-replica-set replicaset definition file
kubectl get rs new-replica-set -o yaml > new-replica-set-definition-original.yaml

# Backup 
cp -rp new-replica-set-definition-original.yaml new-replica-set-definition.yaml 

# Replace new-replica-set with fixed image using replicaset definition file
kubectl delete -f new-replica-set-definition.yaml 
kubectl apply -f new-replica-set-definition.yaml 

# Scale replicaset to 5 using kubectl scale
kubectl scale rs new-replica-set --replicas 5

# Scale replicaset to 2 using definition file / kubectl edit
kubectl get rs new-replica-set -o yaml > new-replica-set-definition-scale.yaml
kubectl apply -f new-replica-set-definition-scale.yaml
