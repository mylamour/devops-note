Simple demo from k8s doc

# Step by step

* step1 : config kubectl with minikube
    `cd demo/v1`
    `./build.sh`
    `kubectl config use-context minikube`

* step2 : start minikube and open dashboard 
    `minikube start`
    `minikube dashboard`

* step3 : create deployments
    `kubectl run he --image=he:v1 --port=8080`

* step4 : create service
    `kubectl expose deployment he --type=LoadBalancer`

* step5 : update app 
    `cd demo/v2`
    `./build.sh`
    `kubectl set image deployment/he he=he:v2`
    `minikube service he`


# Other

* Get Docker Env
`minikube docker-env`
* Get Events
`kubectl get events`
* Get Pods
`kubectl get pods`
* Get Logs
`kubectl logs podsname`
* Get Services
`kubectl get services`
* Get Config
`kubectl config view`
* Get Deployments
`kubectl get deployments`
* Get Addons
`minikube addons list`
* Enable Addons
`minikube addons enable heapster`
* Open Addons
`minikube addons open heapster`
* Delete And Stop
`minikube stop && minikube delete`
