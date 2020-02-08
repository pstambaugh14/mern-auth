#!/bin/bash

MINI1=`whereis minikube`
MINI2=`echo $MINI1 | awk '{ print $2 }' | sed 's/minikube//g'`
export $MINI2

verify=`echo $MINI2`
if $verify="/usr/local/bin/minikube"
then 'export $MINI2'
else
  break;;
fi
