# Config
* `kubectl config use-context minikube`
* `kops export kubecfg useast1.k8s.btcc.shop         # Export kops config use kubectl`
* `kubectl cluster-info`
* `kubectl config show`

# Create Depolyment
* `kubectl run he --image=he:v1 --port=8080`
* `kubectl create -f https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/recommended/kubernetes-dashboard.yaml   # Create Dashboard UI `

# Get Secert
* `kubectl describe secret`
>   export KUBECONFIG=$KUBECONFIG:$HOME/.kube/config
    并通过该网址进行访问 http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/#!/login

* `kops get secrets admin -oplaintext`
*  `kops get secrets kube --type secret -oplaintext         # 需要提前设置KOPS_STATE_STORE`

# Expose Services
* `kubectl expose deployment he --type=LoadBalancer`
* `kubectl expose deployment nginx-deployment --type=LoadBalancer --name=nginx-load-balances`


# Get Services
* `kubectl get services`

# Get Event
* `kubectl get events`

# Get Pods
* `kubectl get pod`

# Get Logs
* `kubectl logs podname`


# Start kubernets services
* `minikube service he`

# Update your app

* `kubectl set image deployment/he he=he:v2`

# Start Services
* `minikube service he`

# List Addone
* `minikube addons list`

# Enable Addone
* `minikube addons enable heapster`

# OPen Addone
* `minikube addons open heapster`

# Resources
* [kubectl cheatsheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/)
* [kops with terraform](https://github.com/kubernetes/kops/blob/master/docs/terraform.md)