
创建Config Map的方式

方式1：
* `kubectl create configmap game-config --from-file=./`

方式2:
* `kubectl create configmap game-config-2 --from-file=./game.properties --from-file=./ui.properties`


方式3:
* 
```
kubectl create configmap config-multi-env-files \
--from-env-file=./game-env-file.properties \
--from-env-file=./ui-env-file.properties
```

* `kubectl get configmaps config-multi-env-files -o yaml`
* `kubectl describe configmaps game-config`
* `kubectl delete configmap game-config-2`