#!/bin/sh

alias k=kubectl

# View all pods in default namespace
k get po

# Retrieve definition file for ubuntu-sleeper pod
k get po ubuntu-sleeper -o yaml > backup/ubuntu-sleeper-pod-definition.yaml

# Verify command used in ubuntu pod
k describe pod ubuntu-sleeper

# Create a pod with the ubuntu image to run a container to sleep for 5000 seconds. Modify the file ubuntu-sleeper-2.yaml.
k apply -f ubuntu-sleeper-2.yaml

# Create a pod using the file named ubuntu-sleeper-3.yaml. There is something wrong with it. Try to fix it!
k apply -f ubuntu-sleeper-3-01.yaml

# Update pod ubuntu-sleeper-3 to sleep for 2000 seconds.
k delete -f ubuntu-sleeper-3-02.yaml
k apply -f ubuntu-sleeper-3-02.yaml

# Create a pod with the given specifications. By default it displays a blue background. Set the given command line arguments to change it to green.
#   Pod Name: webapp-green
#   Image: kodekloud/webapp-color
#   Command line arguments: --color=green
k run webapp-green --image kodekloud/webapp-color -o yaml --dry-run=client > webapp-green-pod-definition.yaml
