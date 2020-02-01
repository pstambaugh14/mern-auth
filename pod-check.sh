#!/bin/bash

export "CaCertPath"="/home/patrick/.minikube/certs/ca.pem"
export "ServerCertPath"="/home/patrick/.minikube/machines/server.pem"
export "ClientCertPath"="/home/patrick/.minikube/certs/cert.pem"

pod_exists=`kubectl get pods -n development | grep -i mern-auth | awk '{ print $1 }'`

if [ "$pod_exists" != "mern-auth" ]
then 
  echo "Pod does not Exist, Will Create Pod..."
else
  echo "Pod Already Exists, Deleting Previous Pod..."
  kubectl delete pod mern-auth -n development
fi
