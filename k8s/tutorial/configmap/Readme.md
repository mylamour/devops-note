ConfigMap:

The ConfigMap API resource stores configuration data as key-value pairs. The data can be consumed in pods or provide the configurations for system components such as controllers. 

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

然后创建pod的时候引用自设置配置来自ConfigMap， 下面示例来自官网文档：

Step1 :

```
   apiVersion: v1
   kind: ConfigMap
   metadata:
     name: special-config
     namespace: default
   data:
     SPECIAL_LEVEL: very
     SPECIAL_TYPE: charm
```

Step2 ：

```
apiVersion: v1
kind: Pod
metadata:
    name: dapi-test-pod
spec:
    containers:
    - name: test-container
        image: k8s.gcr.io/busybox
        command: [ "/bin/sh", "-c", "env" ]
        envFrom:
        - configMapRef:
            name: special-config
    restartPolicy: Never
```

如果ConfigMap引用了不存在的ConfigMap，就会导致POD无法启动。