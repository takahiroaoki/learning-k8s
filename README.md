# learning-k8s

## Setup
SSH to EC2 Instance(Amazon Linux 2) and follow these steps in it.

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