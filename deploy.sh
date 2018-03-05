#!/bin/sh

# TODO: 2/17/18 Parametirize the values here 

helm install --name ci -f ./jenkins/jenkins-values.yaml stable/jenkins

echo "Jenkins Password"
printf $(kubectl get secret --namespace default ci-jenkins -o jsonpath="{.data.jenkins-admin-password}" | base64 --decode);echo


# Not using TLS due to issues I had with static IPs in Google Cloud
# kubectl create -f ./ingress/jenkins-ingress.yaml
# kubectl create -f ./ingress/microservice-ingress.yaml

# Cluster role binding
kubectl create -f ./jenkins/jenkins-rbac.yaml