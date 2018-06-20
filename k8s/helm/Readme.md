安装后k8s以及helm之后，使用`helm init`进行初始化
helm是客户端，tiler是服务端

https://daemonza.github.io/2017/02/20/using-helm-to-deploy-to-kubernetes/


FAQ:

1. [Error: no available release name found](https://github.com/kubernetes/helm/issues/3055)

```
kubectl create serviceaccount --namespace kube-system tiller
kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller
kubectl patch deploy --namespace kube-system tiller-deploy -p '{"spec":{"template":{"spec":{"serviceAccount":"tiller"}}}}'
```