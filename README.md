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
$ git clone https://github.com/takahiroaoki/learning-k8s.git
```

### Docker & Minikube
```
$ cd learning-k8s
$ make docker
$ make minikube
```