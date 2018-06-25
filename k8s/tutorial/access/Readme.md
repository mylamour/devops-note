
# Access Shell

* `kubectl create -f https://k8s.io/docs/tasks/debug-application-cluster/shell-demo.yaml`

* `kubectl exec -it shell-demo -- /bin/bash`

* `kubectl exec  shell-demo ls`

多于1个`container`的`pod`需要指定访问的容器
* `kubectl exec -it my-pod --container main-app -- /bin/bash`

# Access Services

step 1 :

配置基础认证的访问访问,通过`kubectl config view`就可以看到了Basic Auth了。然后访问对应的服务即可。

* `http://kubernetes_master_address/api/v1/namespaces/namespace_name/services/service_name[:port_name]/proxy`
> `https://api.useast1.k8s.btcc.shop/api/v1/namespaces/default/services/cloying-chicken-grafana:80/proxy/login`

> 坑爹，dashboard中复制到的密码，多了个空格浪费了半天时间。

# Ambassador

* 
    ``` 
    kubectl cluster-info dump --namespace kube-system | grep authorization-mode
    kubectl apply -f https://getambassador.io/yaml/ambassador/ambassador-rbac.yaml  
    ```




# Resources
* [Kubectl Exec Command](https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands#exec)