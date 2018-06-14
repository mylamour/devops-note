# Todo

- [ ] 增加插件
- [ ] 滚动升级 
- [ ] 监控系统
- [ ] Service Mesh

# Cheatsheet

Config
* `kubectl config use-context minikube`
* `kubectl cluster-info`
* `kubectl config view`

Create Depolyment
* `kubectl run he --image=he:v1 --port=8080`
* `kubectl create -f https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/recommended/kubernetes-dashboard.yaml   # Create Dashboard UI `
* `kubectl create -f https://raw.githubusercontent.com/kubernetes/kops/master/addons/monitoring-standalone/v1.7.0.yaml        # Create Monitoring  `  

Expose Services
* `kubectl expose deployment he --type=LoadBalancer`
* `kubectl expose deployment nginx-deployment --type=LoadBalancer --name=nginx-load-balances`

Get Services
* `kubectl get services`

Get Event
* `kubectl get events`

Get Pods
* `kubectl get pod`

Get Logs
* `kubectl logs podname`

Start kubernets services
* `minikube service he`

Update your app
* `kubectl set image deployment/he he=he:v2`

Start Services
* `minikube service he`

List Addone
* `minikube addons list`

Enable Addone
* `minikube addons enable heapster`

OPen Addone
* `minikube addons open heapster`

# Resources
* [kubectl cheatsheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/)
* [kops with terraform](https://github.com/kubernetes/kops/blob/master/docs/terraform.md)