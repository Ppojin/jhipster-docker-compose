#!/bin/sh

# echo "=================== gcloud config set project btb-ppojin-1 ====================";
# gcloud config set project btb-ppojin-2;
# echo "=================== gcloud container clusters create ====================";
# gcloud container clusters create \
#     office-cluster \
#     --cluster-version 1.14 \
#     --zone us-central1-a \
#     --num-nodes 4 \
#     --machine-type n1-standard-2 \
#     --enable-autoscaling \
#     --min-nodes 8 \
#     --max-nodes 16;
# echo "=================== get-credentials ====================";
# gcloud container clusters get-credentials office-cluster --zone us-central1-a
# kubectl create clusterrolebinding cluster-admin-binding --clusterrole=cluster-admin --user="hhjin1814@gmail.com"
echo "=================== istio ====================";
kubectl apply -f ./istio/istio-1.0.6/install/kubernetes/helm/istio/templates/crds.yaml;
kubectl apply -f ./istio/istio-1.0.6/install/kubernetes/istio-demo.yaml --as=admin --as-group=system:masters;
echo "=================== kubectl get pods -n istio-system ====================";
kubectl get pods -n istio-system;
echo "=================== kubectl get services -n istio-system ====================";
kubectl get services -n istio-system;