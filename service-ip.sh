#!/bin/bash
#export PATH2=$PATH2
exec $PATH2 service list | grep -i "${feSvcName}" | awk '{ print $6 }'  > "${feSvcName}"
#sh ("${path2} service list | grep -i ${feSvcName} | awk '{ print "${6}" }'")
