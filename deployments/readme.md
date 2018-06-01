`kubectl create -f  https://raw.githubusercontent.com/kubernetes/website/master/content/en/docs/concepts/workloads/controllers/nginx-deployment.yaml`

`kubectl get rs`

`kubectl rollout status deployment/nginx-deployment`

`kubectl set image deployment/nginx-deployment nginx=nginx:1.9.1`

`kubectl edit deployment/nginx-deployment`

`kubectl describe deployment`

* Get History
`kubectl rollout history deployment/nginx-deployment --revision=2`

* Scale Deployment
`kubectl scale deployment nginx-deployment --replicas=10`

* AutoScale Deployment
`kubectl autoscale deployment nginx-deployment --min=10 --max=15 --cpu-percent=80`

* Rollout Stop
`kubectl rollout pause deployment/nginx-deployment`
`kubectl rollout pause deployment nginx-deployment`


* Rollout Update Image
`kubectl set image deploy/nginx-deployment nginx=nginx:1.9.1`

* Update many resources
`kubectl set resources deployment nginx-deployment -c=nginx --limits=cpu=200m,memory=512Mi
deployment "nginx-deployment" resource requirements updated`


