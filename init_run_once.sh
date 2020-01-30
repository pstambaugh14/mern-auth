#!/bin/bash
###Run This Script Once to Initialize K8S Environment for Deployment###

kubectl apply -f ./k8s/namespace/namespace-dev.json
kubectl apply -f ./k8s/services/service.yaml
kubectl apply -f ./k8s/volumes/pv-volume.yaml
kubectl apply -f ./k8s/volumes/pv-claim.yaml
/home/patrick/Apps2/mern-auth/config/configMap_create.sh
