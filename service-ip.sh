#!/bin/bash
minikube service list | grep -i mern-auth-service | awk '{ print $6 }'
