#!/bin/sh

alias k=kubectl
# Deploy a pod named nginx-pod using the nginx:alpine image.
k run nginx-pod --image nginx:alpine

# Deploy a redis pod using the redis:alpine image with the labels set to tier=db.
k run redis --image redis:alpine -l "tier=db"

# Create a service redis-service to expose the redis application within the cluster on port 6379
k expose pod redis --port 6379 --name redis-service

# Create a deployment named webapp using the image kodekloud/webapp-color with 3 replicas.
k create deploy webapp --image kodekloud/webapp-color --replicas 3

# Create a new pod called custom-nginx using the nginx image and run it on container port 8080.
k run custom-nginx --image nginx --port 8080

# Create a new namespace called dev-ns.
k create ns dev-ns

# Create a new deployment called redis-deploy in the dev-ns namespace with the redis image. It should have 2 replicas.
k create deploy redis-deploy --image redis -n dev-ns --replicas 2

# Create a pod called httpd using the image httpd:alpine in the default namespace. Next, create a service of type ClusterIP by the same name (httpd). The target port for the service should be 80.
k run httpd --image httpd:alpine --port 80 --expose
