#!/bin/bash
set -e
echo ""
echo -e "SSHing to Kubeadm machine... and executing kubectl"
ssh -i /home/ubuntu/key -o StrictHostKeyChecking=no ubuntu@3.16.137.79 "cd /home/ubuntu/code/kubectl-ssh && git pull https://github.com/sahil-sharma/kubectl-ssh.git && bash /home/ubuntu/code/kubectl-ssh/yaml-files/start.sh"
