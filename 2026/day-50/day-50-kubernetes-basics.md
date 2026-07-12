# Day 50 – Kubernetes Architecture and Cluster Setup

## Task 1: Recall the Kubernetes Story

### 1. Why was Kubernetes created?

Docker can run containers, but managing hundreds of containers across multiple servers becomes difficult. Kubernetes helps automate container deployment, scaling, networking, recovery, and management.

### 2. Who created Kubernetes, and what was it inspired by?

Kubernetes was created by Google. It was inspired by Google’s internal container-management system called Borg.

### 3. What does Kubernetes mean?

Kubernetes comes from a Greek word meaning helmsman or pilot—the person who steers a ship. This is why the Kubernetes logo contains a ship’s steering wheel.

## Task 2: Kubernetes Architecture

While learning Kubernetes Architecture, I drew the architecture by hand to understand how each component communicates within the cluster.

### Kubernetes Architecture Diagram

![Kubernetes Architecture](./images/kubernetes-architecture.jpg)

### My Understanding

#### Control Plane

- API Server – Entry point for all Kubernetes requests.
- Scheduler – Decides which worker node should run a Pod.
- Controller Manager – Ensures the actual state matches the desired state.
- etcd – Stores the cluster configuration and state.

#### Worker Node (Data Plane)

- kubelet – Receives instructions from the API Server and manages Pods.
- kube-proxy (Service Proxy) – Handles networking between Pods and Services.
- Container Runtime – Runs the containers inside the Pods.

### Request Flow

1. User runs `kubectl apply -f deployment.yaml`
2. API Server receives the request.
3. Cluster state is stored in etcd.
4. Controller Manager checks the desired state.
5. Scheduler selects the best worker node.
6. kubelet starts the Pod using the container runtime.
7. kube-proxy enables communication between Pods and Services.
```bash