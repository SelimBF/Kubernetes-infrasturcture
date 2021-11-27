# requirements 
installation of [vagrant](https://www.vagrantup.com) et [virtualbox](https://www.virtualbox.org)

# Kubernetes Cluster Creation

Using "vagrant up" you wil automaticly deploy 
- 01x Kubernetes Master node sous _CentOS 8_ 
- 03x Kubernetes Worker nodes sous _CentOS 8_ 


# Automatic joining of workers in the cluster
** NFS ** server present on the _Master_, the junction token will be directly accessible at worker level :)
therefore at the end of the deployment your cluster will be operational with the worker _ready_
