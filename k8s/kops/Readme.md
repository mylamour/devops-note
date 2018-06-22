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
* `kops rolling-update cluster`

# Resources

* [AWS KOPS](https://github.com/kubernetes/kops/blob/master/docs/aws.md)