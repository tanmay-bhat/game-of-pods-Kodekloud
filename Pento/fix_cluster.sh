#!/bin/bash
echo "=============================================="
echo "Fixing kubeconfig file.........."
echo
cp /etc/kubernetes/admin.conf ~/.kube/config
export KUBECONFIG=~/.kube/config
echo "Fixing api server by updating manifest file........"
sed  -i 's/ca-authority.crt/ca.crt/g' /etc/kubernetes/manifests/kube-apiserver.yaml
echo
echo "Fixing coredns image..........."
kubectl set image deployment/coredns coredns=k8s.gcr.io/coredns:1.3.1 -n kube-system 2> /dev/null
echo
echo "Uncordoning worker node........"
echo
kubectl uncordon node01 
echo "================================================"
