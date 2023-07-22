setup:
	@echo "Setting up virtual environment"
	python -m venv .env

install:
	@echo "Installing dependencies"
	pip install --upgrade pip  &&\
		pip install -r requirements.txt

format:
	black *.py

lint:
	pylint --disable=R,C *.py

docker-build:
	@echo "Building Docker container"
	docker build -t myapp .

docker-run:
	@echo "Starting Docker container"
	docker run -it myapp python app.py split train test

kube-local-docker:
	@echo "Starting minikube"
	minikube start
	@echo "Deleting Pod if it exists"
	kubectl delete pod myapp
	@echo "Pointing the local Docker daemon to the minikube internal Docker registry"
	eval $(minikube -p minikube docker-env)
	@echo "Creating image myapp"
	docker build -t myapp:latest .
	@echo "Creating Pod"
	kubectl apply -f k8s.yml

pod-logs:
	@echo "Checking Pod logs"
	kubectl logs myapp

pod-status:
	@echo "Status"
	kubectl get pods -o wide

all: install format lint