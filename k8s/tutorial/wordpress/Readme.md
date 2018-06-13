# Question

- [ ] `create -f` 和 `apply -f` 的区别是什么?
- [ ] `tier` 代表的是什么?

创建密码
* `kubectl create secret generic mysql-pass --from-literal=password=TESTSQL`

创建持久卷
* `kubectl create -f mysql-deployment.yaml`

查看持久卷
* `kubectl get pvc`