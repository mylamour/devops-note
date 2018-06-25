端口转发


1. 转发 weave dashboard
``` 
kubectl port-forward -n weave "$(kubectl get -n weave pod --selector=weave-scope-component=app -o jsonpath='{.items..metadata.name}')" 4040  
```

2. 转发grafana

```
 kubectl -n istio-system port-forward $(kubectl -n istio-system get pod -l app=grafana -o jsonpath='{.items[0].metadata.name}') 3000:3000 
```


3. 转发redis 以及其他常规用法 

* `kubectl port-forward redis-master-585798d8ff-ngbb8 6379:6379`
* `kubectl port-forward pods/redis-master-585798d8ff-ngbb8 6379:6379`
* `kubectl port-forward deployment/redis-master-585798d8ff-ngbb8 6379:6379`
* `kubectl port-forward svc/redis-master 6379:6379`
* `kubectl port-forward rs/redis-master 6379:6379`
