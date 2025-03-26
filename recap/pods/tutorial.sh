#!/bin/sh

# List all pods in default namespace
kubectl get po

# Generate pod definition file
kubectl run nginx --image nginx -o yaml --dry-run=client > nginx-pod-definition.yaml

# Create a new pod with the nginx image.
kubectl run nginx --image nginx

# List all pods in default namespace
kubectl get po

# Retrieve newpods replicaset definition file 
kubectl get rs newpods -o yaml > newpods-replicaset-definition.yaml

# Verify image used to create newpods via describe replicaset
kubectl describe rs newpods | grep -i "image:"

# Verify image used to create newpods via describe pod
kubectl describe po newpods | grep -i "image:"

# Verify nodes where newpods are placed
kubectl describe po newpods | grep -i "node:"

# Retrieve webapp pod definition file 
kubectl get po webapp -o yaml > webapp-pod-definition.yaml

# Describe webapp pod to identify containers and image used
kubectl describe po webapp > webapp-pod-describe.out

# Delete webapp pod
kubectl delete po webapp

# Generate pod definition file
kubectl run redis --image redis123 -o yaml --dry-run=client > redis-01-pod-definition.yaml

# Create a new pod with the redis123 image using definition/manifest file
kubectl apply -f redis-01-pod-definition.yaml

# Generate pod definition file
kubectl run redis --image redis -o yaml --dry-run=client > redis-02-pod-definition.yaml

# Delete redis pod using definition/manifest file
kubectl delete -f redis-02-pod-definition.yaml

# Recreate a new pod with the redis image using definition/manifest file
kubectl apply -f redis-02-pod-definition.yaml

