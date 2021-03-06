#!/bin/bash
pod_exists=`kubectl get pods -n development | grep -i mern-auth | awk '{ print $1 }'`

if [ "$pod_exists" = "mern-auth" ]
then
  echo "Pod Already Exists, Deleting Previous Pod..."
  kubectl delete pod mern-auth -n development
else
  echo "Pod does not Exist, Will Create Pod..."
fi
