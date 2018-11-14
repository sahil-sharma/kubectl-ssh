#!/bin/bash
#set -e
cd $HOME/kubectl-ssh/yaml-files
echo -e "List of running deployments"
deployment_name=`kubectl get deploy -o name -n=development`
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
deployment_name=`kubectl get deploy -o name -n=development`
kubectl rollout status $deployment_name -n=development
echo ""
kubectl rollout history $deployment_name -n=development
echo ""
echo -e "Final set of running deployment and pod are as..."
kubectl get deploy -o name -n=development
echo ""
kubectl get po -o name -n=development
sleep 3

