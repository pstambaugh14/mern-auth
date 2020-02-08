#!/bin/bash

PATH1=`whereis minikube`
PATH2=`echo $PATH1| awk '{ print $2 }'`
echo "$PATH2"
