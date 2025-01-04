name: CI/CD Pipeline

on:
  push:
    branches:
      - main
  pull_request:
    branches:
      - main

jobs:
  build-and-deploy:
    name: Build and Deploy
    runs-on: ubuntu-latest

    steps:
    # Step 1: Checkout the repository
    - name: Checkout Code
      uses: actions/checkout@v3

    # Step 2: Set up Docker (optional if Kubernetes is used)
    - name: Set up Docker
      uses: docker/setup-buildx-action@v2

    # Step 3: Deploy with Docker Compose
    - name: Start Services with Docker Compose
      run: |
        docker-compose up -d
        docker ps

    # Step 4: Deploy to Kubernetes (if applicable)
    - name: Set up kubectl
      run: |
        curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
        chmod +x kubectl
        sudo mv kubectl /usr/local/bin/

    - name: Deploy to Kubernetes
      run: |
        kubectl apply -f k8s/timescaledb-deployment.yaml
        kubectl apply -f k8s/minio-deployment.yaml
        kubectl apply -f k8s/grafana-deployment.yaml

    # Step 5: Verify Deployment
    - name: Verify Kubernetes Deployment
      run: |
        kubectl get pods
        kubectl get services
