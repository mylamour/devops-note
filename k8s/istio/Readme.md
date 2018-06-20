kubectl apply -f <(istioctl kube-inject -f samples/sleep/sleep.yaml)


# Start K8s with Minikube

* ```
minikube start \
    --extra-config=controller-manager.cluster-signing-cert-file="/var/lib/localkube/certs/ca.crt" \
    --extra-config=controller-manager.cluster-signing-key-file="/var/lib/localkube/certs/ca.key" \
    --extra-config=apiserver.admission-control="NamespaceLifecycle,LimitRanger,ServiceAccount,PersistentVolumeLabel,DefaultStorageClass,DefaultTolerationSeconds,MutatingAdmissionWebhook,ValidatingAdmissionWebhook,ResourceQuota" \
    --kubernetes-version=v1.10.0
    ```

# Install with Helm


* ` helm template install/kubernetes/helm/istio --name istio --namespace istio-system > $HOME/istio.yaml `

* ` kubectl create namespace istio-system ` 

* ` kubectl create -f $HOME/istio.yaml `


# Uninstall

* ` kubectl delete -f $HOME/istio.yaml `
* ``` 
    helm delete --purge istio 
    #or
    kubectl -n istio-system delete job --all
    # if helm version less than 2.9.0
```