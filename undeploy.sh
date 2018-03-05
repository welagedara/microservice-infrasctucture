#!/bin/sh

helm delete --purge ci

kubectl delete -f ./ingress/jenkins-ingress.yaml

kubectl delete -f ./ingress/microservice-ingress.yaml

kubectl delete -f ./jenkins/jenkins-rbac.yaml