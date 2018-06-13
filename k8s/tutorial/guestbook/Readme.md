# Question

- [ ] 为什么先`kubectl apply -f redis-master-deployment.yaml` 然后才 `kubectl apply -f redis-master-services.yaml `

- [ ] RC 与 RS 的区别


# Step

* `kubectl apply -f redis-master-deployment.yaml`
* `kubectl apply -f redis-master-services.yaml `
* `kubectl apply -f redis-slave-deployment.yaml `
* `kubectl apply -f redis-slave-services.yaml `
* `kubectl apply -f frontend-deployment.yaml `
* `kubectl apply -f frontend-service.yaml`

扩展（增加/减少）
* `kubectl scale deployment frontend --replicas=5`
* `kubectl scale deployment frontend --replicas=2`

查看log,rc,rs
* `kubectl describe service frontend`
* `kubectl describe replicaset`
* `kubectl describe replicationcontroller`

暴露
* `kubectl expose deployment frontend --type=LoadBalancer --name=guestbook-load-balances     #如果没有外部IP,即可通过分配的elb地址访问`
* `kubectl expose rc frontend --port 80 --target-port=8000 --type=LoadBalancer`

删除 services, deployment
* `kubectl delete services xxx`
* `kubectl delete deployment xxx`

查看环境变量,DNS等
* `kubectl exec frontend-67f65745c-6mzqd -- printenv | grep SERVICE`
* `kubectl get services kube-dns --namespace=kube-system`