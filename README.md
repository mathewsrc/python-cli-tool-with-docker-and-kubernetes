## Python CLI tool with Docker and Kubernetes

Project: Create a simple Python CLI app and deploy it with Kubernetes

## Instaling tools 

Before starting to use Kubernetes we need to install Docker Desktop, Minikube or Kind, and Kubectl. I linked the official websites for you below:


**Docker Desktop** is an application for macOS, Linux, and Windows machines that enables us to build and share containerized applications and microservices.
Docker Desktop comes with a Graphical User Interface that lets us easily manage our containers, applications, and images directly from our machine. One advantage of Docker Desktop is that it comes with **Kubernetes** support, so we do not need to install Kubectl by ourselves. Another advantage of this tool is that it enables us to use local **Docker images** with **Kubernetes** without having to push it to a registry first that means that **Kubernetes** can create containers from images stored in the **Docker Engine image cache**. The only thing we need to do is to set `imagePullPolicy: IfNotPresent` in our Kubernetes yaml file. This ensures that the image from the local cache is going to be used.

[Docker Desktop](https://www.docker.com/products/docker-desktop/) <br/>

**Minikube** and **Kind** are both tools that enable us to create a local cluster to run Kubernetes on our local computer. Kind and Minikube require that you have  Docker installed. If you already have installed the Docker Desktop you do not have to worry about this requirement and you can proceed with Minikube or/and Kind installation.

[Minikube](https://minikube.sigs.k8s.io/docs/start/) or [Kind](https://kind.sigs.k8s.io/docs/user/quick-start/#installing-from-release-binaries)<br/>

### Installing Kind (PowerShell or Git Bash)
1. Download Kind: ```curl.exe -Lo kind-windows-amd64.exe https://kind.sigs.k8s.io/dl/v0.20.0/kind-windows-amd64```
2. Move it to some dir: ```.\kind-windows-amd64.exe c:\some-dir-in-your-PATH\kind.exe```
3. Create a cluster using ```kind.exe (or kind) create cluster```

(Optional) If you have installed Docker Desktop you can skip this step

[Kubeclt](https://kubernetes.io/docs/tasks/tools/)


## VSCODE extensions

For this project, I am using the following extensions:

* Docker
* Kubernetes
* Kubernetes Kind
* Makefile
* Python
* YAML

## Project tree structure 

```
- kubernetes
    |-- app.py # This is the Python application code.
    |-- Dockerfile # This is the Dockerfile used to build a Docker container for the application.
    |-- k8s.yml #  This is the Kubernetes configuration file for creating the application.
    |-- Makefile # This file contains build and deployment automation commands.
    |-- requirements.txt # This file lists the Python dependencies required for the application.
    |-- run_kubernetes.sh # This shell script is used to run the Kubernetes application.
```
  
### Some useful commands from Kubeclt

```bash
kubectl cluster-info - Verify kubectl configuration
kubectl version - Print the version of kubectl
kubectl get services - Verify services running
kubectl get pods - Verify all pods running
kubectl get pods -o wide - Verify more details about all pods running
kubectl apply -f <NAME>.yaml --namespace=<NAME> - Create a Pod
kubectl get pod <NAME> --namespace=<NAME> - Verify that the Pod is running
kubectl top pod <NAME> --namespace=<NAME> - Fetch the metrics for the Pod
kubectl delete pod <NAME> --namespace=<NAME> - Delete a Pod
kubectl describe pod <NAME> --namespace=<NAME> - View detailed information about the Pod
kubectl delete namespace <NAME> - Delete a namespace
```

### Some useful commands from Minikube

```bash
minikube version - Print the version of minikube
minikube start - Start minikube
minikube status - Check minikube status
```

### Some useful commands from Kind

```bash
kind --version - Print the version of kind
kind create cluster - Create a new local cluster
```

## Creating a Pod

**Note:**
> Make sure to replace all `<NAME>` placeholders with any name you want


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

Successful example

The following photo shows a successful Pod logs

![kubernetes](https://github.com/mathewsrc/python-cli-tool-with-docker-and-kubernetes/assets/94936606/5a04a67f-8f85-432a-b0ed-9a7352af7ae7)


