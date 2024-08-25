# minikube-env

This is the project for Minikube execution environment.

The maintaner use EC2 instance(Amazon Linux2) as the virtual machine.

Minikube need 2CPUs, so the instance type is larger than t2.medium.

## Setup
SSH to EC2 Instance and follow these steps in it.

### Git
```
$ sudo yum update
$ sudo yum install -y git
$ mkdir ~/workspace
$ cd workspace
$ git clone https://github.com/takahiroaoki/minikube-env.git
```

### Minikube & Docker
```
$ cd ~/workspace/minikube-env
$ make docker
$ exit
$ make minikube
```

## How to use
(Now editing)
```
$ minikube start

$ After the following, you can access http://localhost:8080
$ kubectl port-forward service/${service name} 8080:${load balancer's port}
```

## Appendix
### minikube
```
# start node
$ minikube start

# stop node
$ minikube stop

# check status
$ minikube status

# delete node
$ minikube delete

# check addons
$ minikube addons list
```

### kubectl
```
# apply manifest file
$ kubectl apply -f ${file name}

# delete resource
$ kubectl delete -f ${file name}

# check pod status
$ kubectl get pod [-o wide]

# connect to pod
$ kubectl exec -it ${pod name} sh

# copy file to pod
$ kubectl cp ${src path} ${pod name}:${dest path}

# copy file from pod
$ kubectl cp ${pod name}:${src path} ${dest path}
```