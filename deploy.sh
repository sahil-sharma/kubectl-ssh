#!/bin/bash
set -e
echo ""
echo -e "SSHing to Kubeadm machine... and executing kubectl"
ssh -i /home/ubuntu/key -o StrictHostKeyChecking=no ubuntu@18.218.172.238 "cd /home/ubuntu/code/kubectl-ssh && git pull https://github.com/sahil-sharma/kubectl-ssh.git"
kubectl create -f /home/ubuntu/code/kubectl-ssh/yaml-files/
