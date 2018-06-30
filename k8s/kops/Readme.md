Use Kops to Create Cluster  
(https://kubernetes.io/docs/setup/custom-cloud/kops/)

# TODO

- [ ] KOPS控制扩容
- [ ] KOPS相关的操作


# Cheatsheet

创建运行
* `brew upgrade kops`
* `aws s3 mb s3://k8s.btcc.shop`
* `export KOPS_STATE_STORE=s3://k8s.btcc.shop`
* `kops create cluster --zones=us-east-1c useast1.k8s.btcc.shop --ssh-public-key ~/.ssh/id_rsa.pub  `
* `kops update cluster useast1.k8s.btcc.shop --yes`

创建高可用集群(多主节点, master在aws一个可用zone内可以跨区)

* 
```
    kops create cluster \
    --node-count 3 \
    --zones us-west-2a,us-west-2b,us-west-2c \
    --master-zones us-west-2a,us-west-2b,us-west-2c \
    --node-size t2.medium \
    --master-size t2.medium \
    --topology private \
    --networking kopeio-vxlan \
    hacluster.example.com

```

* 
```
kops create cluster \
    --node-count 3 \
    --zones us-west-2a,us-west-2b,us-west-2c \
    --master-zones us-west-2a,us-west-2b,us-west-2c \
    --dns-zone example.com \
    --node-size t2.medium \
    --master-size t2.medium \
    --node-security-groups sg-12345678 \
    --master-security-groups sg-12345678,i-abcd1234 \
    --topology private \
    --networking weave \
    --cloud-labels "Team=Dev,Owner=John Doe" \
    --image 293135079892/k8s-1.4-debian-jessie-amd64-hvm-ebs-2016-11-16 \
    ${NAME}
```


查看集群
* `kops export kubecfg useast1.k8s.btcc.shop         # Export kops config use kubectl`
* `kubectl config use-context useast1.k8s.btcc.shop`
* `kops validate cluster` 
* `kubectl get nodes --show-labels`

更新ssh key通过ssh访问

* `kops delete secret --name useast1.k8s.btcc.shop sshpublickey admin`
* `kops create secret --name useast1.k8s.btcc.shop sshpublickey admin -i ~/.ssh/id_rsa.pub`
* `kops update cluster --yes`
* `kops rolling-update cluster --name useast1.k8s.btcc.shop --yes #此刻就可以通过自己的秘钥去连接服务器了,操作的过程实质是关闭了原来的服务器。启动了个新的一样的服务器。`

得到密钥访问Kubectl Proxy

* `kubectl describe secret`
>   export KUBECONFIG=$KUBECONFIG:$HOME/.kube/config
    并通过该网址进行访问 http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/#!/login

* `kops get secrets admin -oplaintext`

更改然后更新
* `kops edit cluster useast1.k8s.btcc.shop`
```
spec:
    maxSize: 7
    minSize: 3
    role: Node 
```
* ` kops edit ig --name useast1.k8s.btcc.shop node`
* `kops edit ig nodes useast1.k8s.btcc.shop`
* `kops create cluster --zones=us-east-1c useast1.k8s.btcc.shop --node-count 5`
* `kops update cluster --yes`

删除K8s集群
* `kops delete cluster useast1.k8s.btcc.shop --yes`

导出配置到kubectl
* `kops export kubecfg useast1.k8s.btcc.shop`

得到Token用于访问UI
* `kops get secrets admin -oplaintext`

绑定一个外部IP
* `kops create cluster --zones=us-east-1c useast1.k8s.btcc.shop --associate-public-ip=true`
* `kops update cluster --yes`
* `kops rolling-update cluster --yes`

配置使用Insecure Registry
* 编辑cluster的配置,`kops edit cluster`

```
spec:
   docker:
     insecureRegistry: "api.useast1.k8s.btcc.shop"
     logDriver: json-file
```
* 然后update
```
kops update cluster useast1.k8s.btcc.shop --yes
kops rolling-update cluster --yes
```

# Resources

* [aws with kops](https://github.com/kubernetes/kops/blob/master/docs/aws.md)
* [kops HA](https://github.com/kubernetes/kops/blob/master/docs/high_availability.md)