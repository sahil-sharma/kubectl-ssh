#!/bin/bash
#set -e
pwd
sleep 10
cd $HOME/kubectl-ssh/yaml-files
pwd
sleep 10
echo -e "List of running deployments"
deployment_name=`kubectl get deploy -o name -n=dev`
echo $deployment_name
if [ -z "$deployment_name" ]; then
   echo "Sorry no deployment so far..."
fi
sleep 3
echo ""
echo -e "Looking for YAML files..."
echo ""
sleep 3
echo -e "Executing YAML file..."
kubectl apply -f $HOME/kubectl-ssh/yaml-files/namespace.yaml
sleep 3
kubectl apply -f $HOME/kubectl-ssh/yaml-files/deployment.yaml --record=true -f $HOME/kubectl-ssh/yaml-files/service.yaml -f $HOME/kubectl-ssh/yaml-files/configmap.yaml
sleep 3
echo ""
if [ -z "$deployment_name" ]; then
   #echo "There is no such deployment for this application"
   exit
else
   deployment_name=`kubectl get deploy -o name -n=appnamespace`
   kubectl rollout status $deployment_name -n=appnamespace
   echo ""
   kubectl rollout history $deployment_name -n=appnamespace
   echo ""
   echo -e "Final set of running deployments are as... :"
   kubectl get deploy -o name -n=appnamespace
   echo ""
   sleep 3
fi

