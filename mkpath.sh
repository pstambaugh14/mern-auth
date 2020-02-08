#!/bin/bash

PATH1=`whereis minikube`
PATH2=`echo $PATH1 | awk '{ print $2 }' | sed 's/minikube//g'`
echo "$PATH2"


#node {
#  withEnv(['MK_HOME=${PATH2}']) {
#    sh '$MK_HOME/minikube service list | grep -i "${feSvcName}" | awk '{ print $6 }'  > "${feSvcName}"'
#  }
#}
