#!/bin/bash
#set -e
echo ""
echo -e "Pulling changes from the repo..."
cd /home/ubuntu/kubectl-ssh/yaml-files
echo ""
echo -e "List of running deployments"
deployment_name=`kubectl get deploy -o name -n=appnamespace`
echo $deployment_name
sleep 3
echo ""
echo -e "Executing YAML file..."
kubectl create -f $HOME/new-files/namespace.yaml
echo ""
kubectl create -f $HOME/new-files/deployment.yaml --record=true -f $HOME/new-files/service.yaml
echo ""
kubectl rollout status $deployment_name -n=appnamespace
echo ""
kubectl rollout history $deployment_name -n=appnamespace
echo ""
