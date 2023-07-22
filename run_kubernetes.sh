#!/usr/bin/bash
echo "Starting minikube"
minikube start
echo "Deleting Pod if it exists"
kubectl delete pod myapp
echo "Pointing the local Docker daemon to the minikube internal Docker registry"
eval $(minikube -p minikube docker-env)
echo "Creating image myapp"
docker build -t myapp:latest .
echo "Creating Pod"
kubectl apply -f k8s.yml
echo "Checking Pod logs"
kubectl logs myapp
echo "Status"
kubectl get pods -o wide
