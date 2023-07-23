## Python CLI tool with Docker and Kubernetes

Project: Create a simple Python CLI app and deploy it with Kubernetes

Before starting to use Kubernetes we need to install Docker Desktop, Minikube or Kind, and Kubectl. I linked the official websites for you bellow:

[Docker Desktop](https://www.docker.com/products/docker-desktop/) <br/>
[Minikube](https://minikube.sigs.k8s.io/docs/start/) or [Kind](https://kind.sigs.k8s.io/docs/user/quick-start/#installing-from-release-binaries)<br/>
[Kubeclt](https://kubernetes.io/docs/tasks/tools/)

### Installing Kind (PowerShell or Git Bash)
1. Download Kind: ```curl.exe -Lo kind-windows-amd64.exe https://kind.sigs.k8s.io/dl/v0.20.0/kind-windows-amd64```
2. Move to some dir: ```.\kind-windows-amd64.exe c:\some-dir-in-your-PATH\kind.exe```
3. Create a cluster using ```kind.exe (or kind) create cluster```
   
### Some useful commands from Kubeclt

```bash
kubectl cluster-info - Verify kubectl configuration
kubectl version - Print version
kubectl get services - Verify services running
kubectl get pods - Verify all pods running
kubectl get pods -o wide - Verify more details of all pods running
kubectl apply -f <NAME>.yaml --namespace=<NAME> - Create the Pod
kubectl get pod <NAME> --namespace=<NAME> - Verify that the Pod is running
kubectl top pod <NAME> --namespace=<NAME> - Fetch the metrics for the Pod
kubectl delete pod <NAME> --namespace=<NAME> - Delete Pod
kubectl describe pod <NAME> --namespace=<NAME> - View detailed information about the Pod
kubectl delete namespace <NAME> - Delete namespace
```

### Some useful commands from Minikube

```bash
minikube start - Start minikube
minikube status - Check minikube status
```

### Some useful commands from Kind

```bash
kind create cluster - Create a new local cluster
```

### Creating a Pod

**Note:**
> Make sure to replace all <NAME> placeholders with any name you want
{: .note}

Step 1: Start minikube

```bash
minikube start
```

Step 2: Create a Docker image

```bash
docker build -t <NAME>:<VERSION> -f Dockerfile
```

Step 3: Execute this command to use Kubernetes with local Docker images

```bash
eval $(minikube -p minikube docker-env)
```

Step 4: Create a Pod from a Docker image

```bash
kubectl apply -f k8s.yaml --namespace=<NAME>
```
Step 5: Check if Pod ruined successfully

```bash
kubectl logs <POD NAME>
```

