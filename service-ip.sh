#!/bin/bash
#export PATH2=$PATH2
/bin/sh -xe $PATH2 service list | grep -i mern-auth-service | awk '{ print $6 }'
#sh ("${path2} service list | grep -i ${feSvcName} | awk '{ print "${6}" }'")
