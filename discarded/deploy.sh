#!/bin/sh

# TODO: 2/17/18 Parametirize the values here 

# Merge all Database Scripts into one
cat ./db/database.sql ./db/schema.sql ./db/data.sql > db.sql

echo "Create Config Map for MySQL Data"
kubectl create configmap mysql-initdb-config --from-file=./db.sql

echo "Deploying MySQL"
helm install --set service.type=NodePort --name database ./mysql

# Get MySQL root Password. You will need this to deploy the Spring App
mySqlRootPassword=$(kubectl get secret --namespace default database-mysql -o jsonpath="{.data.mysql-root-password}" | base64 --decode; echo)
echo "Got MySQL Password"

# MySQL Database can be accessed using host database-mysql within the cluster. 

# Create Secrets to Store MySQL Credentials.
kubectl create secret generic mysql-secret --from-literal=username='root' --from-literal=password=$mySqlRootPassword --from-literal=host='database-mysql' --from-literal=port='3306' 

# Install Jenkins
helm install --set Master.ServiceType=NodePort --name ci stable/jenkins

# Create a Secret to Store TLS Key and Cert
kubectl create secret tls tls-secret --key ./tls/tls.key --cert ./tls/tls.crt

# Add Ingresses for Jenkins and the Microservice App
kubectl create -f ./infrastructure-qa-ingress.yaml

# Once Everything is done print the Jenkins password for the user
echo "Printing Jenkins Password"
printf $(kubectl get secret --namespace default ci-jenkins -o jsonpath="{.data.jenkins-admin-password}" | base64 --decode);echo
