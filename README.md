# microservice-infrasctucture-provisioning

## Cluster Setup
Login. Select the project when you are done
```
gcloud auth login
```
To get access to the Dashboard. By default the user only gets minimal privileges. Read References for more details on getting full access to the Dashboard.
```
kubectl proxy
```
Get Helm to work
```
helm init
```
If you run into a Permission Issue with Helm
```
kubectl create clusterrolebinding add-on-cluster-admin --clusterrole=cluster-admin --serviceaccount=kube-system:default
```

## Setup Instructions

Deploy the Infrastructure. Once Deployed log into Jenkins, correct the warnings then run the content in Jenkinsfile0 as a Pipeline Project to see if Jenkins works as expected.
```
./deploy.sh
```
Test Jenkinsfile1 to check if you have access to Google Container Registry

## Clean Up
```
./undeploy.sh
```

## Discarded Directory

You might find some useful code snippets in ./discarded directory.

## References

  - [Croc Hunter Repo](https://github.com/lachie83/croc-hunter)
  - [Kubernetes the Easy Way](https://www.youtube.com/watch?v=kOa_llowQ1c)
  - [Kubernetes RBAC](https://kubernetes.io/docs/admin/authorization/rbac/)
  - [Kubernetes Dashboard Access](https://github.com/kubernetes/dashboard/wiki/Access-control)
  - [Add Role Cluster Admin for Helm](https://github.com/kubernetes/helm/issues/2687)
  - [kubectl cheatsheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/)
  - [Kubernetes Plugin](https://github.com/jenkinsci/kubernetes-plugin)
  - [GCloud Authentication](https://cloud.google.com/storage/docs/authentication#storage-authentication-gohttps://cloud.google.com/storage/docs/authentication#storage-authentication-go)
  - [GCloud Authentication](https://cloud.google.com/sdk/docs/authorizing)
  - [GCloud Authentication](https://cloud.google.com/sdk/docs/authorizing)
  - [Use GCloud with Jenkins](https://stackoverflow.com/questions/28356497/use-gcloud-with-jenkins)


