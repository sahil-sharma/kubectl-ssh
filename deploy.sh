#!/bin/bash
set -e
echo ""
echo -e "SSHing to Kubeadm machine... and pulling the repo"
ssh -A -i /home/ubuntu/key ubuntu@18.218.172.238 "cd /home/ubuntu/ && git pull https://github.com/sahil-sharma/k8s-demo-app.git"
