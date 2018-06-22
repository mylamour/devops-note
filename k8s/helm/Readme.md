安装后k8s以及helm之后，使用`helm init`进行初始化
helm是客户端，tiler是服务端,所以还需要安装一个tiler,详细查看FAQ

https://daemonza.github.io/2017/02/20/using-helm-to-deploy-to-kubernetes/

常用操作
```
helm search
helm search mysql
helm inspect mysql
helm inspect values stable/mariadb

helm install stable/mariadb
helm install -f config.yaml stable/mariadb  # Your  Local Config File To Do This Thing

helm lint
helm package foldername --debug
helm install foldername.tar.gz
helm install https://example.com/charts/foo-1.2.3.tgz

helm repo update
helm repo list
helm repo add dev http://example.com


helm install foldername.tar.gz --debug
helm ls 
helm ls -a
helm ls --deleted
helm delete xxxx


helm plugin install https://github.com/technosophos/helm-template

```

# FAQ:

1. [Error: no available release name found](https://github.com/kubernetes/helm/issues/3055)

```
kubectl create serviceaccount --namespace kube-system tiller
kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller
kubectl patch deploy --namespace kube-system tiller-deploy -p '{"spec":{"template":{"spec":{"serviceAccount":"tiller"}}}}'
```

2. Repo update之后还是无法安装，可能是因为没有加stable
```
    helm install heapster           不可以
    helm install stable/heapster    可以

```


# Resources

* [The Chart Best Practice](https://docs.helm.sh/chart_best_practices/#the-chart-best-practices-guide)

