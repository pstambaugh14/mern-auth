#!/bin/bash
#export PATH2=$PATH2
exec $MINI2 service list | grep -i "${feSvcName}" | awk '{ print $6 }'  > "${feSvcName}"
#sh ("${path2} service list | grep -i ${feSvcName} | awk '{ print "${6}" }'")
#'"${MK_HOME}"/minikube service list | grep -i "${feSvcName}" | awk '{ print "\$6" }'  > "${feSvcName}"'
