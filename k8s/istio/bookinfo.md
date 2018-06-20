
# bookinfo 示例

Step 1 : Create Bookinfo services

` kubectl apply -f <(istioctl kube-inject -f samples/bookinfo/kube/bookinfo.yaml) `

Step 2 : Define ingress gateway

`istioctl create -f samples/bookinfo/routing/bookinfo-gateway.yaml`

Step 3 : Define ingress ip and ports for load balancer ingress gateway

```
export INGRESS_HOST=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
export INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http")].port}')
export SECURE_INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="https")].port}')


 export GATEWAY_URL=$INGRESS_HOST:$INGRESS_PORT
```

Step 4 : Delete It
` samples/bookinfo/kube/cleanup.sh `
> # 使用以下命令确定是否被删除
``` 
istioctl get gateway           #-- there should be no more gateway
istioctl get virtualservices   #-- there should be no more virtual services
kubectl get pods               #-- the Bookinfo pods should be deleted
```