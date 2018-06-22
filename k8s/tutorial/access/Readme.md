
# Access Shell

* `kubectl create -f https://k8s.io/docs/tasks/debug-application-cluster/shell-demo.yaml`

* `kubectl exec -it shell-demo -- /bin/bash`

* `kubectl exec  shell-demo ls`

多于1个`container`的`pod`需要指定访问的容器
* `kubectl exec -it my-pod --container main-app -- /bin/bash`

# Access Services

step 1 :

配置基础认证的访问访问

* 
* `http://kubernetes_master_address/api/v1/namespaces/namespace_name/services/service_name[:port_name]/proxy`




# Resources
* [Kubectl Exec Command](https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands#exec)