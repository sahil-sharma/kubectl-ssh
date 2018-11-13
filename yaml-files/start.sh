#!/bin/bash
#set -e
echo ""
cd /home/ubuntu/code/kubectl-ssh/yaml-files
echo ""
echo -e "List of running deployments"
deployment_name=`kubectl get deploy -o name -n=appnamespace`
echo $deployment_name
if [ -z "$deployment_name" ]; then
   echo "Sorry no deployment so far..."
   exit
fi
sleep 3
echo ""
echo -e "Executing YAML file..."
kubectl apply -f $HOME/new-files/namespace.yaml
echo ""
kubectl apply -f $HOME/new-files/deployment.yaml --record=true -f $HOME/new-files/service.yaml
echo ""
if [ -z "$deployment_name" ]; then
   #echo "There is no such deployment for this application"
   exit
else
   kubectl rollout status $deployment_name -n=appnamespace
   echo ""
   kubectl rollout history $deployment_name -n=appnamespace
   echo ""
   echo -e "Final set of running deployments are as... :"
   kubectl get deploy -o name -n=appnamespace
   echo ""
fi
