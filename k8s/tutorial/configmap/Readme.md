
创建Config Map的方式

方式1： 自文件夹
* `kubectl create configmap game-config --from-file=./`

方式2:  自文件
* `kubectl create configmap game-config-2 --from-file=./game.properties --from-file=./ui.properties`


方式3: 自`env`文件
* 
```
kubectl create configmap config-multi-env-files \
--from-env-file=./game-env-file.properties \
--from-env-file=./ui-env-file.properties
```

方式4: 自键值对
* `kubectl create configmap special-config --from-literal=special.how=very --from-literal=special.type=charm`



* `kubectl get configmaps config-multi-env-files -o yaml`
* `kubectl describe configmaps game-config`
* `kubectl delete configmap game-config-2`


ConfigMap用于创建并定义POD内的相关变量，已经卷等设置。