# Config use minikube
kubectl config use-context minikube

kubectl cluster-info

# Create Depolyment
kubectl run he --image=he:v1 --port=8080


# Create Services
kubectl expose deployment he --type=LoadBalancer

# Get Services
kubectl get services

# Get Event
kubectl get events

# Get Pods
kubectl get pod

# Get Logs
kubectl logs podname


# Start kubernets services
minikube service he

# Update your app

kubectl set image deployment/he he=he:v2

# Start Services
minikube service he

# List Addone
minikube addons list

# Enable Addone
minikube addons enable heapster

# OPen Addone
minikube addons open heapster

# Resources
* [kubectl cheatsheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/)
