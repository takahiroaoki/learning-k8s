# minikube-aws

This is the project for Minikube execution environment.

The maintaner uses EC2 instance(Amazon Linux2) as the virtual machine.

Minikube need 2CPUs, so the instance type is larger than t2.medium.

The infrastructure is maintained by followings.
- [tf-container](https://github.com/takahiroaoki/tf-container): Terraform for EC2 and other settings
- [packer-container](https://github.com/takahiroaoki/packer-container): Packer for exclusive AMI

## Setup
SSH to EC2 Instance and follow these steps in it.

### With exclusive AMI
If you use [packer-container](https://github.com/takahiroaoki/packer-container) and generate exclusive AMI, setup is quite easy.

```
$ mkdir ~/workspace
$ cd workspace
$ git clone https://github.com/takahiroaoki/minikube-aws.git
```

### Without exclusive AMI (Depricated)
#### Git
```
$ sudo dnf update
$ sudo dnf install -y git
$ mkdir ~/workspace
$ cd workspace
$ git clone https://github.com/takahiroaoki/minikube-aws.git
```

#### Docker & Minikube
```
$ cd ~/workspace/minikube-env
$ sh setup.sh
```
Please be careful because each package version can be obsolete.

## How to use
### Nginx sample
The access flow is like `127.0.0.1(on your machine):3000 -> ssh tunnel -> kubectl proxy -> 127.0.0.1:3000(service on ec2) -> each pod`.

```
$ minikube start

# Apply
$ kubectl apply -f nginx/deployment.yml -f nginx/service.yml
$ kubectl proxy --port=3000
```
The port is OK if it is larger than 1023 and available on your machine.
Then get access to `http://127.0.0.1:3000/api/v1/namespaces/default/services/nginx-svc/proxy/`

### Kubernetes dashboard
```
$ minikube dashboard
```
Then, you can access to `http://127.0.0.1:${auto assigned port}/api/v1/namespaces/kubernetes-dashboard/services/http:kubernetes-dashboard:/proxy/` via SSH tunnel.

## Appendix
### minikube
```
# Start cluster
$ minikube start

# Stop cluster
$ minikube stop

# Check status
$ minikube status

# Delete cluster
$ minikube delete

# Check addons
$ minikube addons list
```

### kubectl
```
# Apply manifest file
$ kubectl apply -f ${file name}

# Delete resource
$ kubectl delete -f ${file name}

# Check pod status
$ kubectl get pod [-o wide]

# Connect to pod
$ kubectl exec -it ${pod name} -- sh

# Copy file to pod
$ kubectl cp ${src path} ${pod name}:${dest path}

# Copy file from pod
$ kubectl cp ${pod name}:${src path} ${dest path}

# Check pod info
$ kubectl describe pod/${pod name}

# Check log in a pod
$ kubectl logs pod/${pod name} [--follow]
```
