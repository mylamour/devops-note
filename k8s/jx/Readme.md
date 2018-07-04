
使用jx构建CI/CD k8s
https://github.com/jenkins-x/jx


 `jx create cluster aws`
在中间的过程会弹出框，然后记下jenkins-x的token值在终端填进去


`jx get activity -f exchange-app -w`

查看build的log记录
`jx get build logs mylamour/exchange-app/master`


```
jx get activity -f exchange-app -w
jx get build logs mylamour/exchange-app/master
jx console
jx get pipelines
jx get applications
```