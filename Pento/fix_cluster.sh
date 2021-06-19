#!/bin/bash
==============================================
echo "Fixing kubeconfig file.........."
echo
cp /etc/kubernetes/admin.conf ~/.kube/config
export KUBECONFIG=~/.kube/config
echo
echo "Fixing api server by updating manifest file........"
sed  -i 's/ca-authority.crt/ca.crt/g' /etc/kubernetes/manifests/kube-apiserver.yaml
echo
echo "Fixing coredns image..........."
echo
kubectl set image deployment/coredns -n kube-system coredns=k8s.gcr.io/coredns:1.3.1  2 > /dev/null
echo
echo "Uncordoning worker node........"
echo
kubectl uncordon node01
echo
kubectl get nodes
ssh node01 && mkdir /web 
echo " type 'exit to logout from noe01"
==================================================
