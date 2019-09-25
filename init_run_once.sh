#!/bin/bash
###Run This Script Once to Initialize K8S Environment for Deployment###

kubectl apply -f ./k8s/namespace/namespace-dev.json
kubectl apply -f ./services/service.yaml
kubectl apply -f ./volumes/pv-volume.yaml
kubectl apply -f ./pv-claim.yaml
