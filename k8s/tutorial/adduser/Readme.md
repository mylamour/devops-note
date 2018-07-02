https://stackoverflow.com/questions/42170380/how-to-add-users-to-kubernetes-kubectl

step1 :

`kubectl create sa alice`

step2 :

`kubectl get sa alice`

step3 : 根据第二部得到的token名

`kubectl get secert xxxxx -o json | jq -r '.data["ca.crt"]' | base64 -D > ca.crt`

step4: 得到token

`kubectl get secret xxxxx -o json | jq -r '.data["token"]' | base64 -D`

step5: 在新机器上恢复

```
kubectl config set-cluster cluster-staging \
  --embed-certs=true \
  --server=$endpoint \
  --certificate-authority=./ca.crt
```

`kubectl config set-credentials alice-staging --token=$user_token`


```
kubectl config set-context alice-staging \
  --cluster=cluster-staging \
  --user=alice-staging \
  --namespace=alice

```

`kubectl config use-context alice-staging`