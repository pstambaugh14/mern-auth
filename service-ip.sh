#!/bin/bash
$path2/minikube service list | grep -i $fwSvcName | awk '{ print $6 }'
#sh ("${path2} service list | grep -i ${feSvcName} | awk '{ print "${6}" }'")
