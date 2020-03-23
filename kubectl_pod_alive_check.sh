#!/bin/bash
read -p "What is the namespace? " nsvar
echo "$nsvar"
clear
ls -la $PWD
read -p "What is the name of the yaml file to be deployed?" yaml
clear
echo "$yaml"

#exists2=`kubectl get deployments -n $nsvar | grep -i $1 | awk '{ print $1 }'`


read -p "If it is a '<DEPLOYMENT>' press '[1]' for a '<POD>' press '[2]'" deppod

deppod () {
i=$1
for i in {1..2}
do
 if [[ $1 -eq "1" ]]; then
kubectl get deployments -n $2
read -p "Please enter the name of the deployment: " depvar
elif [[ $1 -eq "2" ]]; then
kubectl get pods -n $2
read -p "Please enter the name of the pod: " podvar
else
  echo "Please Enter a "1" for a Deployment or a "2" for a Pod" $(deppod)
fi
done
}

deppod $deppod $nsvar


deploy () {
#  return 55
  while [[ $1 -eq "1" || "2" ]]; do
    exists=`kubectl get deployments -n $2 | grep -i $3 | awk '{ print $1 }'`
    if [[ $exists == $3 ]]; then
      echo "Pod Already Exists, Deleting Previous Pod & Creating a New One..."
      kubectl delete deployment -n $2 $1 && kubectl create -f $4 -n $2
    elif [[ $exists != $3 ]]; then
      echo "Deployment does not Exist, Will Create Deployment..."
      kubectl create -f deployment $4 -n $2
    else
      pod $nsvar $podvar $deppod $file
   fi
 done
}

deploy $deppod $nsvar $depvar $file

pod () {
  exists=`kubectl get pods -n $1 | grep -i $2 | awk '{ print $1 }'`
  while [[ $3 == "2" ]]; do
    if [[ $exists == $2 ]]; then
      echo "Pod Already Exists, Deleting Previous Pod & Creating a New One..."
      kubectl delete pod $2 -n $1 && kubectl create -f $4 -n $1
    elif [[ $exists != $2 ]]; then
      echo "Deployment does not Exist, Will Create Deployment..."
      kubectl create -f deployment $4 -n $1
    else
      echo "Improper Value - Restarting the Script... " $(deploy)
   fi
done
}

#pod $nsvar $podvar $deppod $file


#while true; do
#read -p "If it is a '<DEPLOYMENT>' press '[1]' for a '<POD>' press '[2]'" $1
#while [[ "$1" -eq "1" ]]; do
#read -p "What is the name of the Deployment? " $2
#exists=`kubectl get pods -n $nsvar | grep -i $1 | awk '{ print $1 }'`
#file=`source "$PWD"/"$yaml"`
#if [[ $exists =~ '^'$2'*' ]]; then
#  echo "Pod does not Exist, Will Create Pod..."
#  kubectl create -f deployment $file -n $nsvar
#else
#  echo "Pod Already Exists, Deleting Previous Pod & Creating a New One..."
#  kubectl delete deployment <DEPLOYMENT> -n <NAMESPACE>
#  kubectl delete pod $exists -n $nsvar && kubectl create -f $file -n $nsvar
#fi




#while [[ "$1" -eq "1" | "2" ]]; do
#  read -p "What is the name of the Deployment? " $2
#  if [[ $exists =~ '^'$1'*' ]]; then
#    echo "Pod does not Exist, Will Create Pod..."
#    kubectl create -f deployment $file -n $nsvar
#  else
#    echo "Pod Already Exists, Deleting Previous Pod & Creating a New One..."
#    kubectl delete deployment $2 -n <NAMESPACE>
#    kubectl delete pod $exists -n $nsvar && kubectl create -f $file -n $nsvar
#  fi
#done



#case $1 in
#
#    1)
#    read -p "What is the name of the Deployment? " $2
#    ;;
#
#  Romania | Moldova)
#    echo -n "Romanian"
#    ;;
#
#  Italy | "San Marino" | Switzerland | "Vatican City")
#    echo -n "Italian"
#    ;;
#
#  *)
#    echo -n "unknown"
#    ;;
#esac

#exists=`kubectl get pods -n $nsvar | grep -i  | awk '{ print $1 }'`
#read -p "If it is a '<DEPLOYMENT>' press '[1]' for a '<POD>' press '[2]'" deppod

#deploy () {
#  read -p "If it is a '<DEPLOYMENT>' press '[1]' for a '<POD>' press '[2]'" deppod
#  while [[ "$deppod" -eq "1" ]]; do
#  read -p "What is the name of the Deployment? " $2
#  exists=`kubectl get pods -n $nsvar | grep -i $1 | awk '{ print $1 }'`
#  file=`source "$PWD"/"$3"`
#  if [[ $exists =~ '^'$2'*' ]]; then
#    echo "Pod does not Exist, Will Create Pod..."
#    kubectl create -f deployment $file -n $nsvar
#  else
#    echo "Pod Already Exists, Deleting Previous Pod & Creating a New One..."
#    kubectl delete deployment <DEPLOYMENT> -n <NAMESPACE>
#    kubectl delete pod $exists -n $nsvar && kubectl create -f $file -n $nsvar
#  fi
#done
#}


#read -p "What is the pod or deployment name?"
#OR
#./04_deployment_install.sh

#THIS SCRIPT IS USED TO CHECK IF YOUR POD IS CURRENTLY RUNNING

#MODIFY ACCORDINGLY TO NEEDS OF DEPLOYMENT OR POD SETUP

#FIRST CHECK IF POD EXISTS AND IS RUNNING
#exists=`kubectl get pods -n <NAMESPACE> | grep -i <POD_NAME> | awk '{ print $1 }'`

#FOR DEPLOYMENTS, COMMENT THE ABOVE LINE AND UNCOMMENT THE BELOW:
#exists=`kubectl get deployment -n <NAMESPACE> | grep -i <DEPLOYMENT> | awk '{ print $1 }'`

#if [ "$pod_exists" != "jenkins" ]
#if [[ ! $pod_exists =~ ^(jenkins*)$ ]]; then
#if [[ ! $pod_exists =~ /jenkins.*/g ]]; then
#if [[ $pod_exists =~ '^jenkins*' ]]; then
#  echo "Pod does not Exist, Will Create Pod..."
#else
#  echo "Pod Already Exists, Deleting Previous Pod..."
#  kubectl delete pod $pod_exists -n jenkins
#fi
#if [[ $exists =~ '^<POD_NAME>*' ]]; then
#  echo "Pod does not Exist, Will Create Pod..."
#  kubectl create -f <APPLICATION>-deployment.yaml -n <NAMESPACE>
  #OR
  #./04_deployment_install.sh
#else
#  echo "Pod Already Exists, Deleting Previous Pod & Creating a New One..."
#  kubectl delete deployment <DEPLOYMENT> -n <NAMESPACE>
#  kubectl delete pod $exists -n <NAMESPACE> && kubectl create -f <APPLICATION>-deployment.yaml -n <NAMESPACE>
#fi

#IF DESIRED FOR ENVIVONMENT VARIABLES, IF, SAY, PIPELINING, UNCOMMENT:
#export pod_exists=$pod_exists

#POD SETUP
#pod_exists=`kubectl get pods -n <NAMESPACE> | grep -i <POD_NAME> | awk '{ print $1 }'`
#if [[ $pod_exists =~ '^<POD_NAME>*' ]]; then
#  echo "Pod does not Exist, Will Create Pod..."
#  kubectl create -f <APPLICATION_POD_DEPLOY>.yaml
  #OR
  #./pods_install.sh
#else
#  echo "Pod Already Exists, Deleting Previous Pod & Creating a New One..."
#  kubectl delete pod $pod_exists -n <NAMESPACE> && kubectl create -f <APPLICATION_POD_DEPLOY>.yaml
#fi

#IF DESIRED FOR ENVIVONMENT VARIABLES, IF, SAY, PIPELINING, UNCOMMENT:
#export pod_exists=$pod_exists
