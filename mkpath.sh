#!/bin/bash

MINI1=`whereis minikube`
MINI2=`echo $MINI1 | awk '{ print $2 }' | sed 's/minikube//g'`
echo "$MINI2"
