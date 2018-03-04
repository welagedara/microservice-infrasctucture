#!/bin/sh

# TODO: 2/17/18 Parametirize the values here 

echo "Delete MySQL"
helm delete --purge database

echo "Delete Config Map"
kubectl delete configmap mysql-initdb-config

echo "Delete Secret"
kubectl delete secret mysql-secret

echo "Delete Jenkins"
helm delete --purge ci

echo "Delete TLS Secret"
kubectl delete secret tls tls-secret

echo "Delete Ingress"
kubectl delete -f ./infrastructure-qa-ingress.yaml