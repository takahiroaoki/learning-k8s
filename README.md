# learning-k8s

## Setup
SSH to EC2 Instance(Amazon Linux 2) and follow these steps in it.

### Git
```
$ sudo yum update
$ sudo yum install -y git
```

### Docker
```
$ sudo amazon-linux-extras install -y docker
$ sudo systemctl enable docker
$ sudo systemctl start docker
$ sudo systemctl status docker
$ sudo usermod -aG docker $(whoami) && newgrp docker
```

### Minikube
```
# curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
# sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64

$ minikube config set driver docker

# Add shell config to wrap kubectl with minikube
$ alias kubectl="minikube kubectl --"
```

### Workspace
Clone this repository