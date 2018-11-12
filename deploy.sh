#!/bin/bash
set -e
echo ""
echo -e "SSHing to Kubeadm machine... and executing kubectl"
ssh -i /home/ubuntu/key -o StrictHostKeyChecking=no ubuntu@18.218.172.238 "bash /home/ubuntu/start.sh"
#ssh -i /home/ubuntu/key -o StrictHostKeyChecking=no ubuntu@18.218.172.238 "cd /home/ubuntu/ && git pull https://github.com/sahil-sharma/k8s-demo-app.git"
