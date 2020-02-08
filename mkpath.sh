#!/bin/bash

path1=`whereis minikube`
path2=`echo $path1 | awk '{ print $2 }'`
echo "$path2"
