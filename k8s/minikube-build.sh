#!/bin/sh

# Step 1: Run docker command within minikube
eval $(minikube docker-env)

# Step 2: Build the image
docker build -t sample-app:v1 sample-app/

# Step 3: Undo Step 1
eval $(minikube docker-env -u)