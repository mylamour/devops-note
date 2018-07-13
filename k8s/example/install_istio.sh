#!/bin/bash

# kubectl delete namespaces $workenv

workenv="prod"
istio="istio.zip"

# check tiller 
kubectl get serviceaccount tiller --namespace kube-system

if [ $? -eq 0 ]
then
	echo "Tiller Was Enabled"
else
#kubectl init remote tiller
	kubectl create serviceaccount --namespace kube-system tiller
	kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller
	kubectl patch deploy --namespace kube-system tiller-deploy -p '{"spec":{"template":{"spec":{"serviceAccount":"tiller"}}}}'
fi

# Download istio-master 
if [ -f "$istio" ]
then
	echo "$istio Downloaded"
else
	echo "$istio Download Failed, Script Will Exit"
    wget https://github.com/istio/istio/archive/master.zip -O $istio
fi

unzip $istio && cd istio-master

# Create NameSpace And Install istio Use Helm With Automatic Sidecar Injection
echo "Istio Was Ready For Install"
echo "Step 1 : Generator Config Yaml"
helm template install/kubernetes/helm/istio --name $workenv --namespace $workenv > /tmp/istio.yaml

echo "Step 2 : Kubectl Create NameSpace"
kubectl create namespace $workenv

echo "Step 3 : Apply Config Yaml"
kubectl create -f /tmp/istio.yaml

echo "Step 4 : Enable Addone Grafana"
wget https://pastebin.com/raw/VhFzRSMA -O /tmp/grafana.yaml
sed -i '' "s/istio-system/$workenv/" /tmp/grafana.yaml	#Notice: macos without g in s///g
kubectl apply -f /tmp/grafana.yaml --namespace=$workenv

echo "Step 5 : Forward Services To localhost"
kubectl -n $workenv port-forward $(kubectl -n $workenv get pod -l app=grafana -o jsonpath='{.items[0].metadata.name}') 3000:3000 &
kubectl -n $workenv port-forward $(kubectl -n $workenv get pod -l app=prometheus -o jsonpath='{.items[0].metadata.name}') 9090:9090 &
# kubectl -n $workenv port-forward $(kubectl -n $workenv get pod -l app=servicegraph -o jsonpath='{.items[0].metadata.name}') 8088:8088 &


echo "Notice: "
echo "You can access prometheus from http://localhost:9090"
echo "You can access grafana from http://localhost:3000"kubectl -n $workenv port-forward $(kubectl -n $workenv get pod -l app=grafana -o jsonpath='{.items[0].metadata.name}') 3000:3000 &
kubectl -n $workenv port-forward $(kubectl -n $workenv get pod -l app=prometheus -o jsonpath='{.items[0].metadata.name}') 9090:9090 &
# kubectl -n $workenv port-forward $(kubectl -n $workenv get pod -l app=servicegraph -o jsonpath='{.items[0].metadata.name}') 8088:8088 &


echo "Notice: "
echo "You can access prometheus from http://localhost:9090"
echo "You can access grafana from http://localhost:3000"
# echo "You can access services graph from http://localhost:"
