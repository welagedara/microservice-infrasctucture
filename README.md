# microservice-infrasctucture-provisioning

## Install Jenkins from 

Install Jenkins using Helm
```
helm --name ci -f ./qa/jenkins/jenkins-values-new.yaml install stable/jenkins
```
If Jenkins jobs do not work use this script to give sufficient permission to jenkins.
```
kubectl -n kube-system create sa jenkins-sa
kubectl create clusterrolebinding jenkins-sa --clusterrole cluster-admin --serviceaccount=<namespace>:jenkins-sa
```

## References

  - [kubectl cheatsheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/)


