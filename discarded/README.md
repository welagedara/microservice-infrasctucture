# mysql

## Prerequisites

Create a Static IP using gcloud( You need this for the Deployment)
```
gcloud compute addresses create global-ip --global
```
Check if the IP got created
```
gcloud compute addresses describe global-ip --global
```
Give cluster-admin role to the Service Account. This did not work all the time.
```
kubectl apply -f ./fabric8-rbac.yaml
```
If it does not work use 
```
kubectl create serviceaccount --namespace kube-system tiller
kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller
kubectl patch deploy --namespace kube-system tiller-deploy -p '{"spec":{"template":{"spec":{"serviceAccount":"tiller"}}}}'      
helm init --service-account tiller --upgrade
```

## Installation Guidelines

To install use deploy.sh
```
./deploy.sh
```
Keep the Jenkins Password that gets printed in a safe place. Then use the below Command to wait for the ingress to get an IP.
```
while true; do kubectl get ingresses;sleep 2; done
```
It will take a while for the Ingress to take effect.

Once you log into Jenkins, Fix any errors you see( Enable CSRF etc). For JNLP warning go to configureSecurity click on Agent Protocols Button and disable the deprecated Protocols. You can disable these messages if you want to. 

Create a pipeline project to see if everything works. Use the script from the Jenkinsfile included.

Check if the Ingress for the App works by deploying a sample app.
```
kubectl run microservice --image=docker.io/jocatalin/kubernetes-bootcamp:v1 --port=8080
kubectl expose deployment/microservice --type="NodePort" --port 8080

curl https://microservice-qa.pncapix.com/

# Scale the deployment 
scale deployment microservice --replicas 2 
```

## Clean Up

To delete everything
```
./deploy.sh
```
Delete Static IP
```
gcloud compute addresses delete global-ip --global
```
