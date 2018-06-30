Pull from private registry

pre : 搭建一个Private Registry  参见我在这里写的 https://gist.github.com/mylamour/dbc63d1901a39e084c500aa9747ea40e

step1 : 创建一个k8s对docker的授权密码

`kubectl create secret docker-registry regcred --docker-server=api.useast1.k8s.btcc.shop --docker-username=admin --docker-password=admin --docker-email=mour.zhao@btcc.com`

step2 : 

`kubectl get secret regcred -o yaml`

step3 : 配置配置文件

```
 apiVersion: v1
 kind: Pod
 metadata:
   name: kankan
 spec:
   containers:
   - name: private-reg-container
     image: api.useast1.k8s.btcc.shop/shawanyi:wanwan
   imagePullSecrets:
   - name: regcred
```

step4 : 创建

`kubectl create -f my-private-reg-pod.yaml`



Note:

* 注意修改Docker的用户名密码
* 还会有一个问题就是之前出现的http: server gave HTTP response to HTTPS client的问题，这是insecure registry的问题，需要在每台节点上设置，可以ssh上去对每台机器进行设置允许，也可以通过kops进行更新

