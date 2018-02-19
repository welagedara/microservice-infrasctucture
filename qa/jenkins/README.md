# jenkins

## Installation Guidelines

Install Jenkins without any modifications. By default LoadBalancer configuration will be installed.
```
helm install stable/jenkins
```
To set ServiceType use --set flag. The Helm Repo wants you to set this to ClusterIP if an Ingress is there. But did not seem to work with the Ingress here.
```
helm install stable/jenkins
```

## Enabling TLS through an Ingress

Install Jenkins behing a ClusterIP.
```
helm install --set Master.ServiceType=NodePort --name jenkins stable/jenkins
```
Service name will be jenkins-jenkins in this example. Deploy the Ingress using the following.
```
kubectl create -f ./jenkins/jenkins-ingress-tls.yaml
```
To wait till the Ingress is up
```
while true; do kubectl get ingresses; sleep 2; done
```
## References

  - [Croc Hunter](https://github.com/lachie83/croc-hunter)
  - [Croc Hunter CI/CD Pipeline Video1](https://www.youtube.com/watch?v=NVoln4HdZOY&t=435s)
  - [Croc Hunter CI/CD Pipeline Video2](https://www.youtube.com/watch?v=eMOzF_xAm7w&t=810s)